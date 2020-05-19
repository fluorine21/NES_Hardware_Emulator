


module nametable_decoder_tb();

reg [8:0] screen_pixel_row, screen_pixel_col;

reg [15:0] cpu_scroll_addr;
reg [7:0] ppu_ctrl1;

wire [15:0] nametable_ptr;
wire [2:0] pattern_table_offset;


wire [15:0] attr_byte_addr;
wire [1:0] attr_bit_offset;


pixel_to_nametable_ptr p_to_n_inst
(
	screen_pixel_row,
	screen_pixel_col,
	
	cpu_scroll_addr,
	ppu_ctrl1,
	
	nametable_ptr,
	pattern_table_offset
);

name_to_att n_to_att_inst
(
	nametable_ptr,
	
	attr_byte_addr,
	attr_bit_offset

);


initial begin

	cpu_scroll_addr = 0;
	screen_pixel_row = 0;
	screen_pixel_col = 0;
	ppu_ctrl1 = 0;

	//Check the case of y (row) offset = 0, x offset = 5
	//First few tiles
	
	cpu_scroll_addr = 16'h0005;
	
	screen_pixel_col = -5;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	
	
	//Check a different row for the same case
	screen_pixel_row = 9;
	
	screen_pixel_col = -5;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	
	
	//Then check wrap around for y offset = 0, x offset = 508
	cpu_scroll_addr = 16'h00FC;
	ppu_ctrl1 = 8'h01;
	
	screen_pixel_col = -4;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;
	#1
	screen_pixel_col = screen_pixel_col + 8;


end




endmodule