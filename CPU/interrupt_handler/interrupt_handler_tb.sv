



module interrupt_handler_tb();


integer mem_listing [] = 
{
	16'hFFFA, 8'hAA,
	16'hFFFB, 8'hAA,
	16'hFFFC, 8'hCC,
	16'hFFFD, 8'hCC,
	16'hFFFE, 8'hEE,
	16'hFFFF, 8'hEE
};


reg clk, rst;

wire [7:0] mem_data_out_1;

//Memory bus for IH
wire [15:0] IH_cpu_addr;

wire [7:0] IH_cpu_data_in = mem_data_out_1;//Data from mem to IH
wire [7:0] IH_cpu_data_out;//Data from IH to mem
wire IH_write_en;


//Memory bus for test bench
reg [15:0] tb_cpu_addr;
reg [7:0] tb_cpu_data_out;
reg tb_write_en;

wire [15:0] mem_addr_1 = rst == 0 ? tb_cpu_addr : IH_cpu_addr;
wire [7:0] mem_data_in = rst == 0 ? tb_cpu_data_out : IH_cpu_data_out;
wire mem_write_en = rst == 0 ? tb_write_en : IH_write_en;

wire [15:0] mem_addr_2 = 0;
wire [7:0] mem_data_2;

generic_ram #(65536, 16) cpu_mem
(
	clk,
	
	mem_addr_1,
	mem_data_in,
	mem_data_out_1,
	mem_write_en,
	
	mem_addr_2,
	mem_data_2
);

reg break_flag;
reg [7:0] ppu_status;
reg soft_reset;

reg is_rti;

reg start;
wire done;
wire accessing_memory;

reg [15:0] pc_in;
reg [7:0] status_in;
reg [15:0] stack_ptr_in;


wire [15:0] pc_out;
wire [7:0] status_out;
wire [15:0] stack_ptr_out;


integer i = 0;


interrupt_handler dut
(
	clk,
	rst,
	
	IH_cpu_addr,
	IH_cpu_data_in,
	IH_cpu_data_out,
	IH_write_en,
	
	break_flag,
	ppu_status,
	soft_reset,
	
	is_rti,
	
	start,
	done,
	accessing_memory,
	
	pc_in,
	status_in,
	stack_ptr_in,
	
	pc_out,
	status_out,
	stack_ptr_out
	
);

initial begin


	clk = 0;
	rst = 0;
	
	tb_cpu_addr = 0;
	tb_cpu_data_out = 0;
	tb_write_en = 0;
	
	break_flag = 0;
	ppu_status = 0;
	soft_reset = 1;
	
	is_rti = 0;
	
	start = 0;//Always go
	
	pc_in = 16'hABCD;
	status_in = 8'h12;
	stack_ptr_in = 16'h01FF;//Grows down
	
	//Hold the system in reset and load memory
	repeat(10) clk_cycle();
	
	load_mem();
	
	//Take the system out of reset
	
	rst = 1;
	
	//Nothing should happen here
	repeat(10) clk_cycle();
	
	//Trigger a soft reset
	soft_reset = 0;
	
	repeat(3) clk_cycle();
	
	soft_reset = 1;
	
	//Start it here
	start = 1;
	repeat(3) clk_cycle();
	start = 0;
	
	//While this is happening also trigger a ppu blank
	ppu_status = 8'h80;
	
	//Let it run for a while
	repeat(20) clk_cycle();
	
	//Turn off ppu status_in
	ppu_status = 0;
	
	//Change cpu status to something else
	status_in = 0;
	
	//Execute a return, make sure we don't load 0
	is_rti = 1;
	
	//Set the stack pointer correctly
	stack_ptr_in = 16'h01FC;//Grows down
	
	start = 1;
	repeat(3) clk_cycle();
	start = 0;
	
	is_rti = 0;
	
	//See if it finishes up the ppu interrupt_handler
	repeat(10) clk_cycle();
	
	//Trigger a software interrupt_handler
	break_flag = 1;
	status_in = 8'h04;
	
	start = 1;
	repeat(3) clk_cycle();
	start = 0;
	
	break_flag = 0;
	
	
	repeat(50) clk_cycle();


end


task load_mem();
begin

	#1
	tb_write_en = 1;
	#1


	for(i = 0; i < $size(mem_listing); i = i + 2) begin
	
		//Set the memory address
		tb_cpu_addr = mem_listing[i];
		tb_cpu_data_out = mem_listing[i+1];
		
		clk_cycle();
		
		
	end
	
	#1
	tb_write_en = 0;

end
endtask

task clk_cycle();
begin

	#1
	clk = 1;
	#1
	clk = 0;

end
endtask



endmodule

