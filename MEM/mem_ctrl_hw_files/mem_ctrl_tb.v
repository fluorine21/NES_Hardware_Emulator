//Test bench for memory controller


module mem_ctrl_tb();


reg clk;
reg rst;
reg [15:0] cpu_addr_in;
reg [7:0] cpu_data_in;
wire [7:0] cpu_data_out;
reg cpu_write_en;
reg cpu_read_en;
wire busy;

wire [7:0] ppu_ctrl1;
wire [7:0] ppu_ctrl2;
reg [7:0] ppu_status;

reg [15:0] vram_ppu_addr;
wire [7:0] vram_ppu_data;

reg [7:0] spram_ppu_addr;
wire [7:0] spram_ppu_data;

integer pass_count;
integer fail_count;

reg [15:0] addr_int;

mem_ctrl dut
(
	clk,
	rst,
	cpu_addr_in,
	cpu_data_in,
	cpu_data_out,
	cpu_write_en,
	cpu_read_en,
	busy,
	
	ppu_ctrl1,
	ppu_ctrl2,
	ppu_status,
	
	vram_ppu_addr,
	vram_ppu_data,
	
	spram_ppu_addr,
	spram_ppu_data

);

initial begin


	pass_count = 0;
	fail_count = 0;
	clk <= 1'b0;
	rst <= 1'b0;
	cpu_addr_in <= 16'b0;
	cpu_data_in <= 8'b0;
	cpu_write_en <= 1'b0;
	cpu_read_en <= 1'b0;
	ppu_status <= 8'b0;
	vram_ppu_addr <= 16'b0;
	spram_ppu_addr <= 8'b0;

	reset();
	
	write_vram_cpu();
	read_vram_cpu();
	
	$display("PPU test complete, %d cases total, %d passed, %d failed\n", pass_count+fail_count, pass_count, fail_count);
	

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

task write_vram_cpu();
begin

	cpu_write_en = 1'b1;
	
	//Write the starting address into the lower and upper spaces
	cpu_data_in = 8'b0;
	cpu_addr_in = 16'h2006;
	clk_cycle();
	clk_cycle();
	cpu_addr_in = 16'h2007;
	
	//Write all entries in the lower address space
	for(addr_int = 16'h0; addr_int < 16'h3000; addr_int = addr_int + 1) begin
	
		cpu_data_in = addr_int[7:0];
		clk_cycle();
	
	end
	
	//Write all entries in the sprite and image pallets
	cpu_addr_in = 16'h2006;
	cpu_data_in = 8'h3F;
	clk_cycle();
	cpu_data_in = 8'h00;
	clk_cycle();
	cpu_addr_in = 16'h2007;
	
	for(addr_int = 16'h3F00; addr_int < 16'h3F20; addr_int = addr_int + 1) begin
		
		cpu_data_in = addr_int[7:0];
		clk_cycle();
	
	end

	cpu_write_en = 1'b0;
	
end
endtask


task read_vram_cpu();
begin

	cpu_read_en = 1'b1;
	cpu_write_en = 1'b1;

	//Set up the vram pointer to point to the beginning of memory
	cpu_data_in = 8'b0;
	cpu_addr_in = 16'h2006;
	clk_cycle();
	clk_cycle();
	cpu_addr_in = 16'h2007;
	cpu_write_en = 1'b0;

	
	//Start reading out the beginning of memory
	for(addr_int = 16'h0; addr_int < 16'h3000; addr_int = addr_int + 1) begin
		
		clk_cycle();
		if(cpu_data_out != addr_int[7:0]) begin
			fail_count = fail_count + 1;
			report_error(addr_int, addr_int[7:0], cpu_data_out);
		end
		else begin
			pass_count = pass_count + 1;
		end
	end
	
	cpu_write_en = 1'b1;
	//Set up the vram pointer to point to the beginning image palet
	cpu_addr_in = 16'h2006;
	cpu_data_in = 8'h3F;
	clk_cycle();
	cpu_data_in = 8'h00;
	clk_cycle();
	cpu_addr_in = 16'h2007;
	cpu_write_en = 1'b0;

	
	//Start reading out the beginning of memory
	for(addr_int = 16'h3F00; addr_int < 16'h3F20; addr_int = addr_int + 1) begin
		
		clk_cycle();
		if(cpu_data_out != addr_int[7:0]) begin
			fail_count = fail_count + 1;
			report_error(addr_int, addr_int[7:0], cpu_data_out);
		end
		else begin
			pass_count = pass_count + 1;
		end
	end

	cpu_read_en = 1'b0;
	
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