//Main memory controller for the PPU and CPU


module mem_ctrl
(
	input wire clk,
	input wire rst,
	
	input wire [15:0] cpu_addr, //System controller will be connected to this bus
	input wire [7:0] cpu_data_in,
	output reg [7:0] cpu_data_out,
	input wire cpu_write_en,
	input wire cpu_read_en, //Needs to be strobed to increment the VRAM addr counter on read
	output busy,
	
	//PPU control registers
	output reg [7:0] ppu_ctrl1,
	output reg [7:0] ppu_ctrl2,
	input wire [7:0] ppu_status,
	output reg [15:0] ppu_scroll_addr,

	input wire [15:0] vram_ppu_addr,
	output wire [7:0] vram_ppu_data,
	
	input wire [7:0] spram_ppu_addr,
	output wire [7:0] spram_ppu_data,
	
	output reg [7:0] spram_cpu_addr,
	output reg ppu_status_read
);



//Internal signals for cpu access to vram and spram
reg [15:0] vram_cpu_addr;
//VRAM Memory address decoder
wire [15:0] vram_ppu_addr_int;
wire [15:0] vram_cpu_addr_int;
ppu_mem_decode read_decode(vram_ppu_addr, vram_ppu_addr_int);
ppu_mem_decode write_decode(vram_cpu_addr, vram_cpu_addr_int);

//CPU address decoding
wire [15:0] cpu_addr_int;
wire cpu_addr_valid;
cpu_mem_decode cpu_decode(cpu_addr, cpu_addr_int, cpu_addr_valid);

//CPU memory declaration and address decoding
//Need 0xBFE0 + 0x800 bytes = 51,168
reg [15:0] cpu_mem_addr;
reg [7:0] cpu_mem_data_in;
wire [7:0] cpu_mem_data_out;
reg cpu_mem_write_en;
wire [7:0] cpu_mem_data_out_2;

generic_ram #(51168, 16) cpu_mem (clk, cpu_mem_addr, cpu_mem_data_in, cpu_mem_data_out, cpu_mem_write_en, 16'h0, cpu_mem_data_out_2);

//SPRAM declaration
reg [7:0] spram_mem_cpu_addr;
reg [7:0] spram_mem_cpu_data_in;
wire [7:0] spram_mem_cpu_data_out;
reg spram_mem_cpu_write_en;


generic_ram #(256, 8) spram_mem (clk, spram_mem_cpu_addr, spram_mem_cpu_data_in, spram_mem_cpu_data_out, spram_mem_cpu_write_en, spram_ppu_addr, spram_ppu_data);

//VRAM declaration
//Need 0x3000 + 0x20 bytes of vram_memory
reg [15:0] vram_mem_cpu_addr;
reg [7:0] vram_mem_cpu_data_in;
wire [7:0] vram_mem_cpu_data_out;
reg vram_mem_cpu_write_en;


generic_ram #(12320, 16) vram_mem (clk, vram_mem_cpu_addr, vram_mem_cpu_data_in, vram_mem_cpu_data_out, vram_mem_cpu_write_en, vram_ppu_addr_int, vram_ppu_data);

//State machine definition
localparam [7:0] state_idle = 8'h00,

                 state_write_cpu_mem = 8'h01,
                 state_write_vram = 8'h02,
					  state_write_spram = 8'h03,
					  
					  state_read_cpu_mem = 8'h04,
					  state_read_vram = 8'h05,
					  state_read_spram = 8'h06;

reg[7:0] state_reg;



