



module sys_ctrl_fsm_tb();


reg [31:0] addr_limit = 16'h0100;

reg clk, rst;

wire uart_rx;
wire uart_tx;

wire [15:0] cpu_addr;
wire [7:0] cpu_data_in, cpu_data_out;
wire write_en;
wire read_en;

wire cpu_halt;
wire cpu_rst;

reg cpu_is_halted = 1;//CPU is always halted for this TB
reg [31:0] cnt;

reg [7:0] uart_result;

wire mux_ctrl;

integer pass_count;
integer fail_count;
integer local_pass_count;
integer local_fail_count;


sys_ctrl_fsm dut
(
	clk,
	rst,
	
	uart_rx,
	uart_tx,
	
	cpu_addr,
	cpu_data_in,
	cpu_data_out,
	write_en,
	read_en,
	
	cpu_halt,
	cpu_rst,
	
	cpu_is_halted,
	
	mux_ctrl
	
);

//CPU memory
wire [15:0] vram_read_addr;
wire [7:0] vram_read_data;
generic_ram #(65535, 16) vram_inst
(
	clk,
	
	cpu_addr,
	cpu_data_out,
	cpu_data_in,
	write_en,
	
	//Connections for vram load fsm
	vram_read_addr,
	vram_read_data
	
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
UART_RX uart_command_rx
(
	clk,
	uart_tx,
	rx_valid,
	rx_data

);


initial begin

	clk = 0;
	rst = 0;
	
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
	
	load_mem();
	
	read_mem();
	
	while(1) begin
	
		halt_cpu();
	
	end

end


task clk_cycle;
begin
	#1
	clk <= 1'b1;
	#1
	clk <= 1'b0;
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

task load_mem();
begin

	//Write all of CPU memory
	for(cnt = 0; cnt < addr_limit; cnt = cnt + 1) begin

		//Send the write byte commands
		write_byte(cnt, cnt[7:0]);

	end
end
endtask

task read_mem();
begin

	//Read all of CPU memory
	for(cnt = 0; cnt < addr_limit; cnt = cnt + 1) begin

		//Send the write byte commands
		read_byte(cnt);
		
		if(uart_result != cnt[7:0]) begin
		
			fail_count = fail_count + 1;
			local_fail_count = local_fail_count + 1;
			report_error(cnt, cnt[7:0], uart_result);
		
		end
		else begin
		
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		
		end

	end
	
	$display("SYS CTRL MEM test complete, %d cases total, %d passed, %d failed", pass_count+fail_count, pass_count, fail_count);
	
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
	tx_data <= addr[7:0];
	
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
	
	repeat(10) clk_cycle();

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

