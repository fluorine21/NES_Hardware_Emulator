

//Takes a pixel address relative to screen and scroll ptr and turns it into a nametable address and pattern table offset
module pixel_to_nametable_ptr
(

	//Relative to the nametables, not the screen
	input wire [8:0] screen_pixel_row,
	input wire [8:0] screen_pixel_col,
	
	//Used to determine the pixel position relative to the nametables
	input wire [15:0] cpu_scroll_addr,
	input wire [7:0] ppu_ctrl1,
	
	output reg [15:0] nametable_ptr,//Where to look in the nametable for the tile
	output wire [2:0] pattern_table_offset//How many bytes in the pattern table to skip

);


//These are relative to the nametables
//Need the 9 bits to count past 512 to do the wrap around
wire [9:0] pixel_row = {1'b0, screen_pixel_row} + {2'b0, cpu_scroll_addr[15:8]} + (ppu_ctrl1[1] ? 240 : 0);
wire [9:0] pixel_col = {1'b0, screen_pixel_col} + {1'b0, ppu_ctrl1[2], cpu_scroll_addr[7:0]};

assign pattern_table_offset = pixel_row[2:0];


always @ * begin

	//If we're in the upper region of the screen
	if(pixel_row < 240 || pixel_row > 479) begin
	
		if(pixel_col < 256 || pixel_col > 512) begin
		
			//We're in nametable 0
			//Once you go up one row, go over 32 cols
			//((row/8)*32) + (col/8)
			nametable_ptr <= 16'h2000 + nametable_offset(pixel_row, pixel_col);
		
		end
		else begin
		
			//We're in nametable 1
			nametable_ptr <= 16'h2400 + nametable_offset(pixel_row, pixel_col);
		
		end
	
	end
	else begin
	
		if(pixel_col < 256 || pixel_col > 512) begin
		
			//We're in nametable 2
			nametable_ptr <= 16'h2800 + nametable_offset(pixel_row, pixel_col);
		
		end
		else begin
		
			//We're in nametable 3
			nametable_ptr <= 16'h2C00 + nametable_offset(pixel_row, pixel_col);
		end
	
	end


end

function [15:0] nametable_offset;
input [9:0] p_row, p_col;
begin

//Once you go up one row, go over 32 cols
//((row/8)*32) + (col/8)
	nametable_offset = {6'b0, p_row[7:3], 5'b0} + {11'b0, p_col[7:3]};

end
endfunction

endmodule