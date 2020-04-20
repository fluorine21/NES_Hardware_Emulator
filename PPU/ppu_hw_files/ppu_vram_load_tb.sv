





module ppu_vram_load_fsm_tb();

//vram load fsm connections
reg clk;
reg rst;
reg start;

reg [8:0] curr_row, curr_col;
wire [15:0] vram_addr;
wire [7:0] vram_data_in;

reg [7:0] ppu_ctrl2;

reg [127:0] bacground_colors;
reg [15:0] background_pattern_base;
wire [15:0] nametable_ptr;
wire [2:0] pattern_table_offset;
wire [15:0] attr_ptr;
wire [1:0] attr_shift;

//Sprite stuff
reg [127:0] sprite_colors;
reg [15:0] sprite_pattern_base;

//Sprite 0
reg sprite_0_on_tile;
reg [7:0] sprite_0_tile_num;
reg [7:0] sprite_0_row;
reg [7:0] sprite_0_col;
reg [7:0] sprite_0_attr;

//Sprite 1
reg sprite_1_on_tile;
reg [7:0] sprite_1_tile_num;
reg [7:0] sprite_1_row;
reg [7:0] sprite_1_col;
reg [7:0] sprite_1_attr;

wire [8:0] vga_ram_row, vga_ram_col;
wire [7:0] vga_ram_data;

wire busy;

//Connections from test bench to ppu memory
reg [15:0] vram_write_addr;
reg [7:0] vram_write_data;
wire [7:0] vram_dummy_data_out;
reg vram_write_en;

//inputs to pixel_to_nametable_ptr
reg [15:0] cpu_scroll_addr;
reg [7:0] ppu_ctrl1;

pixel_to_nametable_ptr pixel_to_nametable_inst
(
	curr_row,
	curr_col,
	
	cpu_scroll_addr,
	ppu_ctrl1,
	
	nametable_ptr,
	pattern_table_offset
);

//Connections from test bench to vga memory
reg [9:0] vga_row, vga_col;
wire [7:0] vga_data;

//Test counters
integer pass_count, fail_count, local_pass_count, local_fail_count;

//Loop counters
integer i, j;

ppu_vram_load_fsm dut
(
	
	clk,
	rst, 
	start,
	curr_row,
	curr_col,
	
	vram_addr,
	vram_data_in,
	
	ppu_ctrl2,
	
	//Background info
	bacground_colors,
	background_pattern_base,
	nametable_ptr,
	pattern_table_offset,
	attr_ptr,
	attr_shift,
	

	sprite_colors,
	sprite_pattern_base,
	
	//Sprite 0
	sprite_0_on_tile,
	sprite_0_tile_num,
	sprite_0_row,
	sprite_0_col,
	sprite_0_attr,
	
	//Sprite 1
	sprite_1_on_tile,
	sprite_1_tile_num,
	sprite_1_row,
	sprite_1_col,
	sprite_1_attr,

	
	vga_ram_row,
	vga_ram_col,
	vga_ram_data,
	vga_write_en,
	
	busy
	
	
);

//ppu memory

generic_ram #(16384, 16) vram_inst
(
	clk,
	
	vram_write_addr,
	vram_write_data,
	vram_dummy_data_out,
	vram_write_en,
	
	//Connections for vram load fsm
	vram_addr,
	vram_data_in
	
);

//Translation from nametable_ptr to attribute table ptr and offset
name_to_att nta_inst
(
	nametable_ptr,
	attr_ptr,
	attr_shift
);

initial begin

	i = 0;
	j = 0;

	pass_count = 0;
	fail_count = 0;
	local_pass_count = 0;
	local_fail_count = 0;
	
	clk = 0;
	rst = 0;
	start = 0;
	
	//We'll start in the second column so we can test sprite overlay
	curr_row = 0;
	curr_col = 8;
	
	//Enable sprites and background
	ppu_ctrl2 = 8'b00011000;
	
	//Set the background colors to all B
	bacground_colors = 128'hFEDCBA9876543210FEDCBA9876543210;
	
	//We'll have the background pattern table start at 0x1000
	background_pattern_base = 16'h1000;
	
	//Other background stuff is determined via pixel_to_nametable_inst
	
	//Set the sprite colors to all A
	sprite_colors = 128'h0123456789ABCDEF0123456789ABCDEF;;
	//Sprite pattern table will start at 0
	sprite_pattern_base = 0;
	
	
	//Try drawing the sprite here
	sprite_0_on_tile = 1;
	
	//We'll select the first (#0) tile in the pattern table
	sprite_0_tile_num = 0;
	
	//We'll have the sprite slightly to the left of the first column
	sprite_0_row = 0;
	sprite_0_col = 3;
	
	//We'll set this sprite to have priority over the background
	//Also selecting the first 3 sprite colors here
	sprite_0_attr = 0;

	sprite_1_on_tile = 1;
	sprite_1_tile_num = 1;
	sprite_1_row = 0;
	sprite_1_col = 14;
	sprite_1_attr = 1;//Selecting the second 3 sprite colors


	vram_write_addr = 0;
	vram_write_data = 0;
	vram_write_en = 0;
	
	vga_row = 0;
	vga_col = 0;
	
	//Set the offset to 0 for now
	cpu_scroll_addr = 0;
	
	//Set nametable base address to 2000
	ppu_ctrl1 = 0;
	
	
	//////////////////////////////////////////////
	///Testing Start//////////////////////////////
	//////////////////////////////////////////////
	
	//Reset everything
	reset();
	
	//Load the VRAM
	load_vram();
	
	//Run the FSM
	run_ppu_vram_load_fsm();

