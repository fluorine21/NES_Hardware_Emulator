


module ppu_sprite_load_fsm
(
	input wire clk,
	input wire rst,
	
	output wire [7:0] spram_addr,
	input wire [7:0] spram_data_in,
	
	input wire [8:0] curr_row,
	input wire [8:0] curr_col,
	
	//All outputs are registered to break a timing path
	output reg sprite_0_on_tile,//If there is a sprite on this tile
	output reg [7:0] sprite_0_tile_num,//Known from cached sprite attributes
	output reg [7:0] sprite_0_row, //y
	output reg [7:0] sprite_0_col, //x
	output reg [7:0] sprite_0_attr,
	
	//Everything we need to know to draw sprite 1
	output reg sprite_1_on_tile,//If this sprite is also on this tile
	output reg [7:0] sprite_1_tile_num,//Known from cached sprite attributes
	output reg [7:0] sprite_1_row, //y
	output reg [7:0] sprite_1_col, //x
	output reg [7:0] sprite_1_attr,
	
	output reg sprite_overflow,//set if sprite_cnt > 8
	input wire start,
	output wire busy,
	input wire [7:0] cpu_sprite_addr, //Sprite mem address
	
	//Used to check sprite 0 colission
	//If 1, this sprite is sprite 0
	output reg sprite_0_is_0,
	output reg sprite_1_is_0
);


//Variables
reg [7:0] sprite_0_num;
reg [7:0] sprite_1_num;


///////////////////
//Functions///////
//////////////////

//Selects the correct sprite value (attr, x, y, tile) from array based on which sprite is 
function [7:0] get_sprite_val;
input [63:0] sprite_vals;
input [7:0] num;
integer i;
begin

get_sprite_val = sprite_vals[(num << 3)+:8];

end
endfunction

//Gets the number of sprite 0 out of the 8 sprites loaded
function [7:0] get_sprite_0_num;
input [63:0] sprite_rows_in;
input [63:0] sprite_cols_in;
integer i;
begin

//Default value indicating no sprite is here
get_sprite_0_num = 8'hFF;

