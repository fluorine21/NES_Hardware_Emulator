/* import ie_defs::*;


module if_tb();


reg clk, rst;
wire [15:0] if_addr_to_ie;
wire [15:0] if_mem_addr;
wire [7:0] if_mem_data_in;

wire [7:0] new_op;
wire [3:0] alu_op;

reg [15:0] pc_from_ie;
wire [15:0] pc_to_ie;

reg [7:0] x_reg, y_reg, acc_reg;

wire accessing_mem;
reg ie_ready = 1;
wire imm_mode;
wire [2:0] store_flag;
wire [1:0] reg_load_flag;
wire mem_load_flag;
wire instr_valid;

integer i = 0;

//DUT
instr_fetch instr_fetch_inst
(

	clk,
	rst,
	if_addr_to_ie,
	if_mem_addr,
	if_mem_data_in,
	new_op,
	alu_op,
	pc_from_ie,
	pc_to_ie,
	x_reg,
	y_reg,
	acc_reg,
	accessing_mem,
	
	ie_ready,
	imm_mode,
	store_flag,
	reg_load_flag,
	mem_load_flag,
	instr_valid

);

reg [15:0] tb_addr;
reg [7:0] tb_data_in;
reg tb_write_en;
wire [7:0] dummy_data_out;



generic_ram #(1024, 16) gen_ram_inst
(
	
	clk,
	
	tb_addr,
	tb_data_in,
	dummy_data_out,
	tb_write_en,
	
	if_mem_addr, 
	if_mem_data_in
	
);


initial begin

	clk = 0;
	rst = 0;
	pc_from_ie = 16'h0100;
	x_reg = 0;
	y_reg = 0;
	acc_reg = 0;
	ie_ready = 0;
	
	tb_addr = 0;
	tb_data_in = 0;
	tb_write_en = 0;
	
	//Hold the system in reset while we are loading memory
	load_mem();
	
	rst = 1;
	
	repeat(10) clk_cycle();
	
	//Prime the first load
	ie_ready = 1;
	
	clk_cycle();
	
	ie_ready = 0;
	
	//Wait for instruction valid to go low
	while(instr_valid)begin
		clk_cycle();
	end
	
	//wait for instr_valid to go high
	while(!instr_valid)begin
		clk_cycle();
	end
	
	//Keep doing loads until we reach the end of memory
	repeat(10) load_instr;

end

task clk_cycle();
begin

	#1
	clk = 1;
	#1
	clk = 0;

end
endtask


task load_mem();
begin

	#1
	tb_write_en = 1;
	#1
	
 	for(i = 0; i < $size(mem_listing_1); i = i + 2) begin
	
		tb_addr = mem_listing_1[i];
		tb_data_in = mem_listing_1[i+1];
		
		clk_cycle();
	
	end 

	#1
	tb_write_en = 0;
	#1
	tb_write_en = 0;

end
endtask


task load_instr();
begin

	//Update the pc
	pc_from_ie = pc_to_ie;
	
	//Start the fetch
	ie_ready = 1;
	
	clk_cycle();
	
	ie_ready = 0;
	
	//Wait for instruction valid to go low
	while(instr_valid)begin
		clk_cycle();
	end
	
	//wait for instr_valid to go high
	while(!instr_valid)begin
		clk_cycle();
	end
	
	repeat(10) clk_cycle();

end
endtask





endmodule */