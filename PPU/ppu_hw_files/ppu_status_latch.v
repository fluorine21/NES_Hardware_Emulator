


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
	
	output wire [7:0] ppu_status
	
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

assign ppu_status = {vsync_reg, sprite_0_hit_reg, sprite_overflow_reg, 5'b0};


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
			if(ppu_vsync_reg && ppu_ctrl1[7]) begin
				vsync_reg <= 1;
			end
		end
		//If it is set
		else begin
			//If the PPU has just restarted
			if(ppu_state == 1 || cpu_addr == 16'h2002) begin
				//Reset the flag here
				vsync_reg <= 0;
			
			end
		end
	end
end

endmodule
