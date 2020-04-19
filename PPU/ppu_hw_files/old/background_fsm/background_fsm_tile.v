











module render_8_pixels
(
	
	//This module should have inputs for preloaded upper and lower pattern table bytes
	//This module only writes to vga ram
	
	//Sprite priority is determined outside of this module
	//This module assumes that the sprite has priority automatically
	
	input wire clk,
	input wire rst,
	
	//These may not be in bounds, but we don't need to check
	input wire [8;0] vga_start_row,
	input wire [8:0] vga_start_col,
	
	//
	output reg [8:0] vga_addr_row,
	output reg [8:0] vga_addr_col,
	output reg [7:0] vga_data,
	output reg vga_write_en,
	
	
	//These should already be alligned to the background patterns
	input wire [7:0] sprite_pattern_low,
	input wire [7:0] sprite_pattern_high,
	//sprite_color_0 is background
	input wire [7:0] sprite_color_1,
	input wire [7:0] sprite_color_2,
	input wire [7:0] sprite_color_3
	
	
	input wire [7:0] background_pattern_low,
	input wire [7:0] background_pattern_high,
	input wire [7:0] background_color_1,
	input wire [7:0] background_color_2,
	input wire [7:0] background_color_3,
	
	
	output reg busy,
	input wire start
	
	

);

wire [2:0] pattern_index = (vga_addr_row - vga_start_row)[2:0];

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
		if(busy == 1'b0)
		
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
		
			//If we need to draw a sprite pixel here:
			if(sprite_pattern_high[pattern_index] || sprite_pattern_low[pattern_index]) begin
			
				case({sprite_pattern_high[pattern_index], sprite_pattern_low[pattern_index]})
				
					0: vga_data <= 8'b0;
					1: vga_data <= sprite_color_1;
					2: vga_data <= sprite_color_2;
					3: vga_data <= sprite_color_3;
			
				endcase
			
			end
			//If we need to draw a background pixel here
			else begin
			
			
				case({background_pattern_high[pattern_index], background_pattern_low[pattern_index]})
				
					0: vga_data <= 8'b0;
					1: vga_data <= background_color_1;
					2: vga_data <= background_color_2;
					3: vga_data <= background_color_3;
			
				endcase
			
			
			end
		
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