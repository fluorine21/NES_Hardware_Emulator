import ie_defs::*;


module if_tb();


reg clk, rst;
wire [15:0] if_addr_to_ie;
wire [15:0] if_mem_addr;
wire [7:0] if_mem_data_in;

wire [7:0] new_op;
wire [3:0] alu_op;

reg [15:0] pc_from_ie;
wire [15:0] pc_to_ie;




endmodule