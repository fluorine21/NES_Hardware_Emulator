import ie_defs::*;
import sv_defs::*;

string fn = "../test_programs/bubble.txt";
string fn_i = "../test_programs/interrupt_test.txt";
string fn_func_1 = "../test_programs/func_test_1.txt";

module cpu_6502_tb();

reg clk, rst, soft_rst;

wire [15:0] cpu_mem_addr;
wire [7:0] cpu_data_out;
wire [7:0] cpu_data_in;
wire cpu_write_en;
wire cpu_read_en;

reg [15:0] pc_reset = 16'h8000;//Just above the stack
reg [7:0] ppu_status = 0;

integer i = 0;
reg halt = 0;
wire [15:0] pc_6502;

integer listing[];

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
	
	ppu_status,
	
	halt,
	1'b1,//Set IRQ to 1, won't be triggered
	pc_6502,
	8'b0
);

reg [15:0] tb_mem_addr;
reg [7:0] tb_mem_data;
reg tb_write_en;

wire [15:0] mem_addr = rst ? cpu_mem_addr : tb_mem_addr;
wire [7:0] mem_data_wr = rst ? cpu_data_out : tb_mem_data;
wire mem_write_en = rst ? cpu_write_en : tb_write_en;

reg [15:0] dummy_addr = 0;
wire [7:0] dummy_data;

generic_ram #(65536, 16) mem_inst
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
	//load_program();
	//load_bubble();
	//load_interrupt();
	load_func_1();
	
	//Take the cpu out of reset
	rst = 1;
	
	//Run the interrupt task
	//run_interrupt();
	
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

/* task load_program();
begin

	#1
	tb_write_en = 1;
	#1

	//Load the program listing itself first
	for(tb_mem_addr = 16'h0200; tb_mem_addr < 16'h0200 + $size(program_listing_2); tb_mem_addr = tb_mem_addr + 1) begin
	
		//Set the data line
		tb_mem_data = program_listing_2[tb_mem_addr - 16'h0200];
		
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



task load_bubble();
begin

	#1
	tb_write_en = 1;
	#1

	load_raw_listing(listing, fn);
	
		//Load the program listing itself first
	for(tb_mem_addr = 16'h0200; tb_mem_addr < 16'h0200 + $size(listing); tb_mem_addr = tb_mem_addr + 1) begin
	
		//Set the data line
		tb_mem_data = listing[tb_mem_addr - 16'h0200];
		
		//cycle the clock
		clk_cycle();
	
	end
	
	
	//Load the memory listing for bubble
	for(i = 0; i < $size(bs_mem); i = i + 2) begin
	
		tb_mem_addr = bs_mem[i];
		tb_mem_data = bs_mem[i+1];
		clk_cycle();
	
	end
	
	#1
	tb_write_en = 0;
	#1
	tb_write_en = 0;
	
end
endtask

task load_interrupt();
begin

	#1
	tb_write_en = 1;
	#1

	load_raw_listing(listing, fn_i);
	
		//Load the program listing itself first
	for(tb_mem_addr = 16'h0200; tb_mem_addr < 16'h0200 + $size(listing); tb_mem_addr = tb_mem_addr + 1) begin
	
		//Set the data line
		tb_mem_data = listing[tb_mem_addr - 16'h0200];
		
		//cycle the clock
		clk_cycle();
	
	end
	
	
	#1
	tb_write_en = 0;
	#1
	tb_write_en = 0;
	
end
endtask */

task run_interrupt();
begin

	while(1) begin
	
		repeat(300) clk_cycle();
		
		soft_rst = 0;
		repeat(2) clk_cycle();
		soft_rst = 1;
		
		repeat(300) clk_cycle();
	
	end

end
endtask


task load_func_1(); 
begin

	#1
	tb_write_en = 1;
	#1
	tb_write_en = 1;

	load_raw_listing(listing, fn_func_1);

	//Load the entire listing from the beginning of memory
	for(i = 0; i < 65536; i = i + 1) begin
	
		tb_mem_addr <= i;
		tb_mem_data <= listing[i];
		
		clk_cycle();
	
	
	end

	#1
	tb_write_en = 0;
	#1
	tb_write_en = 0;


end
endtask
	
endmodule

