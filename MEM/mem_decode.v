


//Main memory controller for the PPU and CPU


module mem_decode
(
	input wire clk,
	input wire rst,
	
	input wire [15:0] cpu_addr, //System controller will be connected to this bus
	input wire [7:0] cpu_data_in,
	output reg [7:0] cpu_data_out,
	input wire cpu_write_en,
	input wire cpu_read_en, //Needs to be strobed to increment the VRAM addr counter on read
	
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
	output wire ppu_status_read,
	
	input wire [7:0] joycon_1,//Need to be connected to shift register
	input wire [7:0] joycon_2,
	
	input wire h_mirror, v_mirror
);


assign ppu_status_read = 0;

//Register for buffering vram memory access
reg [7:0] vram_mem_cpu_buffer;

//Internal signals for cpu access to vram and spram
reg [15:0] vram_cpu_addr;
//VRAM Memory address decoder
wire [15:0] vram_ppu_addr_int;
wire [15:0] vram_cpu_addr_int;
reg [15:0] vram_cpu_addr_buff;
ppu_mem_decode read_decode(vram_ppu_addr, h_mirror, v_mirror, vram_ppu_addr_int);
ppu_mem_decode write_decode(vram_cpu_addr_buff, h_mirror, v_mirror, vram_cpu_addr_int);

//CPU address decoding
wire [15:0] cpu_addr_int;
wire cpu_addr_valid;
cpu_mem_decode cpu_decode(cpu_addr, cpu_addr_int, cpu_addr_valid);

//CPU memory declaration and address decoding
//Need 0xBFE0 + 0x800 bytes = 51,168
wire [15:0] cpu_mem_addr = cpu_addr_valid ? cpu_addr_int : 16'b0;
wire [7:0] cpu_mem_data_in = cpu_data_in;
wire [7:0] cpu_mem_data_out;
wire cpu_mem_write_en = (cpu_addr_valid && cpu_write_en) ? 1'b1 : 1'b0;
wire [7:0] cpu_mem_data_out_2;

//generic_ram #(51168, 16) cpu_mem (clk, cpu_mem_addr, cpu_mem_data_in, cpu_mem_data_out, cpu_mem_write_en, 16'h0, cpu_mem_data_out_2);
generic_ram #(65536) cpu_mem (clk, cpu_mem_addr, cpu_mem_data_in, cpu_mem_data_out, cpu_mem_write_en, 16'h0, cpu_mem_data_out_2);

//SPRAM declaration
wire [7:0] spram_mem_cpu_addr = spram_cpu_addr;
wire [7:0] spram_mem_cpu_data_in = cpu_data_in;
wire [7:0] spram_mem_cpu_data_out;
wire spram_mem_cpu_write_en = (cpu_addr_int == 16'h2004 && cpu_addr_valid == 1'b0 && cpu_write_en) ? 1'b1 : 1'b0;

generic_ram #(256, 8) spram_mem (clk, spram_mem_cpu_addr, spram_mem_cpu_data_in, spram_mem_cpu_data_out, spram_mem_cpu_write_en, spram_ppu_addr, spram_ppu_data);

//VRAM declaration
//Need 0x3000 + 0x20 bytes of vram_memory
wire [15:0] vram_mem_cpu_addr = vram_cpu_addr_int;
wire [7:0] vram_mem_cpu_data_in = cpu_data_in;
wire [7:0] vram_mem_cpu_data_out;
wire vram_mem_cpu_write_en = (cpu_addr_int == 16'h2007 && cpu_addr_valid == 1'b0 && cpu_write_en) ? 1'b1 : 1'b0;

//generic_ram #(12320, 16) vram_mem (clk, vram_mem_cpu_addr, vram_mem_cpu_data_in, vram_mem_cpu_data_out, vram_mem_cpu_write_en, vram_ppu_addr_int, vram_ppu_data);
generic_ram #(16384, 16) vram_mem (clk, vram_mem_cpu_addr, vram_mem_cpu_data_in, vram_mem_cpu_data_out, vram_mem_cpu_write_en, vram_ppu_addr_int, vram_ppu_data);


///////////////////////////////
///Next Definitons/////////////
///////////////////////////////
wire [7:0] spram_cpu_addr_next = (cpu_addr_int == 16'h2003 && cpu_addr_valid == 1'b0 && cpu_write_en) ? cpu_data_in : (cpu_addr_int == 16'h2004 && cpu_addr_valid == 1'b0 && (cpu_write_en || cpu_read_en)) ? spram_cpu_addr + 1'b1 : spram_cpu_addr;

