
`include "ie_defs.vh"


//Simple op-code decoder for setting CPU flags

module simple_op_decode
(
	input wire [7:0] simple_op,
	input wire mem_load_flag,
	input wire [2:0] store_flag,
	input wire [1:0] reg_load_flag,
	input wire [3:0] alu_op_in,
	input wire immediate_flag,
	
	output wire is_load,
	output wire is_store,
	output wire is_branch,
	output wire is_jsr,
	output wire is_rts,
	output wire is_rti,	
	output wire is_break,
	output wire is_stack_op,
	
	output reg [7:0] alu_input_a_flags,
	output reg [7:0] alu_input_b_flags,
	output reg [7:0] alu_output_flags,
	output wire [3:0] alu_op_out
	
	
);

assign is_load = mem_load_flag;
assign is_store = store_flag == 3'b001;

assign alu_op_out = alu_op_in;


assign is_jsr = simple_op == 8'h1D;


assign is_rti = simple_op == 8'h2A;
assign is_rts = simple_op == 8'h2B;

assign is_branch = (   simple_op == BCC ||
					   simple_op == BCS ||
					   simple_op == BEQ ||
					   simple_op == BMI ||
					   simple_op == BNE ||
					   simple_op == BPL ||
					   simple_op == BVC ||
					   simple_op == BVS ||
					   simple_op == JMP);

//always for ALU_B
always @ * begin

	//If the instruction is an immediate just do addr_in
	if(immediate_flag)
	
		alu_input_b_flags <= imm;
	
	end
	
	//If the source and destination match and its not acc reg then we must be doing an increment or decrement
	else if(
		(alu_input_a_flags == alu_output_flags || //src dest are equal (reg to reg for x or y) 
		alu_input_a_flags == mem_load_flag && alu_output_flags == mem_store)&& //or mem to mem
		alu_input_a_flags != a_reg) begin//And not doing something with acc
	
		alu_input_b_flags <= one;//Doing an increment
	
	end
	//Othewise if we're loading from memory and doing something with the accumulator then go with that for input b
	else if(mem_load_flag && alu_input_a_flags == a_reg) begin
	
		alu_input_b_flags <= mem_load;
	
	end
	
	//otherwise do 0 to catch transfers
	else begin
		alu_input_b_flags <= zero;
	end
	
end

//always for i nput a
always @ * begin



	case(reg_load_flag)
	
		2'b01: alu_input_a_flags <= a_reg;
		2'b10: alu_input_a_flags <= x_reg;
		2'b11: alu_input_a_flags <= y_reg;
		2'b00: alu_input_a_flags <= mem_load;
	
	endcase

end

//Always for alu output flags
always @ * begin

	case(store_flag) begin
	
		3'b010: alu_output_flags <= a_reg;
		3'b100: alu_output_flags <= y_reg;
		3'b011: alu_output_flags <= x_reg;
		3'b001: alu_output_flags <= mem_store;
		default: alu_output_flags <= zero;//Don't store anywhere

	end

end


//





endmodule