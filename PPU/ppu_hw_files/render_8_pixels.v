

module render_8_pixels
(
	
	//This module should have inputs for preloaded upper and lower pattern table bytes
	//This module only writes to vga ram
	
	//Sprite priority is determined outside of this module
	//This module assumes that the sprite has priority automatically
	
	input wire clk,
	input wire rst,
	
	//These may not be in bounds, but we don't need to check
	input wire [8:0] vga_start_row,
	input wire [8:0] vga_start_col,
	
	//VGA connections
	output reg [8:0] vga_addr_row,
	output reg [8:0] vga_addr_col,
	output reg [7:0] vga_data,
	output reg vga_write_en,
	
	
	//Sprite 0 inputs
	//Color is decoded in load section fsm by color_selector
	input wire [7:0] sprite_0_pattern_low,
	input wire [7:0] sprite_0_pattern_high,
	input wire [7:0] sprite_0_attr,
	input wire [31:0] sprite_0_colors,
	
	//Sprite 0 inputs
	//Color is decoded in load section fsm
	input wire [7:0] sprite_1_pattern_low,
	input wire [7:0] sprite_1_pattern_high,
	input wire [7:0] sprite_1_attr,
	input wire [31:0] sprite_1_colors,
	
	//Background inputs
	//Color is decoded in load section fsm
	input wire [7:0] background_pattern_low,
	input wire [7:0] background_pattern_high,
	input wire [31:0] background_colors,
	
	//Needed to determine when to draw background
	input wire [7:0] ppu_ctrl2,
	
	//Control signals for this fsm
	input wire start,
	output reg busy
);

//Inputs to pixel mux
wire [63:0] pixel_out;
pixel_mux pixel_mux_inst
(
	sprite_0_pattern_low,
	sprite_0_pattern_high,
	sprite_0_attr,
	sprite_0_colors,
	
	sprite_1_pattern_low,
	sprite_1_pattern_high,
	sprite_1_attr,
	sprite_1_colors,
	
	ppu_ctrl2,
	
	background_pattern_low,
	background_pattern_high,
	background_colors,
	
	pixel_out //The 8 pixels we need to draw
);

wire draw_sprite = ppu_ctrl2[4];
wire draw_background = ppu_ctrl2[3];

//Counter for determining when we're done drawing
wire [2:0] pattern_index = (vga_addr_row - vga_start_row);

localparam [1:0] state_idle = 2'b00, state_draw = 2'b01;

//This module does the following:
//Draws an alligned tile starting at a given row, col address on the screen

always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin
	
		busy <= 1'b0;
		vga_addr_row <= 8'b0;
		vga_addr_col <= 8'b0;
		vga_data <= 8'b0;
		vga_write_en <= 1'b0;
	
	end
	
	else begin
	
		//Idle state
		if(busy == 1'b0) begin
		
			vga_write_en <= 1'b0;
		
			//If we need to start drawing these 8 pixels
			if(start == 1'b1) begin
			
				//Set the busy line to go to the next state
				busy <= 1'b1;
				
				//Set up the address 
				vga_addr_row <= vga_start_row;
				vga_addr_col <= vga_start_col;
			
			
			end
	
		end
		
		//Draw state
		else begin
		
			//Always writing in this state
			vga_write_en <= 1'b1;
		
			//move the next pixel onto the data line
			vga_data <= pixel_out[((vga_addr_col - vga_start_col ) << 3)+:8];
		
			//If we're at the end of the 8 pixels
			if(pattern_index == 3'b111) begin
				
				//Go back go the idle state
				busy <= 1'b0;
			
			end
			//if we need to keep going
			else begin
			
				vga_addr_col <= vga_addr_col + 1;
			
			end
		
		end
	
	
	end

end

endmodule