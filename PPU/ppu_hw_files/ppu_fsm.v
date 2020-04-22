



//PPU state machine will look as follows

//Latch for row_offset
reg [8:0] row_offset_reg;
reg [8:0] col_offset_reg;

//This needs to be set by combinational logic
//tile pixel row col go in and a vram address comes out
//Pixel row col
wire [15:0] nametable_ptr;

//Starting position of pixel in nametable 2x2
wire [8:0] row_offset = {ppu_ctrl1[1], ppu_scroll[15:8]};
wire [8:0] col_offset = {ppu_ctrl1[0], ppu_scroll[7:0]}; 

//These tell us which pixel we're currently drawing relative to the nametables
//These must start counting at 0
reg [8:0] tile_pixel_row_cnt;
reg [8:0] tile_pixel_col_cnt;

wire [8:0] tile_pixel_row = row_offset + tile_pixel_row_cnt;


//These tell us which pixel we're currently drawing relative to the screen
//These will start counting at -1 * row_offset[2:0]
reg [8:0] screen_pixel_row;
reg [8:0] screen_pixel_col;


//On start:

//Determine the nearest tile at which to begin render
//This can be done by setting the last 3 bits of row and col offset to 0 and taking the remaining 5 to be namespace row and col
//Namespace will be addressed using 2x2 grid defined in doccumentation
//Use the last 3 bits to determine the effective pixel offset

//Then a nexted for loop will start, looping cols first then row

//At the start of the row, loop through the sprite attribute table and see which sprites are on this line


//Keeps track of which sprite we're currently looking at in the scanline


case(state):



	state_idle: begin
	
		if(reset_vsync == 1'b1) begin
			
			cpu_vsync <= 1'b0;
		
		end
	
	
		//If we're going to start drawing the screen:
		if(start == 1'b1) begin
		
			cpu_vsync <= 1'b0;
			
			
			//Set the absolute counter
			screen_pixel_row = 0;
		
			state <= state_load_spram_1;
		
		end
		
	end
	
	//Start of the line draw routine
	state_set_counters: begin
	
		//Just need to set the screen_pixel_col counter based on the offset
		screen_pixel_col <= 0 - row_offset_reg[2:0];
		
		//Start loading data
	
	end
	
	state_increment_counters: begin
	
		//If we're done with the frame
		if(screen_pixel_row >= 239) begin
		
			//TODO
		
		end
		//if we're done with the row
		else if(screen_pixel_col >= 255) begin
		
			//Load the scroll latch again
			row_offset_reg <= row_offset;
			col_offset_reg <= col_offset;
			
			//Increment the row counter
			screen_pixel_row <= screen_pixel_row + 1;
			
			//Go to the set col counter state
			
		end
		//Just need to count up correctly
		else begin
			
			//Going to next tile
			screen_pixel_col = screen_pixel_col + 8;
		
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
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	