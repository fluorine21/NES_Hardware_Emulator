import vram_listing::*;

module ppu_fsm_tb();

reg clk, rst;

reg [15:0] cpu_addr;

wire [15:0] vram_read_addr;
wire [7:0] vram_read_data;

wire [7:0] spram_addr;
wire [7:0] spram_data_in;

reg [7:0] ppu_ctrl1;
reg [7:0] ppu_ctrl2;
wire [7:0] ppu_status;
reg [15:0] cpu_scroll_addr;

reg vga_done; //Need to start when this is high

// start; // Not needed; automatically starts when VGA is done with memory
// busy; //Not needed; implied via ppu_status bits

wire [8:0] vga_row;
wire [8:0] vga_col;
wire [7:0] vga_data;
wire vga_write_en;
reg [7:0] cpu_sprite_addr;
ppu_fsm ppu_fsm_inst
(
	 clk,
	 rst,
	
	vram_read_addr,
	vram_read_data,
	
	cpu_addr,//Used to determine when to reset vsync
	1'b1,
	
	spram_addr,
	spram_data_in,
	
	ppu_ctrl1,
	ppu_ctrl2,
	ppu_status,
	cpu_scroll_addr,
	cpu_sprite_addr,
	
	vga_done, //Need to start when this is high
	
	// start, // Not needed, automatically starts when VGA is done with memory
	// busy, //Not needed, implied via ppu_status bits
	
	vga_row,
	vga_col,
	vga_data,
	vga_write_en

);

//VRAM
reg [15:0] vram_write_addr;
reg [7:0] vram_write_data;
wire [7:0] vram_dummy_data_out;
reg vram_write_en;
generic_ram #(16384, 16) vram_inst
(
	clk,
	
	vram_write_addr,
	vram_write_data,
	vram_dummy_data_out,
	vram_write_en,
	
	//Connections for vram load fsm
	vram_read_addr,
	vram_read_data
	
);


//SPRAM
reg [7:0] spram_write_addr;
reg [7:0] spram_write_data;
wire [7:0] spram_dummy_data_out;
reg spram_write_en;
generic_ram #(256, 8) spram_inst
(
	clk,
	
	spram_write_addr,
	spram_write_data,
	spram_dummy_data_out,
	spram_write_en,
	
	//Connections for vram load fsm
	spram_addr,
	spram_data_in
	
);

//Video memory
reg [9:0] vga_read_row = 0;
reg [9:0] vga_read_col = 0;
wire [7:0] vga_read_data;
vga_mem vga_mem_inst
(
	clk,
	vga_row,
	vga_col,
	vga_data,
	vga_write_en,
	
	vga_read_row,
	vga_read_col,
	vga_read_data

);



//Test counters
integer pass_count, fail_count, local_pass_count, local_fail_count;

//Loop counters
integer i, j;

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

//loads the two pattern tables, nametable, and attribute table with values
task load_vram;
begin

	#1
	vram_write_en = 1;
	#1
	

	//Loop through the vram listing and load all of the values
	for(i = 0; i < $size(vram_listing); i = i + 2) begin
	
		//Load the address and data
		vram_write_addr <= vram_listing[i];
		vram_write_data <= vram_listing[i+1][7:0];
		
		//Write in the data
		clk_cycle();
	
	end
	
	#1
	vram_write_en = 0;
	//#1

end
endtask

task write_spram();
begin
	#1
	spram_write_en = 1;
	#1
	//Loop through the vram listing and load all of the values
	for(i = 0; i < $size(spram_listing); i = i + 2) begin
	
		//Load the address and data
		spram_write_addr <= spram_listing[i];
		spram_write_data <= spram_listing[i+1][7:0];
		
		//Write in the data
		clk_cycle();
	
	end
	#1
	spram_write_en = 0;
	//#1
end
endtask


initial begin

	clk <= 0;
	rst <= 0;
	
	cpu_addr <= 16'h2002;
	
	ppu_ctrl1 = 8'h88;
	ppu_ctrl2 = 8'h18;//Enable sprites
	
	cpu_scroll_addr = 1;
	
	vga_done = 0;

	vram_write_addr = 0;
	vram_write_data = 0;
	vram_write_en = 0;
	
	spram_write_addr = 0;
	spram_write_data = 0;
	spram_write_en = 0;
	
	vga_read_row = 0;
	vga_read_col = 0;
	
	cpu_sprite_addr = 0;
	
	
	//Reset everything
	reset();

	rst = 0;
	
	//Load memory
	load_vram();
	write_spram();
	
	
	#1
	vga_done = 1;
	#1
	
	repeat(10) clk_cycle();
	
	#1
	vga_done = 0;
	#1
	
	rst = 1;

	#1
	vga_done = 1;
	#1

	while(1) begin 
		clk_cycle();
		if(ppu_status & 8'h80) begin
		
			#1
			vga_done = 0;
			#1
		
			$display("PPU vsync");
			
//			if(cpu_scroll_addr == 16'h00FF) begin
//				cpu_scroll_addr <= 0;
//				ppu_ctrl1 <= ppu_ctrl1 | 8'h01;
//			
//			end
//			else begin
//			
//				cpu_scroll_addr <= cpu_scroll_addr + 1;
//			
//			end
			
			
			while(!(ppu_status & 8'h80))begin
				clk_cycle();
			end
			
			repeat(100) clk_cycle();
			
			#1
			vga_done = 1;
			
		end
	end
	
	
end



endmodule