

package ie_defs;

//Flags for determining where to load/store things from
localparam [7:0] zero = 0,//source
a_reg = 1,//source/dest
x_reg = 2,//source/dest
y_reg = 3,//source/dest
mem_load = 4,//source
mem_store = 5,//dest
imm = 6,//source
one = 7,//Source
status_reg = 8;

//Branch instructions		   
localparam [7:0] BCC = 8'h04,//Branch on carry clear
BCS = 8'h05,//Branch on carry set
BEQ = 8'h06,//Branch on zero set
BMI = 8'h07,//Branch on minus set
BNE = 8'h08,//Branch on zero clear
BPL = 8'h09,//Branch on minus clear
BVC = 8'h0A,//Branch on overflow clear
BVS = 8'h0B,//Branch on overflow set
JMP = 8'h1C;//Jump direct or indirect 


//Listing for IF memory
integer mem_listing_1[] = 
{
	16'h0100, 8'hA0,
	16'h0101, 8'h00,
	16'h0102, 8'h84,
	16'h0103, 8'h32,
	16'h0104, 8'hB1,
	16'h0105, 8'h1E,
	16'h0106, 8'hAA,
	16'h0107, 8'hC8,
	16'h0108, 8'hCA,
	16'h0109, 8'hB1,
	16'h010A, 8'h30,
	16'h010B, 8'hC8,
	16'h010C, 8'hD1,
	16'h010D, 8'h30,
	16'h010E, 8'h90,
	16'h010F, 8'h18,
	16'h0110, 8'hF0,
	16'h0111, 8'h16,
	16'h0112, 8'h48,
	16'h0113, 8'hB1,
	16'h0114, 8'h30,
	16'h0115, 8'h88,
	16'h0116, 8'h91,
	16'h0117, 8'h30,
	16'h0118, 8'h68,
	16'h0119, 8'hC8,
	16'h011A, 8'h91,
	16'h011B, 8'h30,
	16'h011C, 8'hA9,
	16'h011D, 8'hFF,
	16'h011E, 8'h85,
	16'h011F, 8'h44,
	16'h0120, 8'hCA,
	16'h0121, 8'hD0,
	16'h0122, 8'hE8,
	16'h0123, 8'h24,
	16'h0124, 8'h32,
	16'h0125, 8'h30,
	16'h0126, 8'hDB,
	16'h0127, 8'h60,
	
	//Constants in memory
	16'h001E, 8'hAA,
	16'h001F, 8'hBB

};


endpackage