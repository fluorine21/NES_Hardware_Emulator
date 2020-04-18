

//Selects a color set based on the attribute table


module color_selector
(
	input wire [127:0] background_colors,
	input wire [127:0] sprite_colors,
	
	input wire [1:0] sprite_upper,
	input wire [1:0] background_upper,
	
	output reg [7:0] background_color_1,
	output reg [7:0] background_color_2,
	output reg [7:0] background_color_3,
	
	output reg [7:0] sprite_color_1,
	output reg [7:0] sprite_color_2,
	output reg [7:0] sprite_color_3
	
);

//lower bit pos = sprite_upper * 32 + 8 to select first color
assign sprite_color_1 = sprite_colors[8+(sprite_upper << 5) + 8:8+(sprite_upper << 5)]
assign sprite_color_2 = sprite_colors[16+(sprite_upper << 5) + 16:8+(sprite_upper << 5)]
assign sprite_color_3 = sprite_colors[24+(sprite_upper << 5) + 24:8+(sprite_upper << 5)]

assign background_color_1 = background_colors[8+(background_upper << 5) + 8:8+(background_upper << 5)]
assign background_color_2 = background_colors[16+(background_upper << 5) + 16:8+(background_upper << 5)]
assign background_color_3 = background_colors[24+(background_upper << 5) + 24:8+(background_upper << 5)]

endmodule