//Main memory controller for the PPU and CPU


module mem_ctrl
(
	input wire clk,
	input wire rst,
	
	input wire [15:0] cpu_addr, //System controller will be connected to this bus
	input wire [7:0] cpu_data_in,
	output reg [7:0] cpu_data_out,
	input wire cpu_write_en,
	input wire cpu_read_en, //Needs to be strobed to increment the VRAM addr counter on read
	output reg busy,
	
	//PPU control registers
	output reg [7:0] ppu_ctrl1,
	output reg [7:0] ppu_ctrl2,
	input wire [7:0] ppu_status,

	input wire [15:0] vram_ppu_addr,
	output reg [7:0] vram_ppu_data,
	
	input wire [7:0] spram_ppu_addr,
	output reg [7:0] spram_ppu_data
);

//Internal signals for cpu access to vram and spram
reg [15:0] vram_cpu_addr;
reg [7:0] spram_cpu_addr;

//VRAM declaration
//Need 0x3000 + 0x20 bytes of vram_memory
reg [7:0] vram_arr[0:12320];
wire [15:0] vram_ppu_addr_int;
wire [15:0] vram_cpu_addr_int;

//VRAM Memory address decoder
ppu_mem_decode read_decode(vram_ppu_addr, vram_ppu_addr_int);
ppu_mem_decode write_decode(vram_cpu_addr, vram_cpu_addr_int);

//SPRAM declaration
reg[7:0] spram_arr[0:255];

//CPU memory declaration and address decoding
//Need 0xBFE0 + 0x800 bytes = 51,168
reg [8:0] cpu_mem_arr[0:51167];
wire [15:0] cpu_addr_int;
cpu_mem_decode cpu_decode(cpu_addr, cpu_addr_int, cpu_addr_valid);


//Process for PPU reading SPRAM and VRAM
always @ (posedge clk or negedge rst) begin
	
	if(rst == 1'b0) begin
	
		vram_ppu_data <= 8'b0;
		spram_ppu_data <= 8'b0;
	
	end

	else begin
	
		vram_ppu_data = vram_arr[vram_ppu_addr_int];
		spram_ppu_data = spram_arr[spram_ppu_addr];
	
	end
	
end


always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin
	
		cpu_data_out <= 8'b0;
		busy <= 1'b0;
		ppu_ctrl1 <= 8'b0;
		ppu_ctrl2 <= 8'b0;
		spram_cpu_addr <= 8'b0;
	
	end
	
	
	else begin
	
		//If we're trying to read/write to a registers
		if(cpu_addr_valid == 1'b0) begin
		
			//if we're trying to read/write to one of the control registers
			
			//ppu_ctrl1
			if(cpu_addr_int == 16'h2000) begin
				if(cpu_write_en)begin
					ppu_ctrl1 <= cpu_data_in;
				end
				else begin
					cpu_data_out <= ppu_ctrl1;
				end
			end
			
			//ppu_ctrl2
			else if(cpu_addr_int == 16'h2001) begin
				if(cpu_write_en) begin
					ppu_ctrl2 <= cpu_data_in;
				end
				else begin
					cpu_data_out <= ppu_ctrl2;
				end
			end
			
			//ppu_status
			else if(cpu_addr_int == 16'h2002) begin
				//Need to assume a read here and clear 2005 and 2006
				//Also need to signal to PPU to clear bit 7
				cpu_data_out <= ppu_status;
				vram_cpu_addr <= 16'b0;
			end
			
			//spram addr
			else if(cpu_addr_int == 16'h2003) begin
				if(cpu_write_en) begin
					spram_cpu_addr <= cpu_data_in;
				end
				else begin
					cpu_data_out <= spram_cpu_addr;
				end
			end
			
			//spram data
			else if(cpu_addr_int == 16'h2004) begin
				//must assume read here
				if(cpu_write_en) begin
					spram_arr[spram_cpu_addr] <= cpu_data_in;
				end
			end
			
			//scroll addr
			else if(cpu_addr_int == 16'h2005) begin
				if(cpu_write_en) begin
					vram_cpu_addr[7:0] <= cpu_data_in;
				end
			end
			
			//vram addr
			else if(cpu_addr_int == 16'h2006) begin
				if(cpu_write_en) begin
					vram_cpu_addr[15:8] <= vram_cpu_addr[7:0];
					vram_cpu_addr[7:0] <= cpu_data_in;
				end
			end
			
			//vram data
			else if(cpu_addr_int == 16'h2007) begin
				if(cpu_write_en) begin
					vram_arr[vram_cpu_addr_int] <= cpu_data_in;
				end
				else if(cpu_read_en) begin
					cpu_data_out <= vram_arr[vram_cpu_addr_int];
				end
				
				if(ppu_ctrl1[2] == 1'b0) begin
					vram_cpu_addr <= vram_cpu_addr + 1;
				end
				else begin
					vram_cpu_addr <= vram_cpu_addr + 32;
				end
			end	
		
		
		end
		
		//Must be trying to read from memory
		else begin
		
			if(cpu_write_en) begin
				cpu_mem_arr[cpu_addr_int] <= cpu_data_in;
			end
			else begin
				cpu_data_out <= cpu_mem_arr[cpu_addr_int];
			end
		
		
		end
	
	
	
	end


end


endmodule