



module vga_mem
(
	input wire clk,
	input wire [8:0] ppu_row,
	input wire [8:0] ppu_col,
	input wire [7:0] ppu_data,
	input wire ppu_write_en,
	
	input wire [9:0] vga_row,
	input wire [9:0] vga_col,
	output wire [7:0] vga_data
);

//Checking to make sure ppu_row and col are within range
wire [15:0] ppu_addr = (ppu_row < 240 && ppu_col < 256) ? {ppu_row[7:0], ppu_col[7:0]} : 16'b0;
wire ppu_w_e = (ppu_row < 240 && ppu_col < 256) ? ppu_write_en : 1'b0;

//Connections for generic ram
wire [7:0] ram_data_out;

//Making sure we give VGA black pixels whenever we're not in the frame
wire [15:0] vga_addr = (vga_row < 240 && vga_col < 256) ? {vga_row[7:0], vga_col[7:0]} : 16'b0;
//Need 3F here for a black pixel
assign vga_data = (vga_row < 240 && vga_col < 256) ? ram_data_out : 8'h3F;
wire [7:0] ppu_dummy_data_out;
generic_ram #(61440, 16) ram
(
	clk, 
	ppu_addr,
	ppu_data,
	ppu_dummy_data_out,
	ppu_w_e,
	
	vga_addr,
	ram_data_out
);



endmodule