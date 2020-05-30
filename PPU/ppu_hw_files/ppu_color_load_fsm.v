




module ppu_color_load_fsm
(
	input wire clk,
	input wire rst,
	
	inout wire [15:0] vram_addr_out,
	input wire [7:0] vram_data_in,
	input wire start,
	output wire busy,
	
	output wire [127:0] background_colors,
	output wire [127:0] sprite_colors
);


wire [15:0] vram_addr;

assign vram_addr_out = vram_addr[1:0] == 2'b00 ? 16'h3F00 : vram_addr;

//3F00 to 3F0F is background_colors
//3F10 to 3F1F is sprite colors

reg [15:0] vram_addr_int;
wire [15:0] color_index = vram_addr_int - 16'h3F00 - 16'h0001;
reg [255:0] color_reg;
reg [1:0] state;

assign background_colors = color_reg[127:0];
assign sprite_colors = color_reg[255:128];

localparam [1:0] state_idle = 0, state_wait = 1, state_load = 2;

task reset();
begin

	vram_addr_int <= 0;
	color_reg <= 0;
	state <= state_idle;

end
endtask

assign vram_addr = vram_addr_int;
assign busy = state != state_idle;

always @ (posedge clk or negedge rst) begin


	if(rst == 1'b0) begin
	
		reset();
	
	end
	else begin
	
	
	
		case(state)
		
		
			state_idle: begin
			
				if(start == 1'b1) begin
				
					//Push the first address onto the vram_addr
					vram_addr_int <= 16'h3F00;
					
					state <= state_wait;
				
				end
			
			
			end
			
			
			state_wait: begin
			
				//Push the second address
				vram_addr_int <= vram_addr_int + 16'h0001;
			
				//Go to the third state
				state <= state_load;
				
			end
			
			
			state_load: begin
			
				//Index is color_index
				color_reg[(color_index << 3)+:8] = vram_data_in;
				
				//if we're done loading colors
				if(color_index == 31) begin
				
					state <= state_idle;
					
				
				end
				else begin
				
					vram_addr_int <= vram_addr_int + 16'h0001;
				
				end
			
			
			end
		
			default begin
			
				reset();
			
			end
		
		
		endcase
	
	end



end


endmodule