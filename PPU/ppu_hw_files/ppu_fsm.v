



//PPU state machine will look as follows

//This needs to be set by combinational logic
//tile pixel row col go in and a vram address comes out
//Pixel row col
wire [15:0] nametable_ptr;

wire [8:0] row_offset = {ppu_ctrl1[1], ppu_scroll[15:8]};
wire [8:0] col_offset = {ppu_ctrl1[0], ppu_scroll[7:0]}; 

//These tell us which pixel we're currently drawing relative to the nametables
reg [8:0] tile_pixel_row;
reg [8:0] tile_pixel_col;


//These tell us which pixel we're currently drawing relative to the screen
reg [8:0] screen_pixel_row;
reg [8:0] screen_pixel_col;

//These tell us our start pixel position and end pixel position
//Need to be defined combinationally
wire [8:0] screen_pixel_row_start, screen_pixel_col_end;

//On start:

//Determine the nearest tile at which to begin render
//This can be done by setting the last 3 bits of row and col offset to 0 and taking the remaining 5 to be namespace row and col
//Namespace will be addressed using 2x2 grid defined in doccumentation
//Use the last 3 bits to determine the effective pixel offset

//Then a nexted for loop will start, looping cols first then row

//At the start of the row, loop through the sprite attribute table and see which sprites are on this line

//keeps track of how many sprites are on this scan line
reg sprite_cnt;
//Keeps track of which sprite we're currently looking at in the scanline
reg sprite_hit_cnt;

case(state):



	state_idle: begin
	
	
		//If we're going to start drawing the screen:
		if(start == 1'b1) begin
		
			
			//These are relative to the screen
			screen_pixel_row = 0 - row_offset[2:0];
			screen_pixel_col = 0 - col_offset[2:0];
		
			//Set the starting tile row and col number
			tile_pixel_row = row_offset;
			tile_pixel_col = col_offset;
		
			state <= state_load_spram_1;
		
		end
		
	end
	
	
	state_load_spram_1: begin
	
		//Start an SPRAM load at spram_cpu_addr to see if this sprite is on this line
		spram_addr <= spram_cpu_addr;
	
		state <= state_load_spram_2;
	
	end
	
	
	state_load_spram_2: begin
	
		//Wait one cycle for SPRAM to finish loading
		
		if(spram_addr[2:0] == 3b0) begin
			state <= state_load_spram_3;
		end
		else begin
			state <= state_load_spram_4;
		end
	
	end
	
	state_load_spram_3: begin
	
		//If we are out of sprites to load
		if(sprite_cnt == 8) begin
			
			//Set the overflow flag
			sprite_overflow <= 1'b1;
			//move on to drawing the first row
			state <= state_draw_col_1;
		
		end
	
		//The result of SPRAM holds the Y coordinate of the sprite
		
		//If this Y coordinate falls in the range of the scan line
		else if(spram_data_in =< pixel_row && spram_data_in + (sprite_16 ? 16 : 8) > pixel_row) begin

			//Load and store locally the next 3 bytes
			sprite_y_arr[sprite_cnt] = spram_data_in;
			
			//Increment the address for the next byte
			spram_addr <= spram_addr + 1;
			
			//Go to the wait cycle
			state <= state_load_spram_2;

		end
		else begin
			
			//If we're about to be out of sprites to check
			if(spram_addr + 4 == 0) begin
			
				//Start drawing columns
				state <= state_draw_col_1;
			
			end
			
			else begin
				//Check the next sprite 
				spram_addr = spram_addr + 4;
				state <= state_load_spram_2;
			end
		
		end
	
	end
	
	state_load_spram_4: begin
	
		//Figure out where to store this byte
		case(spram_addr[1:0]) begin
		
			0: sprite_row[sprite_cnt] <= spram_data_in;
			1: sprite_tile[sprite_cnt] <= spram_data_in;
			2: sprite_attr[sprite_cnt <= spram_data_in;
			3: sprite_col[sprite_cnt] <= spram_data_in;
		
		endcase
		
		//If we're done with this sprite
		if(spram_addr[1:0] == 3) begin
			sprite_cnt = sprite_cnt + 1;
		end
	
		//Increment the sprite address
		spram_addr <= spram_addr + 1;
		
		
		//if we're out of sprites to check
		if(spram_addr == 255) begin
			//Start rendering the columns
			state <= state_draw_col_1;
		end
		
		
		else begin
			//Go back to the wait state
			state <= state_load_spram_2;
		end
	
	
	end
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	