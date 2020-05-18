//CPU main memory with control registers


//Depreciated, do not use

module cpu_mem
(

	input wire clk,
	input wire rst,

	//Main memory control
	input wire [15:0] addr,
	inout wire [7:0] data,
	input wire cpu_write_en,
	input wire sysctrl_write_en,
	output reg busy,
	
	
	//PPU control registers
	output reg [7:0] ppu_ctrl1,
	output reg [7:0] ppu_ctrl2,
	input wire [7:0] ppu_status,
	
	//To CPU port of PPU SPRAM
	output reg [7:0] spram_addr,
	output reg [7:0] spram_data,
	output reg spram_write_en,
	
	//To CPU port of PPU VRAM
	output reg [15:0] vram_addr,
	output reg [7:0] vram_data_out,
	input wire [7:0] vram_data_in,
	output reg vram_write_en
	
	
);

reg [7:0] mem_result;


wire [15:0] addr_int;
wire addr_valid;
cpu_mem_decode cpu_decode(addr, addr_int, addr_valid);

//Need 0xBFE0 + 0x800 bytes = 51,168
reg [8:0] cpu_mem_arr[0:51167];



always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin
	
		mem_result <= 8'b0;
		ppu_ctrl1 <= 8'b0;
		ppu_ctrl2 <= 8'b0;
		spram_addr <= 8'b0;
		spram_data <= 8'b0;
		spram_write_en <= 1'b0;
		busy <= 1'b0;
		vram_addr <= 16'b0;
		vram_data_out <= 8'b0;
		vram_write_en <= 1'b0;
	
	
	end 
	
	
	
	else begin
		
		//Reset spram_write_enable strobe
		//This will be set automatically by spram decoding if we're writing again.
		spram_write_en <= 1'b0;
	
		
		//If vram was written on the last cycle
		if(vram_write_en == 1'b1) begin
		
			//If we're not aboout to write again
			if(addr_int != 16'h2007) begin
				//Reset the strobe
				vram_write_en <= 1'b0;
			end
			
			//If we're not trying to write the vram address again on this cycle
			if(addr_int != 16'h2005 && addr_int != 16'h2006) begin
			
				//Increment the address counter based on bit 2 od ppu ctrl 1
				if(ppu_ctrl1[2] == 1'b1) begin
					vram_addr <= vram_addr + 32;
				end
				else begin
					vram_addr <= vram_addr + 1;
				end
			
			end
		
		end
	
	
		//If we're trying to read/write to a registers
		if(addr_valid == 1'b0) begin
		
			//if we're trying to read/write to one of the control registers
			
			//ppu_ctrl1
			if(addr_int == 16'h2000) begin
				if(cpu_write_en)begin
					ppu_ctrl1 <= data;
				end
				else begin
					mem_result <= ppu_ctrl1;
				end
			end
			
			//ppu_ctrl2
			else if(addr_int == 16'h2001) begin
				if(cpu_write_en) begin
					ppu_ctrl2 <= data;
				end
				else begin
					mem_result <= ppu_ctrl2;
				end
			end
			
			//ppu_status
			else if(addr_int == 16'h2002) begin
				//Need to assume a read here and clear 2005 and 2006
				//Also need to signal to PPU to clear bit 7
				mem_result <= ppu_status;
				vram_addr_1 <= 8'b0;
				vram_addr_2 <= 8'b0;
			end
			
			//spram addr
			else if(addr_int == 16'h2003) begin
				if(cpu_write_en) begin
					spram_addr <= data;
				end
				else begin
					mem_result <= spram_addr;
				end
			end
			
			//spram data
			else if(addr_int == 16'h2004) begin
				if(cpu_write_en) begin
					spram_data <= data;
					//Need to strobe spram_write_en for one cycle
					spram_write_en <= 1'b1;
				end
				else begin
					mem_result <= spram_data;
				end
			
			end
			
			//vram addr 1
			else if(addr_int == 16'h2005) begin
				if(cpu_write_en) begin
					vram_addr[7:0] <= data;
				end
				else begin
					mem_result <= vram_addr[7:0];
				end
			end
			
			//vram addr 2
			else if(addr_int == 16'h2006) begin
				if(cpu_write_en) begin
					vram_addr[15:8] <= data;
				end
				else begin
					mem_result <= vram_addr[15:8];
				end
			end
			
			//vram data
			else if(addr_int == 16'h2007) begin
				if(cpu_write_en) begin
					mem_result <= vram_data_out
					//Need to strobe vram_write_en for one cycle
					vram_write_en <= 1'b1;
				end
				else begin
					mem_result <= vram_data_in;
				end
			end	
		
		
		end
		
		//Must be trying to read from memory
		else begin
		
			if(cpu_write_en) begin
				cpu_mem_arr[addr_int] <= data;
			end
			else begin
				mem_result <= cpu_mem_arr[addr_int];
			end
		
		
		end
	
	end


end

//Data bus assignment
assign data = (cpu_write_en || sysctrl_write_en) ? 8'bz : mem_result;

endmodule