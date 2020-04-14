


module dma_module
(
	input wire clk,
	input wire rst,
	
	input wire [15:0] cpu_addr,
	input wire [7:0] cpu_data,
	input wire cpu_write_en,
	
	output wire [15:0] mem_addr,
	input wire [7:0] mem_data_in, //Incomming data from CPU mem_addr
	output reg [7:0] mem_data_out, // outgoing data to sprite mem
	output reg [7:0] mem_write_en,
	output reg busy // Used to switch the memory bus mux

);

//First need to read the old spram addr
//Then need to reset spram addr to 0
//Then perform the transfer
//Then reset the old spram addr

reg [7:0] spram_addr_old;
reg [15:0] mem_start_addr;
reg [3:0] state;

localparam [3:0] state_idle = 4h'0, 
				 state_reset_spram_addr = 4'h1, 
				 state_transfer_read = 4'h2,
				 state_transfer_write = 4'h3,
				 state_fix_spram_addr = 4'h4;


always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin
	
		mem_data_out <= 8b0
	
	end
	
	else begin
	
		case(state)
	
	
		state_idle: begin
		
			//If the CPU is trying to write to 0x4014 
			if(cpu_addr == 16'h4014 && cpu_write_en == 1'b1) begin
			
				//Set the busy line
				busy <= 1'b1;
				
				//Read the current spram pointer
				mem_addr <= 16'h2003;
				mem_write_en <= 1'b0;
				
				//Set the CPU starting address
				mem_start_addr <= {cpu_data, 8'h0};
				
				//go to the reset spram addr state
				state <= state_reset_spram_addr;
			
			end
			else begin
			
				//Give access back to CPU
				busy <= 1'b0;
				mem_write_en <= 1'b0;
			
			end
		
		end
		
		state_reset_spram_addr: begin
		
			//Store the old SPRAM addr
			spram_addr_old <= mem_data_in;
			
			//Write 8'h0 to SPRAM addr
			mem_data_out <= 8'h0;
			mem_write_en <= 8'h0;
			
			//Go to the first transfer state
			state <= state_transfer_read;
			
		end
		
		state_transfer_read: begin
		
			//Read data from the first CPU address
			mem_write_en <= 1'b0;
			mem_addr <= mem_start_addr;
			
			state <= state_transfer_write;
		
		end
		
		state_transfer_write: begin
		
			//Load the result of memory back into the input
			mem_data_out <= mem_data_in;
			
			//Set the address line to the SPRAM I/O register
			mem_addr <= 16'h2004;
			mem_write_en <= 1'b1;
			
			//If we're done writing memory
			if(mem_start_addr[7:0] == 8'hFF) begin
					
					state <= state_fix_spram_addr;
			
			end
			else begin
				
				//Increment the address and read the next value
				mem_start_addr <= mem_start_addr + 1;
				state <= state_transfer_read;
			end
		
		end
		
		state_fix_spram_addr: begin
			
			//write the SPRAM addr register with the old value
			mem_addr <= 16'h2003;
			mem_data_out <= spram_addr_old;
			
			state <= state_idle;
			
		end
		
		
		default: begin
		
			state <= state_idle;
		
		end
	
	
		endcase
	
	end








end


task reset();
begin



end
endtask
				 
				 
				 
endmodule