



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
	
	input wire [7:0] ppu_status,
	
	input wire halt,
	input wire nIRQ,
	output wire [15:0] pc_6502,
	input wire [7:0] ppu_ctrl1

);

//Instruction fetch

wire [15:0] if_addr_to_ie;
wire [15:0] if_mem_addr;
wire [7:0] new_op;
wire [3:0] alu_op;
wire [15:0] pc_from_ie;//connect to pc_next
wire [15:0] pc_to_ie;//Connect to if_pc_next
wire [7:0] x_reg, y_reg, acc_reg;
wire accessing_mem;

wire ie_ready, imm_mode;
wire [2:0] store_flag;
wire [1:0] reg_load_flag;
wire instr_valid;
wire if_start;
wire mem_load_flag;
instr_fetch instr_fetch_inst
(

	clk,
	rst,
	if_addr_to_ie,
	if_mem_addr,
	mem_data_in,//Shared between all modules
	new_op,
	alu_op,
	pc_from_ie,
	pc_to_ie,
	x_reg,
	y_reg,
	acc_reg,
	accessing_mem,
	
	if_start,//ie ready in inst fetch
	imm_mode,
	store_flag,
	reg_load_flag,
	mem_load_flag,
	instr_valid,//equivalent to if_ready
	halt

);

//Instruction Execute
wire [7:0] ie_status;
wire [7:0] stack_ptr;
wire [15:0] ie_mem_addr;

ie_fsm inst_exec_inst
(
	clk,
	rst,
	soft_rst,
	
	ie_mem_addr,
	mem_data_out,
	mem_data_in,
	mem_write_en,
	mem_read_en,
	
	pc_reset,
	
	instr_valid,
	if_addr_to_ie,
	pc_to_ie,
	new_op,
	alu_op,
	store_flag,
	reg_load_flag,
	mem_load_flag,
	imm_mode,
	
	if_start,
	
	ppu_status,
	
	pc_from_ie,//to if, pc_next
	ie_status,
	acc_reg, x_reg, y_reg,
	stack_ptr,
	halt,
	nIRQ,
	ppu_ctrl1
	
);

assign pc_6502 = pc_from_ie;

//MUX for memory 
assign mem_addr = instr_valid ? ie_mem_addr : if_mem_addr;
//Only need to mux mem addr, everything else goes to ie

endmodule

