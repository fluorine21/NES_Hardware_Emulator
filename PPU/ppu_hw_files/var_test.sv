

package vram_listing;



//Memory listing for vram
integer vram_listing[106] = 
{
	//memory address, value (upper bits are 0
	
	//This is the sprite pattern found at tile 0 of pattern table 0
	//This would make the sprite 0 a solid square of color 3
	16'h0000, 16'h00FF,
	16'h0001, 16'h0000,
	16'h0002, 16'h00FF,
	16'h0003, 16'h00FF,
	16'h0004, 16'h00FF,
	16'h0005, 16'h00FF,
	16'h0006, 16'h00FF,
	16'h0007, 16'h00FF,
	16'h0008, 16'h00FF,
	16'h0009, 16'h00FF,
	16'h000A, 16'h00FF,
	16'h000B, 16'h00FF,
	16'h000C, 16'h00FF,
	16'h000D, 16'h00FF,
	16'h000E, 16'h00FF,
	16'h000F, 16'h00FF,
	
	//This is the sprite pattern found at tile 1 of pattern table 0
	//This would make the sprite 1 a solid square of color 3
	16'h0010, 16'h00FF,
	16'h0011, 16'h0000,
	16'h0012, 16'h00FF,
	16'h0013, 16'h00FF,
	16'h0014, 16'h00FF,
	16'h0015, 16'h00FF,
	16'h0016, 16'h00FF,
	16'h0017, 16'h00FF,
	16'h0018, 16'h00FF,
	16'h0019, 16'h00FF,
	16'h001A, 16'h00FF,
	16'h001B, 16'h00FF,
	16'h001C, 16'h00FF,
	16'h001D, 16'h00FF,
	16'h001E, 16'h00FF,
	16'h001F, 16'h00FF,
	
	
	//This is the background pattern found at tile 1 of pattern table 1
	//This would make the background a solid square of color 3
	16'h1010, 16'h00FF,
	16'h1011, 16'h0000,//Need to select a different color for this row
	16'h1012, 16'h00FF,
	16'h1013, 16'h00FF,
	16'h1014, 16'h00FF,
	16'h1015, 16'h00FF,
	16'h1016, 16'h00FF,
	16'h1017, 16'h00FF,
	16'h1018, 16'h00FF,
	16'h1019, 16'h00FF,
	16'h101A, 16'h00FF,
	16'h101B, 16'h00FF,
	16'h101C, 16'h00FF,
	16'h101D, 16'h00FF,
	16'h101E, 16'h00FF,
	16'h101F, 16'h00FF,
	
	//This is the nametable entry at 2000 for the background
	//It will point to tile 1 of pattern table 1
	16'h2000, 16'h0001,
	16'h2001, 16'h0001,
	16'h2400, 16'h0001,
	
	//This is the attribute table entry for nametable 0 tile ptr 0
	//The fsm should select the second set of two bits
	16'h23C0, 16'b0000000000001101,
	16'h27C0, 16'h0//This is for nametable 1
};

integer spram_listing[64] = 
{
	//Sprite 0
	8'h00, 8'h00, //row 0
	8'h01, 8'h00, // Tile 1F
	8'h02, 8'h1F, // Attribute bytes
	8'h03, 8'h00, //Col 0
	
	//Sprite 1
	8'h04, 8'h00, //row 0
	8'h05, 8'h01, // Tile 1F
	8'h06, 8'h1F, // Attribute bytes
	8'h07, 8'h08, //Col 8
	
	//Sprite 2
	8'h08, 8'h00, //row 0
	8'h09, 8'h02, // Tile 1F
	8'h0A, 8'h1F, // Attribute bytes
	8'h0B, 8'h10, //Col 16
	
	//Sprite 3
	8'h0C, 8'h00, //row 0
	8'h0D, 8'h03, // Tile 1F
	8'h0E, 8'h1F, // Attribute bytes
	8'h0F, 8'h18, //Col 24
	
	//Sprite 4
	8'h10, 8'h00, //row 0
	8'h11, 8'h04, // Tile 1F
	8'h12, 8'h1F, // Attribute bytes
	8'h13, 8'h20, //Col 32
	
	//Sprite 5
	8'h14, 8'h00, //row 0
	8'h15, 8'h05, // Tile 1F
	8'h16, 8'h1F, // Attribute bytes
	8'h17, 8'h28, //Col 40
	
	//Sprite 6
	8'h18, 8'h00, //row 0
	8'h19, 8'h06, // Tile 1F
	8'h1A, 8'h1F, // Attribute bytes
	8'h1B, 8'h30, //Col 48
	
	//Sprite 7
	8'h1C, 8'h00, //row 0
	8'h1D, 8'h07, // Tile 1F
	8'h1E, 8'h1F, // Attribute bytes
	8'h1F, 8'h38 //Col 56
};





endpackage