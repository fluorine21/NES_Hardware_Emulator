

import ie_defs::*;

string cpu_str = "../games/smb/smb_cpu_mem.txt";
string ppu_str = "../games/smb/smb_ppu_mem.txt";

string cpu_str_tst = "../test_programs/func_test_1.txt";

module nes_fpga_tb();

reg clk_50;
reg rst;
reg ppu_rst;


wire uart_rx, uart_tx, uart_rts, uart_cts;

wire vga_clk, vga_hsync, vga_vsync, vga_sync_n, vga_blank_n;
wire [7:0] vga_r, vga_b, vga_g;
wire ppu_vsync;

reg [7:0] joycon_1 = 0, joycon_2 = 0;

reg [31:0] cnt;

reg [7:0] uart_result;

integer pass_count;
integer fail_count;
integer local_pass_count;
integer local_fail_count;

wire clk;
clkdiv2 clkdiv2_inst
(
	clk_50,
	rst,
	
	clk//25MHz
);

wire cpu_halt;
wire one_w = 1'b1;
wire [27:0] pc_out, sys_out;
nes_fpga_top_lvl nes_dut
(
	clk_50, //50MHz clk from crystal to be divided to 25
	rst,//Reset on button 0
	one_w,///On button 1
	
	//UART connections
	uart_rx,
	uart_tx,
	uart_rts,
	uart_cts,
	
	//VGA connections
	vga_clk,
	vga_hsync,
	vga_vsync,
	vga_sync_n,
	vga_blank_n,
	vga_r, vga_g, vga_b,
	
	joycon_1, joycon_2,//connected to dip switches in bit order
	
	ppu_vsync,
	cpu_halt,
	
	//Program counter of 6502
	pc_out,
	
	//Sys ctrl address out
	sys_out

);

//TX module for sending the commands
reg tx_start;
reg [7:0] tx_data;
wire tx_active, tx_done;
UART_TX uart_command_tx
(
	clk,
	tx_start,
	tx_data,
	tx_active,
	uart_rx,
	tx_done
);

//RX module for reading out bytes
wire rx_valid;
wire [7:0] rx_data;
uart_rx uart_command_rx
(
	clk,
	rst,
	uart_tx,
	rx_valid,
	rx_data

);



initial begin

	clk_50 = 0;
	rst = 1;
	ppu_rst = 0;
	
	cnt = 0;
	pass_count = 0;
	fail_count = 0;
	local_fail_count = 0;
	local_pass_count = 0;
	
	tx_start = 0;
	tx_data = 0;
	
	reset();
	
	//To enable access to memory bus
	reset_cpu();
	
	
	//CPU memory
	load_pgrom_test();
	check_pgrom_test();
	
	//PPU memory
	//load_chrom();
	//check_chrom();
	
	//Take the CPU PPU out of reset
	set_cpu();
	
	while(1) begin
		clk_cycle();
	end
	

end


//Twice since we divide by 2
task clk_cycle;
begin
	#1
	clk_50 <= 1'b1;
	#1
	clk_50 <= 1'b0;
	#1
	clk_50 <= 1'b1;
	#1
	clk_50 <= 1'b0;
end
endtask


task reset;
begin
	
	repeat(10) clk_cycle();
	
	rst <= 1'b0;
	
	repeat(10) clk_cycle();
	
	rst <= 1'b1;
	
	repeat(10) clk_cycle();

end
endtask

integer listing[];

