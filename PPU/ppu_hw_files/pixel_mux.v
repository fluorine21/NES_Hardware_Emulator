


module pixel_mux
(

	//Sprite 0 information
	input wire [7:0] sprite_0_pattern_low,
	input wire [7:0] sprite_0_pattern_high,
	input wire [7:0] sprite_0_attr,
	input wire [31:0] sprite_0_colors,
	
	//Sprite 1 information
	input wire [7:0] sprite_1_pattern_low,
	input wire [7:0] sprite_1_pattern_high,
	input wire [7:0] sprite_1_attr,
	input wire [31:0] sprite_1_colors,
	
	//background information
	input wire [7:0] ppu_ctrl2, // Figure out if we need to draw background or sprites
	input wire [7:0] background_pattern_low,
	input wire [7:0] background_pattern_high,
	input wire [31:0] background_colors,
	
	
	//Output pixel array to draw
	output reg [63:0] pixel_out

);

integer i;

always @ * begin



	for(i = 0; i < 8; i = i + 1) begin
	
		if(
			//There is a sprite 0 pixel to draw here
			{sprite_0_pattern_high[i], sprite_0_pattern_low[i]} > 0 &&
			//sprites are enabled
			ppu_ctrl2[4] && 
			//This sprite is on top of the background or there is no background
			(sprite_0_attr[5] == 0 || {background_pattern_high[i], background_pattern_low[i]} == 0)
		
		) begin
	
			//Then we're drawing sprite 0's color
			pixel_out[(i<<3)+:8] <= sprite_0_colors[({sprite_0_pattern_high[i], sprite_0_pattern_low[i]} << 3)+:8];
	
	
		end
		
		else if
		(
			//There is a sprite 1 pixel to draw here
			{sprite_1_pattern_high[i], sprite_1_pattern_low[i]} > 0 &&
			//sprites are enabled
			ppu_ctrl2[4] && 
			//This sprite is on top of the background or there is no background
			(sprite_1_attr[5] == 0 || {background_pattern_high[i], background_pattern_low[i]} == 0)
		
		) begin
		
		
			//Then we're drawing sprite 1's color
			pixel_out[(i<<3)+:8] <= sprite_1_colors[({sprite_1_pattern_high[i], sprite_1_pattern_low[i]} << 3)+:8];
		
		end
		else if
		(
			//Background draw is enabled
			ppu_ctrl2[3] && 
			//Theres background here to draw
			{background_pattern_high[i], background_pattern_low[i]} != 0
		
		) begin
		
			//Then we're drawing the background's color
			pixel_out[(i<<3)+:8] <= background_colors[({background_pattern_high[i], background_pattern_low[i]} << 3)+:8];
		
		end
	
	end

end



endmodule