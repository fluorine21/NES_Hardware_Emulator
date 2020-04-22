




module background_pattern_table_decode
(
	input wire [2:0] y_offset, // row number, cols are indexed by bit
	input wire bit_plane,
	input wire [3:0] tile_col,
	input wire [3:0] tile_row,
	input wire sprite_table_half,
	input wire pattern_table_half,
	
	output wire [15:0] vram_addr_out
);

assign vram_addr_out = {2'b00, pattern_table_half, sprite_table_half, tile_row, tile_col, bit_plane, y_offset};



endmodule




module sprite_pattern_table_decode
(

	input wire [2:0] y_offset, // row number, cols are indexed by bit
	input wire bit_plane,
	input wire [3:0] tile_col,
	input wire [3:0] tile_row,
	input wire sprite_table_half,
	input wire pattern_table_half,
	input wire is_16,
	
	output wire [15:0] vram_addr_out

);

	



endmodule