task load_chrom();
begin

	listing = {};
	load_raw_listing(listing, ppu_str);

	//Write all of vram
	for(cnt = 0; cnt <  $size(listing); cnt = cnt + 1) begin

		//Set the address first
		write_byte(16'h2006, cnt[15:8]);
		write_byte(16'h2006, cnt[7:0]);
		
		
		//Set the data last
		write_byte(16'h2007, listing[cnt][7:0]);

	end
end
endtask

task check_chrom();
begin

	listing = {};

	load_raw_listing(listing, ppu_str);

	//Read all of CPU memory
	for(cnt = 0; cnt <  $size(listing); cnt = cnt + 2) begin

		//Send the write byte commands
		//Set the address first
		write_byte(16'h2006, cnt[15:8]);
		write_byte(16'h2006, cnt[7:0]);
		
		//Read twice because of buffer bug
		read_byte(16'h2007);
		
		//But only if we're not reading the color
		if(cnt < 16'h3F00) begin
			write_byte(16'h2006, listing[cnt][15:8]);
			write_byte(16'h2006, listing[cnt][7:0]);
			read_byte(16'h2007);
		end
		
		if(uart_result != listing[cnt][7:0]) begin
		
			fail_count = fail_count + 1;
			local_fail_count = local_fail_count + 1;
			report_error(listing[cnt], listing[cnt+1][7:0], uart_result);
		
		end
		else begin
		
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		
		end

	end
	
	$display("MEM readback test complete, %d cases total, %d passed, %d failed", pass_count+fail_count, pass_count, fail_count);
	
end
endtask

reg [31:0] cnt_inc;
task load_pgrom();
begin

	listing = {};
	load_raw_listing(listing, cpu_str);

	//Write all of vram
	for(cnt = 0; cnt <  $size(listing); cnt = cnt + 1) begin


		cnt_inc = (cnt + 16'h8000);
		//Set the address first
		write_byte(16'h2006, cnt_inc[15:8]);
		write_byte(16'h2006, cnt_inc[7:0]);
		
		
		//Set the data last
		write_byte(16'h2007, listing[cnt][7:0]);

	end
end
endtask

task check_pgrom();
begin

	listing = {};

	load_raw_listing(listing, cpu_str);

	//Read all of CPU memory
	for(cnt = 32'h00000000; cnt <  32'h00008000; cnt = cnt + 2) begin
	
		cnt_inc = (cnt + 16'h8000);
		read_byte(cnt_inc);
	
		
		if(uart_result != listing[cnt][7:0]) begin
		
			fail_count = fail_count + 1;
			local_fail_count = local_fail_count + 1;
			report_error(listing[cnt], listing[cnt+1][7:0], uart_result);
		
		end
		else begin
		
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		
		end

	end
	
	
	$display("MEM readback test complete, %d cases total, %d passed, %d failed", pass_count+fail_count, pass_count, fail_count);
	
end
endtask


task load_pgrom_test();
begin

	listing = {};
	load_raw_listing(listing, cpu_str_tst);

	//Write PGROM first
	for(cnt = 32'h00008000; cnt <  32'h00010000; cnt = cnt + 1) begin
		//Set the data last
		write_byte(cnt[15:0], listing[cnt][7:0]);

	end
	
	
	//Then write ram
	for(cnt = 0; cnt < 16'h0300; cnt = cnt + 1) begin
	
		write_byte(cnt[15:0], listing[cnt][7:0]);
	
	end
	
end
endtask

task check_pgrom_test();
begin

	listing = {};

	load_raw_listing(listing, cpu_str_tst);

	//Read all of CPU memory
	for(cnt = 32'h00008000; cnt <  32'h00010000; cnt = cnt + 1) begin
	
		
		read_byte(cnt[15:0]);
		

		
		if(uart_result != listing[cnt][7:0]) begin
		
			fail_count = fail_count + 1;
			local_fail_count = local_fail_count + 1;
			report_error(listing[cnt], listing[cnt+1][7:0], uart_result);
		
		end
		else begin
		
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		
		end

	end
	
	//Read all of CPU memory
	for(cnt = 32'h00000000; cnt <  32'h00000300; cnt = cnt + 1) begin
	
		//Read twice because of buffer bug
		read_byte(cnt[15:0]);
	
		
		if(uart_result != listing[cnt][7:0]) begin
		
			fail_count = fail_count + 1;
			local_fail_count = local_fail_count + 1;
			report_error(listing[cnt], listing[cnt+1][7:0], uart_result);
		
		end
		else begin
		
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		
		end

	end
	
	$display("MEM readback test complete, %d cases total, %d passed, %d failed", pass_count+fail_count, pass_count, fail_count);
	
end
endtask


task write_byte(
input [15:0] addr,
input [7:0] data
);
begin

	//Send the command 2
	tx_data <= 8'h02;
	
	//
	tx_start <= 1;
	
	clk_cycle();
	
	tx_start <= 0;
	
	while(tx_active) begin
		clk_cycle();
	end
	
	repeat(3) clk_cycle();
	
	
	//Send the upper address byte
	tx_data <= addr[15:8];
	
	tx_start <= 1;
	
	clk_cycle();
	
	tx_start <= 0;
	
	while(tx_active) begin
		clk_cycle();
	end
	
	repeat(3) clk_cycle();
	
	//Send the lower address byte
	tx_data <= addr[7:0];
	
	tx_start <= 1;
	
	clk_cycle();
	
	tx_start <= 0;
	
	while(tx_active) begin
		clk_cycle();
	end
	
	repeat(3) clk_cycle();
	
	//Send the data
	tx_data <= data;
	
	tx_start <= 1;
	
	clk_cycle();
	
	tx_start <= 0;
	
	while(tx_active) begin
		clk_cycle();
	end
	
	repeat(3) clk_cycle();

end
endtask



task read_byte(
input [15:0] addr
);
begin
	
	//Send the command 2
	tx_data <= 8'h03;
	
	//
	tx_start <= 1;
	
	clk_cycle();
	
	tx_start <= 0;
	
	while(tx_active) begin
		clk_cycle();
	end
	
	repeat(3) clk_cycle();
	
	//Send the upper addr byte
	tx_data <= addr[15:8];
	
	//
	tx_start <= 1;
	
	clk_cycle();
	
	tx_start <= 0;
	
	while(tx_active) begin
		clk_cycle();
	end
	
	repeat(3) clk_cycle();
	
	//Send the lower addr byte
	tx_data <= addr[7:0];
	
	//
	tx_start <= 1;
	
	clk_cycle();
	
	tx_start <= 0;
	
	while(tx_active) begin
		clk_cycle();
	end
	
	//Check for the data returned
	while(!rx_valid) begin
		clk_cycle();
	end
		
	//Read data into uart result
	uart_result = rx_data;
	
	
	clk_cycle();
	


end
endtask

task reset_cpu();
begin

	//Send the command 2
	tx_data <= 8'h06;
	
	//
	tx_start <= 1;
	
	clk_cycle();
	
	tx_start <= 0;
	
	while(tx_active) begin
		clk_cycle();
	end
	
	repeat(3) clk_cycle();

end
endtask

task set_cpu();
begin

	//Send the command 2
	tx_data <= 8'h07;
	
	//
	tx_start <= 1;
	
	clk_cycle();
	
	tx_start <= 0;
	
	while(tx_active) begin
		clk_cycle();
	end
	
	repeat(3) clk_cycle();

end
endtask

task report_error
(
input [15:0] addr,
input [7:0] expected,
input [7:0] actual
);
begin

	$display("Error reading memory at %x, expected %x, got %x", addr, expected, actual);

end
endtask


endmodule


