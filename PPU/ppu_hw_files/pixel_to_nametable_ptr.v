


module pixel_to_nametable_ptr
(

	input wire [8:0] pixel_row,
	input wire [8:0] pixel_col,
	
	output reg [15:0] nametable_ptr

);


always @ * begin

	//If we're in the upper region of the screen
	if(pixel_row < 240) begin
	
		if(pixel_col < 256) begin
		
			//We're in nametable 0
			nametable_ptr <= 16'h2000 + (pixel_row << 5) + pixel_col[7:3];
		
		end
		else begin
		
			//We're in nametable 1
			nametable_ptr <= 16'h2400 + (pixel_row[7:0] << 5) + pixel_col[7:3];
		
		end
	
	end
	else begin
	
		if(pixel_col < 256) begin
		
			//We're in nametable 2
			nametable_ptr <= 16'h2800 + (pixel_row[7:0] << 5) + pixel_col[7:3];
		
		end
		else begin
		
			//We're in nametable 3
			nametable_ptr <= 16'h2C00 + (pixel_row[7:0] << 5) + pixel_col[7:3];
		end
	
	end


end


endmodule