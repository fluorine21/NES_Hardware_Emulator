



module ppu_vram_load_fsm
(
	input wire clk,
	input wire rst,
	input wire start,
	
	//Pixels we're about to render
	//Relative to the screen, not the nametables 
	input wire [8:0] curr_row,
	input wire [8:0] curr_col,
	
	//VRAM memory connections
	output wire [15:0] vram_addr_wire,
	input wire [7:0] vram_data_in,
	
	input wire [7:0] ppu_ctrl1,//Used for determining if 8x8 or 8x16
	input wire [7:0] ppu_ctrl2,//Used to determine if things need to be drawn or not
	
	//Everything needed to draw background
	input wire [127:0] background_colors,
	input wire [15:0] background_pattern_base,
	input wire [15:0] nametable_ptr,//where in the nametable to look, comes from pixel_to_nametable_ptr.v
	input wire [2:0] pattern_table_offset,//Where in the tile pattern to look based on pixel position relative to nametables, comes from pixel_to_nametable_ptr
	input wire [15:0] attr_ptr,//Pointer to attribute table location based on nametable_prt, comes from name_to_attr
	input wire [1:0] attr_shift,//Which two bits of attribute table result we need to look at, comes from name_to_attr
	
	//Used for sprites 0 and 1
	input wire [127:0] sprite_colors,
	input wire [15:0] sprite_pattern_base,//known from PPU settings

	//Everything we need to know to draw sprite 0
	input wire sprite_0_on_tile,//If there is a sprite on this tile
	input wire [7:0] sprite_0_tile_num,//Known from cached sprite attributes
	input wire [7:0] sprite_0_row, //y
	input wire [7:0] sprite_0_col, //x
	input wire [7:0] sprite_0_attr,
	
	//Everything we need to know to draw sprite 1
	input wire sprite_1_on_tile,//If this sprite is also on this tile
	input wire [7:0] sprite_1_tile_num,//Known from cached sprite attributes
	input wire [7:0] sprite_1_row, //y
	input wire [7:0] sprite_1_col, //x
	input wire [7:0] sprite_1_attr,
	
	//Connections to VGA memory coming from render 8
	output wire [8:0] vga_ram_row,
	output wire [8:0] vga_ram_col,
	output wire [7:0] vga_ram_data,
	output wire vga_write_en,
	
	output reg busy,
	
	output wire sprite_0_hit,
	output wire sprite_1_hit
	
);

reg [15:0] vram_addr;
assign vram_addr_wire = vram_addr;

//State register and definitions
reg [7:0] state;

localparam [7:0] state_idle = 0,
				 state_draw_col_2 = 1,
				 state_draw_col_3 = 2,
				 state_draw_col_4 = 3,
				 state_draw_col_5 = 4,
				 state_draw_col_6 = 5,
				 state_load_sprite_0_1 = 6,
				 state_load_sprite_0_2 = 7,
				 state_load_sprite_0_3 = 8,
				 state_load_sprite_1_1 = 9,
				 state_load_sprite_1_2 = 10,
				 state_load_sprite_1_3 = 11,
				 state_start_render = 12;

//Used to hold the result of nametable load for background
//Is a tile number in nametable for background
reg [7:0] nametable_result;
//Used for determining which color to draw in color pallet
reg [7:0] attr_table_result;
//Used to store background pattern table results
reg [7:0] background_pattern_low, background_pattern_high;
//Used to store sprite pattern table results loaded from VRAM
reg [7:0] sprite_0_pattern_low, sprite_0_pattern_high, sprite_1_pattern_low, sprite_1_pattern_high;

//Sprite memory and shifting definitions
//Pointer to the lower byte in the pattern table we need to load based on if we're flipping this sprite vertically
wire [15:0] sprite_0_tile_addr = get_sprite_tile_addr(sprite_pattern_base, sprite_0_tile_num, sprite_0_attr, sprite_0_row, curr_row);
//Defines the final sprite pattern to be loaded into render 8 based on sprite x position
wire [7:0] sprite_0_pattern_low_final = sprite_shift(sprite_0_pattern_low, curr_col, sprite_0_col, sprite_0_attr);
wire [7:0] sprite_0_pattern_high_final = sprite_shift(sprite_0_pattern_high, curr_col, sprite_0_col, sprite_0_attr);

//Sprite 1 definitions same as above
wire [15:0] sprite_1_tile_addr = get_sprite_tile_addr(sprite_pattern_base, sprite_1_tile_num, sprite_1_attr, sprite_1_row, curr_row);
wire [7:0] sprite_1_pattern_low_final = sprite_shift(sprite_1_pattern_low, curr_col, sprite_1_col, sprite_1_attr);
wire [7:0] sprite_1_pattern_high_final = sprite_shift(sprite_1_pattern_high, curr_col, sprite_1_col, sprite_1_attr);



function [15:0] get_sprite_tile_addr;
input [15:0] sprite_base;
input [7:0] sprite_tile_num;
input [7:0] sprite_attr;
input [7:0] sprite_row;
input [8:0] curr_row;
begin

