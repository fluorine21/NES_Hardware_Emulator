library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

use work.instr_fetch_pkg.all;


entity instr_fetch is
	port(

			signal clk: in std_logic;
			signal rst: in std_logic;
		
			--memory bus
			signal addr_out: out std_logic_vector(15 downto 0); -- address bus going from IF to IE	
			signal mem_addr_out_s: out std_logic_vector(15 downto 0); -- address bus going from IF to mem	
			signal mem_data_in: in std_logic_vector(7 downto 0); -- address bus going from mem to IF	
			signal new_op  : out std_logic_vector(7 downto 0);
			signal alu_op  : out std_logic_vector(3 downto 0); -- 000 = add, 001 = subtract, 010 = shift
																				-- 011 = and, 100 = or, 101 = xor
			signal pc_ie   : in std_logic_vector(15 downto 0);
			signal pc      : out std_logic_vector(15 downto 0); --going to IE

			
			-- special purpose registers
			signal x_reg: in std_logic_vector(7 downto 0) := (others => '0'); 
			signal y_reg: in std_logic_vector(7 downto 0) := (others => '0'); 
			signal acc_reg: in std_logic_vector(7 downto 0) := (others => '0');			
			
			--flags
			signal accessing_mem_bus	: out std_logic := '0'; --	1 means ready	
			signal ie_ready				: in std_logic; -- 0 is ie computing, 1 is ie is ready for instruction
			signal imm_mode				: out std_logic := '0'; -- immediate addy mode flag, 0 if no, 1 if yes
			
			signal store_flag				: out std_logic_vector(2 downto 0) := "000"; -- 000 = not used, 001 = store in mem
																											-- 010 = acc, 011 = xreg, 100 = yreg
			signal reg_load_flag			: out std_logic_vector(1 downto 0) := "00";  -- 00 = not used, 01 = load from acc
																											-- 10 = load from xreg, 11 = yreg 
			signal mem_load_flag			: out std_logic := '0'; -- load to mem flag, 0 if no, 1 if loading from mem
			
			signal instr_valid			: out std_logic := '0'-- IF done	
		);
end entity instr_fetch;

