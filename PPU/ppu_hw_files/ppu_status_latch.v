


module ppu_status_latch
(
	input wire clk,
	input wire rst,
	
	input wire sprite_0_hit,
	input wire sprite_overflow,
	input wire ppu_vsync_reg,
	input wire [7:0] ppu_ctrl1,
	input wire [7:0] ppu_state,
	
	input wire [15:0] cpu_addr,//Needed to determine when CPU is reading 2002
	input wire cpu_read,
	
	output reg [7:0] ppu_status_out
	
);
//This module is responsible for:
//Sprite 0 hit:
//Set when the hit occurs, unset when ppu restarts
//
//Sprite overflow:
//Set when overflow occurs, reset when ppu restarts
//
//Vertical Sync
//Set when PPU is finished with frame render,
//Reset of $2002 is read or ppu restarts
reg sprite_0_hit_reg;
reg sprite_overflow_reg;
reg vsync_reg;

wire [7:0] ppu_status = {vsync_reg, sprite_0_hit_reg, sprite_overflow_reg, 5'b0};


//Always for output register
// reg toggle;
// always @ (posedge clk or negedge rst) begin
	// if(!rst) begin
		// ppu_status_out <= 0;
		// toggle = 0;
	// end
	// else begin

		//If we're safe to update
		// if(!toggle) begin
			
			//If we're no longer safe
			// if(cpu_addr == 16'h2002) begin

				// ppu_status_out <= ppu_status_out | ppu_status;
				// toggle <= 1;

			// end
			// else begin
				// ppu_status_out <= ppu_status;
			// end

		// end
		// else begin
			// ppu_status_out <= ppu_status_out | ppu_status;
			// if(cpu_addr != 16'h2002) begin
				// toggle = 0;
			// end
		// end
		
	// end

// end


reg [7:0] s1, s2, s3, s4, s5, s6, s7;
always @ (posedge clk or negedge rst) begin

	if(!rst) begin
	
		s1 <= 0;
		s2 <= 0;
		s3 <= 0;
		s4 <= 0;
		s5 <= 0;
		s6 <= 0;
		s7 <= 0;
		ppu_status_out <= 0;
	end
	else begin
		
		s1 <= ppu_status;
		ppu_status_out <= s1;
	
	
	end



end

//Always for setting sprite 0 hit
always @ (posedge clk or negedge rst) begin
	if(rst == 0) begin
		sprite_0_hit_reg <= 0;
	end
	else begin
		//If sprite 0 hit is not set
		if(sprite_0_hit_reg == 0) begin
			//If we need to set the flag
			if(sprite_0_hit) begin
				sprite_0_hit_reg <= 1;
			end
		end
		//If it is set
		else begin
			//If the PPU has just restarted
			if(ppu_state == 1) begin
				//Reset the flag here
				sprite_0_hit_reg <= 0;
			
			end
		end
	end
end

//Always for setting sprite overflow
always @ (posedge clk or negedge rst) begin
	if(rst == 0) begin
		sprite_overflow_reg <= 0;
	end
	else begin
		//If sprite 0 hit is not set
		if(sprite_overflow_reg == 0) begin
			//If we need to set the flag
			if(sprite_overflow) begin
				sprite_overflow_reg <= 1;
			end
		end
		//If it is set
		else begin
			//If the PPU has just restarted
			if(ppu_state == 1) begin
				//Reset the flag here
				sprite_overflow_reg <= 0;
			
			end
		end
	end
end

//Always for setting vsync
always @ (posedge clk or negedge rst) begin
	if(rst == 0) begin
		vsync_reg <= 0;
	end
	else begin
		//If vsync is not set
		if(vsync_reg == 0) begin
			//If we need to set the flag
			//if we're in the PPU wait state
			//if(ppu_vsync_reg && ppu_ctrl1[7]) begin
			if(ppu_vsync_reg) begin
				vsync_reg <= 1;
			end
		end
		//If it is set
		else begin
			//If the PPU has just restarted
			if(ppu_state == 1 || (cpu_addr == 16'h2002 && cpu_read)) begin
				//Reset the flag here
				vsync_reg <= 0;
			
			end
		end
	end
end

endmodule