//If it's an 8x8
if(ppu_ctrl1[5] == 0) begin

	get_sprite_tile_addr = sprite_base + ({8'b0, sprite_tile_num} << 4) + (sprite_attr[7] ? (7 - (curr_row - sprite_row)) : (curr_row - sprite_row));

end
//8x16
else begin

	get_sprite_tile_addr = (sprite_tile_num[0] ? 16'h1000 : 16'h0000) + ({9'b0, sprite_tile_num[7:1]} << 4) + (sprite_attr[7] ? (15 - (curr_row - sprite_row)) : (curr_row - sprite_row));

end


end
endfunction


function [7:0] sprite_shift;
input [7:0] sprite_pattern;
input [8:0] curr_col;
input [7:0] sprite_col;
input [7:0] sprite_attr;

reg [7:0] sprite_pattern_h;
reg [7:0] col_neg;

begin

sprite_pattern_h = sprite_attr[6] ? reverse_bits(sprite_pattern) : sprite_pattern;
col_neg = ~curr_col + 1;

if(curr_col[8]) begin

	sprite_shift = sprite_pattern_h >> (col_neg + sprite_col);

end
else begin

	sprite_shift = (sprite_col > curr_col) ? sprite_pattern_h >> (sprite_col - curr_col) : sprite_pattern_h << (curr_col - sprite_col);

end

end
endfunction

//If sprites are enabled and there is a sprite on the line of this tile
wire draw_sprite_0 = ppu_ctrl2[4] & sprite_0_on_tile;
wire draw_sprite_1 = ppu_ctrl2[4] & sprite_1_on_tile;
//Will always load background even if it is not enabled
//Sets the attribute 2 bits based on attribute shift for background
wire [1:0] background_attr = attr_table_result[({1'b0, attr_shift} << 1)+:2];


//color decoder
wire [31:0] background_colors_lst, sprite_0_colors_lst, sprite_1_colors_lst;

color_selector color_selector_inst
(

	background_colors,
	sprite_colors,
	
	
	background_attr,
	sprite_0_attr[1:0],
	sprite_1_attr[1:0],
	
	background_colors_lst,
	sprite_0_colors_lst,
	sprite_1_colors_lst

);

//Inputs to render_8_pixels
reg [8:0] vga_start_row, vga_start_col;

reg [7:0] sprite_0_pattern_low_out, sprite_0_pattern_high_out, sprite_0_attr_out;

reg [7:0] sprite_1_pattern_low_out, sprite_1_pattern_high_out, sprite_1_attr_out;

//Needed to register inputs to render 8
reg [31:0] background_colors_out, sprite_0_colors_out, sprite_1_colors_out;

reg [7:0] background_pattern_low_out, background_pattern_high_out;

reg [7:0] ppu_ctrl2_out;
reg render_8_start_out;
wire render_8_busy;


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
	
	sprite_0_pattern_low_out,
	sprite_0_pattern_high_out,
	sprite_0_attr_out,
	sprite_0_colors_out,
	
	sprite_1_pattern_low_out,
	sprite_1_pattern_high_out,
	sprite_1_attr_out,
	sprite_1_colors_out,
	
	background_pattern_low_out,
	background_pattern_high_out,
	background_colors_out,
	
	ppu_ctrl2_out,
	
	render_8_start_out,
	render_8_busy,
	
	sprite_0_hit,
	sprite_1_hit
);

task reset();
begin

	vga_start_row <= 0;
	vga_start_col <= 0;
	
	sprite_0_pattern_low_out <= 0;
	sprite_0_pattern_high_out <= 0;
	sprite_0_attr_out <= 0;
	sprite_0_colors_out <= 0;
	
	sprite_1_pattern_low_out <= 0;
	sprite_1_pattern_high_out <= 0;
	sprite_1_attr_out <= 0;
	sprite_1_colors_out <= 0;
	
	background_pattern_low_out <= 0;
	background_pattern_high_out <= 0;
	background_colors_out <= 0;
	
	ppu_ctrl2_out <= 0;
	
	render_8_start_out <= 0;
	
	busy <= 1'b0;

	state <= state_idle;
	
	vram_addr <= 0;
	
	nametable_result <= 0;
	attr_table_result <= 0;
	sprite_0_pattern_high <= 0;
	sprite_0_pattern_low <= 0;
	sprite_1_pattern_high <= 0;
	sprite_1_pattern_low <= 0;
	background_pattern_high <= 0;
	background_pattern_low <= 0;
	

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
				if(start == 1'b1) begin
				
					busy <= 1'b1;
				
					//Start by loading the nametable entry to determine the corresponding pattern table entry
					vram_addr <= nametable_ptr;
					
					//Go to the nametable wait state
					state <= state_draw_col_2;
				
				end
				
			end
			
			
			state_draw_col_2: begin
			
				//Load in the attribute table address
				vram_addr <= attr_ptr;
				
				//Go to state 3
				state <= state_draw_col_3;
			
			end
			
			state_draw_col_3: begin//Loading in result from nametable and queueing pattern table read
			
				//Load in the tile number from the table
				nametable_result <= vram_data_in;
				
				//Load in pattern table low
				//vram_addr <= background_pattern_base + ({8'h00, vram_data_in} << 4) + pattern_table_offset;
				vram_addr <= name_to_pattern(background_pattern_base, vram_data_in, pattern_table_offset);
				
				//Go to state 4
				state <= state_draw_col_4;
			end
			
			state_draw_col_4: begin//Loading result from 
			
				//Read in the attribute table
				//Decoding is done in a wire assignment above
				attr_table_result <= vram_data_in;
				
				//Load in pattern table high
				//vram_addr <= background_pattern_base + (nametable_result << 4) + 8 + pattern_table_offset;
				vram_addr <= name_to_pattern(background_pattern_base, nametable_result, pattern_table_offset) + 8;
				
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
			
				//Read in the high byte of the pattern table
				background_pattern_high <= vram_data_in;
			
				//Check if there is a sprite here we need to draw
				if(draw_sprite_0) begin
			
					//Don't need to wory about 8x8 or 8x16, that is decoded elsewhere
			
					//Queue up the low byte of the bitplane
					vram_addr <= sprite_0_tile_addr;
				
					//Go to the load sprite states
					state <= state_load_sprite_0_1;
				
				end
				//If we still need to draw sprite 1
				else if (draw_sprite_1) begin
				
					//Don't need to draw sprite 0, make it transparent
					sprite_0_pattern_low <= 8'b0;
					sprite_0_pattern_high <= 8'b0;
				
					//Load the pallet byte low address based on sprite y position
					
					state <= state_load_sprite_1_1;
				
				end
				else begin
				
					//Don't need to draw sprite 0, make it transparent
					sprite_0_pattern_low <= 8'b0;
					sprite_0_pattern_high <= 8'b0;
				
					state <= state_start_render;
				
				end
			
			end
			
			
			state_load_sprite_0_1: begin
			
				//Queue up the high byte of pattern table load
				vram_addr <= sprite_0_tile_addr + 8;
				
				state <= state_load_sprite_0_2;
			
			
			end
			
			state_load_sprite_0_2: begin
			
				//Store the low byte of sprite pattern
				sprite_0_pattern_low <= vram_data_in;
			
				state <= state_load_sprite_0_3;
			
			
			end
			
			state_load_sprite_0_3: begin
			
				sprite_0_pattern_high <= vram_data_in;
							
				//if we need to draw sprite 1
				if(draw_sprite_1) begin
				
					//Put the starting address of that pattern table on the address line
					vram_addr <= sprite_1_tile_addr;
					state <= state_load_sprite_1_1;
				
				
				end
				else begin
					
					//Don't need to draw sprite 1, make it transparent
					sprite_1_pattern_low <= 8'b0;
					sprite_1_pattern_high <= 8'b0;
					
					state <= state_start_render;
				
				end
			
			
			end
			
			state_load_sprite_1_1: begin
			
				//Put the address of the high byte
				vram_addr <= sprite_1_tile_addr + 8;
				
				//Go to state 2
				state <= state_load_sprite_1_2;
			
			end
			
			
			state_load_sprite_1_2: begin
			
				//Load in the low byte
				sprite_1_pattern_low <= vram_data_in;
			
				//Go to state 3
				state <= state_load_sprite_1_3;
			
			end
			
			
			state_load_sprite_1_3: begin
			
				//Load in the high byte
				sprite_1_pattern_high <= vram_data_in;
			
				//Go to render start
				state <= state_start_render;
				
			end
			
			state_start_render: begin
				
				//Sprite shifts and flips are already calculated into _final values
				
				//If the render 8 is ready
				if(render_8_busy == 1'b0) begin
				
					//Prepare the rest of the inputs an start the render
					vga_start_row <= curr_row;
					vga_start_col <= curr_col;
					
					sprite_0_pattern_low_out <= sprite_0_pattern_low_final;
					sprite_0_pattern_high_out <= sprite_0_pattern_high_final;
					sprite_0_attr_out <= sprite_0_attr;
					sprite_0_colors_out <= sprite_0_colors_lst;
					
					sprite_1_pattern_low_out <= sprite_1_pattern_low_final;
					sprite_1_pattern_high_out <= sprite_1_pattern_high_final;
					sprite_1_attr_out <= sprite_1_attr;
					sprite_1_colors_out <= sprite_1_colors_lst;
					
					background_pattern_low_out <= background_pattern_low;
					background_pattern_high_out <= background_pattern_high;
					background_colors_out <= background_colors_lst;
					
					ppu_ctrl2_out <= ppu_ctrl2;
					
					render_8_start_out <= 1'b1;
					
					busy <= 1'b0;
					
					//We're done
					state <= state_idle;
					
				end
				
			end
			
			
			default: begin
			
				reset();
			
			end
			
		endcase//state case
	end//if not reset
end//always




function [7:0] reverse_bits;
input [7:0] in;

integer i;

for(i = 0; i < 8; i = i + 1) begin

	reverse_bits[7-i] = in[i];

end

endfunction


function [15:0] name_to_pattern;
input [15:0] p_b;
input [7:0] n_b;
input [2:0] p_o;
begin

	name_to_pattern = p_b + p_o + ({8'h00, n_b} << 4);
	
end
endfunction

endmodule