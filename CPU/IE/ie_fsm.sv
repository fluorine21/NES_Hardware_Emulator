
module ie_fsm
(
	
	input wire clk,
	input wire rst,
	input wire soft_reset,
	
	//Memory bus connections
	output wire [15:0] mem_addr,
	output wire [7:0] mem_data_out,
	input wire [7:0] mem_data_in,
	output wire mem_write_en,
	
	//Inputs from instruction fetch
	input wire [15:0] if_addr_in,//Can also be immediate or branch target

	input wire [15:0] if_pc_next,
	input wire [7:0] simple_op,
	input wire [3:0] alu_op_in,
	input wire [2:0] store_flag,
	input wire [1:0] reg_load_flag,
	input wire mem_load_flag,
	input wire immediate_flag,//if 1, treat addr_in as an immediate value
	
	
	//Inputs from PPU
	input wire [7:0] ppu_status,

	
	//Outpits to IF
	output reg [15:0] pc_next,
	output reg [7:0] status,
	//CPU registers
	output reg [7:0] a, x, y,
	output reg [7:0] stack_ptr

);

//simple op code decoder

wire is_load, is_store, is_branch, is_jsr, is_rts, is_rti, is_break, is_stack_op;

wire [7:0] alu_input_a_flags, alu_input_b_flags, alu_output_flags;
wire [3:0] alu_op_out;

simple_op_decode simple_op_decode_inst
(

	//Inputs
	simple_op,
	mem_load_flag,
	store_flag,
	reg_load_flag,
	alu_op_in,
	immediate_flag,
	


	//Outputs
	is_load, 
	is_store, 
	is_branch, 
	is_jsr, 
	is_rts, 
	is_rti, 
	is_break, 
	is_stack_op,
	
	alu_input_a_flags, 
	alu_input_b_flags, 
	alu_output_flags

);

//need an internal state for the PC
reg [15:0] pc;

/////////////////////
//Interrupt handler//
/////////////////////

wire interrupt_busy;
wire [15:0] interrupt_pc_out,
wire [7:0] interrupt_status_out,
wire [7:0] interrupt_stack_out
interrupt_handler interrupt_handler_inst
(

	clk, 
	rst,
	
	interrupt_addr,
	mem_data_in, 
	interrupt_data_out,
	interrupt_write_en,
	
	is_break,
	
	ppu_status,
	
	soft_reset,
	
	is_rti,
	
	interrupt_start,
	interrupt_done,
	interrupt_busy,
	
	pc,
	status,
	stack_ptr,
	
	interrupt_pc_out,
	interrupt_status_out,
	interrupt_stack_out

);






//Memory access registers for IE
reg [15:0] ie_addr;
reg [7:0] ie_data_out;
reg ie_write_en;

assign mem_addr = interrupt_busy ? interrupt_addr : ie_addr;
assign mem_data_out = interrupt_busy ? interrupt_data_out : ie_data_out;
assign mem_write_en = interrupt_busy ? interrupt_write_en : ie_write_en;


//Connections to simple decoder
wire [7:0] alu_input_a_flags;
wire [7:0] alu_input_b_flags;
wire [7:0] alu_output_flags;

//Inputs to AlU
reg [7:0] alu_input_a;
reg [7:0] alu_input_b;
//Output from ALU
wire [7:0] alu_output;

import ie_defs::*;
//pc next is output


