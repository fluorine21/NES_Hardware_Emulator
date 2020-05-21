

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

reg [4:0] cnt;

wire [31:0] shift_reg = {8'h00, 4'h0, 4'h1, 8'h00, joycon_ctrl_input};

assign joycon_cpu_reg = {7'b0, ~shift_reg[cnt - 1]};


always @ (posedge clk or negedge rst) begin
	
	if(!rst) begin
	
		cnt <= 0;
	
	end 
	
	else begin
	
		//If the CPU is trying to read this register:
		if(cpu_addr == reg_addr && cpu_read_en) begin
			
			if(cnt >= 23) begin
				cnt <= 0;
			end
			else begin
				cnt <= cnt + 1;
			end
			
		
		end
		//If we're trying to reset this device
		else if(cpu_addr == reg_addr && cpu_write_en) begin
			
			cnt <= 0;
		
		end
	
	end

end


endmodule 

