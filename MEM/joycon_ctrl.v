

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
		if(cpu_addr == reg_addr && (cpu_write_en || cpu_read_en)) begin
		
			joycon_cpu_reg <= {7'b0, joycon_ctrl_input[cnt]};
			cnt <= cnt + 1;
		
		end
	
	end

end


endmodule 