architecture a of instr_fetch is

	component b2b_access is
		port(
			clk			: in std_logic;
			rst			: in std_logic;
			
			addr_1		: in std_logic_vector(15 downto 0);
			addr_2		: in std_logic_vector(15 downto 0);
			
			data_1		: out std_logic_vector(7 downto 0);
			data_2		: out std_logic_vector(7 downto 0);
			
			mem_read		: out std_logic;
			mem_done		: out std_logic;
			b2b_start		: in std_logic;
			b2b_busy		: out std_logic;

			mem_addr 		: out std_logic_vector(15 downto 0);
			mem_data_in 		: in std_logic_vector(7 downto 0)
		);
	end component b2b_access;	
	
	signal opcode			: std_logic_vector(15 downto 0); --{opcode, operand}
	signal addr_pc			: std_logic_vector(15 downto 0);
	

	signal addr_1			: std_logic_vector(15 downto 0);
	signal addr_2			: std_logic_vector(15 downto 0);
			
	signal data_1			: std_logic_vector(7 downto 0);
	signal data_2			: std_logic_vector(7 downto 0);	
	
	signal mem_read		: std_logic;
	signal mem_done		: std_logic;
	signal b2b_start		: std_logic := '0';
	signal b2b_busy    		: std_logic := '0';

	signal mem_addr				: std_logic_vector(15 downto 0);
 	
	-- ARRAY length 3 for {opcode, operand, operand}
	type array_if is array(0 to 2) of std_logic_vector(7 downto 0);
	signal instr_reg	: array_if;
	
	
	--FSM signals
	TYPE state_type is (idle, wait_state, read_op, decode_op, wait_indirect_x, wait_indirect_y);
	signal state: state_type;

	signal counter	: unsigned(15 downto 0) := (others => '0');
	signal mem_addr_out : std_logic_vector(15 downto 0);

	--Behavioral design goes here	
	begin
	mem_addr_out_s <= mem_addr_out when (b2b_busy = '0' and b2b_start = '0') else mem_addr;
	b2b_inst : b2b_access
		port map( clk, rst, addr_1, addr_2, data_1, data_2, mem_read, mem_done, b2b_start, b2b_busy, mem_addr, mem_data_in);
	instr_valid <= '1' when state = idle else '0';
		instr_fetch_process : process(clk, rst)
		begin
		
	

		if rst = '0' then
			state <= idle;
			pc <= (others => '0');
			counter <= (others => '0');
		elsif (rising_edge(clk)) then
			case (state) is				
				when idle =>
					if (ie_ready = '1') then
						accessing_mem_bus <= '1'; -- 1 cycle delay
						--pc <= pc_ie; -- IE giving us new value for PC
						addr_pc <= std_logic_vector(resize(unsigned(pc_ie),16));
						mem_addr_out <= pc_ie;
						counter <= (others => '0');
						state <= wait_state;
					else 
						--state <= idle; --check
					end if;
					
					
				when wait_state =>
					addr_pc <= std_logic_vector(unsigned(addr_pc)+to_unsigned(1,16)); -- queue for next state, addr_pc = PC + 1 
					mem_addr_out <= addr_pc;
					state <= read_op;

				when read_op =>
					
					if counter >= to_unsigned(3,16) then
						state<= decode_op;
					else	
						mem_addr_out <= addr_pc;
						instr_reg(to_integer(counter)) <= mem_data_in; -- addr_pc would go into decoder module, and the data would go into instr_reg
						addr_pc <= std_logic_vector(unsigned(addr_pc)+to_unsigned(1,16));	
						counter <= unsigned(addr_pc) - resize(unsigned(pc_ie),16) - to_unsigned(1,16); --conversion needed
						state <= read_op;
					end if;
					
				
				when decode_op => --update pc, mem address, simplify opcode
					
					--Default flag assignments
					alu_op <= TRA_OP;
					mem_load_flag <= '0';
					store_flag <= "000";
					reg_load_flag <= A_REG_F;
					
					case (instr_reg(0)) is
										
						-- ADC -- simplified opcode: x"00" -- Add with Carry
						when x"6D" => --ADC_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"00";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= ADD_OP; -- add
							state <= idle;
							
						when x"7D" => --ADC_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"00";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= ADD_OP; -- add
							state <= idle;
							
						when x"79" => --ADC_ABSY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"00";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= ADD_OP; -- add
							state <= idle;
							
						when x"69" => --ADC_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"00";
							imm_mode <= '1';
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= ADD_OP; -- add
							state <= idle;
							
						when x"61" => --ADC_INDX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), x_reg, x"00");	
							addr_2 <= indirect_addr(instr_reg(1), x_reg, x"01");
							new_op <= x"00";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= ADD_OP; -- add
							state <= wait_indirect_x;
						
						when x"71" => --ADC_INDY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), y_reg, x"00");
							addr_2 <= indirect_addr(instr_reg(1), y_reg, x"01");
							new_op <= x"00";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= ADD_OP; -- add
							state <= wait_indirect_y;
						
						when x"65" => --ADC_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= x"00" & instr_reg(1);
							new_op <= x"00";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= ADD_OP; -- add
							state <= idle;
							
						when x"75" => --ADC_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"00";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= ADD_OP; -- add
							state <= idle;
							
							
						-- AND -- simplified opcode: x"01" -- Bitwise And with Accumulator
						when x"2D" => --AND_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"01";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= idle;
							
						when x"3D" => --AND_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"01";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= idle;
							
						when x"39" => --AND_ABSY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"01";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= idle;
							
						when x"29" => --AND_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"01";
							imm_mode <= '1';
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= idle;
							
						when x"21" => --AND_INDX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), x_reg, x"00"); -- (x"00" & operand1) + x_reg
							addr_2 <= indirect_addr(instr_reg(1), x_reg, x"01");
							new_op <= x"01";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= wait_indirect_x;
						
						when x"31" => --AND_INDY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), y_reg, x"00"); -- x"00" & operand1
							addr_2 <= indirect_addr(instr_reg(1), y_reg, x"01");
							new_op <= x"01";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= wait_indirect_y;
						
						when x"25" => --AND_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"01";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= idle;
							
						when x"35" => --AND_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"01";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= idle;
												
													
						-- ASL -- simplified opcode: x"02" -- Arithmetic Shift Left
						when x"0E" => --ASL_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"02";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"1E" => --ASL_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"02";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;

						when x"0A" => --ASL_ACC
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							addr_out <= std_logic_vector(resize(unsigned(acc_reg),16));
							new_op <= x"02";
							store_flag <= A_STORE; -- store in acc
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SHIFT_OP; -- shift
							state <= idle;

						when x"06" => --ASL_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"02";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
						
						when x"16" => --ASL_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"02";	
							store_flag <= MEM_STORE; -- store in mem	
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
						
						-- BIT -- simplified opcode: x"03" -- Test Bits
						when x"24" => --BIT_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"03";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= idle;
							
						when x"2C" => --BIT_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"03";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= AND_OP; -- and
							state <= idle;
						
