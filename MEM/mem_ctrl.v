
//Puts the DMA, mem_decode, and joycon modules together




module mem_ctrl
(
	input wire clk,
	input wire rst,
	
	//CPU connections
	input wire [15:0] cpu_addr,
	input wire [7:0] cpu_data_in,
	output wire [7:0] cpu_data_out,
	input wire cpu_write_en,
	input wire cpu_read_en,
	
	//PPU connections
	output wire [7:0] ppu_ctrl1,
	output wire [7:0] ppu_ctrl2,
	input wire [7:0] ppu_status,
	output wire [15:0] ppu_scroll_addr,
	
	input wire [15:0] vram_ppu_addr,
	output wire [7:0] vram_ppu_data,
	
	input wire [7:0] spram_ppu_addr,
	output wire [7:0] spram_ppu_data,
	
	output wire [7:0] spram_cpu_addr,
	output wire ppu_status_read,
	
	//Need to be connected register where all 8-bits are used to denote button press
	input wire [7:0] joycon_1,
	input wire [7:0] joycon_2,
	
	output wire busy, //1 if DMA is running
	input wire h_mirror, v_mirror

);

//Mem data out for scope purposes
wire [7:0] mem_data_out;
assign cpu_data_out = mem_data_out;

//DMA variables
wire [15:0] dma_addr;
wire [7:0] dma_data_in = mem_data_out; // from mem
wire [7:0] dma_data_out; // to mem
wire dma_write_en;

//mem_decode instantiation
wire [15:0] mem_addr = busy ? dma_addr : cpu_addr;
wire [7:0] mem_data_in = busy ? dma_data_out : cpu_data_in;
//Mem data out connected to dma and cpu

wire mem_write_en = busy ? dma_write_en : cpu_write_en;
//mem read en connected only to CPU


//Joycon inputs to mem decode
wire [7:0] joycon_1_in, joycon_2_in;

mem_decode mem_decode_inst
(

	clk,
	rst,
	
	mem_addr,
	mem_data_in,
	mem_data_out,
	mem_write_en,
	cpu_read_en,
	
	ppu_ctrl1,
	ppu_ctrl2,
	ppu_status,
	ppu_scroll_addr,
	
	vram_ppu_addr,
	vram_ppu_data,
	
	spram_ppu_addr,
	spram_ppu_data,
	
	spram_cpu_addr,
	ppu_status_read,
	
	joycon_1_in,
	joycon_2_in,
	
	h_mirror, v_mirror

);


//DMA instantiation

dma_module dma_module_inst
(
	clk,
	rst,
	
	cpu_addr,
	cpu_data_in,
	cpu_write_en,
	
	dma_addr,
	dma_data_in,
	dma_data_out,
	dma_write_en, 
	busy

);

//Joycon controllers

joycon_ctrl #(16'h4016) joycon_ctrl_1
(
	clk,
	rst,
	cpu_addr,
	cpu_data_in,
	cpu_write_en,
	cpu_read_en,
	
	joycon_1_in,
	
	joycon_1
); 

joycon_ctrl #(16'h4017) joycon_ctrl_2
(
	clk,
	rst,
	cpu_addr,
	cpu_data_in,
	cpu_write_en,
	cpu_read_en,
	
	joycon_2_in,
	
	joycon_2
); 









endmodule