//Memory module for PPU
//Includes address decoding!


module ppu_mem
(
	//PPU VRAM connections
	input wire clk,
	input wire rst,
	input wire [15:0] vram_read_addr,
	output reg [7:0] vram_read_data,
	output reg [7:0] vram_cpu_read_data,
	
	//Memory controller VRAM connections
	input wire [15:0] vram_write_addr,
	input wire [7:0] vram_write_data,
	input wire vram_write_en
	
	//PPU SPR-RAM connections
	input wire [7:0] spram_read_addr,
	output reg [7:0] spram_read_data,
	
	//Memory controller SPR-RAM connections
	input wire [7:0] spram_write_addr,
	input wire [7:0] spram_write_data,
	input wire spram_write_en
);

//Need 0x3000 + 0x20 bytes of vram_memory
reg [7:0] vram_arr[0:12320];
wire [15:0] vram_read_addr_int;
wire [15:0] vram_write_addr_int;

//Memory address decoder
ppu_mem_decode read_decode(read_addr, vram_read_addr_int);
ppu_mem_decode write_decode(vram_write_addr, vram_write_addr_int);

//SPRAM declaration
reg[7:0] spram_arr[0:255];


always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin
	
		vram_read_data <= 8'b0;
		spram_read_data <= 8'b0;
	
	end
	
	else begin
	
		//If the CPU is writing data
		if(vram_write_en) begin
		
			vram_arr[vram_write_addr_int] <= vram_write_data;
		
		end
		//Otherwise CPU must be reading data
		else begin
		
			vram_cpu_read_data <= vram_arr[vram_write_addr_int];
		
		end
		
		if(spram_write_en) begin
		
			spram_arr[spram_write_addr] <= spram_write_data;
		
		end
		
		vram_read_data <= vram_arr[vram_read_addr_int];
		spram_read_data <= spram_arr[spram_read_addr];
	
	end

end


endmodule