for(i = 0; i < 64; i = i + 8) begin
	
	//If it's this sprite and this sprite isn't invalid
	if(check_sprite_col_0(sprite_cols_in[i+:8]) && sprite_rows_in[i+:8] != 8'hFF) begin
		get_sprite_0_num = (i >> 3);
		break;
	end

end


end
endfunction



//Gets the number of sprite 1 out of the 8 sprites loaded
function [7:0] get_sprite_1_num;
input [63:0] sprite_rows_in;
input [63:0] sprite_cols_in;
integer i;
begin

//Default value indicating no sprite is here
get_sprite_1_num = 8'hFF;

for(i = 0; i < 64; i = i + 8) begin
	
	//If it's this sprite
	if(check_sprite_col_1(sprite_cols_in[i+:8], (i>>3)) && sprite_rows_in[i+:8] != 8'hFF) begin
		get_sprite_1_num = (i >> 3);
		break;
	end

end


end
endfunction



//Checks to see if we need to draw sprite 0
function check_sprite_col_0;
input [7:0] sprite_col_in;
reg [8:0] neg_curr_col;
begin
	neg_curr_col = (~curr_col) + 1;

	//If the column is negative
	if(curr_col[8]) begin
	
		if(neg_curr_col + sprite_col_in < 8) begin
			check_sprite_col_0 = 1;
		end
		else begin
			check_sprite_col_0 = 0;
		end
	
	end
	else begin
	
		if( 
		  (sprite_col_in >= curr_col && sprite_col_in < curr_col + 8) ||
		  (curr_col >= sprite_col_in && curr_col < sprite_col_in + 8)
		)begin
		  
		    check_sprite_col_0 = 1;
		end
		else begin
			check_sprite_col_0 = 0;
		end
	
	end

end
endfunction

//Checks to see if we need to draw sprite 1
function check_sprite_col_1;
input [7:0] sprite_col_in;
input [7:0] sprite_num;//Number of potential sprite #1
reg [8:0] neg_curr_col;
begin
	neg_curr_col = (~curr_col) + 1;

	//If the column is negative
	if(curr_col[8]) begin
	
		if(neg_curr_col + sprite_col_in < 8 && sprite_num != sprite_0_num) begin
			check_sprite_col_1 = 1;
		end
		else begin
			check_sprite_col_1 = 0;
		end
	
	end
	else begin
	
		if( 
		  ((sprite_col_in >= curr_col && sprite_col_in < curr_col + 8) ||
		  (curr_col >= sprite_col_in && curr_col < sprite_col_in + 8)) && 
		  (sprite_num != sprite_0_num)//And this isn't the same as sprite 0
		)begin
		  
		    check_sprite_col_1 = 1;
		end
		else begin
			check_sprite_col_1 = 0;
		end
	
	end

end
endfunction


///////////////////////////////////////////////

reg [8:0] spram_addr_out;
assign spram_addr = spram_addr_out[7:0];

//keeps track of how many sprites are on this scan line
reg [7:0] sprite_hit_cnt;

//Sprite arrays
reg [63:0] sprite_tile_nums;
reg [63:0] sprite_rows;
reg [63:0] sprite_cols;
reg [63:0] sprite_attrs;
reg [7:0] is_sprite_0;


localparam [7:0] state_idle = 0, state_wait = 1, state_check = 2, state_load_sprite = 3;

reg [7:0] state;

assign busy = state != state_idle;

task reset_state();
begin

	state <= state_idle;
	spram_addr_out <= 0;
	sprite_attrs <= 0;
	sprite_rows <= 64'hFFFFFFFFFFFFFFFF;//So we know they aren't loaded
	sprite_cols <= 0;
	sprite_tile_nums <= 0;
	sprite_hit_cnt <= 0;
	sprite_overflow <= 0;
	is_sprite_0 <= 0;
	
end
endtask

task reset_sprites();
begin

	sprite_attrs <= 0;
	sprite_rows <= 64'hFFFFFFFFFFFFFFFF;//So we know they aren't loaded
	sprite_cols <= 0;
	sprite_tile_nums <= 0;
	sprite_hit_cnt <= 0;
	sprite_overflow <= 0;
	is_sprite_0 <= 0;

end
endtask

//always for fsm
always @ (posedge clk or negedge rst) begin
	
	if(rst == 1'b0) begin
		
		reset_state();
	
	end
	else begin
	
		case(state)
		
			state_idle: begin
				
				if(start == 1) begin
				
					//Put the address of the first sprite on the line
					spram_addr_out <= {1'b0, cpu_sprite_addr};
					
					//Reset all of the sprites we previously loaded
					reset_sprites();
					
					//Go to the wait one cycle state
					state <= state_wait;
					
				end
			
			
			end
			
			state_wait: begin
			
				//Push the next address onto the addr line
				//In case we end up needing to load the next byte
				spram_addr_out  <= spram_addr_out  + 1;
				
				//Go to the checkk state
				state <= state_check;
			
			end
			
			state_check: begin
			
				//If we're done with memory
				if(spram_addr_out[8]) begin
					//Go back to the idle state
					state <= state_idle;
				end
			
				//If we're looking at a sprite on this line
				//If the row is in the range of the sprite
				else if(curr_row >= spram_data_in && curr_row < spram_data_in + 8) begin
			
					//If we have an overflow
					if(sprite_hit_cnt >= 8) begin
						//Set the overflow flag
						sprite_overflow <= 1'b1;
						//Go to the idle state
						state <= state_idle;
					end
					
					else begin
						//Save the row and go to the sprite load routine
						sprite_rows[(sprite_hit_cnt << 3)+:8] = spram_data_in;
						spram_addr_out  <= spram_addr_out  + 1;
						state <= state_load_sprite;
						
						//If this sprite is sprite 0
						if(spram_addr_out - cpu_sprite_addr == 1) begin
						
							is_sprite_0[sprite_hit_cnt] <= 1;
						
						end
						
					end
				end
				else begin
					
					//Set the values of this sprite row to FF
					sprite_rows[(sprite_hit_cnt << 3)+:8] = 8'hFF;
				
					//Try loading the next sprite
					spram_addr_out <= spram_addr_out + 3;
					state <= state_wait;
				
				end
			
			end
			
			state_load_sprite: begin
			
				//Increment the address so we start loading the potential byte
				spram_addr_out <= spram_addr_out + 1;
			
				//Check the last two bits of the address to figure out where we're storing this byte
				case(spram_addr_out[1:0]) 
				
					2: sprite_tile_nums[(sprite_hit_cnt << 3)+:8] <= spram_data_in;
					3: sprite_attrs[(sprite_hit_cnt << 3)+:8] <= spram_data_in;
					0: sprite_cols[(sprite_hit_cnt << 3)+:8] <= spram_data_in;
					default: begin end
				
				endcase
				
				//If we're already on the next address:
				if(spram_addr_out[1:0] == 0) begin
				
					//Increment the hit count
					sprite_hit_cnt <= sprite_hit_cnt + 1;
				
					//Then go back to the check state, data should be there next cycle
					state <= state_check;
				
				end
				
			end
			
			default: reset_state();
		
		endcase
	
	
	end


end



//Always for setting outputs
always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin
	
		//Reset outputs
		reset_outputs();
	
	end
	else begin
	
		//Set the outputs
		set_outputs();
	
	end



end

task set_outputs();
begin

	sprite_0_num = get_sprite_0_num(sprite_rows, sprite_cols);
	sprite_1_num = get_sprite_1_num(sprite_rows, sprite_cols);

	//If we need to draw sprite 0 (if it's number is valid
	if(sprite_0_num != 8'hFF) begin
	
		sprite_0_on_tile = 1;
		sprite_0_tile_num = get_sprite_val(sprite_tile_nums, sprite_0_num);
		sprite_0_row = get_sprite_val(sprite_rows, sprite_0_num);
		sprite_0_col = get_sprite_val(sprite_cols, sprite_0_num);
		sprite_0_attr = get_sprite_val(sprite_attrs, sprite_0_num);
		sprite_0_is_0 = is_sprite_0[sprite_0_num];
	end
	else begin
		
		sprite_0_on_tile = 0;
		sprite_0_tile_num = 0;
		sprite_0_row = 0;
		sprite_0_col = 0;
		sprite_0_attr = 0;
		sprite_0_is_0 = 0;
	end
	
	//If we need to draw sprite 1
	if(sprite_1_num != 8'hFF) begin
	
		sprite_1_on_tile = 1;
		sprite_1_tile_num = get_sprite_val(sprite_tile_nums, sprite_1_num);
		sprite_1_row = get_sprite_val(sprite_rows, sprite_1_num);
		sprite_1_col = get_sprite_val(sprite_cols, sprite_1_num);
		sprite_1_attr = get_sprite_val(sprite_attrs, sprite_1_num);
		sprite_1_is_0 = is_sprite_0[sprite_1_num];
	
	end
	else begin
	
		sprite_1_on_tile = 0;
		sprite_1_tile_num = 0;
		sprite_1_row = 0;
		sprite_1_col = 0;
		sprite_1_attr = 0;
		sprite_1_is_0 = 0;
	
	end

end
endtask

task reset_outputs();
begin

	sprite_0_on_tile <= 0;
	sprite_0_tile_num <= 0;
	sprite_0_row <= 0;
	sprite_0_col <= 0;
	sprite_0_attr <= 0;

	sprite_1_on_tile <= 0;
	sprite_1_tile_num <= 0;
	sprite_1_row <= 0;
	sprite_1_col <= 0;
	sprite_1_attr <= 0;
	
	sprite_0_num <= 0;
	sprite_1_num <= 0;

end
endtask








endmodule