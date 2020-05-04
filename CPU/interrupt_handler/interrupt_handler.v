


//Little endian

module interrupt_handler
(
	input wire clk,
	input wire rst, 
	
	//Memory access lines
	//Need to be multiplexed with the IE mem access lines so that this module can access bus when busy, use busy flag as mux control
	output wire cpu_addr,
	input wire cpu_data_in,
	output reg cpu_data_out,
	output wire cpu_write_en,

	//////////////////////////////////////////////
	//Interrupt sources, these will be latched internally
	//Whenever a BRK instruction occurs
	input wire break_flag,
	
	//Whenever ppu_vblank occurs
	//Non-maskable interrupt
	input wire [7:0] ppu_status,
	
	//Need to know if we're having a soft reset
	input wire soft_reset,
	//////////////////////////////////////////////
	
	//Need to know if this instruction is a return from interrupt so we can reset the interrupt disable flag
	input wire is_rti,
	
	//Interrupt handler status and control
	input wire start,
	output wire busy,
	
	//Status inputs from IE
	input wire [15:0] pc_in,
	input wire [7:0] status_in,
	input wire [15:0] stack_ptr_in
	
	//Next state of these registers when state machine finishes
	output reg [15:0] pc_out,
	output reg [7:0] status_out,
	output reg [15:0] stack_ptr_out
	
);

//State machine variables
reg [7:0] state;
localparam [7:0] state_idle = 0,
				 state_handle_1 = 1,
				 state_handle_2 = 2,
				 state_handle_3 = 3,
				 state_return_1 = 4,
				 state_return_2 = 5,
				 state_return_3 = 6;

//Interrupt disable flag is in status 2
assign break_disable = status_in[2];

assign busy = state != state_idle;

reg [7:0] addr_low;//Low byte of the interrupt vector

reg interrupt_disable;//If we're executing an interrupt


//Latches
//Check next address to figure out which flag to reset
reg soft_reset_int;
reg [7:0] ppu_status_int;


always @ (posedge clk or negedge rst) begin

	if(!rst) begin
	
		soft_reset_int = 0;
		ppu_status_int = 0;
	
	end
	
	else begin
	
	
		//If we need to set soft_reset
		if(soft_reset) begin
			soft_reset_int = 1;
		end
		
		//If we need to set ppu_status_int
		if(ppu_status[7]) begin
			ppu_status_int = 1;
		end
		
		//If we need to reset soft reset
		if(state = state_handle_1 && cpu_addr_next == 16'hFFFD) begin
		
			soft_reset_int = 0;
		
		end
		
		//If we need to reset ppu status
		if(state = state_handle_1 && cpu_addr_next == 16'hFFFB) begin
		
			ppu_status_int = 0;
		
		end
	
	
	end
	
end


always @ (posedge clk or negedge rst) begin

	if(rst == 0) begin
	
	
	end
	
	else begin
	
		case(state):
		
		
			state_idle: begin
			
				//Reset write enable
				cpu_write_en <= 1;
				
				//Reset next address if no interrupt is triggered
				cpu_addr_next <= 0;
			
				//If the interrupt disable flag is set
				if(interrupt_disable) begin
				
					//If this instruction is rti we can unset it
					if(is_rti) begin
					
						interrupt_disable <= 0;
						
						//Need to go pop the PC and CPU status register
						
						
					
					end
					
					else begin
					
						//Don't need to do anything, just return whatver the IE gave us
						pc_out <= pc_in;
						status_out <= status_in;
						stack_ptr_out <= stack_ptr_in;
					
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
				else if(ppu_status_int[7]) begin
				
					//Lookup the interrupt vector at 0xFFFA (low) and 0xFFFB (high)
					cpu_addr <= 16'hFFFA;
					cpu_addr_next <= 16'hFFFB
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
				
			state_handle_1: begin
			
				//Queue up the next address
				cpu_addr <= cpu_addr_next;
				
				state <= state_handle_2;
			
			end
			
			state_handle_2: begin
			
				//Get the low byte of the address
				addr_low <= cpu_data_in;
				
				//Queue up the program counter for a write
				cpu_addr <= stack_ptr_in + 1;
				cpu_data_out <= pc_next;
				cpu_write_en <= 1;
				
				state <= state_handle_3;
			
			end
			
			state_handle_3: begin
			
				//Store the high byte inside of pc output
				pc_out = {cpu_data_in, addr_low};
			
				//Push the program counter and the status register
				cpu_addr <= stack_ptr_in + 2;
				cpu_data_out <= cpu_status;
				
				////Set the interrupt disable flag
				interrupt_disable <= 1;
				
				//Push the new stack pointer
				stack_ptr_out <= stack_ptr_in + 2;
				
				//Push the new status register
				status_out <= status_in;
				
				//Go back to the idle state
				state <= state_idle;
			
			end
			
			state_return_1: begin
			
				//Queue up the PC's address
				cpu_addr <= stack_ptr_in - 1;
				
				//Go to next state
				state <= state_return_2;
			
			end
			
			state_return_2: begin
			
				//Read back the status register
				status_out <= cpu_data_in;
				
				//Reset the interrupt disable flag
				interrupt_disable <= 0;
				
				//Go read the PC
				state <= state_return_3;
			
			end
			
			state_return_3: begin
			
				//Read in the PC
				pc_out <= cpu_data_in;
				
				//Set the new stack pointer
				stack_ptr_out <= stack_ptr_in - 2;
				
				//Go back to idle
				state <= state_idle;
			
			end
		
			default: begin
				reset_regs();
			end
				
		
		
		endcase
	
	end


end


endmodule





