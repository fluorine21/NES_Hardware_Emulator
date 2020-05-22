//Memory decoder for the PPU
//Takes a full address for the PPU and
//reroutes it to destination based on fig3-1 page 12
//and ppu_notes memory map


module ppu_mem_decode
(
	input wire [15:0] addr_in,
	
	input wire h_mirror,
	input wire v_mirror,
	
	output reg [15:0] addr_out
);

//This does the mirroring for 4000 to 10000
wire [15:0] addr_int = {2'b00, addr_in[13:0]};

always @ * begin

	addr_out <= addr_int;

/* 
	//If we're in the mirror region 3F20 to 4000
	if(addr_int >= 16'h3F20) begin
		
		//Need to subtract 0x3F20 to find offset, do mod 0x20 and then add to 0x3000
		
		addr_out <= (addr_int & 16'h001F) | 16'h3F00;
		
	end
	
	//If we're in the image and sprite palette region 3F00 to 3F1F
	else if(addr_int >= 16'h3F00) begin
	
		// if(addr_int[1:0] == 2'b00) begin
		
			// addr_out <= 16'h3000;
			
		// end
		// else begin
			//Need to subtract 0F00 to get to correct location
			// addr_out <= addr_int - 16'h0F00;
		// end
		addr_out <= addr_int;
		
	
	end
	
	//If we're in the mirror reion 2000 to 2EFF
	else if(addr_int >= 16'h3000) begin
	
		//Need to subtract 1000 to get to start of name table 0
		addr_out <= addr_int - 16'h1000;
	
	end
	
	//Somethwere in nametables or pattern tables
	else begin
	
		//If we're in the nametables
		if(addr_int >= 16'h2000) begin
		
			//If we're doing vertical mirroring
			if(v_mirror) begin
			
				if(addr_int >= 16'h2800) begin
				
					//Subtract 800 to get to the proper nametables
					addr_out <= addr_int - 16'h0800;
				
				end
				
				else begin
				
					//Don't need to do any translation
					addr_out <= addr_int;
				
				end
			end
			else if(h_mirror) begin
			
				//TODO
				addr_out <= addr_int;
			
			end
			else begin
			
				//Don't need to do any translation
				addr_out <= addr_int;
			
			end
		
		end
		else begin
			//Don't need to do any translation
			addr_out <= addr_int;
		end
	end */
	

end




endmodule