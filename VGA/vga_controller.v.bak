

module vga_controller
(
	input wire clk,
	//VGA buffer connections
	output wire [9:0] vga_row, 
	output wire [9:0] vga_col,
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

assign vga_done = vga_row > 240;


//VGA sync generator instance
wire eof;//Not used (for now)
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