always @ (posedge clk or negedge rst) begin

	if(rst == 1'b0) begin
	
		cpu_data_out <= 8'b0;
		ppu_ctrl1 <= 8'b0;
		ppu_ctrl2 <= 8'b0;
		spram_cpu_addr <= 8'b0;
		ppu_status_read <= 1'b0;
		vram_cpu_addr <= 16'h0;
	
	end
	
	else begin
	
	case(state_reg)
	
		state_idle: begin
		
			//Reset the ppu_status flag if necissary
			if(ppu_status_read == 1'b1) begin
				ppu_status_read <= 1'b0;
			end
		
			//If the CPU is trying to read or write
			if(cpu_write_en || cpu_read_en) begin
				//If we're trying to read/write to a registers
				if(cpu_addr_valid == 1'b0) begin
				
					//if we're trying to read/write to one of the control registers
					
					//ppu_ctrl1
					if(cpu_addr_int == 16'h2000) begin
						if(cpu_write_en)begin
							ppu_ctrl1 <= cpu_data_in;
						end
						else begin
							cpu_data_out <= ppu_ctrl1;
						end
						state_reg <= state_idle;
					end
					
					//ppu_ctrl2
					else if(cpu_addr_int == 16'h2001) begin
						if(cpu_write_en) begin
							ppu_ctrl2 <= cpu_data_in;
						end
						else begin
							cpu_data_out <= ppu_ctrl2;
						end
					end
					
					//ppu_status
					else if(cpu_addr_int == 16'h2002) begin
						//Need to assume a read here and clear vram_cpu_addr
						//Also need to signal to PPU to clear bit 7
						if(cpu_write_en == 1'b0) begin
							cpu_data_out <= ppu_status;
							vram_cpu_addr <= 16'b0;
							ppu_status_read <= 1'b1;
						end
						state_reg <= state_idle;
						
					end
					
					//spram addr
					else if(cpu_addr_int == 16'h2003) begin
						if(cpu_write_en) begin
							spram_cpu_addr <= cpu_data_in;
						end
						else begin
							cpu_data_out <= spram_cpu_addr;
						end
					end
					
					//spram data
					//Need to start a memory access here
					else if(cpu_addr_int == 16'h2004) begin
						//must assume read here
						if(cpu_write_en) begin
							spram_mem_cpu_addr <= spram_cpu_addr;
							spram_mem_cpu_data_in <= cpu_data_in;
							spram_mem_cpu_write_en <= 1'b1;
							state_reg <= state_write_spram;
							spram_cpu_addr <= spram_cpu_addr + 1;
						end
						else begin
							spram_mem_cpu_addr <= spram_cpu_addr;
							spram_mem_cpu_write_en <= 1'b0;
							state_reg <= state_read_spram;
						end
					end
					
					//scroll addr
					else if(cpu_addr_int == 16'h2005) begin
						if(cpu_write_en) begin
							ppu_scroll_addr[15:8] <= ppu_scroll_addr[7:0];
							ppu_scroll_addr[7:0] <= cpu_data_in;
						end
					end
					
					//vram addr
					else if(cpu_addr_int == 16'h2006) begin
						if(cpu_write_en) begin
							vram_cpu_addr[15:8] <= vram_cpu_addr[7:0];
							vram_cpu_addr[7:0] <= cpu_data_in;
						end
					end
					
					//vram data
					else if(cpu_addr_int == 16'h2007) begin
						if(cpu_write_en) begin
							vram_mem_cpu_addr <= vram_cpu_addr_int;
							vram_mem_cpu_data_in <= cpu_data_in;
							vram_mem_cpu_write_en <= 1'b1;
							state_reg <= state_write_vram;
						end
						else if(cpu_read_en) begin
							vram_mem_cpu_addr <= vram_cpu_addr_int;
							vram_mem_cpu_write_en <= 1'b0;
							state_reg <= state_read_vram;
						end
						
						if(ppu_ctrl1[2] == 1'b0) begin
							vram_cpu_addr <= vram_cpu_addr + 1;
						end
						else begin
							vram_cpu_addr <= vram_cpu_addr + 32;
						end
					end	
				
				
				end
				
				//Reading writing CPU mem
				else begin
					if(cpu_write_en) begin
						cpu_mem_addr <= cpu_addr_int;
						cpu_mem_data_in <= cpu_data_in;
						cpu_mem_write_en <= 1'b1;
						state_reg <= state_write_cpu_mem;
					end
					else begin
						cpu_mem_addr <= cpu_addr_int;
						cpu_mem_write_en <= 1'b0;
						state_reg <= state_read_cpu_mem;
					end
				
				end
				
			end//CPU not trying to write or read
			
			else begin
				state_reg <= state_idle;
			end
			
		end//IDLE case
			
		//Mem reading states	
		state_write_cpu_mem: begin
			cpu_mem_write_en <= 1'b0;
			state_reg <= state_idle;
		end	
		
		state_write_vram: begin
			vram_mem_cpu_write_en <= 1'b0;
			state_reg <= state_idle;
		end
		
		state_write_spram: begin
			spram_mem_cpu_write_en <= 1'b0;
			state_reg <= state_idle;
		end
		
		//mem writing states
		state_read_cpu_mem: begin
			cpu_data_out <= cpu_mem_data_out;
			state_reg <= state_idle;
		end
		
		state_read_vram: begin
			cpu_data_out <= vram_mem_cpu_data_out;
			state_reg <= state_idle;
		end
		
		state_read_spram: begin
			cpu_data_out <= spram_mem_cpu_data_out;
			state_reg <= state_idle;
		end
	
	endcase
	
	end


end


assign busy = state_reg == state_idle;

endmodule