//Always for handing buffered return of 
reg [7:0] vram_mem_cpu_buffer_2;
always @ (posedge clk or negedge rst) begin
	if(!rst) begin
		vram_mem_cpu_buffer_2 <= 0;
		vram_mem_cpu_buffer <= 0;
	end
	else if((cpu_read_en||cpu_write_en) && cpu_addr_int == 16'h2007 && !cpu_addr_valid) begin
		vram_mem_cpu_buffer_2 <= vram_mem_cpu_data_out;
		vram_mem_cpu_buffer <= vram_mem_cpu_buffer_2;
		//vram_mem_cpu_buffer_2 <= vram_mem_cpu_data_out;
	end
end


//Always for handling ppu scroll
reg scroll_toggle;
always @ (posedge clk or negedge rst) begin
	if(!rst) begin
		scroll_toggle <= 0;
		ppu_scroll_addr <= 0;
	end
	else if(!cpu_addr_valid)begin
	
		vram_cpu_addr_buff <= vram_cpu_addr;
	
		//If the CPU is reading from 0x2002
		if(cpu_addr_int == 16'h2002 && (cpu_read_en || cpu_write_en)) begin
			//Reset the togggle bit
			scroll_toggle <= 0;
		end
		else if(cpu_addr_int == 16'h2005 && cpu_write_en) begin
		
			//If the toggle bit set
			if(scroll_toggle) begin
				//Write Y (row) position
				ppu_scroll_addr[15:8] <= cpu_data_in;
				scroll_toggle <= 0;
			end
			else begin
				//Write x (col) position
				ppu_scroll_addr[7:0] <= cpu_data_in;
				scroll_toggle <= 1;
			end
		end
		else if(cpu_addr_int == 16'h2006 && cpu_write_en) begin
			
			//If the toggle bit unset
			if(!scroll_toggle) begin
				//Write high byte first
				vram_cpu_addr[15:8] <= cpu_data_in;
				scroll_toggle <= 1;
			end
			else begin
				//Write low byte last
				vram_cpu_addr[7:0] <= cpu_data_in;
				scroll_toggle <= 0;

			end
		
		end
		else if(cpu_addr_int == 16'h2007 && (cpu_write_en || cpu_read_en)) begin
			
			//Increment by 1 or 32 depending on ppu_ctrl1[2]
			if(ppu_ctrl1[2]) begin
			
				vram_cpu_addr <= vram_cpu_addr + 32;
				
			end
			else begin
			
				vram_cpu_addr <= vram_cpu_addr + 1;
			
			end
		end
		
		
		
		
	end
end

//Always for handling ppu_ctrl1, ppu_ctrl2
always @ (posedge clk or negedge rst) begin
	if(!rst) begin
		ppu_ctrl1 <= 0;
		ppu_ctrl2 <= 0;
	end
	else if(cpu_write_en) begin
		if(cpu_addr_int == 16'h2000) begin
			ppu_ctrl1 <= cpu_data_in;
		end
		else if(cpu_addr_int == 16'h2001) begin
			ppu_ctrl2 <= cpu_data_in;
		end
	end
end


always @ (posedge clk or negedge rst) begin
	if(!rst) begin
		spram_cpu_addr <= 8'b0;
	end
	else begin
		spram_cpu_addr <= spram_cpu_addr_next;
	end
end

reg [15:0] cpu_addr_int_reg;
reg cpu_addr_valid_reg;
always @ (posedge clk or negedge rst) begin
	if(!rst) begin
		cpu_addr_int_reg <= 0;
		cpu_addr_valid_reg <= 0;
	end
	else begin
		cpu_addr_int_reg <= cpu_addr_int;
		cpu_addr_valid_reg <= cpu_addr_valid;
	end
end

always @ * begin

	//If we're trying to read/write to a registers
	if(cpu_addr_valid_reg == 1'b0) begin
	
		case(cpu_addr_int_reg)
		
		//ppu_ctrl1
		16'h2000: cpu_data_out = ppu_ctrl1;
		
		//ppu_ctrl2
		16'h2001: cpu_data_out = ppu_ctrl2;
		
		//ppu_status
		16'h2002: cpu_data_out = ppu_status;
		
		//spram addr
		16'h2003: cpu_data_out = spram_cpu_addr;
		
		//spram data
		16'h2004: cpu_data_out = spram_mem_cpu_data_out;
		
		//scroll addr
		16'h2005: cpu_data_out = ppu_scroll_addr[7:0];
		
		//vram addr
		16'h2006: cpu_data_out = vram_cpu_addr[7:0];
			
		//vram data
		//Need to buffer this if we are accessing 
		16'h2007: begin
			//If we don't need buffering
			if(vram_cpu_addr >= 16'h3F00) begin
				cpu_data_out = vram_mem_cpu_buffer_2;
			end
			//If we do
			else begin
				cpu_data_out = vram_mem_cpu_buffer;
			end
		end
		//joycon1
		16'h4016: cpu_data_out = joycon_1;
		
		//joycon2
		16'h4017: cpu_data_out = joycon_2;
		
		default: cpu_data_out = 8'b0;
		
		endcase
	
	end
	
	//Reading writing CPU mem
	else begin
		cpu_data_out = cpu_mem_data_out;
	end

end
endmodule

