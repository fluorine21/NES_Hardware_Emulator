
 module working_joycon
(
	input wire clk,
	input wire rst,

	input wire [7:0] joycon_ctrl_input,

	input wire joypad_clk,
	input wire joypad_latch,
	output reg joycon_data

);


wire [31:0] shift_reg_val = {8'hff, 4'hf, 4'h1, 8'h00, joycon_ctrl_input};

reg [31:0] shift_reg;
reg clocked;
always @ (posedge clk or negedge rst) begin

	if(!rst) begin
	
		shift_reg <= 0;
		joycon_data <= 0;
		clocked <= 0;
	
	end
	else begin
	
		if(joypad_latch) begin
			shift_reg <= shift_reg_val;
			joycon_data <= shift_reg_val[0];
		end
		else if(joypad_clk && !clocked) begin
			joycon_data <= shift_reg[0];
			shift_reg <= {1'b0, shift_reg[31:1]};
			clocked <= 1;
		end
		else if(!joypad_clk) begin
		
			clocked <= 0;
		
		end
	end


end


endmodule





 module joycon_ctrl
#(
parameter reg_addr = 16'h4016
)
(
	input wire clk,
	input wire rst,

	//Used to determine when joycon strobe is happening
	input wire [15:0] cpu_addr,
	input wire [7:0] cpu_data,
	input wire cpu_write_en,
	input wire cpu_read_en,

	//Register seen by the CPU
	output reg [7:0] joycon_cpu_reg,

	// Gets the current button press states
	input wire [7:0] joycon_ctrl_input 

);

wire [31:0] shift_reg_val = {8'hff, 4'hf, 4'h1, 8'h00, joycon_ctrl_input};

reg [31:0] shift_reg;
always @ (posedge clk or negedge rst) begin

	if(!rst) begin
	
		shift_reg <= 0;
		joycon_cpu_reg <= 0;
	
	end
	else begin
	
		if(cpu_addr == reg_addr && cpu_write_en) begin
			shift_reg <= shift_reg_val;
			joycon_cpu_reg <= 0;
		end
		else if(cpu_addr == reg_addr && cpu_read_en) begin
			joycon_cpu_reg <= {7'b0, shift_reg[0]};
			shift_reg <= {1'b0, shift_reg[31:1]};
		end
	end


end


endmodule


//////////////////////////////////////////Working////////////////////

//Joycon controller for CPU
//Simulates the joycon shift register

/* module joycon_ctrl
#(
parameter reg_addr = 16'h4016
)
(
	input wire clk,
	input wire rst,

	//Used to determine when joycon strobe is happening
	input wire [15:0] cpu_addr,
	input wire [7:0] cpu_data,
	input wire cpu_write_en,
	input wire cpu_read_en,

	//Register seen by the CPU
	output reg [7:0] joycon_cpu_reg,

	// Gets the current button press states
	input wire [7:0] joycon_ctrl_input 

);

reg [2:0] cnt;

always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin

		cnt <= 3'b0;

	end 

	else begin

		//If the CPU is trying to read/write this register:
		if(cpu_addr == reg_addr && cpu_read_en) begin

			joycon_cpu_reg <= {7'b0, joycon_ctrl_input[cnt]};
			cnt <= cnt + 1;

		end
		else if(cpu_addr == reg_addr && cpu_write_en && cpu_data[0]) begin
		
			cnt <= 0;
		
		end

	end

end


endmodule */ 


////////////////////////////////////////////////////////////////////////////









/* 

//Joycon controller for CPU
//Simulates the joycon shift register

module joycon_ctrl
#(
parameter reg_addr = 16'h4016
)
(
	input wire clk,
	input wire rst,
	
	//Used to determine when joycon strobe is happening
	input wire [15:0] cpu_addr,
	input wire cpu_write_en,
	input wire cpu_read_en,
	
	//Register seen by the CPU
	output wire [7:0] joycon_cpu_reg,
	
	// Gets the current button press states
	input wire [7:0] joycon_ctrl_input 
	
);



reg [31:0] shift_reg;
//wire [7:0] shift_reg = joycon_ctrl_input;
reg shift_bit;
reg shift_bit_out;
assign joycon_cpu_reg = {7'b0, shift_bit_out};


always @ (posedge clk or negedge rst) begin
	
	if(!rst) begin
	
		shift_bit <= 0;
		shift_reg <= {8'hFF, 8'hFF, 8'hFF, 8'h00};
		shift_bit_out <= 0;
		
	end 
	
	else begin
	
		//If the CPU is trying to read this register:
		if(cpu_addr == reg_addr && cpu_read_en) begin
			
			shift_bit_out <= shift_bit;
			shift_bit <= shift_reg[0];
			shift_reg <= {1'b1, shift_reg[31:1]};
		
		end
		//If we're trying to reset this device
		else if(cpu_addr == reg_addr && cpu_write_en) begin
			
			shift_bit <= joycon_ctrl_input[0];
			shift_bit_out <= 0;
			shift_reg <= {8'hFF, 8'hFF, 8'hFF, joycon_ctrl_input};
		
		end
	
	end

end


endmodule 

 */
 
 
 
 
 
 /* 

//Joycon controller for CPU
//Simulates the joycon shift register

module joycon_ctrl
#(
parameter reg_addr = 16'h4016
)
(
	input wire clk,
	input wire rst,

	//Used to determine when joycon strobe is happening
	input wire [15:0] cpu_addr,
	input wire [7:0] cpu_data,
	input wire cpu_write_en,
	input wire cpu_read_en,

	//Register seen by the CPU
	output wire [7:0] joycon_cpu_reg,

	// Gets the current button press states
	input wire [7:0] joycon_ctrl_input 

);

reg set;


latch74 jlatch(clk, rst, sclk, set, joycon_ctrl_input, joycon_bit);

assign joycon_cpu_reg = {7'b0, joycon_bit};
assign sclk = cpu_read_en;

always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin

		set = 0;
		
	end 

	else begin

		//No need to worry about read
		
		if(cpu_addr == reg_addr && cpu_write_en) begin
		
			if(cpu_data[0]) begin
				
				//Set
				set <= 1;
			
			end
			else begin
			
				//Unset
				set <= 0;
			
			end
		
		end

	end

end


endmodule 


module latch74
(
	input wire clk, rst,
	input wire sclk,
	input wire set,
	
	input wire [7:0] p_input,
	output reg shift_bit
);

reg wait_low;
reg [7:0] shift_reg;
always @ (posedge clk or negedge rst) begin

	if(!rst) begin
	
		shift_reg <= 0;
		shift_bit <= 0;
	
	end
	else begin
	
		if(set) begin
		
			shift_reg <= p_input;
		
		end
		else if (!sclk) begin
			
			wait_low <= 0;
		
		end
		else if(sclk && !wait_low) begin
			
			
			wait_low <= 1;
			shift_bit <= shift_reg[0];
			shift_reg <= {1'b1, shift_reg[7:1]};
		
		end
	end
end


endmodule
 */
