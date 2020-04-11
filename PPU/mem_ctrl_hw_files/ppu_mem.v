//Memory module for PPU
//Includes address decoding!


module ppu_mem
(
	//PPU connections
	input wire clk,
	input wire rst,
	input wire [15:0] read_addr,
	output reg [7:0] read_data,
	
	//Memory controller connections
	input wire [15:0] write_addr,
	input wire [7:0] write_data,
	input wire write_en
);

//Need 0x3000 + 0x20 bytes of memory
reg [7:0] mem_arr[0:12320];
wire [15:0] read_addr_int;
wire [15:0] write_addr_int;

//Memory address decoder
ppu_mem_decode read_decode(read_addr, read_addr_int);
ppu_mem_decode write_decode(write_addr, write_addr_int);


always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin
	
		read_data <= 8'b0;
	
	end
	
	else begin
	
		if(write_en) begin
		
			mem_arr[write_addr_int] <= write_data;
		
		end
		
		read_data <= mem_arr[read_addr_int];
	
	end

end


endmodule