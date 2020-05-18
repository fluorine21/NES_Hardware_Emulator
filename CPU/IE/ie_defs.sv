

package ie_defs;

//Flags for determining where to load/store things from
localparam [7:0] 
zero = 0,//source
a_reg = 1,//source/dest
x_reg = 2,//source/dest
y_reg = 3,//source/dest
mem_load = 4,//source
mem_store = 5,//dest
imm = 6,//source
one = 7,//Source
status_reg = 8,
stack_reg = 9;

//Branch instructions		   
localparam [7:0] 
BCC = 8'h04,//Branch on carry clear
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

//Program listing starts automatically at 0x0200
//Simple look through memory and add values program
integer program_listing_1[] =
{
	8'hA2, 8'h00, 
	8'h8A, 
	8'h18, 
	8'h75, 8'h00, 
	8'hE8, 
	8'h75, 8'h00, 
	8'hE8, 
	8'h75, 8'h00, 
	8'hE8, 
	8'h75, 8'h00, 
	8'hE8,
	8'h75, 8'h00, 
	8'hE8, 
	8'h95, 8'h00
};

integer program_listing_1_mem[] =
{
	16'h0000, 8'h01,
	16'h0001, 8'h02,
	16'h0002, 8'h03,
	16'h0003, 8'h04,
	16'h0004, 8'h05,
	16'h0005, 8'h00 //should see 15 (0x0F) here
	
};

//add with branch
integer program_listing_2[] = 
{

	8'hA2, 00, 
	8'h8A, 
	8'h18, 
	8'h7D, 8'h00, 8'h00, 
	8'hE8,
	8'hE0, 05, 
	8'h30, 8'hF7, 
	8'h9D, 8'h00, 8'h00
	
};


integer bs_mem [] = 
{

	16'h0000, 8'h09,
	16'h0001, 8'h07,
	16'h0002, 8'h00,
	16'h0003, 8'h02,
	16'h0004, 8'h01,
	16'h0005, 8'h05,
	16'h0006, 8'h03,
	16'h0007, 8'h04,
	16'h0008, 8'h08,
	16'h0009, 8'h06
	
};


typedef integer queue_of_int[$];

function automatic void load_raw_listing(ref integer listing[], string filename);

/* 	fd = $fopen (filename, "r");
	if(fd) $display("Successfully opened %s" filename);
	else $display("Failed to open %s" filename);
	
	while(!$feof(fd)) begin
	
		//Read the line
		
	
	end */
	
	$readmemh(filename, listing);
	



endfunction

endpackage