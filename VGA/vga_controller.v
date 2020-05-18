

module vga_controller
(
	input wire clk,
	//VGA buffer connections
	output wire [9:0] vga_row_out, 
	output wire [9:0] vga_col_out,
	input wire [7:0] vga_data,
	output wire vga_done,
	
	//VGA signals
	output wire vga_clk,//Connected to pixel clock
	output wire hsync,
	output wire vsync,
	output wire blank_n, //connected to video on
	output wire sync_n,//Set to 1 always
	
	output wire [7:0] R, G, B
);

assign vga_done = vga_row_out > 240;
assign sync_n = 1;

//VGA sync generator instance
wire eof;//Not used (for now)
wire [9:0] vga_row, vga_col;
assign vga_row_out = vga_row - 7;
assign vga_col_out = vga_col - 7;
VGA_SYNC vga_sync_inst
(
	clk,
	hsync,
	vsync,
	blank_n,
	vga_clk,
	eof,
	vga_row, 
	vga_col
);

//Color Decoder
vga_color_decode color_decode_inst
(
	vga_data,
	R,G,B
);


endmodule