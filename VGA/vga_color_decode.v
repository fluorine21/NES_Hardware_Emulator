

module vga_color_decode
(
	input wire [7:0] vga_buffer_byte,
	
	output reg [7:0] R, G, B
);

always @ * begin

	case(vga_buffer_byte)
	
		8'h00: begin
			R <= 8'h75;
			G <= 8'h75;
			B <= 8'h75;
		end
		
		8'h01: begin
			R <= 8'h27;
			G <= 8'h1B;
			B <= 8'h8F;
		end
		
		8'h02: begin
			R <= 0;
			G <= 0;
			B <= 8'hAB;
		end
		
		8'h03: begin
			R <= 8'h47;
			G <= 0;
			B <= 8'h9F;
		end
		
		8'h04: begin
			R <= 8'h8F;
			G <= 0;
			B <= 8'h77;
		end
		
		8'h05: begin
			R <= 8'hAB;
			G <= 0;
			B <= 8'h13;
		end
	
		8'h06: begin
			R <=8'hA7;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h07: begin
			R <=8'h7F;
			G <=8'h0B;
			B <=8'h00;
		end
		
		8'h08: begin
			R <=8'h43;
			G <=8'h2F;
			B <=8'h00;
		end
		
		8'h09: begin
			R <=8'h00;
			G <=8'h47;
			B <=8'h00;
		end
		
		8'h0A: begin
			R <=8'h00;
			G <=8'h51;
			B <=8'h00;
		end
		
		8'h0B: begin
			R <=8'h00;
			G <=8'h3F;
			B <=8'h17;
		end
		
		8'h0C: begin
			R <=8'h1B;
			G <=8'h3F;
			B <=8'h5F;
		end
		
		8'h0D: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h0E: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h0F: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h10: begin
			R <=8'hBC;
			G <=8'hBC;
			B <=8'hBC;
		end
		
		8'h11: begin
			R <=8'h00;
			G <=8'h73;
			B <=8'hEF;
		end
		
		8'h12: begin
			R <=8'h23;
			G <=8'h3B;
			B <=8'hEF;
		end
		
		8'h13: begin
			R <=8'h83;
			G <=8'h00;
			B <=8'hF3;
		end
		
		8'h14: begin
			R <=8'hBF;
			G <=8'h00;
			B <=8'hBF;
		end
		
		8'h15: begin
			R <=8'hE7;
			G <=8'h00;
			B <=8'h5B;
		end
		
		8'h16: begin
			R <=8'hDB;
			G <=8'h2B;
			B <=8'h00;
		end
		
		8'h17: begin
			R <=8'hCB;
			G <=8'h4F;
			B <=8'h0F;
		end
		
		8'h18: begin
			R <=8'h8B;
			G <=8'h73;
			B <=8'h00;
		end
		
		8'h19: begin
			R <=8'h00;
			G <=8'h97;
			B <=8'h00;
		end
		
		8'h1A: begin
			R <=8'h00;
			G <=8'hAB;
			B <=8'h00;
		end
		
		8'h1B: begin
			R <=8'h00;
			G <=8'h93;
			B <=8'h3B;
		end
		
		8'h1C: begin
			R <=8'h00;
			G <=8'h83;
			B <=8'h8B;
		end
		
		8'h1D: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h1E: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h1F: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h20: begin
			R <=8'hFF;
			G <=8'hFF;
			B <=8'hFF;
		end
		
		8'h21: begin
			R <=8'h3F;
			G <=8'hBF;
			B <=8'hFF;
		end
		
		8'h22: begin
			R <=8'h5F;
			G <=8'h97;
			B <=8'hFF;
		end
		
		8'h23: begin
			R <=8'hA7;
			G <=8'h8B;
			B <=8'hFD;
		end
		
		8'h24: begin
			R <=8'hF7;
			G <=8'h7B;
			B <=8'hFF;
		end
		
		8'h25: begin
			R <=8'hFF;
			G <=8'h77;
			B <=8'hBF;
		end
		
		8'h26: begin
			R <=8'hFF;
			G <=8'h77;
			B <=8'h63;
		end
		
		8'h27: begin
			R <=8'hFF;
			G <=8'h9B;
			B <=8'h3B;
		end
		
		8'h28: begin
			R <=8'hF3;
			G <=8'hBF;
			B <=8'h3F;
		end
		
		8'h29: begin
			R <=8'h83;
			G <=8'hD3;
			B <=8'h13;
		end
		
		8'h2A: begin
			R <=8'h4F;
			G <=8'hDF;
			B <=8'h4B;
		end
		
		8'h2B: begin
			R <=8'h58;
			G <=8'hF8;
			B <=8'h98;
		end
		
		8'h2C: begin
			R <=8'h00;
			G <=8'hEB;
			B <=8'hDB;
		end
		
		8'h2D: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h2E: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h2F: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h30: begin
			R <=8'hFF;
			G <=8'hFF;
			B <=8'hFF;
		end
		
		8'h31: begin
			R <=8'hAB;
			G <=8'hE7;
			B <=8'hFF;
		end
		
		8'h32: begin
			R <=8'hC7;
			G <=8'hD7;
			B <=8'hFF;
		end
		
		8'h33: begin
			R <=8'hD7;
			G <=8'hCB;
			B <=8'hFF;
		end
		
		8'h34: begin
			R <=8'hFF;
			G <=8'hC7;
			B <=8'hFF;
		end
		
		8'h35: begin
			R <=8'hFF;
			G <=8'hC7;
			B <=8'hDB;
		end
		
		8'h36: begin
			R <=8'hFF;
			G <=8'hBF;
			B <=8'hB3;
		end
		
		8'h37: begin
			R <=8'hFF;
			G <=8'hDB;
			B <=8'hAB;
		end
		
		8'h38: begin
			R <=8'hFF;
			G <=8'hE7;
			B <=8'hA3;
		end
		
		8'h39: begin
			R <=8'hE3;
			G <=8'hFF;
			B <=8'hA3;
		end
		
		8'h3A: begin
			R <=8'hAB;
			G <=8'hF3;
			B <=8'hBF;
		end
		
		8'h3B: begin
			R <=8'hB3;
			G <=8'hFF;
			B <=8'hCF;
		end
		
		8'h3C: begin
			R <=8'h9F;
			G <=8'hFF;
			B <=8'hF3;
		end
		
		8'h3D: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h3E: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
		
		8'h3F: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end
	
		default: begin
			R <=8'h00;
			G <=8'h00;
			B <=8'h00;
		end

	endcase

end





endmodule