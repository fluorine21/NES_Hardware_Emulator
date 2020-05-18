

module generic_ram
#(
parameter size = 100,
parameter addr_width = 16
)
(
	input wire clk,
	input wire [addr_width-1:0] addr_1,
	input wire [7:0] data_in_1,
	output reg [7:0] data_out_1,
	input wire write_en,
	
	input wire [addr_width-1:0] addr_2,
	output reg [7:0] data_out_2
);

reg [7:0] mem_arr[0:size-1];

always @ (posedge clk) begin

	if(write_en) begin
		mem_arr[addr_1] = data_in_1;
	end
	
	data_out_1 = mem_arr[addr_1];
	data_out_2 = mem_arr[addr_2];

end




endmodule


