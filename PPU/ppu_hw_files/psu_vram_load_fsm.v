



module ppu_vram_load_fsm
(
	input wire clk,
	input wire rst,
	input wire start,
	
	//Pixels we're about to render
	//Relative to the screen, not the frame 
	input wire [8:0] curr_row,
	input wire [8:0] curr_col,
	
	//VRAM memory connections
	output reg [15:0] vram_addr,
	input wire [7:0] vram_data_in,
	
	//Known based on current pixel pos, comes from ppu fms using decoder
	input wire [15:0] nametable_prt,//where in the nametable to look
	input wire [15:0] attr_ptr,
	input wire [1:0] attr_shift,//where in the attribute byte we need to load
	
	input wire [7:0] ppu_ctrl2,//Used to determine if sprites are enabled
	input wire sprite_on_tile,//If there is a sprite on this line
	//Pointer to the location of the sprite's tile in the pattern table
	//Know based on sprite byte 1, not loaded if draw sprite is set to 0
	input wire [15:0] sprite_pattern_base,//known from PPU settings
	input wire [7:0] sprite_tile_num,//Known from cached sprite attributes
	input wire [7:0] sprite_row, //y
	input wire [7:0] sprite_col, //x
	input wire [7:0] sprite_attr,
	
	
	//Start of pattern table for background
	input wire [15:0] background_pattern_base;
	
	//Input colors
	input wire [127:0] background_colors,
	input wire [127:0] sprite_colors,
	
	
	output wire [8:0] vga_ram_row,
	output wire [8:0] vga_ram_col,
	output wire [7:0] vga_ram_data,
	output wire vga_write_en,
	
	output reg busy
	
);

//If sprites are enabled and there is a sprite on the line of this tile
wire draw_sprite = ppu_ctrl2[4] & sprite_on_tile;
//If the background is enabled
wire draw_background = ppu_ctrl2[3];

wire [1:0] background_attr = attr_table_result[(attr_shift << 1) + 1:(attr_shift << 1)];


//color decoder
wire [7:0] sprite_color_1, sprite_color_2, sprite_color_3;
wire [7:0] background_color_1, background_color_2, background_color_3;
color_selector color_selector_inst
(

	background_colors,
	sprite_colors,
	
	sprite_attr[1:0],
	background_attr,
	
	background_color_1,
	background_color_2,
	background_color_3,
	
	sprite_color_1,
	sprite_color_2,
	sprite_color_3

);

//Draw 8 instantiation
render_8_pixels render_8_inst
(
	clk,
	rst,
	
	vga_start_row,
	vga_start_col,
	
	vga_ram_row,
	vga_ram_col,
	vga_ram_data,
	vga_write_en,
	
	sprite_pattern_low_out,
	sprite_pattern_high_out,
	spritr_attr_out,
	
	sprite_color_1_out,
	sprite_color_2_out,
	sprite_color_3_out,
	background_pattern_low_out,
	background_pattern_high_out,
	background_color_1_out,
	background_color_2_out,
	background_color_3_out,
	
	ppu_ctrl2_out,
	
	
	render_8_busy,
	render_8_start_out
	
);

//Used to hold the result of nametable load for background
//Is a tile number in nametable for background
reg [7:0] nametable_result;
//Used for determining which color to draw in color pallet
reg [7:0] attr_table_result;