--				-- branch					
						-- BCC -- simplified opcode: x"04" -- Branch on Carry Clear
						when x"90" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							new_op <= x"04";
							alu_op <= ADD_OP; -- add
							state <= idle;

						-- BCS -- simplified opcode: x"05" -- Branch on Carry Set
						when x"B0" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							new_op <= x"05";
							alu_op <= ADD_OP; -- add
							state <= idle;

						-- BEQ -- simplified opcode: x"06" -- Branch on Equal
						when x"F0" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							new_op <= x"06";
							alu_op <= ADD_OP; -- add
							state <= idle;

						-- BMI -- simplified opcode: x"07" -- Branch on Minus
						when x"30" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							new_op <= x"07";
							alu_op <= ADD_OP; -- add
							state <= idle;

						-- BNE -- simplified opcode: x"08" -- Branch on Not Equal
						when x"D0" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							new_op <= x"08";
							alu_op <= ADD_OP; -- add
							state <= idle;

						-- BPL -- simplified opcode: x"09" -- Branch on Plus
						when x"10" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							new_op <= x"09";
							alu_op <= ADD_OP; -- add
							state <= idle;

						-- BVC -- simplified opcode: x"0A" -- Branch on Overflow Clear
						when x"50" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							new_op <= x"0A";
							alu_op <= ADD_OP; -- add
							state <= idle;

						-- BVS -- simplified opcode: x"0B" -- Branch on Overflow Set
						when x"70" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							new_op <= x"0B";
							alu_op <= ADD_OP; -- add
							state <= idle;

							
--				
						-- BRK -- simplified opcode: x"0C" -- break
						when x"00" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"0C";
							state <= idle;
							
							
--				-- flag instructions
						-- CLC -- simplified opcode: x"0D" -- Clear Carry
						when x"18" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"0D";
							state <= idle;
						
						-- CLD -- simplified opcode: x"0E" -- Clear Decimal
						when x"D8" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"0E";
							state <= idle;
						
						-- CLI -- simplified opcode: x"0F" -- Clear Interrupt
						when x"58" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"0F";
							state <= idle;
						
						-- CLV -- simplified opcode: x"10" -- Clear Overflow
						when x"B8" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"10";
							state <= idle;
							
							
						-- CMP -- simplified opcode: x"11" -- Compare Accumulator
						when x"CD" => --CMP_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"11";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"DD" => --CMP_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"11";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
						
						when x"D9" => --CMP_ABSY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"11";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
						
						when x"C9" => --CMP_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"11";
							imm_mode <= '1';
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
						
						when x"C1" => --CMP_INDX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), x_reg, x"00"); -- (x"00" & operand1) + x_reg
							addr_2 <= indirect_addr(instr_reg(1), x_reg, x"01");
							new_op <= x"11";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= wait_indirect_x;
						
						when x"D1" => --CMP_INDY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), y_reg, x"00");-- x"00" & operand1
							addr_2 <= indirect_addr(instr_reg(1), y_reg, x"01");
							new_op <= x"11";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= wait_indirect_y;
						
						when x"C5" => --CMP_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"11";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
						
						when x"D5" => --CMP_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"11";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
							
						-- CPX -- simplified opcode: x"12" -- Compare X Register
						when x"EC" => --CPX_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"12";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= X_REG_F; --load from xreg
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"E0" => --CPX_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"12";
							imm_mode <= '1';
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= X_REG_F; --load from xreg
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"E4" => --CPX_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"12";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= X_REG_F; --load from xreg
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
							
						-- CPY -- simplified opcode: x"13" -- Compare Y Register
						when x"CC" => --CPY_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"13";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= Y_REG_F; --load from yreg
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"C0" => --CPY_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"13";
							imm_mode <= '1';
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= Y_REG_F; --load from yreg
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"C4" => --CPY_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"13";
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= Y_REG_F; --load from yreg
							alu_op <= SUB_OP; -- subtract
							state <= idle;
						
						
						-- DEC -- simplified opcode: x"14" -- Decrement Memory
						when x"CE" => --DEC_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"14";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"DE" => --DEC_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"14";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SUB_OP; -- subtract
							state <= idle;
						
						when x"C6" => --DEC_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"14";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SUB_OP; -- subtract
							state <= idle;
						
						when x"D6" => --DEC_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"14";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SUB_OP; -- subtract
							state <= idle;
						
						
