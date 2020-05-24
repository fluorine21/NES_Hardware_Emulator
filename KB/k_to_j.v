


module k_to_j
(
	input wire clk, rst,
	
	input wire keyboard_clk, keyboard_data,
	
	output wire [7:0] joycon_state
);




wire [7:0] scan_code, H0, H1, H2, H3;
wire scan_valid;
ps2 ps2_inst
(
	keyboard_clk,
	keyboard_data,
	clk,
	rst,
	
	scan_code,
	scan_valid,
	H3,H2,H1,H0
);

localparam [7:0] W_key = 8'h1D, A_key = 8'h1C, S_key = 8'h1B, D_key = 8'h23, space_key = 8'h29, shift_key = 8'h12, Z_key = 8'h1A, X_key = 8'h22;


reg a, b, sel, start, up, dn, l, r;

//assign joycon_state = {a, b, sel, start, up, dn, l, r};
assign joycon_state = {r, l, dn, up, start, sel, b, a};

always @ (posedge clk or negedge rst) begin

	if(!rst) begin
	
		up <= 0;
		l <= 0;
		dn <= 0;
		r <= 0;
		a <= 0;
		b <= 0;
		sel <= 0;
		start <= 0;
	
	end
	else if(scan_valid) begin
	
		//If this is a key lift
		if(H1 == 8'hF0) begin
		
			case(H0)
			
				W_key : up <= 0;
				A_key : l <= 0;
				S_key : dn <= 0;
				D_key : r <= 0;
				space_key : a <= 0;
				shift_key : b <= 0;
				Z_key : sel <= 0;
				X_key : start <= 0;
			
			
			endcase
		
		end
		else begin
			
			case(H0)
			
				
				W_key : up <= 1;
				A_key : l <= 1;
				S_key : dn <= 1;
				D_key : r <= 1;
				space_key : a <= 1;
				shift_key : b <= 1;
				Z_key : sel <= 1;
				X_key : start <= 1;
			
			
			endcase
			
		end
		

	end
end






endmodule