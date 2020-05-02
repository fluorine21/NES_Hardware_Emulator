
module ppu_mem_vga_top_lvl
(
	input wire clk_50, //50MHz clk from crystal to be divided to 25
	input wire rst,//Reset on button 0
	input wire ppu_rst,///On button 1
	
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
	
	input wire [7:0] joycon_1, joycon_2,//connected to dip switches in bit order
	
	output wire ppu_vsync,
	output wire cpu_halt,
	
	output wire [6:0] addr_0, addr_1, addr_2, addr_3,
	output wire [6:0] data_0, data_1,
	output wire [6:0] state_out

);
assign uart_cts = 1;
wire clk;
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
wire ppu_status_read;//Not used
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

wire cpu_rst;
wire cpu_is_halted = 1;
wire cpu_sys_mux_ctrl;
wire [7:0] state;
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
	
	cpu_is_halted,
	
	cpu_sys_mux_ctrl,
	
	state
	
);


leddcd addr_0_dec
(
	cpu_addr_in[3:0],
	addr_0
);

leddcd addr_1_dec
(
	cpu_addr_in[7:4],
	addr_1
);

leddcd addr_2_dec
(
	cpu_addr_in[11:8],
	addr_2
);

leddcd addr_3_dec
(
	cpu_addr_in[15:12],
	addr_3
);


leddcd data_0_dec
(
	cpu_data_in[3:0],
	data_0
);

leddcd data_1_dec
(
	cpu_data_in[7:4],
	data_1
);

leddcd state_dec
(
	state[3:0],
	state_out
);





endmodule
