import ie_defs::*;



module cpu_6502_tb();

reg clk, rst, soft_rst;

wire [15:0] cpu_mem_addr;
wire [7:0] cpu_data_out;
wire [7:0] cpu_data_in;
wire cpu_write_en;
wire cpu_read_en;

reg [15:0] pc_reset = 16'h0200;//Just above the stack
reg [7:0] ppu_status = 0;

integer i = 0;

cpu_6502 cpu_6502_dut
(
	clk,
	rst,
	soft_rst,
	
	cpu_mem_addr,
	cpu_data_out,
	cpu_data_in,
	cpu_write_en,
	cpu_read_en,
	
	pc_reset,
	
	ppu_status
);

reg [15:0] tb_mem_addr;
reg [7:0] tb_mem_data;
reg tb_write_en;

wire [15:0] mem_addr = rst ? cpu_mem_addr : tb_mem_addr;
wire [7:0] mem_data_wr = rst ? cpu_data_out : tb_mem_data;
wire mem_write_en = rst ? cpu_write_en : tb_write_en;

reg [15:0] dummy_addr = 0;
wire [7:0] dummy_data;

generic_ram #(1024, 16) mem_inst
(
	clk,
	
	mem_addr,
	mem_data_wr,
	cpu_data_in,
	mem_write_en,
	
	dummy_addr,
	dummy_data
);


initial begin

	clk = 0;
	rst = 0;
	soft_rst = 1;
	
	tb_mem_addr = 0;
	tb_mem_data = 0;
	tb_write_en = 0;
	
	repeat(10) clk_cycle();
	
	//Load the program while the CPU is in reset
	load_program();
	
	//Take the cpu out of reset
	rst = 1;
	
	//Run the program 
	while(1) begin
	
		clk_cycle();
	
	end

end

task clk_cycle();
begin

	#1
	clk = 1;
	#1
	clk = 0;

end
endtask

task load_program();
begin

	#1
	tb_write_en = 1;
	#1

	//Load the program listing itself first
	for(tb_mem_addr = 16'h0200; tb_mem_addr < 16'h0200 + $size(program_listing_1); tb_mem_addr = tb_mem_addr + 1) begin
	
		//Set the data line
		tb_mem_data = program_listing_1[tb_mem_addr - 16'h0200];
		
		//cycle the clock
		clk_cycle();
	
	end
	
	//Then load the program data
	for(i = 0; i < $size(program_listing_1_mem); i = i + 2) begin
	
		tb_mem_addr = program_listing_1_mem[i];
		tb_mem_data = program_listing_1_mem[i+1];
		clk_cycle();
	
	end
	
	#1
	tb_write_en = 0;
	#1
	tb_write_en = 0;

end
endtask



endmodule
