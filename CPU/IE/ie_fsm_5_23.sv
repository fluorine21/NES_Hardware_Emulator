import ie_defs::*;

//Test commit

`define DEBUG // Turns on instruction debug output during fetch cycle

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
	output reg mem_read_en,
	
	//Default PC to go to on hard reset
	input wire [15:0] pc_reset,
	
	//Inputs from instruction fetch
	
	input wire if_ready,
	input wire [15:0] if_addr_in,//Can also be immediate or branch target
	input wire [15:0] if_pc_next,
	input wire [7:0] simple_op,
	input wire [3:0] alu_op_in,
	input wire [2:0] store_flag,
	input wire [1:0] reg_load_flag,
	input wire mem_load_flag,
	input wire immediate_flag,//if 1, treat addr_in as an immediate value
	
	//IF control
	output reg if_start,
	
	
	//Inputs from PPU
	input wire [7:0] ppu_status,

	
	//Outpits to IF
	output reg [15:0] pc_next,
	output reg [7:0] ie_status,
	//CPU registers
	output reg [7:0] a, x, y,
	output reg [7:0] stack_ptr,
	
	
	input wire halt,//CPU halts execution if 1
	input wire nIRQ,
	
	input wire [7:0] ppu_ctrl1

);


reg [7:0] dma_cnt;
localparam [7:0] dma_delay = 5;


//localparam [31:0] delay_cycles = 50;
localparam [31:0] delay_cycles = 3;

//////////////////////////
//simple op code decoder//
//////////////////////////

wire is_load, is_store, is_branch, is_jsr, is_rts, is_rti, is_break, is_stack_op, is_nop, is_flag_inst;

wire [7:0] alu_input_a_flags, alu_input_b_flags, alu_output_flags;
wire [3:0] alu_op_out;
wire [7:0] alu_status_edit;


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
	is_nop,
	is_flag_inst,
	
	alu_input_a_flags, 
	alu_input_b_flags, 
	alu_output_flags,
	alu_status_edit

);

/////////////////////
//Interrupt handler//
/////////////////////

wire [15:0] interrupt_addr;
wire [7:0] interrupt_data_out;
reg interrupt_start;
wire interrupt_busy;
wire interrupt_write_en;
wire [15:0] interrupt_pc_out;
wire [7:0] interrupt_status_out;
wire [7:0] interrupt_stack_out;
wire interrupt_disable;
wire interrupt_done;
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
	
	pc_next,
	ie_status,
	stack_ptr,
	
	interrupt_pc_out,
	interrupt_status_out,
	interrupt_stack_out,
	interrupt_disable,
	
	halt,
	nIRQ,
	
	ppu_ctrl1

);

//Inputs to AlU
reg [7:0] alu_input_a;
reg [7:0] alu_input_b;
//Output from ALU
wire [7:0] alu_output;
wire [7:0] alu_status_out;
wire ignore_output;
//ALU declaration
alu alu_inst(

	//inputA : in std_logic_vector(7 downto 0);
	alu_input_a,
	//inputB: in std_logic_vector(7 downto 0);
	alu_input_b,
	//alu_op: in std_logic_vector(3 downto 0);
	alu_op_in,
	//opcode : in std_logic_vector(7 downto 0);
	simple_op,
	//proc_status_in : in std_logic_vector(7 downto 0);
	ie_status,
	
	
	//ignore_output : out std_logic;
	ignore_output,
	//proc_status_out : out std_logic_vector(7 downto 0);
	alu_status_out,
	//alu_out : out std_logic_vector(7 downto 0)
	alu_output
);

wire carry_flag = ie_status[0];
wire minus_flag = ie_status[7];
wire ovf_flag = ie_status[6];
wire zero_flag = ie_status[1]; 


//Memory access registers for IE
reg [15:0] ie_addr;
reg [7:0] ie_data_out;
reg ie_write_en;

assign mem_addr = interrupt_busy ? interrupt_addr : ie_addr;
assign mem_data_out = interrupt_busy ? interrupt_data_out : ie_data_out;
assign mem_write_en = interrupt_busy ? interrupt_write_en : ie_write_en;



reg [7:0] state;
localparam [7:0] state_idle = 0, 
				 state_load_1 = 1, 
				 state_load_2 = 2, 
				 state_alu_store_output = 3,
				 state_interrupt_1 = 4, 
				 state_interrupt_2 = 5, 
				 state_interrupt_3 = 6, 
				 state_jump_1 = 7, 
				 state_return_1 = 8, 
				 state_return_2 = 9, 
				 state_return_3 = 10, 
				 state_if_wait = 11,
				 state_dma_delay = 12,
				 state_delay = 13;
	


//pc next is output


task set_load_output();
begin

	//Doing a read here, need to pulse read_en
	mem_read_en <= 1;

	//Determine the address we are loading from
	//Will either be if_addr_in or stack_ptr
	if(is_stack_op) begin
		//If address is stack_ptr, increment by 1
		//doing a pull here
		ie_addr <= 16'h0100 | ((stack_ptr+1) & 8'hFF);
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
	
	
	//If this happens to be a php instruction
	if(simple_op == 8'h25) begin
		//Set the reserve bit and break bit
		ie_data_out <= alu_output | 8'b00110000;
	end
	else begin
		//Source of data will always be ALU outpuy
		ie_data_out <= alu_output;
	end
	
	ie_write_en <= 1;

end
endtask



task set_alu_inputs();
begin

	//Two case statements, one for A input, one for B input
	case(alu_input_a_flags)
	
		zero: alu_input_a <= 0;
		a_reg: alu_input_a <= a;
		x_reg: alu_input_a <= x;
		y_reg: alu_input_a <= y;
		mem_load: alu_input_a <= mem_data_in;
		imm: alu_input_a <= if_addr_in[7:0];
		one: alu_input_a <= 1;
		status_reg: alu_input_a <= ie_status;
		stack_reg: alu_input_a <= stack_ptr;
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

	`ifdef DEBUG
					
		report_alu_operands();
					
	`endif

	//Store the new status
	if(alu_output_flags != status_reg) begin
		ie_status <= alu_status_out;
	end
	
	//Don't do anything for mem store here, happens automatically in set_store_output
	case(alu_output_flags)
	
		a_reg: a <= alu_output;
		x_reg: x <= alu_output;
		y_reg: y <= alu_output;
		//Don't store reserved and break if we're pulling into status reg
		status_reg: ie_status <= alu_output & 8'b11001111;
		//status_reg: ie_status <= alu_output;
		stack_reg: stack_ptr <= alu_output;
		
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
		(simple_op == JMP)
	)begin
	
		//Take the branch
		
		//Set pc next to if_addr_in
		pc_next <= if_addr_in;
	
	end
	else begin
	
		//Set pC next to if_pc_next
		pc_next <= if_pc_next;
	
	end

end
endtask

task push
(
	input [7:0] val
);
begin

	ie_addr <= {8'h01, stack_ptr};
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

	ie_addr <= 16'h0100 | ((stack_ptr+1) & 8'hFF);
	ie_write_en <= 0;
	stack_ptr <= stack_ptr + 1;


end
endtask


reg [15:0] pc_prev;
task read_back_interrupt_result();
begin

	

	`ifdef DEBUG				

		if(interrupt_pc_out == pc_prev) begin
			
			catch_trap();
		
		end
	
	`endif
	
	

	//Read back pc next
	pc_next <= interrupt_pc_out;
	
	//Read back stack next
	stack_ptr <= interrupt_stack_out;
	
	//Read back the status
	ie_status <= interrupt_status_out;
	
end
endtask

task goto_interrupt();
begin

	interrupt_start <= 1;
	state <= state_interrupt_2;

end
endtask


task debug_print();
begin

	$display("IF OUTPUTS: Simple op: %x, ALU op: %x, reg load flag: %x, store flag: %x, mem load flag: %x, immediate flag: %x, addr in: %x, IF pc next: %x", simple_op, alu_op_in, reg_load_flag, store_flag, mem_load_flag, immediate_flag, if_addr_in, if_pc_next);
	
	$display("OP DECODE OUTPUTS: is load: %x, is store: %x, is branch: %x, is jsr: %x, is rts: %x, is rti: %x, is break: %x, is stack op: %x, is nop: %x, is flag inst: %x, input a flags: %x, input b flags: %x, output flags: %x", is_load, is_store, is_branch, is_jsr, is_rts, is_rti, is_break, is_stack_op, is_nop, is_flag_inst, alu_input_a_flags, alu_input_b_flags, alu_output_flags);
	
	$display("State before is: a: %x, x: %x, y: %x, status: %x, stack ptr: %x, pc now: %x, interrupt disable: %x", a, x, y, ie_status, stack_ptr, pc_next, interrupt_disable); 

end
endtask

task report_state();
begin
	$display("State after is: a: %x, x: %x, y: %x, status: %x, stack ptr: %x, pc next: %x, interrupt disable: %x\n", a, x, y, ie_status, stack_ptr, pc_next, interrupt_disable); 
end
endtask		

task report_alu_operands();
begin
	$display("ALU input A was %x, ALU input B was %x, ALU output was %x", alu_input_a, alu_input_b, alu_output);
end
endtask	 

task catch_trap();
begin
	$display("Trapped at %x", pc_next);
end
endtask
			
reg [31:0] d_cnt;			
task reset_regs();
begin

	//Default register values
	mem_read_en <= 0;
	ie_status <= 0;
	a <= 0;
	x <= 0;
	y <= 0;
	stack_ptr <= 16'hFF;
	interrupt_start <= 0;
	alu_input_a <= 0;
	alu_input_b <= 0;
	
	ie_addr <= 0;
	ie_data_out <= 0;
	ie_write_en <= 0;

	//load in the reset vector PC into PC and PC next
	pc_next <= pc_reset;

	//Start in the wait if state to load the next instruction
	if_start <= 1;
	state <= state_if_wait;
	
	dma_cnt <= 0;
	d_cnt <= 0;

end
endtask


wire [15:0] jsr_pc = if_pc_next - 1;


always @ (posedge clk or negedge rst) begin


	if(!rst) begin
	
		reset_regs();
	
	end
	else if(!halt) begin

		case(state)
		
			state_idle: begin
			
				//If we are being presented with a valid instruction
				if(if_ready) begin
				
					pc_prev <= pc_next;
				
					//If we're in debug mode print out the current instruction
					`ifdef DEBUG
					
						debug_print();
					
					`endif
					
				
					//Go to the next PC by default
					pc_next <= if_pc_next;
				
					
					//If this is a branch instruction
					if(is_branch) begin
					
						//Determine the branch outcome and go to the interrupt handler
						determine_branch_outcome();

						goto_interrupt();
					
					end
					
					//If this is a jump to subroutine instruction
					else if(is_jsr) begin
					
						//Queue up a push of pc_next low
						push(jsr_pc[15:8]);
						
						//set pc next to addr in
						pc_next <= if_addr_in;
					
						//Go to the jsr state
						state <= state_jump_1;
					
					end
					
					else if(is_rti) begin
						
						goto_interrupt();
					
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
						goto_interrupt();
					end
					
					//if we need to do a load
					else if(is_load) begin
						
						//Set up the memory bus
						set_load_output();
						
						//Go to the load_1 state to wait on data
						state <= state_load_1;
					
					end
					
					//Otherwise if this is a flag instruction
					else if(is_flag_inst) begin
					
						//Store the new alu output
						ie_status <= alu_status_out;
						
						goto_interrupt();
					
					end
					
					//If this is a no-op instruction
					else if(is_nop) begin
					
						goto_interrupt();
						
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
				
				//Reset the read flag
				mem_read_en <= 0;
			
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


				//If we just started DMA
				if(if_addr_in == 16'h4014 && is_store) begin
					
					//Wait for DMA to become active and halt us safetly
					dma_cnt <= 0;
					state <= state_dma_delay;
					
				end
				else begin
					//No need to wait
					goto_interrupt();

				end

			
			end
			
			state_dma_delay: begin
			
				ie_write_en <= 0;
			
				if(dma_cnt > dma_delay) begin
				
					dma_cnt <= 0;
					//Now go to the interrupt handler
					goto_interrupt();
				
				end
				else begin
					dma_cnt <= dma_cnt + 1;
				end
			
			end

			state_interrupt_2: begin
			
				ie_write_en <= 0;
			
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
			
				//Reset write enable
				ie_write_en <= 0;
			
				//If instruction fetch is busy loading
				if(!if_ready) begin
				
					//Reset if start
					if_start <= 0;
				
					//Go back to the idle state
					state <= state_delay;
					
					//Report the current state
					`ifdef DEBUG
					
						report_state();
					
					`endif
				
				end
			end
			
			//TODO
			state_jump_1: begin
				
				//Queue up the high byte next
				push(jsr_pc[7:0]);
				
				goto_interrupt();
				
				
			end
			
			state_return_1: begin
				
				//queue up the load of the low byte
				pull();
				
				state <= state_return_2;
			
			end

			state_return_2: begin
				
				//Read the high byte off the data bus
				pc_next[7:0] <= mem_data_in;
				
				state <= state_return_3;
			
			end
			
			state_return_3: begin
				
				//Read in the low byte
				//pc_next[15:8] <= mem_data_in;
				
				//Need to return at + 1
				pc_next <= {mem_data_in, pc_next[7:0]} + 1;
				
				goto_interrupt();
			
			
			end
			
			
			state_delay: begin
			
				d_cnt <= d_cnt + 1;
				
				if(d_cnt > delay_cycles) begin
					
					d_cnt <= 0;
				
					state <= state_idle;
				
				end
			
			
			end
			
			default: reset_regs();
		
		endcase

	end

end


endmodule



