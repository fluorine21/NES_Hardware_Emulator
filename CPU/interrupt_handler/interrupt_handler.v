


//Little endian

module interrupt_handler
(
	input wire clk,
	input wire rst, 
	
	//Memory access lines
	//Need to be multiplexed with the IE mem access lines so that this module can access bus when busy, use busy flag as mux control
	output reg [15:0] cpu_addr,
	input wire [7:0] cpu_data_in,
	output reg [7:0] cpu_data_out,
	output reg cpu_write_en,

	//////////////////////////////////////////////
	//Interrupt sources, these will be latched internally
	//Whenever a BRK instruction occurs
	input wire break_in,
	
	//Whenever ppu_vblank occurs
	//Non-maskable interrupt
	input wire [7:0] ppu_status,
	
	//Need to know if we're having a soft reset
	input wire soft_reset_n,
	//////////////////////////////////////////////
	
	//Need to know if this instruction is a return from interrupt so we can reset the interrupt disable flag
	input wire is_rti,
	
	//Interrupt handler status and control
	input wire start,
	output wire done,//Pulsed once when handler is finished
	output wire accessing_memory,
	
	//Status inputs from IE
	input wire [15:0] pc_in,
	input wire [7:0] status_in,
	input wire [7:0] stack_ptr_in,
	
	//Next state of these registers when state machine finishes
	output reg [15:0] pc_out,
	output reg [7:0] status_out,
	output reg [7:0] stack_ptr_out,
	output wire ie_dis,
	
	input wire halt
	
);

reg [7:0] pc_high;

//State machine variables
reg [7:0] state;
localparam [7:0] state_idle = 0,
				 state_handle_1 = 1,
				 state_handle_2 = 2,
				 state_handle_3 = 3,
				 state_handle_4 = 4,
				 state_return_1 = 5,
				 state_return_2 = 6,
				 state_return_3 = 7,
				 state_return_4 = 8,
				 state_wait_1 = 9;

//Interrupt disable flag is in status 2
assign break_disable = status_in[2];

reg break_flag;

reg [7:0] addr_low;//Low byte of the interrupt vector

reg interrupt_disable;//If we're executing an interrupt
assign ie_dis = interrupt_disable;

reg [15:0] cpu_addr_next;//For loading interrupt vector

assign done = state == state_wait_1;
assign accessing_memory = state != state_idle;


//Latches
//Check next address to figure out which flag to reset
reg soft_reset_int;
reg ppu_status_int;


