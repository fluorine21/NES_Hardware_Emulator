import vram_listing::*;

module ppu_mem_vga_tb();


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

wire [6:0] addr_0, addr_1, addr_2, addr_3, data_0, data_1, state_out;
ppu_mem_vga_top_lvl dut
(
	clk_50, //50MHz clk from crystal to be divided to 25
	rst,
	ppu_rst,
	
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
	
	joycon_1, joycon_2,

	ppu_vsync,
	cpu_halt,
	
	addr_0, addr_1, addr_2, addr_3,
	data_0, data_1,
	state_out

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
	halt_cpu();
	
	load_vram();
	
	read_vram();
	
	load_spram();
	
	read_spram();
	
	//Set the PPU control registers
	write_byte(16'h2000, 8'b10001000);
	write_byte(16'h2001, 8'b00011000);
	
	//Set the scroll pointer
	write_byte(16'h2005, 8'b0);
	write_byte(16'h2005, 8'b0);
	
	//set the sprite address
	write_byte(16'h2003, 8'b0);
	
	//unhalt the cpu to take ppu out of reset
	resume_cpu();

	//Set the CPU address so we're always resetting vsync
	//read_byte(16'h2002);	


	#1
	ppu_rst = 1;
	#1
	
	while(1) begin
	
		clk_cycle();
		if(ppu_vsync) begin

			$display("PPU frame end");
			while(ppu_vsync) begin

				clk_cycle();
			end
		end
	
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

task load_vram();
begin

	//Write all of vram
	for(cnt = 0; cnt <  $size(vram_listing); cnt = cnt + 2) begin

		//Set the address first
		write_byte(16'h2006, vram_listing[cnt][15:8]);
		write_byte(16'h2006, vram_listing[cnt][7:0]);
		
		
		//Set the data last
		write_byte(16'h2007, vram_listing[cnt+1][7:0]);

	end
end
endtask

task load_spram();
begin

	//Write all of vram
	for(cnt = 0; cnt <  $size(spram_listing); cnt = cnt + 2) begin

		//Set the address first
		write_byte(16'h2003, spram_listing[cnt][7:0]);
		
		
		//Set the data last
		write_byte(16'h2004, spram_listing[cnt+1][7:0]);

	end
end
endtask

task read_spram();
begin

	pass_count = 0;
	fail_count = 0;

	//Read all of CPU memory
	for(cnt = 0; cnt <  $size(spram_listing); cnt = cnt + 2) begin

		//Set the address first
		write_byte(16'h2003, spram_listing[cnt][7:0]);
		
		//Read the result
		read_byte(16'h2004);
		
		if(uart_result != spram_listing[cnt+1][7:0]) begin
		
			fail_count = fail_count + 1;
			local_fail_count = local_fail_count + 1;
			$display("SPRAM ERROR");
			report_error(vram_listing[cnt], vram_listing[cnt+1][7:0], uart_result);
		
		end
		else begin
		
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		
		end

	end
	
	$display("SPRAM readback test complete, %d cases total, %d passed, %d failed", pass_count+fail_count, pass_count, fail_count);
	
end
endtask

task read_vram();
begin

	//Read all of CPU memory
	for(cnt = 0; cnt <  $size(vram_listing); cnt = cnt + 2) begin

		//Send the write byte commands
		//Set the address first
		write_byte(16'h2006, vram_listing[cnt][15:8]);
		write_byte(16'h2006, vram_listing[cnt][7:0]);
		
		//Read twice because of buffer bug
		read_byte(16'h2007);
		
		//But only if we're not reading the color
		if(vram_listing[cnt] < 16'h3F00) begin
			write_byte(16'h2006, vram_listing[cnt][15:8]);
			write_byte(16'h2006, vram_listing[cnt][7:0]);
			read_byte(16'h2007);
		end
		
		if(uart_result != vram_listing[cnt+1][7:0]) begin
		
			fail_count = fail_count + 1;
			local_fail_count = local_fail_count + 1;
			report_error(vram_listing[cnt], vram_listing[cnt+1][7:0], uart_result);
		
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

task halt_cpu();
begin

	//Send the command 2
	tx_data <= 8'h00;
	
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

task resume_cpu();
begin

	//Send the command 2
	tx_data <= 8'h01;
	
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

