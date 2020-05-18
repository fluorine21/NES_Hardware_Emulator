


module sys_ctrl_test_top_lvl
(
	input wire clk_50,
	input wire rst,
	
	
	//UART connections
	input wire uart_rx,
	output wire uart_tx,
	output wire uart_cts,
	input wire uart_rts,
	
	output wire [6:0] addr_0, addr_1, addr_2, addr_3,
	
	input wire [7:0] cpu_bus_data_in,
	
	output wire [6:0] data_0, data_1,
	
	
	//These aren't tristate, can OR with CPU inputs
	output wire cpu_bus_write_en,
	output wire cpu_bus_read_en,
	
	//Outputs to CPU control
	output wire cpu_halt,
	output wire cpu_rst,
	
	output wire cpu_sys_mux_ctrl,//Needed to switch the CPU mem bus into this module to avoid tristate buffers
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


wire [15:0] cpu_bus_addr;
wire [7:0] cpu_bus_data_out;

wire [7:0] state;
sys_ctrl_fsm sys_ctrl
(

	clk,
	rst,
	
	//UART connections
	uart_rx,
	uart_tx,
	
	//Connections to CPU memory bus
	cpu_bus_addr,
	cpu_bus_data_in,
	cpu_bus_data_out,
	//These aren't tristate, can OR with CPU inputs
	cpu_bus_write_en,
	cpu_bus_read_en,
	
	//Outputs to CPU control
	cpu_halt,
	cpu_rst,
	
	1'b1, // Needed to detect when the CPU is actually halted
	
	cpu_sys_mux_ctrl,//Needed to switch the CPU mem bus into this module to avoid tristate buffers

	state

);


leddcd addr_0_dec
(
	cpu_bus_addr[3:0],
	addr_0
);

leddcd addr_1_dec
(
	cpu_bus_addr[7:4],
	addr_1
);

leddcd addr_2_dec
(
	cpu_bus_addr[11:8],
	addr_2
);

leddcd addr_3_dec
(
	cpu_bus_addr[15:12],
	addr_3
);


leddcd data_0_dec
(
	cpu_bus_data_out[3:0],
	data_0
);

leddcd data_1_dec
(
	cpu_bus_data_out[7:4],
	data_1
);

leddcd state_dec
(
	state[3:0],
	state_out
);

endmodule
