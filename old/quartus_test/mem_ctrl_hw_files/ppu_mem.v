//Memory module for PPU
//Includes address decoding!

//Depreciated, do not use

module ppu_mem
(
	//PPU VRAM connections
	input wire clk,
	input wire rst,
	input wire [15:0] vram_ppu_addr,
	output reg [7:0] vram_ppu_data,
	output reg [7:0] vram_cpu_data_out,
	
	//Memory controller VRAM connections
	input wire [15:0] vram_cpu_addr, //CPU will read data from this address
	input wire [7:0] vram_cpu_data_in, //CPU writes data to this wire
	input wire vram_write_en,
	
	//PPU SPR-RAM connections
	input wire [7:0] spram_ppu_addr,
	output reg [7:0] spram_ppu_data,
	
	//Memory controller SPR-RAM connections
	input wire [7:0] spram_cpu_addr,
	input wire [7:0] spram_cpu_data,
	input wire spram_write_en
);

//Need 0x3000 + 0x20 bytes of vram_memory
reg [7:0] vram_arr[0:12320];
wire [15:0] vram_ppu_addr_int;
wire [15:0] vram_cpu_addr_int;

//Memory address decoder
ppu_mem_decode read_decode(vram_ppu_addr, vram_ppu_addr_int);
ppu_mem_decode write_decode(vram_cpu_addr, vram_cpu_addr_int);

//SPRAM declaration
reg[7:0] spram_arr[0:255];


always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin
	
		vram_ppu_data <= 8'b0;
		spram_ppu_data <= 8'b0;
		vram_cpu_data_out <= 8'b0;
	
	end
	
	else begin
	
		//If the CPU is writing data
		if(vram_write_en) begin
		
			vram_arr[vram_cpu_addr_int] <= vram_cpu_data_in;
		
		end
		//Otherwise CPU must be reading data
		else begin
		
			vram_cpu_data_out <= vram_arr[vram_cpu_addr_int];
		
		end
		
		if(spram_write_en) begin
		
			spram_arr[spram_cpu_addr] <= spram_cpu_data;
		
		end
		
		vram_ppu_data <= vram_arr[vram_ppu_addr_int];
		spram_ppu_data <= spram_arr[spram_ppu_addr];
	
	end

end


endmodule