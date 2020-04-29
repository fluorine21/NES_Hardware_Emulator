
module ppu_mem_vga_top_lvl
(
	input wire clk_50, //50MHz clk from crystal to be divided to 25
	input wire rst,
	input wire ppu_rst,
	
	//UART connections
	input wire uart_rx,
	output wire uart_tx,
	input wire uart_rts,
	output wire uart_cts,
	
	//VGA connections
	output wire vga_clk,
	output wire vga_hsync,
	output wire vga_vsync,
	output wire vga_sync_n,
	output wire vga_blank_n,
	output wire [7:0] vga_r, vga_g, vga_b,
	
	input wire [7:0] joycon_1, joycon_2,
	
	output wire ppu_vsync

);


clkdiv2 clkdiv2_inst
(
	clk_50,
	rst,
	
	clk//25MHz
);


//CPU address bus
wire [15:0] cpu_addr_in;
wire [7:0] cpu_data_in;
wire [7:0] cpu_data_out;
wire cpu_write_en;
wire cpu_read_en;


//PPU creation
wire [15:0] ppu_vram_addr;
wire [7:0] ppu_vram_data;
wire [7:0] spram_addr, spram_data_in;
wire vga_done;
wire [8:0] ppu_vga_row, ppu_vga_col;
wire [7:0] ppu_vga_data;
wire ppu_vga_write_en;

wire [7:0] ppu_ctrl1, ppu_ctrl2, ppu_status, spram_cpu_addr;
wire [15:0] ppu_scroll_addr;

assign ppu_vsync = ppu_status[7];

ppu_fsm ppu_fsm_inst
(
	clk,
	(rst & ppu_rst),
	
	ppu_vram_addr,
	ppu_vram_data,
	
	cpu_addr_in,//Used to determine when to reset vsync
	
	spram_addr,
	spram_data_in,
	
	ppu_ctrl1,
	ppu_ctrl2,
	ppu_status,
	ppu_scroll_addr,
	spram_cpu_addr,
	
	vga_done, //Need to start when this is high
	
	// start, // Not needed, automatically starts when VGA is done with memory
	// busy, //Not needed, implied via ppu_status bits
	
	ppu_vga_row,
	ppu_vga_col,
	ppu_vga_data,
	ppu_vga_write_en

);


wire mem_ctrl_busy;
mem_ctrl mem_ctrl_inst
(
	clk,
	rst,
	
	cpu_addr_in,
	cpu_data_in,
	cpu_data_out,
	cpu_write_en,
	cpu_read_en,
	
	ppu_ctrl1,
	ppu_ctrl2,
	ppu_status,
	ppu_scroll_addr,
	
	ppu_vram_addr,
	ppu_vram_data,
	
	spram_addr,
	spram_data_in,
	
	spram_cpu_addr,
	ppu_status_read,
	
	joycon_1,
	joycon_2,


	mem_ctrl_busy

);

//VGA module
wire [9:0] vga_row, vga_col;
wire [7:0] vga_data;
vga_controller vga_ctrl_inst
(
	clk,
	vga_row,
	vga_col,
	vga_data,
	vga_done,
	
	vga_clk,
	vga_hsync,
	vga_vsync,
	vga_blank_n,
	vga_sync_n,
	
	vga_r, vga_g, vga_b
);

//VGA buffer
wire [7:0] vga_read_data;
vga_mem vga_mem_inst
(
	clk,
	ppu_vga_row,
	ppu_vga_col,
	ppu_vga_data,
	ppu_vga_write_en,
	
	vga_row,
	vga_col,
	vga_data

);

wire cpu_halt, cpu_rst;
wire cpu_is_halted = 1;
sys_ctrl_fsm sys_ctrl_inst
(
	clk,
	rst,
	
	uart_rx,
	uart_tx,
	
	cpu_addr_in,
	cpu_data_out,
	cpu_data_in,
	cpu_write_en,
	cpu_read_en,
	
	cpu_halt,
	cpu_rst,
	
	cpu_is_halted
	
);






endmodule

