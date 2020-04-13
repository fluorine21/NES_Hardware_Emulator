//Test bench for memory controller


module mem_ctrl_1_cycle_tb();


reg clk;
reg rst;
reg [15:0] cpu_addr_in;
reg [7:0] cpu_data_in;
wire [7:0] cpu_data_out;
reg cpu_write_en;
reg cpu_read_en;

wire [7:0] ppu_ctrl1;
wire [7:0] ppu_ctrl2;
reg [7:0] ppu_status;
wire [15:0] ppu_scroll_addr;

reg [15:0] vram_ppu_addr;
wire [7:0] vram_ppu_data;

reg [7:0] spram_ppu_addr;
wire [7:0] spram_ppu_data;

wire [7:0] spram_cpu_addr;
wire ppu_status_read;

integer pass_count;
integer fail_count;
integer local_pass_count;
integer local_fail_count;

reg [15:0] addr_int;

mem_ctrl_1_cycle dut
(
	clk,
	rst,
	
	cpu_addr_in,
	cpu_data_in,
	cpu_data_out,
	cpu_write_en,
	cpu_read_en,
	
	ppu_ctrl1,
	ppu_ctrl2,
	ppu_status,
	ppu_scroll_addr,
	
	vram_ppu_addr,
	vram_ppu_data,
	
	spram_ppu_addr,
	spram_ppu_data,
	
	spram_cpu_addr,
	ppu_status_read

);

initial begin


	pass_count = 0;
	fail_count = 0;
	local_pass_count = 0;
	local_fail_count = 0;
	
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
	write_spram_cpu();
	write_mem_cpu();
	
	read_vram_cpu();
	read_spram_ppu();
	read_mem_cpu();
	read_vram_ppu();
	
	$display("MEM test complete, %d cases total, %d passed, %d failed\n", pass_count+fail_count, pass_count, fail_count);
	

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

	#1

	local_fail_count = 0;
	local_pass_count = 0;

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
			$display("VRAM CPU ERROR");
			fail_count = fail_count + 1;
			local_fail_count = local_fail_count + 1;
			report_error(addr_int, addr_int[7:0], cpu_data_out);
		end
		else begin
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
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
			$display("VRAM CPU ERROR");
			fail_count = fail_count + 1;
			local_fail_count = local_fail_count + 1;
			report_error(addr_int, addr_int[7:0], cpu_data_out);
		end
		else begin
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		end
	end

	cpu_read_en = 1'b0;
	
	$display("VRAM CPU Read test complete, %d cases total, %d passed, %d failed\n", local_fail_count+local_pass_count, local_pass_count, local_fail_count);
	
end
endtask

task write_spram_cpu();
begin

	//load 0x00 into the spram pointer
	cpu_addr_in <= 16'h2003;
	cpu_data_in <= 8'h00;
	cpu_write_en <= 1'b1;
	
	clk_cycle();
	
	cpu_addr_in <= 16'h2004;
	
	//Write all 256 locations of spram
	for(addr_int = 16'h0000; addr_int < 16'h0100; addr_int = addr_int + 1) begin
	
		cpu_data_in <= addr_int[7:0];
		clk_cycle();
	
	end
	
	cpu_write_en = 1'b0;

end
endtask

task read_spram_ppu();
begin
	#1
	
	local_fail_count = 0;
	local_pass_count = 0;


	for(addr_int = 16'h0000; addr_int < 16'h0100; addr_int = addr_int + 1)begin
		
		spram_ppu_addr <= addr_int[7:0];
		
		clk_cycle();
		
		if(spram_ppu_data != addr_int[7:0]) begin
			local_fail_count = local_fail_count + 1;
			fail_count = fail_count + 1;
			$display("SPRAM PPU ERROR");
			report_error(addr_int, addr_int[7:0], spram_ppu_data);
		end
		else begin
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		end
	
	end
	
	$display("SPRAM PPU Read test complete, %d cases total, %d passed, %d failed\n", local_fail_count+local_pass_count, local_pass_count, local_fail_count);

end
endtask

task write_mem_cpu();
begin

	cpu_write_en = 1'b1;

	//Start by writing 0x00 to 0x800
	for(addr_int = 16'h0000; addr_int < 16'h0800; addr_int = addr_int + 1) begin
		
		cpu_write_en = 1'b1;
		cpu_addr_in = addr_int;
		cpu_data_in = addr_int[7:0];
		clk_cycle();
	
	
	end
	
	
	//Then write 0x4020 to 0x10000
	for(addr_int = 16'h4020; addr_int < 16'h7FFF; addr_int = addr_int + 1) begin
		
		cpu_addr_in = addr_int;
		cpu_data_in = addr_int[7:0];
		
		clk_cycle();
	
	end

	cpu_write_en = 1'b0;
	
end
endtask

task read_mem_cpu();
begin
	#1
	local_pass_count = 0;
	local_fail_count = 0;

	//Read address 0x00 to 0x800
	//Start by writing 0x00 to 0x800
	for(addr_int = 16'h0000; addr_int < 16'h0800; addr_int = addr_int + 1) begin
		
		cpu_addr_in <= addr_int;
		
		clk_cycle();
		
		if(cpu_data_out != addr_int[7:0]) begin
			$display("CPU MEM ERROR");
			local_fail_count = local_fail_count + 1;
			fail_count = fail_count + 1;
			report_error(addr_int, addr_int[7:0], spram_ppu_data);
		end
		else begin
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		end
	
	
	end
	
	//Then read 0x4020 to 0x10000
	for(addr_int = 16'h4020; addr_int < 16'h7FFF; addr_int = addr_int + 1) begin
	
		cpu_addr_in <= addr_int;
		
		clk_cycle();
		
		if(cpu_data_out != addr_int[7:0]) begin
			$display("CPU MEM ERROR");
			local_fail_count = local_fail_count + 1;
			fail_count = fail_count + 1;
			report_error(addr_int, addr_int[7:0], spram_ppu_data);
		end
		else begin
			pass_count = pass_count + 1;
			local_pass_count = local_pass_count + 1;
		end
	end
	
	$display("CPU MEM Read test complete, %d cases total, %d passed, %d failed\n", local_fail_count+local_pass_count, local_pass_count, local_fail_count);

end
endtask

task read_vram_ppu();
begin


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