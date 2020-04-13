//Main memory controller for the PPU and CPU


module mem_ctrl_1_cycle
(
	input wire clk,
	input wire rst,
	
	input wire [15:0] cpu_addr, //System controller will be connected to this bus
	input wire [7:0] cpu_data_in,
	output reg [7:0] cpu_data_out,
	input wire cpu_write_en,
	input wire cpu_read_en, //Needs to be strobed to increment the VRAM addr counter on read
	
	//PPU control registers
	output reg [7:0] ppu_ctrl1,
	output reg [7:0] ppu_ctrl2,
	input wire [7:0] ppu_status,
	output reg [15:0] ppu_scroll_addr,

	input wire [15:0] vram_ppu_addr,
	output wire [7:0] vram_ppu_data,
	
	input wire [7:0] spram_ppu_addr,
	output wire [7:0] spram_ppu_data,
	
	output reg [7:0] spram_cpu_addr,
	output reg ppu_status_read
);

//Internal signals for cpu access to vram and spram
reg [15:0] vram_cpu_addr;
//VRAM Memory address decoder
wire [15:0] vram_ppu_addr_int;
wire [15:0] vram_cpu_addr_int;
ppu_mem_decode read_decode(vram_ppu_addr, vram_ppu_addr_int);
ppu_mem_decode write_decode(vram_cpu_addr, vram_cpu_addr_int);

//CPU address decoding
wire [15:0] cpu_addr_int;
wire cpu_addr_valid;
cpu_mem_decode cpu_decode(cpu_addr, cpu_addr_int, cpu_addr_valid);

//CPU memory declaration and address decoding
//Need 0xBFE0 + 0x800 bytes = 51,168
wire [15:0] cpu_mem_addr = cpu_addr_valid ? cpu_addr_int : 16'b0;
wire [7:0] cpu_mem_data_in = cpu_data_in;
wire [7:0] cpu_mem_data_out;
wire cpu_mem_write_en = (cpu_addr_valid && cpu_write_en) ? 1'b1 : 1'b0;
wire [7:0] cpu_mem_data_out_2;

generic_ram #(51168, 16) cpu_mem (clk, cpu_mem_addr, cpu_mem_data_in, cpu_mem_data_out, cpu_mem_write_en, 16'h0, cpu_mem_data_out_2);

//SPRAM declaration
wire [7:0] spram_mem_cpu_addr = spram_cpu_addr;
wire [7:0] spram_mem_cpu_data_in = cpu_data_in;
wire [7:0] spram_mem_cpu_data_out;
wire spram_mem_cpu_write_en = (cpu_addr_int == 16'h2004 && cpu_addr_valid == 1'b0 && cpu_write_en) ? 1'b1 : 1'b0;

generic_ram #(256, 8) spram_mem (clk, spram_mem_cpu_addr, spram_mem_cpu_data_in, spram_mem_cpu_data_out, spram_mem_cpu_write_en, spram_ppu_addr, spram_ppu_data);

//VRAM declaration
//Need 0x3000 + 0x20 bytes of vram_memory
wire [15:0] vram_mem_cpu_addr = vram_cpu_addr_int;
wire [7:0] vram_mem_cpu_data_in = cpu_data_in;
wire [7:0] vram_mem_cpu_data_out;
wire vram_mem_cpu_write_en = (cpu_addr_int == 16'h2007 && cpu_addr_valid == 1'b0 && cpu_write_en) ? 1'b1 : 1'b0;

generic_ram #(12320, 16) vram_mem (clk, vram_mem_cpu_addr, vram_mem_cpu_data_in, vram_mem_cpu_data_out, vram_mem_cpu_write_en, vram_ppu_addr_int, vram_ppu_data);

///////////////////////////////
///Next Definitons/////////////
///////////////////////////////

