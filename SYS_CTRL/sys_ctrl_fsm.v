


module sys_ctrl_fsm
(
	input wire clk,
	input wire rst,
	
	//UART connections
	input wire uart_rx,
	output wire uart_tx,
	
	//Connections to CPU memory bus
	inout wire [15:0] cpu_bus_addr,
	input wire [7:0] cpu_bus_data_in,
	inout wire [7:0] cpu_bus_data_out,
	//These aren't tristate, can OR with CPU inputs
	inout wire cpu_bus_write_en,
	inout wire cpu_bus_read_en,
	
	//Outputs to CPU control
	output reg cpu_halt,
	output reg cpu_rst,
	
	input wire cpu_is_halted // Needed to detect when the CPU is actually halted
	
);

localparam [7:0] HALT_CPU = 8'h00, 
				 RESUME_CPU = 8'h01, 
				 WRITE_BYTE = 8'h02, 
				 READ_BYTE = 8'h03,
				 RESET_CPU = 8'h04;//

//This module can do the following things
//Halt the CPU - 0x00
//Resume the CPU - 0x01
//Upload a byte to memory 0x02
//Read a byte from memory 0x03
//Reset the CPU 0x04

reg [15:0] addr;
reg [7:0] data;
reg write_en, read_en;

//Bus control
assign cpu_bus_addr = cpu_halt && cpu_is_halted ? addr : 16'bz;
assign cpu_bus_data_out = cpu_halt && cpu_is_halted && write_en ? data : 8'bz;
assign cpu_bus_write_en = cpu_halt && cpu_is_halted ? write_en : 0;
assign cpu_bus_read_en = cpu_halt && cpu_is_halted ? read_en : 0;

localparam [7:0] state_idle = 0,
				 state_read_1 = 1,
				 state_read_2 = 2,
				 state_read_3 = 3,
				 state_read_4 = 4,
				 state_write_1 = 5,
				 state_write_2 = 6,
				 state_write_3 = 7,
				 state_reset_cpu = 8;

reg [7:0] state;
reg [8:0] cnt;

//Uart RX
wire rx_valid;
wire [7:0] rx_data;
UART_RX uart_rx_inst
(
	clk,
	uart_rx,
	rx_valid,
	rx_data
);

//Uart TX
reg tx_start;
reg [7:0] tx_data;
wire tx_active, tx_done;
UART_TX uart_tx_inst
(
	clk,
	tx_start,
	tx_data,
	tx_active,
	uart_tx,
	tx_done
);

task reset_regs();
begin

	state <= state_idle;
	addr <= 0;
	data <= 0;
	write_en <= 0;
	read_en <= 0;
	cnt <= 0;
	cpu_halt <= 0;
	cpu_rst <= 0;
	tx_start <= 0;
	tx_data <= 0;

end
endtask


always @ (posedge clk or negedge rst) begin


	if(rst == 0) begin
	
		reset_regs();
	
	end
	else begin
	
		case(state)

			state_idle: begin
			
				//Reset TX start
				tx_start <= 0;
			
				//Reset write_en
				write_en <= 0;
				
				//Reset the counter
				cnt <= 0;
				
				//If we have an incomming RX bit
				if(rx_valid) begin
					
					case(rx_data)
					
						HALT_CPU: begin
						
							//Set the CPU halt flag
							cpu_halt <= 1'b1;
						
						end
						
						RESUME_CPU: begin
						
							//Reset the CPU halt flag
							cpu_halt <= 1'b0;
							
						end
						
						WRITE_BYTE: begin
							
							//Go to the first write state
							state <= state_write_1;
							
						end
						
						READ_BYTE: begin
							//Go to the first read state
							state <= state_read_1;
						end
						
						RESET_CPU: begin
							//Set CPU reset low
							cpu_rst <= 0;
							//Go to the reset state
							state <= state_reset_cpu;
						end
					
					endcase
				end
				
			end//IDLE state
			
			//Read the high address byte
			state_read_1: begin
			
				//If we have an incomming byte
				if(rx_valid) begin
					//Store it in the high byte of the address and continue
					addr[15:8] <= rx_data;
					state <= state_read_2;
				end
			
			end
			
			//Read the low address byte and set the address line
			state_read_2: begin
				//If we have an incomming byte
				if(rx_valid) begin
					//Store it in the low byte of the address
					addr[7:0] <= rx_data;
					
					//Start the CPU read
					read_en <= 1;
					
					
					state <= state_read_3;
				end
			end
			
			//
			state_read_3: begin
			
				//Stop the read and go to the next state
				read_en <= 0;
			
				state <= state_read_4;
			end
			
			state_read_4: begin
			
				//Send the byte to the TX module
				tx_data <= cpu_bus_data_in;
			
				//If the TX module is ready
				if(tx_done) begin
				
					//Start the TX module
					tx_start <= 1;
					
					//Go back to the idle state
					state <= state_idle;
				
				end
			
			end
			
			//Read the high address byte
			state_write_1: begin
			
				//If we have an incomming byte
				if(rx_valid) begin
					//Store it in the high byte of the address and continue
					addr[15:8] <= rx_data;
					state <= state_write_2;
				end
			
			end
			
			//Read the low address byte and set the address line
			state_write_2: begin
				//If we have an incomming byte
				if(rx_valid) begin
					//Store it in the low byte of the address
					addr[7:0] <= rx_data;
					//Go to the data capture state
					state <= state_write_3;
				end
			end
			
			state_write_3: begin
				//If we have an incomming byte
				if(rx_valid) begin
			
					//Use it as the data byte
					data <= rx_data;
					
					//Start the write
					write_en <= 1;
					
					//Go back to idle
					state <= state_idle;
				
				end
			end
			
			
			state_reset_cpu: begin
			
				//if we're done counting
				if(cnt[8] == 1) begin
					
					//Stop resetting
					cpu_rst <= 0;
					
					//Go back to idle
					state <= state_idle;
				
				end
				else begin
					//Keep counting
					cnt <= cnt + 1;
				end
			
			end
			
			default: reset_regs();
		
	
		endcase
	end

end



endmodule

