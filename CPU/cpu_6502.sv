



module cpu_6502
(

	input wire clk,
	input wire rst,
	input wire soft_rst,
	
	//Memory bus
	output wire [15:0] mem_addr,
	output wire [7:0] mem_data_out,
	input wire [7:0] mem_data_in,
	output wire mem_write_en,
	output wire mem_read_en,
	
	//Hard reset program vector
	input wire [15:0] pc_reset,
	
	input wire [7:0] ppu_status

);






endmodule

