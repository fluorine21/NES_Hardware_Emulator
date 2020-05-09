
module ppu_fsm
(
	input wire clk,
	input wire rst,
	
	output wire [15:0] vram_addr,
	input wire [7:0] vram_data_in,
	
	input wire [15:0] cpu_addr,//Used to determine when to reset vsync
	
	output wire [7:0] spram_addr,
	input wire [7:0] spram_data_in,
	
	input wire [7:0] ppu_ctrl1,
	input wire [7:0] ppu_ctrl2,
	output wire [7:0] ppu_status,
	input wire [15:0] cpu_scroll_addr,
	input wire [7:0] cpu_sprite_addr,
	
	input wire vga_done, //Need to start when this is high
	
	//input wire start, // Not needed, automatically starts when VGA is done with memory
	//output wire busy, //Not needed, implied via ppu_status bits
	
	output wire [8:0] vga_row,
	output wire [8:0] vga_col,
	output wire [7:0] vga_data,
	output wire vga_write_en

);



//Starting position of pixel in nametable 2x2
wire [9:0] col_offset = {1'b0, ppu_ctrl1[0], cpu_scroll_addr[7:0]}; 


//These tell us which pixel we're currently drawing relative to the screen, not the nametables
reg [8:0] screen_pixel_row;//This stats counting at 0
reg [8:0] screen_pixel_col;//Thit starts counting at -1 * col_offset[2:0]


//Sprite load fsm
wire sprite_0_on_tile, sprite_0_is_0; 
wire [7:0] sprite_0_tile_num, sprite_0_row, sprite_0_col, sprite_0_attr;
wire sprite_1_on_tile, sprite_1_is_0;
wire [7:0] sprite_1_tile_num, sprite_1_row, sprite_1_col, sprite_1_attr;
reg sprite_load_start;
wire sprite_load_busy;
wire sprite_overflow;

ppu_sprite_load_fsm sprite_load_inst
(
	clk,
	rst,
	
	spram_addr,
	spram_data_in,

	screen_pixel_row,
	screen_pixel_col,
	
	sprite_0_on_tile,
	sprite_0_tile_num, 
	sprite_0_row, 
	sprite_0_col, 
	sprite_0_attr,
	
	sprite_1_on_tile,
	sprite_1_tile_num, 
	sprite_1_row, 
	sprite_1_col, 
	sprite_1_attr,
	
	sprite_overflow,
	sprite_load_start,
	sprite_load_busy,
	cpu_sprite_addr,
	
	sprite_0_is_0,
	sprite_1_is_0

);

//Color load fsm
reg color_load_start;
wire color_load_busy;
wire [127:0] background_colors, sprite_colors;
wire [15:0] color_vram_addr;
ppu_color_load_fsm color_load_inst
(
	clk,
	rst,
	
	color_vram_addr,
	vram_data_in,
	color_load_start,
	color_load_busy,
	
	background_colors,
	sprite_colors
);

//nametable address lookup
wire [15:0] nametable_ptr;
wire [2:0] pattern_table_offset;
pixel_to_nametable_ptr pixel_to_nametable_inst
(
	screen_pixel_row,
	screen_pixel_col,
	
	cpu_scroll_addr,
	ppu_ctrl1,
	
	nametable_ptr,
	pattern_table_offset
);

//Translation from nametable_ptr to attribute table ptr and offset
wire [15:0] attr_ptr;
wire [1:0] attr_shift;
name_to_att name_to_att_inst
(
	nametable_ptr,
	attr_ptr,
	attr_shift
);

//vram load fsm
wire [15:0] background_pattern_base = ppu_ctrl1[4] ? 16'h1000 : 0;
wire [15:0] sprite_pattern_base = ppu_ctrl1[3] ? 16'h1000 : 0;
wire sprite_0_hit, sprite_1_hit;
reg vram_load_start;
wire vram_load_busy;

wire [15:0] render_8_vram_addr;
ppu_vram_load_fsm vram_load_inst
(
	
	clk,
	rst, 
	vram_load_start,
	screen_pixel_row,
	screen_pixel_col,
	
	render_8_vram_addr,
	vram_data_in,
	
	ppu_ctrl1,
	ppu_ctrl2,
	
	//Background info
	background_colors,
	background_pattern_base,
	nametable_ptr,
	pattern_table_offset,
	attr_ptr,
	attr_shift,
	

	sprite_colors,
	sprite_pattern_base,
	
	//Sprite 0
	sprite_0_on_tile,
	sprite_0_tile_num,
	sprite_0_row,
	sprite_0_col,
	sprite_0_attr,
	
	//Sprite 1
	sprite_1_on_tile,
	sprite_1_tile_num,
	sprite_1_row,
	sprite_1_col,
	sprite_1_attr,

	
	vga_row,
	vga_col,
	vga_data,
	vga_write_en,
	
	vram_load_busy,
	
	sprite_0_hit,
	sprite_1_hit
);


//An input to ppu status fsm
wire sprite_0_hit_strobe = (sprite_0_hit && sprite_0_is_0) || (sprite_1_hit && sprite_1_is_0);
reg [7:0] state;
reg ppu_vsync_reg;

//status register latch
ppu_status_latch ppu_status_inst
(
	clk,
	rst,
	
	sprite_0_hit_strobe,
	sprite_overflow,
	ppu_vsync_reg,
	ppu_ctrl1,
	
	cpu_addr,
	ppu_status
	
);


assign vram_addr = color_load_busy ? color_vram_addr : render_8_vram_addr;


localparam [7:0] state_idle = 0, 
				 state_wait_colors_1 = 1,
				 state_wait_colors_2 = 2,				 
				 state_wait_sprite_1 = 3, 
				 state_wait_sprite_2 = 4, 
				 state_draw_row_1 = 5,
				 state_draw_row_2 = 6,
				 state_draw_row_3 = 7,
				 state_wait_vga = 8;

task reset_state();
begin

	screen_pixel_row <= 0;
	screen_pixel_col <= 0;
	state <= state_idle;
	
	vram_load_start <= 0;
	color_load_start <= 0;
	sprite_load_start <= 0;
	ppu_vsync_reg <= 0;

end
endtask

always @ (posedge clk or negedge rst) begin

	if(rst == 0) begin
	
		reset_state();
	
	end
	else begin

		case(state)



			state_idle: begin
			
				if(vga_done == 1) begin
				
					//Start the color loading FSM
					color_load_start <= 1;
					
					//Reset the row and col counters
					screen_pixel_row <= 0;
					set_col_counter();
					
					//Go to the wait_color state
					state <= state_wait_colors_1;
	
				end
				
			end	
			
			state_wait_colors_1: begin
			
				if(color_load_busy) begin
				
					state <= state_wait_colors_2;
					color_load_start <= 0;
				end
			
			end
			
			state_wait_colors_2: begin
			
				color_load_start <= 0;
				
				//If color loading is done
				if(color_load_busy == 0) begin
				
					//Start the sprite loading
					sprite_load_start <= 1;
					
					//Wait on the sprite fsm to be done
					state <= state_wait_sprite_1;
				
				end
			
			end
			
			state_wait_sprite_1: begin
			
				//If the sprite load has started
				if(sprite_load_busy) begin
					state <= state_wait_sprite_2;
					sprite_load_start <= 0;
				end
			
			end
			
			state_wait_sprite_2: begin
				
				//If we're done waiting on the sprite load fsm
				if(sprite_load_busy == 0) begin
				
					//Go to draw row 1
					state <= state_draw_row_1;
				
				end
			
			
			end
			
			
			state_draw_row_1: begin
			
				//Start the vram load fsm
				vram_load_start <= 1;
				
				//Go to the row 2 state to wait for it to be done
				state <= state_draw_row_2;
			
			
			end
			
			state_draw_row_2: begin
			
				//If the row draw is now btsy
				if(vram_load_busy == 1) begin
				
					state <= state_draw_row_3;
					vram_load_start <= 0;
				end
				
			end
			
			state_draw_row_3: begin
			
				
				//If it's done
				if(vram_load_busy == 0) begin
				
					//if we're about to go over the edge of a column
					if(screen_pixel_col + 8 >= 256) begin
					
						//if we're on the last row
						if(screen_pixel_row >= 239) begin
							//We're done rendering this frame
							
							//Wait for VGA to start rendering the screen
							state <= state_wait_vga;
							
							ppu_vsync_reg <= 1;
							
						end
						else begin
							//Just need to go to the next row
							screen_pixel_row <= screen_pixel_row + 1;
							set_col_counter();
							
							//Need to reload sprites here
							state <= state_wait_colors_2;
						end
					end
					//No col or row overflow
					else begin
						//Just need to increment col by 8 and continue
						screen_pixel_col <= screen_pixel_col + 8;
						state <= state_draw_row_1;
					
					end
				end//vram load done
			
			end
			
			state_wait_vga: begin
			
				ppu_vsync_reg <= 0;
			
				//If VGA has started to read out the screen
				if(vga_done == 0) begin
					//Then we can go wait for it to be done
					state <= state_idle;
				
				end
			
			end
			
			default: reset_state();
			
		endcase
	
	
	end//not reset
end//always
	
task set_col_counter();
begin

	screen_pixel_col <= (~col_offset[2:0] + 1);

end
endtask
	
	
endmodule
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	