//CPU memory decoder


module cpu_mem_decode
(
	input wire [15:0] addr_in,
	output reg [15:0] addr_out,
	//If 1, this address is in memory, otherwise address referes to register
	output reg addr_valid
);


always @ (addr_in) begin


	//If this address is in a register
	if(addr_in >= 16'h2000 && addr_in < 16'h4020) begin
	
		addr_valid = 1'b0;
		
		//If it's in the top IO region
		if(addr_in >= 16'h4000) begin
		
			addr_out = addr_in;
		
		end
		
		//If we're in the PPU ctrl mirror region
		else if(addr_in >= 16'h2008) begin
			
			addr_out = addr_in[2:0] + 16'h2000; 
		
		end
		
		//If we're just in the PPU ctrl region
		else begin
		
			addr_out = addr_in;
		
		end
		
	
	end
	
	else begin
		
		addr_valid <= 1'b1;
		
		addr_out = addr_in;
	
		//If were in the ExROM SRAM ROM space
		// if(addr_in >= 16'h4020)begin
			
			//Just need to subtract 0x4020 and add 0x800
			// addr_out = addr_in;

		// end

		//If we don't need to decode anything
		// else begin

			//addr_out = addr_in & 16'h07FF;

		// end
	
	end



end


endmodule