--				-- register instructions
						-- DEX -- simplified opcode: x"15"
						when x"CA" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"15";
							store_flag <= X_STORE; -- store in xreg
							reg_load_flag <= X_REG_F; --load from xreg
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						-- DEY -- simplified opcode: x"16"
						when x"88" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"16";
							store_flag <= Y_STORE; -- store in yreg
							reg_load_flag <= Y_REG_F; --load from yreg
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
							
						-- EOR -- simplified opcode: x"17" -- Bitwise Exclusive OR
						when x"4D" => --EOR_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"17";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= XOR_OP; -- xor
							state <= idle;
							
						when x"5D" => --EOR_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"17";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= XOR_OP; -- xor
							state <= idle;
						
						when x"59" => --EOR_ABSY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"17";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= XOR_OP; -- xor
							state <= idle;
						
						when x"49" => --EOR_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"17";
							imm_mode <= '1';
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= XOR_OP; -- xor
							state <= idle;
						
						when x"41" => --EOR_INDX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), x_reg, x"00"); -- (x"00" & operand1) + x_reg
							addr_2 <= indirect_addr(instr_reg(1), x_reg, x"01");
							new_op <= x"17";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= XOR_OP; -- xor
							state <= wait_indirect_x;
						
						when x"51" => --EOR_INDY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), y_reg, x"00"); -- x"00" & operand1
							addr_2 <= indirect_addr(instr_reg(1), y_reg, x"01");
							new_op <= x"17";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= XOR_OP; -- xor
							state <= wait_indirect_y;
						
						when x"45" => --EOR_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"17";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= XOR_OP; -- xor
							state <= idle;
						
						when x"55" => --EOR_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"17";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= XOR_OP; -- xor
							state <= idle;
							
							
--				-- halt
						-- HLT -- simplified opcode: x"18"
						when x"02" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 2
							new_op <= x"18";
							state <= idle;
							
						
						-- INC -- simplified opcode: x"19" -- Increment Memory
						when x"EE" => --INC_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"19";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= MEM_REG_F;-- load memory into input a
							alu_op <= ADD_OP; -- add
							state <= idle;
							
						when x"FE" => --INC_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"19";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= ADD_OP; -- add
							state <= idle;
						
						when x"E6" => --INC_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"19";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= ADD_OP; -- add
							state <= idle;
						
						when x"F6" => --INC_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"19";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= ADD_OP; -- add
							state <= idle;

							
