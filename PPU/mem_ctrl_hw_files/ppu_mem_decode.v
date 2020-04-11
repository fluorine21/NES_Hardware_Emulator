//Memory decoder for the PPU
//Takes a full address for the PPU and
//reroutes it to destination based on fig3-1 page 12
//and ppu_notes memory map


module ppu_mem_decode
(
	input wire [15:0] addr_in,
	output wire [15:0] addr_out
);

//This does the mirroring for 4000 to 10000
wire [15:0] addr_int = {0b00, addr_in[13:0]};

always @ (addr_in) begin

	//If we're in the mirror region 3F20 to 4000
	if(addr_int >= 16'h3F20) begin
		
		//Need to subtract 0x3F20 to find offset, do mod 0x20 and then add to 0x3000
		
		addr_out = ((addr_int - 16'h3F20) % 16h'0020) + 16'h3000;
		
	end
	
	//If we're in the image and sprite palette region 3F00 to 3F1F
	else if(addr_int >= 16'h3F00) begin
	
		//Need to subtract 0F00 to get to correct location
		addr_out = addr_int - 16'hF00;
	
	end
	
	//If we're in the mirror reion 2000 to 2EFF
	else if(addr_int >= 16'h3000) begin
	
		//Need to subtract 1000 to get to start of name table 0
		addr_out <= addr_int - 16'h1000;
	
	end
	
	else begin
		//Don't need to do any translation
		addr_out <= addr_int;
	end

end




endmodule