//PPU and SPRAM stuff
wire [7:0] ppu_ctrl1_next = (cpu_addr_int == 16'h2000 && cpu_addr_valid == 1'b0 && cpu_write_en) ? cpu_data_in : ppu_ctrl1;
wire [7:0] ppu_ctrl2_next = (cpu_addr_int == 16'h2001 && cpu_addr_valid == 1'b0 && cpu_write_en) ? cpu_data_in : ppu_ctrl2;
wire [7:0] ppu_scroll_addr_next = (cpu_addr_int == 16'h2005 && cpu_addr_valid == 1'b0 && cpu_write_en) ? cpu_data_in : ppu_scroll_addr;
wire [7:0] spram_cpu_addr_next = (cpu_addr_int == 16'h2003 && cpu_addr_valid == 1'b0 && cpu_write_en) ? cpu_data_in : (cpu_addr_int == 16'h2004 && cpu_addr_valid == 1'b0 && cpu_write_en) ? spram_cpu_addr + 1'b1 : spram_cpu_addr;
wire ppu_status_read_next = (cpu_addr_int == 16'h2002 && cpu_addr_valid == 1'b0 && ppu_status_read == 1'b0) ? 1'b1 : 1'b0;

//Vram cpu addr assignments
wire [15:0] vram_cpu_addr_plus_1 = vram_cpu_addr + 1;
wire [7:0] vram_cpu_addr_next_high = (cpu_addr_int == 16'h2006 && cpu_addr_valid == 1'b0 && cpu_write_en == 1'b1) ? vram_cpu_addr[7:0] : (cpu_addr_int == 16'h2007 && cpu_addr_valid == 1'b0 && (cpu_write_en == 1'b1 || cpu_read_en == 1'b1)) ? vram_cpu_addr_plus_1[15:8] : vram_cpu_addr[15:8];
wire [7:0] vram_cpu_addr_next_low = (cpu_addr_int == 16'h2006 && cpu_addr_valid == 1'b0 && cpu_write_en == 1'b1) ? cpu_data_in : (cpu_addr_int == 16'h2007 && cpu_addr_valid == 1'b0 && (cpu_write_en == 1'b1 || cpu_read_en == 1'b1)) ? vram_cpu_addr_plus_1[7:0] : vram_cpu_addr[7:0];
wire [15:0] vram_cpu_addr_next = {vram_cpu_addr_next_high, vram_cpu_addr_next_low};


always @ (posedge clk or negedge rst) begin


	if(rst == 1'b0) begin
		
		ppu_ctrl1 <= 8'b0;
		ppu_ctrl2 <= 8'b0;
		ppu_scroll_addr <= 8'b0;
		spram_cpu_addr <= 8'b0;
		ppu_status_read <= 1'b0;
		vram_cpu_addr <= 16'b0;
		
	end
	
	else begin
	
		ppu_ctrl1 <= ppu_ctrl1_next;
		ppu_ctrl2 <= ppu_ctrl2_next;
		ppu_scroll_addr <= ppu_scroll_addr_next;
		spram_cpu_addr <= spram_cpu_addr_next;
		ppu_status_read <= ppu_status_read_next;
		vram_cpu_addr <= vram_cpu_addr_next;
	
	end

end





//going to need one always for the scnchronous logic
//and _next wires


always @ * begin
	
		//If we're trying to read/write to a registers
		if(cpu_addr_valid == 1'b0) begin
		
			//if we're trying to read/write to one of the control registers
			
			//ppu_ctrl1
			if(cpu_addr_int == 16'h2000) begin
				cpu_data_out <= ppu_ctrl1;
			end
			
			//ppu_ctrl2
			else if(cpu_addr_int == 16'h2001) begin
				cpu_data_out <= ppu_ctrl2;
			end
			
			//ppu_status
			else if(cpu_addr_int == 16'h2002) begin
				cpu_data_out <= ppu_status;
			end
			
			//spram addr
			else if(cpu_addr_int == 16'h2003) begin
				cpu_data_out <= spram_cpu_addr;
			end
			
			//spram data
			//Need to start a memory access here
			else if(cpu_addr_int == 16'h2004) begin
				cpu_data_out <= spram_mem_cpu_data_out;
			end
			
			//scroll addr
			else if(cpu_addr_int == 16'h2005) begin
				cpu_data_out <= ppu_scroll_addr;
			end
			
			//vram addr
			else if(cpu_addr_int == 16'h2006) begin
				cpu_data_out <= vram_cpu_addr;
			end
			
			//vram data
			else if(cpu_addr_int == 16'h2007) begin
				cpu_data_out <= vram_mem_cpu_data_out;
			end	
		
		
		end
		
		//Reading writing CPU mem
		else begin
			cpu_data_out <= cpu_mem_data_out;
		end

end
endmodule