--				-- register instructions
						-- INX -- simplified opcode: x"1A"
						when x"E8" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 2
							new_op <= x"1A";
							store_flag <= X_STORE; -- store in xreg
							reg_load_flag <= X_REG_F; --load from xreg
							alu_op <= ADD_OP; -- add to xreg
							state <= idle;
							
						-- INY -- simplified opcode: x"1B"
						when x"C8" =>
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 2
							new_op <= x"1B";
							store_flag <= Y_STORE; -- store in yreg
							reg_load_flag <= Y_REG_F; --load from yreg
							alu_op <= ADD_OP; -- add to yreg
							state <= idle;
							
							
						-- JMP -- simplified opcode: x"1C" -- Jump
						when x"4C" => --JMP_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"1C";
							alu_op <= ADD_OP; -- add to PC
							state <= idle;

						when x"6C" => --JMP_IND
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_1 <= (instr_reg(2) & instr_reg(1));
							addr_2 <= (instr_reg(2) & instr_reg(1)) + 1;
							new_op <= x"1C";
							alu_op <= ADD_OP; -- add to PC
							state <= wait_indirect_x;
							

						-- JSR -- simplified opcode: x"1D" -- Jump to Subroutine
						when x"20" => --JSR_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"1D";
							store_flag <= MEM_STORE; -- store in mem in stack
							alu_op <= SUB_OP; -- sub from SP
							state <= idle;
							
						
						-- LDA -- simplified opcode: x"1E" -- Load Accumulator
						when x"AD" => --LDA_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"1E";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
							
						when x"BD" => --LDA_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"1E";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
						
						when x"B9" => --LDA_ABSY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"1E";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
						
						when x"A9" => --LDA_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"1E";
							imm_mode <= '1';
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRB_OP; --transfer immediate value on input B to output
							state <= idle;
						
						when x"A1" => --LDA_INDX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), x_reg, x"00"); -- (x"00" & operand1) + x_reg
							addr_2 <= indirect_addr(instr_reg(1), x_reg, x"01");
							new_op <= x"1E";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							b2b_start <= '1';
							state <= wait_indirect_x;
						
						when x"B1" => --LDA_INDY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), y_reg, x"00");			
							addr_2 <= indirect_addr(instr_reg(1), y_reg, x"01");
							new_op <= x"1E";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							b2b_start <= '1';
							state <= wait_indirect_y;
						
						when x"A5" => --LDA_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"1E";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
						
						when x"B5" => --LDA_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"1E";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;

							
						-- LDX -- simplified opcode: x"1F" -- Load X Register
						when x"AE" => --LDX_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"1F";
							store_flag <= X_STORE; -- store in xreg
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
							
						when x"BE" => --LDX_ABSY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"1F";
							store_flag <= X_STORE; -- store in xreg
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output 
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
							
						when x"A2" => --LDX_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"1F";
							imm_mode <= '1';
							store_flag <= X_STORE; -- store in xreg
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRB_OP;
							state <= idle;
							
						when x"A6" => --LDX_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"1F";
							store_flag <= X_STORE; -- store in xreg
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
							
						when x"B6" => --LDX_ZPY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + y_reg;
							new_op <= x"1F";
							store_flag <= X_STORE; -- store in xreg
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
							
							
						-- LDY -- simplified opcode: x"20" -- Load Y Register
						when x"AC" => --LDY_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"20";
							store_flag <= Y_STORE; -- store in yreg
							mem_load_flag <= '1'; -- load from mem
							state <= idle;
							
						when x"BC" => --LDY_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"20";
							store_flag <= Y_STORE; -- store in yreg
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
							
						when x"A0" => --LDY_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(unsigned(addr_pc) - to_unsigned(1,16));
							new_op <= x"20";
							imm_mode <= '1';
							store_flag <= Y_STORE; -- store in yreg
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRB_OP;--Immediate automatically loaded into input B
							state <= idle;
							
						when x"A4" => --LDY_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"20";
							store_flag <= Y_STORE; -- store in yreg
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
							
						when x"B4" => --LDY_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"20";
							store_flag <= Y_STORE; -- store in yreg
							mem_load_flag <= '1'; -- load from mem
							alu_op <= TRA_OP;--Transfer A input (mem result) to output (A)
							reg_load_flag <= MEM_REG_F; -- Load mem result into input A
							state <= idle;
							
							
						-- LSR -- simplified opcode: x"21" -- Logical Shift Right
						when x"4E" => --LSR_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"21";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							
						when x"5E" => --LSR_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"21";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
					
						when x"4A" => --LSR_ACC
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize(unsigned(acc_reg),16));
							new_op <= x"21";
							store_flag <= A_STORE; -- store in acc
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"46" => --LSR_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"21";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"56" => --LSR_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"21";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
							
						-- NOP -- simplified opcode: x"22" -- No Operation
						when x"EA" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"22";
							state <= idle;
							
							
						-- ORA -- simplified opcode: x"23" -- bitwise OR with Accumulator
						when x"0D" => --ORA_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"23";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= OR_OP; -- or
							state <= idle;
							
						when x"1D" => --ORA_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"23";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= OR_OP; -- or
							state <= idle;
							
						when x"19" => --ORA_ABSY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"23";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= OR_OP; -- or
							state <= idle;
							
						when x"09" => --ORA_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"23";
							imm_mode <= '1';
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= OR_OP; -- or
							state <= idle;
							
						when x"01" => --ORA_INDX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), x_reg, x"00"); -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_2 <= indirect_addr(instr_reg(1), x_reg, x"01");
							new_op <= x"23";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= OR_OP; -- or
							state <= wait_indirect_x;
							
						when x"11" => --ORA_INDY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), y_reg, x"00"); -- "00" & LSB
							addr_2 <= indirect_addr(instr_reg(1), y_reg, x"01");
							new_op <= x"23";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= OR_OP; -- or
							state <= wait_indirect_y;
							
						when x"05" => --ORA_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"23";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= OR_OP; -- or
							state <= idle;
							
						when x"15" => --ORA_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"23";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= OR_OP; -- or
							state <= idle;
							
							
						-- PHA -- simplified opcode: x"24" -- Push Accumulator
						when x"48" => 
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"24";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract from SP
							state <= idle;
							
							
						-- PHP -- simplified opcode: x"25" -- Push Processor Status
						when x"08" => 
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"25";
							store_flag <= MEM_STORE; -- store in mem
							alu_op <= SUB_OP; -- subtract from SP
							state <= idle;
							
							
						-- PLA -- simplified opcode: x"26" -- Pull/Pop Accumulator
						when x"68" => 
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"26";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							alu_op <= ADD_OP; -- add to SP
							state <= idle;
							
							
						-- PLP -- simplified opcode: x"27" -- Pull/Pop Processor Status
						when x"28" => 
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"27";
							mem_load_flag <= '1'; -- load from mem
							alu_op <= ADD_OP; -- add to SP
							state <= idle;
							store_flag <= STATUS_STORE;
							
							
						-- ROL -- simplified opcode: x"28" -- Rotate Left
						when x"2E" => --ROL_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"28";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"3E" => --ROL_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"28";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"2A" => --ROL_ACC
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize(unsigned(acc_reg),16));
							new_op <= x"28";
							store_flag <= A_STORE; -- store in acc
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"26" => --ROL_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"28";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"36" => --ROL_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"28";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
						
						
						-- ROR -- simplified opcode: x"29" -- Rotate Right
						when x"6E" => --ROR_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"29";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"7E" => --ROR_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"29";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"6A" => --ROR_ACC
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize(unsigned(acc_reg),16));
							new_op <= x"29";
							store_flag <= A_STORE; -- store in acc
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"66" => --ROR_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"29";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
							
						when x"76" => --ROR_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"29";
							store_flag <= MEM_STORE; -- store in mem
							mem_load_flag <= '1'; -- load from mem
							alu_op <= SHIFT_OP; -- shift
							state <= idle;
						
						
						-- RTI -- simplified opcode: x"2A" -- Return from Interrupt
						when x"40" => --RTI -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"2A";
							state <= idle;
							
							
						-- RTS -- simplified opcode: x"2B" -- Return from Subroutine
						when x"60" => --RTS -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"2B";
							state <= idle;
							
							
						-- SBC -- simplified opcode: x"2D" -- Subtract with Carry
						when x"ED" => --SBC_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"2D";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"FD" => --SBC_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"2D";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"F9" => --SBC_ABSY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"2D";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"E9" => --SBC_IMM
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= std_logic_vector(resize((unsigned(addr_pc) - to_unsigned(1,8)), 16));
							new_op <= x"2D";
							imm_mode <= '1';
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"E1" => --SBC_INDX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), x_reg, x"00"); -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_2 <= indirect_addr(instr_reg(1), x_reg, x"01");
							new_op <= x"2D";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= wait_indirect_x;
							
						when x"F1" => --SBC_INDY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), y_reg, x"00"); -- "00" & LSB
							addr_2 <= indirect_addr(instr_reg(1), y_reg, x"01");
							new_op <= x"2D";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= wait_indirect_y;
							
						when x"E5" => --SBC_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"2D";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
						when x"F5" => --SBC_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"2D";
							store_flag <= A_STORE; -- store in acc
							mem_load_flag <= '1'; -- load from mem
							reg_load_flag <= A_REG_F; --load from acc
							alu_op <= SUB_OP; -- subtract
							state <= idle;
							
							
						-- SEC -- simplified opcode: x"2E" -- Set Carry
						when x"38" => --SEC -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"2E";
							state <= idle;
							
							
						-- SED -- simplified opcode: x"2F" -- Set Decimal
						when x"F8" => --SED -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"2F";
							state <= idle;
							
							
						-- SEI -- simplified opcode: x"30" -- Set Interrupt
						when x"78" => --SEI -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"30";
							state <= idle;
							
							
						-- STA -- simplified opcode: x"31" -- Store Accumulator
						when x"8D" => --STA_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"31";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= A_REG_F; --load from acc
							state <= idle;
							
						when x"9D" => --STA_ABSX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + x_reg;
							new_op <= x"31";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= A_REG_F; --load from acc
							state <= idle;
							
						when x"99" => --STA_ABSY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1)) + y_reg;
							new_op <= x"31";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= A_REG_F; --load from acc
							state <= idle;
							
						when x"81" => --STA_INDX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), x_reg, x"00");
							addr_2 <= indirect_addr(instr_reg(1), x_reg, x"01");
							new_op <= x"31";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= A_REG_F; --load from acc
							state <= wait_indirect_x;
							
						when x"91" => --STA_INDY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_1 <= indirect_addr(instr_reg(1), y_reg, x"00");
							addr_2 <= indirect_addr(instr_reg(1), y_reg, x"01");
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"31";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= A_REG_F; --load from acc
							state <= wait_indirect_y;
							
						when x"85" => --STA_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"31";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= A_REG_F; --load from acc
							state <= idle;
							
						when x"95" => --STA_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"31";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= A_REG_F; --load from acc
							state <= idle;
							
							
						-- STX -- simplified opcode: x"32" -- Store X Register
						when x"8E" => --STX_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"32";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= X_REG_F; --load from xreg
							state <= idle;
							
						when x"86" => --STX_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"32";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= X_REG_F; --load from xreg
							state <= idle;
							
						when x"96" => --STX_ZPY
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + y_reg;
							new_op <= x"32";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= X_REG_F; --load from xreg
							state <= idle;
							
						-- STY -- simplified opcode: x"33" -- Store Y Register
						when x"8C" => --STY_ABS
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(3,16)); --length 3
							addr_out <= (instr_reg(2) & instr_reg(1));
							new_op <= x"33";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= Y_REG_F; --load from yreg
							state <= idle;
							
						when x"84" => --STY_ZP
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1));
							new_op <= x"33";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= Y_REG_F; --load from yreg
							state <= idle;
							
						when x"94" => --STY_ZPX
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(2,16)); --length 2
							addr_out <= (x"00" & instr_reg(1)) + x_reg;
							new_op <= x"33";
							store_flag <= MEM_STORE; -- store in mem
							reg_load_flag <= Y_REG_F; --load from yreg
							state <= idle;
							
							
						-- TAX -- simplified opcode: x"34" -- Transfer A to X
						when x"AA" => --TAX -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"34";
							store_flag <= X_STORE; -- store in xreg
							reg_load_flag <= A_REG_F; --load from acc
							state <= idle;
							
							
						-- TAY -- simplified opcode: x"35" -- Transfer A to Y
						when x"A8" => --TAY -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"35";
							store_flag <= Y_STORE; -- store in yreg
							reg_load_flag <= A_REG_F; --load from acc
							state <= idle;
							
							
						-- TSX -- simplified opcode: x"36" -- Transfer Stack Pointer to X
						when x"BA" => --TSX -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"36";
							store_flag <= X_STORE; -- store in xreg
							state <= idle;
							
							
						-- TXA -- simplified opcode: x"37" -- Transfer X to A
						when x"8A" => --TXA -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"37";
							store_flag <= A_STORE; -- store in acc
							reg_load_flag <= X_REG_F; --load from xreg
							state <= idle;
							
							
						-- TXS -- simplified opcode: x"38" -- Transfer X to Stack Pointer
						when x"9A" => --TXS -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"38";
							reg_load_flag <= X_REG_F; --load from xreg
							state <= idle;
							
							
						-- TYA -- simplified opcode: x"39" -- Transfer Y to A
						when x"98" => --TYA -- GO OVER
							pc <= std_logic_vector(unsigned(pc_ie) + to_unsigned(1,16)); --length 1
							new_op <= x"39";	
							store_flag <= A_STORE; -- store in acc
							reg_load_flag <= Y_REG_F; --load from yreg
							state <= idle;
							
						
						-- OTHERS
						when OTHERS =>
							new_op <= x"22";
							instr_valid <= '0';
							state <= idle;
						end case;
						
				when wait_indirect_x =>
						if mem_done = '1' then
							addr_out <= data_2 & data_1;
							state <= idle;
						end if;
				
				when wait_indirect_y =>
						b2b_start <= '0';
						if mem_done = '1' then
							addr_out <= (data_2 & data_1) + y_reg;
							state <= idle;	
						end if;	
						
				when OTHERS =>
					state <= idle;

				end case;
		end if;
		end process instr_fetch_process;
	
--	clk_process: process(rst, clk)   
--		begin
--		if (rst = '0') then
--			state <= idle;
--		elsif(rising_edge(clk)) then
--			state <= state;
--		end if;
--	end process clk_process;
end architecture a;