//Pointer to the address of the sprite tile
wire [15:0] sprite_tile_addr = sprite_pattern_base + (sprite_tile_num << 4) + ( (attr_out[7] == 1'b1) ? sprite_row - curr_row : curr_row - sprite_row);
//Byte offset in pattern is y - curr_row
//Byte offset in pattern is y - curr_row


//Inputs to render_8_pixels
reg [8:0] vga_start_row, vga_start_col;
reg [7:0] sprite_pattern_low_out;
reg [7:0] sprite_pattern_high_out;
reg [7:0] background_pattern_low_out;
reg [7:0] background_pattern_high_out;
reg [7:0] sprite_attr_out;
reg [7:0] sprite_color_1_out;
reg [7:0] sprite_color_2_out;
reg [7:0] sprite_color_3_out;
reg [7:0] background_color_1_out;
reg [7:0] background_color_2_out;
reg [7:0] background_color_3_out;
reg [7:0] ppu_ctrl2_out;
reg render_8_start_out;
wire render_8_busy;


task reset();
begin

	vga_start_row <= 0;
	vga_start_col <= 0;
	sprite_pattern_low_out <= 0;
	sprite_pattern_high_out <= 0;
	background_pattern_low_out <= 0;
	background_pattern_high_out <= 0;
	sprite_attr_out <= 0;
	sprite_color_1_out <= 0;
	sprite_color_2_out <= 0;
	sprite_color_3_out <= 0;
	background_color_1_out <= 0;
	background_color_2_out <= 0;
	background_color_3_out <= 0;
	ppu_ctrl2_out <= 0;
	render_8_start_out <= 0;
	
	busy <= 0;
	
	nametable_result <= 0;
	attr_table_result <= 0;

end
endtask




always @ (posedge clk or negedge rst) begin



	if(rst == 1'b0) begin
	
		reset();
	
	end
	else begin
	
		case(state)

		//The draw row states will loop through the selected tiles and draw each of them
			state_idle: begin
				
				render_8_start_out <= 1'b0;
				busy <= 1'b0;
				
				//If we're supposed to start and need to draw the background
				if(start == 1'b1 && (draw_background || draw_sprite)) begin
				
					busy <= 1'b1;
				
					//Start by loading the nametable entry to determine the corresponding pattern table entry
					vram_addr <= nametable_ptr;
					
					//Go to the nametable wait state
					state <= state_draw_col_2;
				
				end
				
			end
			
			
			state_draw_col_2: begin
			
				//Load in the attribute table address
				vram_addr <= attribute_ptr;
				
				//Go to state 3
				state <= state_draw_col_3;
			
			end
			
			state_draw_col_3: begin//Loading in result from nametable and queueing pattern table read
			
				//Load in the tile number from the table
				nametable_result <= vram_data_in;
				
				//Load in pattern table low
				vram_addr <= background_pattern_base + (vram_data_in << 4);
				
				//Go to state 4
				state <= state_draw_col_4;
			end
			
			state_draw_col_4: begin//Loading result from 
			
				//Read in the attribute table
				attr_table_result <= vram_data_in;
				
				//Load in pattern table high
				vram_addr <= background_pattern_base + (vram_data_in << 4) + 8;
				
				//Go to state 5
				state <= state_draw_col_5;
			
			end
			
			
			state_draw_col_5: begin
			
				//Read in the low byte of the pattern table
				background_pattern_low <= vram_data_in;
				
				//Go to state 6
				state <= state_draw_col_6;
			
			end
			
			state_draw_col_6: begin
			
				background_pattern_high <= vram_data_in;
			
				//Check if there is a sprite here we need to draw
				if(draw_sprite) begin
				
					//If 8x8 sprites
					if(sprite_16) begin
						
						//TODO
					
					end
					//8x8 sprites
					else begin
						
						//Queue up the low byte of the bitplane
						vram_addr <= sprite_tile_addr;
					
						//Go to the load sprite states
						state <= state_load_sprite_1;
						
					end
				
				end
				else begin
				
					state <= state_start_render;
				
				end
			
			end
			
			
			state_load_sprite_1: begin
			
				//Queue up the high byte of pattern table load
				vram_addr <= sprite_tile_addr + 8;
				
				state <= state_load_sprite_2;
			
			
			end
			
			state_load_sprite_2: begin
			
				//Store the low byte of sprite pattern
				sprite_pattern_table_low <= vram_data_in;
				
				state <= state_start_render;
			
			
			end
			
			state_start_render: begin
			
				//Store the high byte of sprite patern
				sprite_pattern_table_high <= vram_data_in;
				
				//Figure out the ammount by which to shift the two sprite patterns
				
				//If flipping horizontally
				if(sprite_attr[6]) begin
				
					//TODO
				
				end
				
				else begin
				
					//If we're in the sprite boundary
					if(curr_col > sprite_col) begin
					
						//Shift is curr_col - sprite_col to the left
						sprite_pattern_low_out <= sprite_pattern_table_low << (curr_col - sprite_col);
						sprite_pattern_high_out <= vram_data_in << (curr_col - sprite_col);
					
					end
					else begin
					
						//Shift is sprite_col - curr_col to the right
						sprite_pattern_low_out <= sprite_pattern_table_low >> (sprite_col - curr_col);
						sprite_pattern_high_out <= vram_data_in >> (sprite_col - curr_col);
					
					end
				
				
				end
				
				//If the render 8 is ready
				if(render_8_busy == 1'b0) begin
				
					vga_start_row <= curr_row;
					vga_start_col <= curr_col;
					
					//Prepare the rest of the inputs an start the render
					background_pattern_low_out <= background_pattern_low;
					background_pattern_high_out <= background_pattern_high;
					sprite_attr_out <= sprite_attr;
					sprite_color_1_out <= sprite_color_1;
					sprite_color_2_out <= sprite_color_2;
					sprite_color_3_out <= sprite_color_3;
					background_color_1_out <= background_color_1;
					background_color_2_out <= background_color_2;
					background_color_3_out <= background_color_3;
					ppu_ctrl_out <= ppu_ctrl;
					
					render_8_start_out <= 1'b1;
					
					busy <= 1'b0;
					
					//We're done
					state <= state_idle;
					
				end
			end
		endcase//state case
	end//if not reset

endmodule