end




//Video memory

vga_mem vga_mem_inst
(
	clk,
	vga_ram_row,
	vga_ram_col,
	vga_ram_data,
	vga_write_en,
	
	vga_row,
	vga_col,
	vga_data

);

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

//Memory listing for vram
integer vram_listing[100] = 
{
	//memory address, value (upper bits are 0
	
	//This is the sprite pattern found at tile 0 of pattern table 0
	//This would make the sprite 0 a solid square of color 3
	16'h0000, 16'h00FF,
	16'h0001, 16'h00FF,
	16'h0002, 16'h00FF,
	16'h0003, 16'h00FF,
	16'h0004, 16'h00FF,
	16'h0005, 16'h00FF,
	16'h0006, 16'h00FF,
	16'h0007, 16'h00FF,
	16'h0008, 16'h00FF,
	16'h0009, 16'h00FF,
	16'h000A, 16'h00FF,
	16'h000B, 16'h00FF,
	16'h000C, 16'h00FF,
	16'h000D, 16'h00FF,
	16'h000E, 16'h00FF,
	16'h000F, 16'h00FF,
	
	//This is the sprite pattern found at tile 1 of pattern table 0
	//This would make the sprite 1 a solid square of color 3
	16'h0010, 16'h00FF,
	16'h0011, 16'h00FF,
	16'h0012, 16'h00FF,
	16'h0013, 16'h00FF,
	16'h0014, 16'h00FF,
	16'h0015, 16'h00FF,
	16'h0016, 16'h00FF,
	16'h0017, 16'h00FF,
	16'h0018, 16'h00FF,
	16'h0019, 16'h00FF,
	16'h001A, 16'h00FF,
	16'h001B, 16'h00FF,
	16'h001C, 16'h00FF,
	16'h001D, 16'h00FF,
	16'h001E, 16'h00FF,
	16'h001F, 16'h00FF,
	
	
	//This is the background pattern found at tile 1 of pattern table 1
	//This would make the background a solid square of color 3
	16'h1010, 16'h00FF,
	16'h1011, 16'h00FF,
	16'h1012, 16'h00FF,
	16'h1013, 16'h00FF,
	16'h1014, 16'h00FF,
	16'h1015, 16'h00FF,
	16'h1016, 16'h00FF,
	16'h1017, 16'h00FF,
	16'h1018, 16'h00FF,
	16'h1019, 16'h00FF,
	16'h101A, 16'h00FF,
	16'h101B, 16'h00FF,
	16'h101C, 16'h00FF,
	16'h101D, 16'h00FF,
	16'h101E, 16'h00FF,
	16'h101F, 16'h00FF,
	
	//This is the nametable entry at 2000 for the background
	//It will point to tile 1 of pattern table 1
	16'h2001, 16'h0001,
	
	//This is the attribute table entry for nametable 0 tile ptr 0
	//The fsm should select the second set of two bits
	16'h23C0, 16'b0000000000001100
	
	
	
};



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


task run_ppu_vram_load_fsm;
begin

	//Tell the module to start
	#1
	start = 1;
	#1
	
	clk_cycle();
	
	#1
	start = 0;
	#1
	
	for(i = 0; i < 1000; i = i + 1) begin
	
		clk_cycle();
		
		//If the module finished
		if(busy == 1'b0) begin
			
			//Exit the loop
			i = 1000;
		
		end
		//If I got too large
		else if(i > 500) begin
			
			$display("PPU VRAM LOAD FSM ERROR, took %d cycles to complete\n", i);
		
			//Exit the loop
			i = 1000;
		
		end
	
	end
	
	//Run the render 8 fsm
	repeat(100) clk_cycle();

	

end
endtask



endmodule