always @ (posedge clk or negedge rst) begin

	if(!rst) begin
	
		soft_reset_int = 0;
		ppu_status_int = 0;
		break_flag = 0;
	
	end
	
	else begin
	
	
		//If we need to set soft_reset (inverted)
		if(!soft_reset_n) begin
			soft_reset_int = 1;
		end
		
		//If we need to set ppu_status_int
		if(ppu_status[7]) begin
			ppu_status_int = 1;
		end
		//If we need to set break
		if(break_in) begin
			break_flag = 1;
		end
		
		//If we need to reset soft reset
		if(cpu_addr_next == 16'hFFFD) begin
		
			soft_reset_int = 0;
		
		end
		
		//If we need to reset ppu status
		if(cpu_addr_next == 16'hFFFB) begin
		
			ppu_status_int = 0;
		
		end
		
		if(cpu_addr_next == 16'hFFFF) begin
			break_flag = 0;
		end
	
	
	end
	
end

task reset_regs();
begin

	state <= state_idle;
	pc_high = 0;
	addr_low = 0;
	interrupt_disable = 0;
	cpu_addr_next = 0;
	cpu_addr <= 0;
	cpu_data_out = 0;
	pc_out <= 0;
	stack_ptr_out <= 0;
	status_out <= 0;
	cpu_write_en <= 0;

end
endtask


always @ (posedge clk or negedge rst) begin

	if(rst == 0) begin
	
		reset_regs();
	
	end
	
	else if(!halt) begin
	
		case(state)		
		
			state_idle: begin

				//No need to reset done flag, state dependent
			
				//Reset write enable
				cpu_write_en <= 0;
				
				//Reset next address if no interrupt is triggered
				cpu_addr_next <= 0;
				
				if(start) begin

					//Don't need to do anything by default, just return whatver the IE gave us
					pc_out <= pc_in;
					status_out <= status_in;
					stack_ptr_out <= stack_ptr_in;
							
					state <= state_wait_1;
			
					//If the interrupt disable flag is set
					if(interrupt_disable) begin
					
						//If this instruction is rti we can unset it
						if(is_rti) begin
						
							interrupt_disable <= 0;
							
							//Need to go pop the PC and CPU status register
							state <= state_return_1;
							
							//Queue read on high byte of return address
							cpu_addr <= 16'h0100 | ((stack_ptr_in+1) & 8'hFF);
						
						end
					
					end	
						

					//If this is a soft reset
					else if(soft_reset_int) begin
						
						//0xFFFC and FFFD
						cpu_addr <= 16'hFFFC;
						cpu_addr_next <= 16'hFFFD;
						
						state <= state_handle_1;
					
					end
					//or a ppu blanking
					else if(ppu_status_int) begin
					
						//Lookup the interrupt vector at 0xFFFA (low) and 0xFFFB (high)
						cpu_addr <= 16'hFFFA;
						cpu_addr_next <= 16'hFFFB;
						state <= state_handle_1;
					
					end
					//or be a BRK, no need to latch this one, only externals
					else if(break_flag && !break_disable) begin
					
						//Lookup the interrupt vector at 0xFFFE (low) and 0xFFFF (high)
						cpu_addr <= 16'hFFFE;
						cpu_addr_next <= 16'hFFFF;
						state <= state_handle_1;
					
					end
					
					
				end
						
						
			end
				
			state_handle_1: begin
			
				//Queue up the next address
				cpu_addr <= cpu_addr_next;
				
				state <= state_handle_2;
			
			end
			
			state_handle_2: begin
			
				//Get the low byte of the address
				addr_low <= cpu_data_in;
				
				//Queue up the program counter for a write
				cpu_addr <= {8'h01, stack_ptr_in};
				cpu_data_out <= pc_in[15:8];
				cpu_write_en <= 1;
				
				state <= state_handle_3;
			
			end
			
			
			
			state_handle_3: begin
			
				//Store the high byte inside of pc output
				pc_out = {cpu_data_in, addr_low};
			
				//Push the program counter and the status register
				cpu_addr <= 16'h0100 | ((stack_ptr_in-1) & 8'hFF);
				cpu_data_out <= pc_in[7:0];
				
				////Set the interrupt disable flag
				interrupt_disable <= 1;
				
				//Push the new status register
				status_out <= status_in;
				
				state <= state_handle_4;
				

			end
			
			state_handle_4: begin
			
				//Go to wait 1 state so we have enough time to do the write
				state <= state_wait_1;
				
				cpu_addr <= 16'h0100 | ((stack_ptr_in-2) & 8'hFF);
				
				if(cpu_addr_next == 16'hFFFF) begin
					cpu_data_out <= status_in | 8'h00110000;
				end
				else begin
					cpu_data_out <= status_in | 8'h00100000;
				end
			
				//Push the new stack pointer
				//3 because we stored 3 bytes
				stack_ptr_out <= stack_ptr_in - 3;
			
			
			end
			
			state_return_1: begin
			
				//Queue up the PC's address
				cpu_addr <= 16'h0100 | ((stack_ptr_in+2) & 8'hFF);
				
				//Go to next state
				state <= state_return_2;
			
			end
			
			state_return_2: begin
			
				//Read in the address high byte
				status_out <= cpu_data_in & 8'h11001111;
				
				//Queue up the status register
				cpu_addr <= 16'h0100 | ((stack_ptr_in+3) & 8'hFF);
				
				//Set the next stack ptr
				stack_ptr_out <= stack_ptr_in + 3;
				
				//Reset the interrupt disable flag
				interrupt_disable <= 0;
				
				//Go read the PC
				state <= state_return_3;
			
			end
			
			state_return_3: begin
			
				//Read in the PC
				pc_out[7:0] <= cpu_data_in;
				
				state <= state_return_4;
			
			end
			
			state_return_4: begin
			
				//Read back the status register
				pc_out[15:8] <= cpu_data_in;
			
				//Go to wait to trigger done
				state <= state_wait_1;
				
			end
			
			state_wait_1: begin
				
				cpu_write_en <= 0;
				
				//Just go back to idle
				state <= state_idle;
			
			end
		
			default: begin
				reset_regs();
			end
				
		
		
		endcase
	
	end


end


endmodule





