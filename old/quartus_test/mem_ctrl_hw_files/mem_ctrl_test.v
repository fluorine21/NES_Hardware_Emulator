


module mem_ctrl_test
#(parameter size = 100)
(
	input wire clk,
	input wire rst,
	input wire [15:0] addr,
	input wire [7:0] data_in,
	output reg [7:0] data_out,
	input wire write_en
);

reg [7:0] cpu_mem[0:size-1];

always @ (posedge clk) begin

	

	if(write_en) begin
	
		cpu_mem[addr] <= data_in;
	
	end
	

end


endmodule

