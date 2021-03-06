//Test bench for PPU memory (VRAM and SPRAM)

//git push -u origin master


module ppu_mem_tb();

//Connections to PPU memory
reg clk;
reg rst;
reg [15:0] vram_ppu_addr;
wire [7:0] vram_ppu_data;
wire [7:0] vram_cpu_data_out;

reg [15:0] vram_cpu_addr; 
reg [7:0] vram_cpu_data_in;
reg vram_write_en;

reg [7:0] spram_ppu_addr;
wire [7:0] spram_ppu_data;

reg [7:0] spram_cpu_addr;
reg [7:0] spram_cpu_data;
reg spram_write_en;

integer pass_count;
integer fail_count;

reg [15:0] mirror_addr;


//ppu_mem instantiation
ppu_mem ppu_mem_inst
(
	clk,
	rst,
	vram_ppu_addr,
	vram_ppu_data,
	vram_cpu_data_out,
	vram_cpu_addr,
	vram_cpu_data_in,
	vram_write_en,
	spram_ppu_addr,
	spram_ppu_data,
	spram_cpu_addr,
	spram_cpu_data,
	spram_write_en
);


initial begin

	pass_count <= 0;
	fail_count <= 0;

	clk <= 1'b0;
	rst <= 1'b1;
	
	vram_ppu_addr <= 16'b0;
	vram_cpu_addr <= 16'b0;
	vram_cpu_data_in <= 8'b0;
	vram_write_en <= 1'b0;
	
	spram_ppu_addr <= 8'b0;
	spram_cpu_addr <= 8'b0;
	spram_write_en <= 1'b0;
	mirror_addr <= 16'b0;

	reset();

	write_spram();
	read_spram();
	
	write_vram();
	read_vram();
	
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


task write_vram;
begin
	
	vram_write_en <= 1'b1;

	//Write all entries in the lower address space
	for(vram_cpu_addr = 16'h0; vram_cpu_addr < 16'h3000; vram_cpu_addr = vram_cpu_addr + 1) begin
	
		vram_cpu_data_in = vram_cpu_addr[7:0];
		clk_cycle();
	
	end
	
	//Write all entries in the sprite and image pallets
	for(vram_cpu_addr = 16'h3F00; vram_cpu_addr < 16'h3F20; vram_cpu_addr = vram_cpu_addr + 1) begin
		
		vram_cpu_data_in = vram_cpu_addr[7:0];
		clk_cycle();
	
	end
	vram_write_en <= 1'b0;

end
endtask

task read_vram;
begin

	//Read all the entries of the lower address space
	for(vram_cpu_addr = 16'h0; vram_cpu_addr < 16'h3000; vram_cpu_addr = vram_cpu_addr + 1) begin
	
		//Set up the PPU address lines as well
		vram_ppu_addr <= vram_cpu_addr;
	
		//Cycle the clock to process the read_vram
		clk_cycle();
		if(vram_cpu_data_out != vram_cpu_addr[7:0] || vram_ppu_data != vram_ppu_addr[7:0]) begin
			fail_count = fail_count + 1;
			$display("Read failed for address %x, expecting %x, got %x\n", vram_cpu_addr, vram_cpu_data_out, vram_cpu_addr[7:0]);
		
		end
		else begin
			pass_count = pass_count + 1;
		end
	
	end
	
	//Read all the entries of the first mirror
	for(vram_cpu_addr = 16'h3000; vram_cpu_addr < 16'h3F00; vram_cpu_addr = vram_cpu_addr + 1) begin
	
		//Cycle the clock to process the read_vram
		clk_cycle();
		if(vram_cpu_data_out != vram_cpu_addr[7:0]) begin
			fail_count = fail_count + 1;
			$display("Read failed for address %x, expecting %x, got %x\n", vram_cpu_addr, vram_cpu_data_out, vram_cpu_addr[7:0]);
		
		end
		else begin
			pass_count = pass_count + 1;
		end
	
	end
	
	//Read all the entries of the image and sprite pallets
	for(vram_cpu_addr = 16'h3F00; vram_cpu_addr < 16'h3F20; vram_cpu_addr = vram_cpu_addr + 1) begin
	
		//Cycle the clock to process the read_vram
		clk_cycle();
		if(vram_cpu_data_out != vram_cpu_addr[7:0]) begin
			fail_count = fail_count + 1;
			$display("Read failed for address %x, expecting %x, got %x\n", vram_cpu_addr, vram_cpu_data_out, vram_cpu_addr[7:0]);
		
		end
		else begin
			pass_count = pass_count + 1;
		end
	
	end
	
	//Read all the entries of the sprite pallets but this time from the mirror
	for(vram_cpu_addr = 16'h3F20; vram_cpu_addr < 16'h4000; vram_cpu_addr = vram_cpu_addr + 1) begin
	
		//Cycle the clock to process the read_vram
		clk_cycle();
		
		//Figure out the address we should be looking at
		mirror_addr = ((vram_cpu_addr - 16'h3F20) % 16'h0020) + 16'h3F00;
		
		
		if(vram_cpu_data_out != mirror_addr[7:0]) begin
			fail_count = fail_count + 1;
			$display("Read failed for address %x, expecting %x, got %x\n", vram_cpu_addr, vram_cpu_data_out, mirror_addr[7:0]);
		
		end
		else begin
			pass_count = pass_count + 1;
		end
	
	end
	
	//Read all the entries of the lower address space via the mirror
	for(vram_cpu_addr = 16'h4000; vram_cpu_addr < 16'h7000; vram_cpu_addr = vram_cpu_addr + 1) begin
	
		//Cycle the clock to process the read_vram
		clk_cycle();
		if(vram_cpu_data_out != vram_cpu_addr[7:0]) begin
			fail_count = fail_count + 1;
			$display("Read failed for address %x, expecting %x, got %x\n", vram_cpu_addr, vram_cpu_data_out, vram_cpu_addr[7:0]);
		
		end
		else begin
			pass_count = pass_count + 1;
		end
	
	end


end
endtask


task write_spram;
begin

	spram_write_en <= 1'b1;

	//Write all SPRAM addresses with their address value
	for(spram_cpu_addr = 8'b0; spram_cpu_addr < 8'hFF; spram_cpu_addr = spram_cpu_addr + 1) begin
	
		spram_cpu_data <= spram_cpu_addr;
		clk_cycle();
	
	end
	
	spram_write_en <= 1'b1;

end
endtask

task read_spram;
begin

	//Write all SPRAM addresses with their address value
	for(spram_ppu_addr = 8'b0; spram_ppu_addr < 8'hFF; spram_ppu_addr = spram_ppu_addr + 1) begin

		clk_cycle();
		
		if(spram_ppu_addr != spram_ppu_data) begin
			
			fail_count = fail_count + 1;
			$display("Failed to read SPRAM memory at %x, expected %x, got %x\n", spram_ppu_addr, spram_ppu_addr, spram_ppu_data);
		
		end
		else begin
		
			pass_count = pass_count + 1;
		
		end
	
	end

end
endtask


endmodule