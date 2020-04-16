//Translates a nametable address into the corresponding attribute table address and bit offset



module name_to_att
(
	input wire [15:0] nametable_base_addr,
	input wire [15:0] nametable_addr,
	
	output wire [15:0] attr_byte_addr,
	output wire [2:0] attr_byte_offset

);


wire [15:0] nametable_offset = nametable_addr - nametable_base_addr;

//Divide by 32 to get nametable row
wire [7:0] nametable_row = (nametable_offset >> 32);
//Just take the last 5 bits to get the col
wire [7:0] nametable_col = nametable_offset[4:0];

//To get the attributr row we need to access, divide nametable_row by 4
wire [7:0] attr_row = (nametable_row >> 2);
//To get the attribute tabe column, divide nametable_col by 4
wire [7:0] attr_col = (nametable_col >> 2);

//Now calculate the full attribute table address
assign attr_byte_addr = nametable_base_addr + 16'h03C0 + (attr_row << 3) + attr_col;

//Finally get the byte offset, rows and cols for nametable
//even row and col = d1d0
//even row odd col = d3d2
//odd row even col = d5d4
//odd row odd col = d7d7

always @ * begin

	//Even row
	if(nametable_row[0] == 1'b0) begin
	
		//Even row even col
		if(nametable_col == 1'b0) begin
			
			attr_byte_offset = 0;
		
		end
		//Even row odd col
		else begin
			
			attr_byte_offset = 2;
		
		end
	
	end
	
	//Odd row
	else begin
	
		//Odd row even col
		if(nametable_col == 1'b0) begin
		
			attr_byte_offset = 4;
		
		end
		//Odd row odd col
		else begin
		
			attr_byte_offset = 6;
		
		end
	
	end
end



end