



module sprite_priority_decode
(

	//PPU CTRL2 to determine if sprites need to be drawn
	input wire [7:0] ppu_ctrl_2;

	//Current pixel about to be drawn
	input wire [8:0] screen_curr_row,
	input wire [8:0] screen_curr_col,
	
	//Sprite 0
	input wire [7:0] sprite_0_row,
	input wire [7:0] sprite_0_col,
	input wire [7:0] sprite_0_table_num,
	input wire [7:0] sprite_0_attr,
	
	//Sprite 1
	input wire [7:0] sprite_1_row,
	input wire [7:0] sprite_1_col,
	input wire [7:0] sprite_1_table_num,
	input wire [7:0] sprite_1_attr,
	
	//Sprite 2
	input wire [7:0] sprite_2_row,
	input wire [7:0] sprite_2_col,
	input wire [7:0] sprite_2_table_num,
	input wire [7:0] sprite_2_attr,
	
	//Sprite 3
	input wire [7:0] sprite_3_row,
	input wire [7:0] sprite_3_col,
	input wire [7:0] sprite_3_table_num,
	input wire [7:0] sprite_3_attr,
	
	//Sprite 4
	input wire [7:0] sprite_4_row,
	input wire [7:0] sprite_4_col,
	input wire [7:0] sprite_4_table_num,
	input wire [7:0] sprite_4_attr,
	
	//Sprite 5
	input wire [7:0] sprite_5_row,
	input wire [7:0] sprite_5_col,
	input wire [7:0] sprite_5_table_num,
	input wire [7:0] sprite_5_attr,
	
	//Sprite 6
	input wire [7:0] sprite_6_row,
	input wire [7:0] sprite_6_col,
	input wire [7:0] sprite_6_table_num,
	input wire [7:0] sprite_6_attr,
	
	//Sprite 7
	input wire [7:0] sprite_7_row,
	input wire [7:0] sprite_7_col,
	input wire [7:0] sprite_7_table_num,
	input wire [7:0] sprite_7_attr,
	
	//The selected sprite to draw
	output reg draw_sprite, //Set to 1 if this sprite needs to be drawn
	output reg [7:0] row_out,//y
	output reg [7:0] col_out,//x
	output reg [7:0] table_num_out,
	output reg [7:0] attr_out
);


always @ * begin

	//If sprites are disabled
	if(ppu_ctrl_2[4] == 0) begin
		draw_sprite <= 1'b0;
		row_out <= 8'b0;
		col_out <= 8'b0;
		table_num_out <= 8'b0;
		attr_out <= 8'b0;
	end
	else if( (sprite_0_col >= screen_curr_col && sprite_0_col < screen_curr_col + 8) || (curr_col >= sprite_0_col && curr_col < sprite_0_col + 8) ) begin
	
		draw_sprite <= 1'b1;
		row_out <= sprite_0_row;
		col_out <= sprite_0_col;
		table_num_out <= sprite_0_table_num;
		attr_out <= sprite_0_attr;
	
	
	end
	if( (sprite_1_col >= screen_curr_col && sprite_1_col < screen_curr_col + 8) || (curr_col >= sprite_1_col && curr_col < sprite_1_col + 8) ) begin

		draw_sprite <= 1'b1;
		row_out <= sprite_1_row;
		col_out <= sprite_1_col;
		table_num_out <= sprite_1_table_num;
		attr_out <= sprite_1_attr;


	end
	if( (sprite_2_col >= screen_curr_col && sprite_2_col < screen_curr_col + 8) || (curr_col >= sprite_2_col && curr_col < sprite_2_col + 8) ) begin

		draw_sprite <= 1'b1;
		row_out <= sprite_2_row;
		col_out <= sprite_2_col;
		table_num_out <= sprite_2_table_num;
		attr_out <= sprite_2_attr;


	end
	if( (sprite_3_col >= screen_curr_col && sprite_3_col < screen_curr_col + 8) || (curr_col >= sprite_3_col && curr_col < sprite_3_col + 8) ) begin

		draw_sprite <= 1'b1;
		row_out <= sprite_3_row;
		col_out <= sprite_3_col;
		table_num_out <= sprite_3_table_num;
		attr_out <= sprite_3_attr;


	end
	if( (sprite_4_col >= screen_curr_col && sprite_4_col < screen_curr_col + 8) || (curr_col >= sprite_4_col && curr_col < sprite_4_col + 8) ) begin

		draw_sprite <= 1'b1;
		row_out <= sprite_4_row;
		col_out <= sprite_4_col;
		table_num_out <= sprite_4_table_num;
		attr_out <= sprite_4_attr;


	end
	if( (sprite_5_col >= screen_curr_col && sprite_5_col < screen_curr_col + 8) || (curr_col >= sprite_5_col && curr_col < sprite_5_col + 8) ) begin

		draw_sprite <= 1'b1;
		row_out <= sprite_5_row;
		col_out <= sprite_5_col;
		table_num_out <= sprite_5_table_num;
		attr_out <= sprite_5_attr;


	end
	if( (sprite_6_col >= screen_curr_col && sprite_6_col < screen_curr_col + 8) || (curr_col >= sprite_6_col && curr_col < sprite_6_col + 8) ) begin

		draw_sprite <= 1'b1;
		row_out <= sprite_6_row;
		col_out <= sprite_6_col;
		table_num_out <= sprite_6_table_num;
		attr_out <= sprite_6_attr;


	end
	if( (sprite_7_col >= screen_curr_col && sprite_7_col < screen_curr_col + 8) || (curr_col >= sprite_7_col && curr_col < sprite_7_col + 8) ) begin

		draw_sprite <= 1'b1;
		row_out <= sprite_7_row;
		col_out <= sprite_7_col;
		table_num_out <= sprite_7_table_num;
		attr_out <= sprite_7_attr;


	end
	else begin
	
		draw_sprite <= 1'b0;
		row_out <= 8'b0;
		col_out <= 8'b0;
		table_num_out <= 8'b0;
		attr_out <= 8'b0;
	
	end






end


endmodule