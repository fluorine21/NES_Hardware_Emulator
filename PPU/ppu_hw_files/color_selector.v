

//Selects a color pallet set based on the attribute table
//Should be put inside ppu_vram_load

module color_selector
(
	input wire [127:0] background_colors,
	input wire [127:0] sprite_colors,//Includes colors for both sprites
	
	//Atrribute bytes to select color pallet
	input wire [1:0] background_upper,//From attributr table
	input wire [1:0] sprite_0_upper,//From lower bytes of sprite attribute
	input wire [1:0] sprite_1_upper,
	
	output wire [31:0] background_colors_out,
	output wire [31:0] sprite_0_colors,
	output wire [31:0] sprite_1_colors
	
);

//lower bit pos = sprite_upper * 32 + 8 to select first color

assign background_colors_out = background_colors[(background_upper << 5)+:8];
assign sprite_0_colors = sprite_colors[(sprite_0_upper << 5) +:8];
assign sprite_1_colors = sprite_colors[(sprite_1_upper << 5) +:8];


endmodule