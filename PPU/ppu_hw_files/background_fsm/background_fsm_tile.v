



//Draws a single background tile
module background_fsm_tile
(
	input wire clk,
	input wire rst,
	
	
	
	//Vram access
	inout wire [15:0] vram_addr,
	input wire [7:0] vram_data,
	
	input wire [15:0] nametable_base_addr
	input wire [15:0] nametable_start_addr,
	input wire [7:0] video_mem_row_start,
	input wire [7:0] video_mem_col_start,
	
	
	//Outputs to video ram
	output wire [7:0] video_mem_row,
	output wire [7:0] video_mem_col,
	
	

);

//Assume we know the starting address in the nametable
//And the base nametable address as well
//And video mem starting position is known
//Don't do video bounds checking, that will be done by memory

//In order to render
//Read name table to determine where the tile is in the pattern table
//Read the corresponding attribute table entry to determine the upper two bits of color
//Read the 3 possible colors we can use from the selected color table
//
//For all rows
// Load the two row bytes from the pattern table
//	for all cols
		//Use the two pattern table byte to determine color and write to vram
		



endmodule