task set_load_output();
begin

	//Determine the address we are loading from
	//Will either be if_addr_in or stack_ptr
	if(is_stack_op) begin
		//If address is stack_ptr, increment by 1
		//doing a pull here
		ie_addr <= {8'h01, (stack_ptr+1)};
		stack_ptr <= stack_ptr + 1;
	end
	else begin
		//Otherwise use addr_in
		ie_addr <= if_addr_in;
	end

end
endtask

task set_store_output();
begin

	//If we're pushing to the stack
	if(is_stack_op) begin
		
		ie_addr <= {8'h01, stack_ptr};
		//Decrement stack ptr
		stack_ptr <= stack_ptr - 1;
	
	end
	else begin
		//Otherwise use addr in
		ie_addr <= if_addr_in;
	end
	
	//Source of data will always be ALU output
	ie_data_out <= alu_output;
	
	ie_write_en <= 1;

end
endtask



task set_alu_inputs();
begin

	//Two case statements, one for A input, one for B input
	case(alu_input_a_flags)
	
		zero: alu_input_a <= 0;
		a_reg: alu_input_a <= a;
		x_reg: alu_input_a <= x_reg;
		y_reg: alu_input_a <= y_reg;
		mem_load: alu_input_a <= mem_data_in;
		imm: alu_input_a <= if_addr_in[7:0];
		default: alu_input_a <= 0;
	
	endcase
	
	case(alu_input_b_flags)
	
		zero: alu_input_b <= 0;
		a_reg: alu_input_b <= a;
		x_reg: alu_input_b <= x_reg;
		y_reg: alu_input_b <= y_reg;
		mem_load: alu_input_b <= mem_data_in;
		imm: alu_input_b <= if_addr_in[7:0];
		default: alu_input_b <= 0;
	
	endcase

end
endtask

task store_alu_output();
begin
	
	//Don't do anything for mem store here, happens automatically in set_store_output
	case(alu_output_flags)
	
		a_reg: a <= alu_output;
		x_reg: x <= alu_output;
		y_reg: y <= alu_output;
		
	endcase

end
endtask


				 


task determine_branch_outcome();
begin

	if
	(
		(simple_op == BCC && carry_flag == 0) ||
		(simple_op == BCS && carry_flag == 1) ||
	    (simple_op == BEQ && zero_flag  == 1) ||
	    (simple_op == BMI && minus_flag == 1) ||
	    (simple_op == BNE && zero_flag  == 0) ||
	    (simple_op == BPL && minus_flag == 0) ||
	    (simple_op == BVC && ovf_flag   == 0) ||
	    (simple_op == BVS && ovf_flag   == 1) ||
		(simple_op = JMP)
	)begin
	
		//Take the branch
		
		//Set pc next to if_addr_in
		pc <= if_addr_in;
	
	end
	else begin
	
		//Set pC next to if_pc_next
		pc <= if_pc_next;
	
	end

end
endtask

task push
(
	input [7:0] val
);
begin

	ie_addr <= {8'h01, stack_ptr};;
	ie_data_out <= val;
	ie_write_en <= 1;
	stack_ptr <= stack_ptr - 1;


end
endtask

task pull
(
	//No output, needs to happen two cycles later
);
begin

	ie_addr <= {8'h01, (stack_ptr+1)};
	ie_write_en <= 0;
	stack_ptr <= stack_ptr + 1;


end
endtask

task read_back_interrupt_result();
begin


end
endtask


always @ (posedge clk or negedge rst) begin


	if(!rst) begin
	
		reset_regs();
	
	end
	else begin

		case(state):
		
			state_idle: begin
			
				//If we are being presented with a valid instruction
				if(if_ready) begin
				
					
					//If this is a branch instruction
					if(is_branch) begin
					
						//Determine the branch outcome and go to the interrupt handler
						determine_branch_outcome();
						
						state <= state_interrupt_1;
					
					end
					
					//If this is a jump instruction
					else if(is_jsr) begin
					
						//Queue up a push of pc_next low
						push(if_pc_next[7:0]);
					
						//Go to the jsr state
						state <= state_jump_1;
					
					end
					
					else if(is_rti) begin
						
						//Go to the interrupt handler
						state <= state_interrupt_1;
					
					end
					
					//If we're doing a return from subroutine
					else if(is_rts) begin
					
						//Pull the high byte of the pc off the stack first
						pull();
					
						//Go to the return state
						state <= state_return_1;
					
					end
					
					//If this instruction is a software break
					else if(is_break) begin
						//Just go to the interrupt handler state
						state <= state_interrupt_1;
					end
					
					//if we need to do a load
					else if(is_load) begin
						
						//Set up the memory bus
						set_load_output();
						
						//Go to the load_1 state to wait on data
						state <= state_load_1;
					
					end
					
					//Otherwise just need to go to the ALU operation
					else begin
						
						//Set up the ALU inputs
						set_alu_inputs();
						
						//Go to the ALU output store state
						state <= state_alu_store_output;
					
					end
				
				end
			
			end
			
			
			state_load_1: begin
			
				//Just go to the load 2 state
				state <= state_load_2;
			
			end
			
			state_load_2: begin
			
				//Memory result is available here
				
				//Set the ALU inputs and go to the store state
				set_alu_inputs();
				state <= state_alu_store_output;
			
			end
			
			state_alu_store_output: begin
			
				//Set the ALU outputs
				store_alu_output();
				
				//If we need to store something in memory
				if(is_store) begin
				
					//Set up the memory bus for a store
					set_store_output();

				end

				//Go to the interrupt handler state
				//Automatically resets write_en
				state <= state_interrupt_1;

			
			end
			
			state_interrupt_1: begin
			
				//Just need to reset write enable here
				mem_write_en <= 0;
			
				//Start the interrupt handler
				interrupt_start <= 1;
				
				//go to the interrupt wait state
				state <= state_interrupt_2;
			
			end
			
			state_interrupt_2: begin
			
				interrupt_start <= 0;
				//Just go to the interrupt readback state
				state <= state_interrupt_3;
				
			end
			
			state_interrupt_3: begin
			
				if(interrupt_done) begin
				
					//Load in the result of the interrupt
					read_back_interrupt_result();
				
					//Start the instruction fetch
					if_start <= 1;
					
					//Go to the IF wait state
					state <= state_if_wait;
					
				end
			end
			
			state_if_wait: begin
			
				//Reset if start
				if_start <= 0;
			
				//Reset write enable
				if_write_en <= 0;
			
				//If instruction fetch is busy loading
				if(!if_ready) begin
				
					//Go back to the idle state
					state <= state_idle;
				
				end
			end
			
			//TODO
			state_jump_1: begin
				
				//Queue up the high byte next
				push(if_pc_next[15:8]);
				
				//set pc next to addr in
				pc <= addr_in;
				
				state_if_start <= 1;
				
				//Go wait on if_wait
				state <= state_if_wait;
				
				
			end
			
			state_return_1: begin
				
				//queue up the load of the low byte
				pull();
				
				state <= state_return_2;
			
			end

			state_return_2: begin
				
				//Read the high byte off the data bus
				pc[15:8] <= mem_data_in;
				
				state <= state_return_3;
			
			end
			
			state_return_3: begin
				
				//Read in the low byte
				pc[7:0] <= mem_data_in;
				
				//Start if
				if_start <= 1;
				
				//Go to the wait if state
				state <= state_if_wait;
			
			
			end
			
			default: reset_regs();
		
		endcase

	end

end


endmodule



