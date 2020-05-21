


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
	output reg [63:0] pixel_out,
	
	
	output reg sprite_0_hit,
	output reg sprite_1_hit

);


function get_sprite_hit;
input [7:0] sprite_pattern_low;
input [7:0] sprite_pattern_high;
reg [7:0] b_p, s_p;
begin

	b_p = background_pattern_low | background_pattern_high;
	s_p = sprite_pattern_low | sprite_pattern_high;
	//If we and these two together and the result is greater than 1, then a sprite pixel was on top of a background pixel
	//get_sprite_hit = (b_p & s_p) != 0;
	get_sprite_hit = s_p != 0;

end
endfunction

integer i;

always @ * begin

	sprite_0_hit = get_sprite_hit(sprite_0_pattern_low, sprite_0_pattern_high);
	sprite_1_hit = get_sprite_hit(sprite_1_pattern_low, sprite_1_pattern_high);

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
			pixel_out[(i<<3)+:8] <= sprite_0_colors[({6'b0, sprite_0_pattern_high[i], sprite_0_pattern_low[i]} << 3)+:8];
	
	
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
			pixel_out[(i<<3)+:8] <= sprite_1_colors[({6'b0, sprite_1_pattern_high[i], sprite_1_pattern_low[i]} << 3)+:8];
		
		end
		else if
		(
			//Background draw is enabled
			ppu_ctrl2[3] //&& 
			
			//Always default to background
			
			//Theres background here to draw
			//{background_pattern_high[i], background_pattern_low[i]} != 0
		
		) begin
		
			//Then we're drawing the background's color
			pixel_out[(i<<3)+:8] <= background_colors[({6'b0, background_pattern_high[i], background_pattern_low[i]} << 3)+:8];
		
		end
		else begin//Default to avoid latches
			pixel_out[(i<<3)+:8] <= 0;
		end
	
	end

end



endmodule