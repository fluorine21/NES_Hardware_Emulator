

module test_tb();

wire [1:0] attr_shift = 2'b01;


wire [7:0] attr_table_result = 8'h0C;

wire [1:0] background_attr = attr_table_result[(attr_shift << 1)+:2];

wire [1:0] background_test = attr_table_result[2+:2];




endmodule