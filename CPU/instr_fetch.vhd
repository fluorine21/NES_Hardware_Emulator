library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity instr_fetch is
	port(

			signal clk: in std_logic;
			signal rst: in std_logic;
			signal ready:	in std_logic; --start
		
			--memory bus
			signal data_in: in std_logic_vector(7 downto 0); --data input bus
			signal data_out: out std_logic_vector(7 downto 0); -- data output bus
			signal addr_out: out std_logic_vector(15 downto 0); -- address bus going from IF to IE
			signal addr_in: out std_logic_vector(15 downto 0); -- address bus going from IE to IF
			signal ctrl_out: out std_logic_vector(7 downto 0); -- control bus
			
			signal done: out std_logic;
			signal new_op: out std_logic_vector(7 downto 0);
			
			-- special purpose registers
			signal x_reg: in std_logic_vector(7 downto 0); 
			signal y_reg: in std_logic_vector(7 downto 0); 
			signal acc_reg: in std_logic_vector(7 downto 0);
			
		-- PORT MAP
			-- b2b memory access
			signal addr_1		: out std_logic_vector(15 downto 0);
			signal addr_2		: out std_logic_vector(15 downto 0);
			
			signal data_1		: in std_logic_vector(7 downto 0);
			signal data_2		: in std_logic_vector(7 downto 0)
			
			-- b2b memory access
			signal addr_1		: out std_logic_vector(15 downto 0);
			signal addr_2		: out std_logic_vector(15 downto 0);
			
			signal data_1		: in std_logic_vector(7 downto 0);
			signal data_2		: in std_logic_vector(7 downto 0);
			
			
		);
end entity instr_fetch;

architecture a of instr_fetch is

	

	--Signals and components go here 
	constant ADC_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"6D");
	constant ADC_ABSX : std_logic_vector (7 downto 0) := to_stdlogicvector(x"7D");
	constant ADC_ABSY : std_logic_vector (7 downto 0) := to_stdlogicvector(x"79");
	constant ADC_IMM	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"69");
	constant ADC_INDX : std_logic_vector (7 downto 0) := to_stdlogicvector(x"61");
	constant ADC_INDY : std_logic_vector (7 downto 0) := to_stdlogicvector(x"71");
	constant ADC_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"65");
	constant ADC_ZPX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"75");
	
	constant AND_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"2D");
	constant AND_ABSX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"3D");
	constant AND_ABSY	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"39");
	constant AND_IMM	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"29");
	constant AND_INDX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"21");
	constant AND_INDY	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"31");
	constant AND_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"25");
	constant AND_ZPX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"35");
	
	constant ASL_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"0E");
	constant ASL_ABSX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"1E");
	constant ASL_ACC	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"0A");
	constant ASL_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"06");
	constant ASL_ZPX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"16");
	
	constant BCC		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"90");
	
	constant BCS		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"B0");
	
	constant BEQ		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"F0");
	
	constant BIT_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"2C");
	constant BIT_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"24");
	
	constant BMI		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"30");
	
	constant BNE		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"D0");
	
	constant BPL		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"10");
	
	constant BRK		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"00");
	
	constant BVC		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"50");
	
	constant BVS		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"70");
	
	constant CLC		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"18");
	
	constant CLD		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"D8");
	
	constant CLI		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"58");
	
	constant CLV		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"B8");
	
	constant CMP_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"CD");
	constant CMP_ABSX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"DD");
	constant CMP_ABSY	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"D9");
	constant CMP_IMM	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"C9");
	constant CMP_INDX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"C1");
	constant CMP_INDY	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"D1");
	constant CMP_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"C5");
	constant CMP_ZPX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"D5");
	
	constant CPX_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"EC");
	constant CPX_IMM	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"E0");
	constant CPX_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"E4");
	
	constant CPY_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"CC");
	constant CPY_IMM	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"C0");
	constant CPY_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"C4");
	
	constant DEC_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"CE");
	constant DEC_ABSX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"DE");
	constant DEC_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"C6");
	constant DEC_ZPX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"D6");
	
	constant DEX		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"CA");
	constant DEY		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"88");
	
	constant EOR_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"4D");
	constant EOR_ABSX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"5D");
	constant EOR_ABSY	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"59");
	constant EOR_IMM	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"49");
	constant EOR_INDX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"41");
	constant EOR_INDY	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"51");
	constant EOR_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"45");
	constant EOR_ZPX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"55");
	
	constant HLT		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"02");
	
	constant INC_ABS	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"EE");
	constant INC_ABSX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"FE");
	constant INC_ZP	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"E6");
	constant INC_ZPX	: std_logic_vector (7 downto 0) := to_stdlogicvector(x"F6");
	
	constant INX		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"E8");
	
	constant INY		: std_logic_vector (7 downto 0) := to_stdlogicvector(x"C8");
	
	constant JMP_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"4C");
	constant JMP_IND	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"6C");

	constant JSR		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"20");

	constant LDA_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"AD");
	constant LDA_ABSX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"BD");
	constant LDA_ABSY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"B9");
	constant LDA_IMM	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"A9");
	constant LDA_INDX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"A1");
	constant LDA_INDY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"B1");
	constant LDA_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"A5");
	constant LDA_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"B5");

	constant LDX_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"AE");
	constant LDX_ABSY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"BE");
	constant LDX_IMM	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"A2");
	constant LDX_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"A6");
	constant LDX_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"B6");
	
	constant LDY_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"AC");
	constant LDY_ABSX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"BC");
	constant LDY_IMM	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"A0");
	constant LDY_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"A4");
	constant LDY_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"B4");

	constant LSR_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"4E");
	constant LSR_ABSX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"5E");
	constant LSR_ACC	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"4A");
	constant LSR_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"46");
	constant LSR_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"56");

	constant NOP		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"EA");

	constant ORA_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"0D");
	constant ORA_ABSX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"1D");
	constant ORA_ABSY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"19");
	constant ORA_IMM	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"09");
	constant ORA_INDX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"01");
	constant ORA_INDY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"11");
	constant ORA_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"05");
	constant ORA_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"15");

	constant PHA		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"48");

	constant PHP		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"08");

	constant PLA		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"68");

	constant PLP		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"28");

	constant ROL_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"2E");
	constant ROL_ABSX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"3E");
	constant ROL_ACC	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"2A");
	constant ROL_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"26");
	constant ROL_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"36");

	constant ROR_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"6E");
	constant ROR_ABSX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"7E");
	constant ROR_ACC	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"6A");
	constant ROR_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"66");
	constant ROR_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"76");

	constant RTI		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"40");

	constant RTS		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"60");

	constant SBC_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"ED");
	constant SBC_ABSX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"FD");
	constant SBC_ABSY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"F9");
	constant SBC_IMM	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"E9");
	constant SBC_INDX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"E1");
	constant SBC_INDY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"F1");
	constant SBC_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"E5");
	constant SBC_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"F5");

	constant SEC		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"38");

	constant SED		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"F8");

	constant SEI		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"78");

	constant STA_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"8D");
	constant STA_ABSX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"9D");
	constant STA_ABSY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"99");
	constant STA_INDX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"81");
	constant STA_INDY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"91");
	constant STA_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"85");
	constant STA_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"95");

	constant STX_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"8E");
	constant STX_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"86");
	constant STX_ZPY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"96");

	constant STY_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"8C");
	constant STY_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"84");
	constant STY_ZPX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"94");

	constant TAX		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"AA");

	constant TAY		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"A8");

	constant TSX		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"BA");

	constant TXA		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"8A");

	constant TXS		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"9A");

	constant TYA		: std_logic_vector(7 downto 0) := to_stdlogicvector(x"98");
	
	

	signal opcode			: std_logic_vector(15 downto 0); --{opcode, operand}
	signal pc				: std_logic_vector(7 downto 0); --assuming PC is holding memory address
	signal addr_pc			: std_logic_vector(7 downto 0);
	signal addr_temp		: std_logic_vector(7 downto 0);
	 
	signal instr_valid, ie_ready, accessing_mem_bus	: std_logic := '0'; --	1 means ready	
	
	-- ARRAY length 3 for {opcode, operand, operand}
	type array_if is array(natural range <>) of std_logic_vector(7 downto 0);
	signal instr_reg	: array_if(0 to 2);
	
	
	
	--FSM signals
	signal done_o, done_c: std_logic := 0;
	
	
	TYPE state_type is (idle, read_op, decode_op);
	signal state, next_state: state_type;


	--Behavioral design goes here	
	begin

		comb_process : process()
		
		variable counter	: unsigned(2 downto 0) := 0;

		
		begin
			case (state) is
			
				pc <= addr_in;
			
				when idle =>
					--instr_valid <= '0';
					if ie_ready = true then
						accessing_mem_bus <= '0'; -- 1 cycle delay
						pc <= pc_ie -- IE giving us new value for PC
						addr_in <= pc;
						state <= wait_state;
					else 
						state <= idle; --check
					end if
					
					
				when wait_state =>
						addr_in <= std_logic_vector(unsigned(addr_in)+to_unsigned(1,16)); -- queue for next state, addr_pc = PC + 1 
					state <= read_op;

				when read_op =>
					counter<= addr_in - pc - '1'; --conversion needed
					if counter >= '3' then
						state<= decode_op;
					else	
						--QUESTION: indexing syntax? is counter correct type? 
						instr_reg(counter) <= addr_in; -- addr_in would go into decoder module, and the data would go into instr_reg
						addr_in <= std_logic_vector(unsigned(addr_in)+to_unsigned(1,16));
						state <= read_op;
					end if 
					
				
				when decode_op => --update pc, mem address, simplify opcode
					case (instr_reg[0]) is
															
						-- ADC -- simplified opcode: x"00" -- Add with Carry
						when x"6D" => --ADC_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"00";
							
						when x"7D" => --ADC_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"00";
						
						when x"79" => --ADC_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"00";
						
						when x"69" => --ADC_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"00";
						
						when x"61" => --ADC_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
<<<<<<< HEAD
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- (x"00" & operand1) + x_reg
							addr_2 <= addr_1 + x"01";
							addr_out <= data_2 & data_1;
							new_op <= x"00";
						
						when x"71" => --ADC_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- x"00" & operand1
							addr_2 <= addr_1 + x"01";
=======
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_2 <= addr_1 + x"01" 
							addr_out <= data_2 & data_1;
							new_op <= x"00";
						when x"71" => --ADC_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- "00" & LSB
							addr_2 <= addr_1 + x"01" 
>>>>>>> 3ba687d0b44fcd99341342186eac8bf933c5c584
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"00";
						
						when x"65" => --ADC_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"00";
						
						when x"75" => --ADC_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"00";
							
						
							
						-- LDX -- simplified opcode: x"1F" -- Load X Register
						when x"AE" => --LDX_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"1F";
						when x"BE" => --LDX_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"1F";
						when x"A2" => --LDX_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"1F";
						when x"A6" => --LDX_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"1F";
						when x"B6" => --LDX_ZPY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + y_reg;
							new_op <= x"1F";
							
						-- LDY -- simplified opcode: x"20" -- Load Y Register
						when x"AC" => --LDY_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"20";
						when x"BC" => --LDY_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"20";
						when x"A0" => --LDY_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"20";
						when x"A4" => --LDY_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"20";
						when x"B4" => --LDY_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"20";
							
						-- LSR -- simplified opcode: x"21" -- Logical Shift Right
						when x"4E" => --LSR_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"21";
						when x"5E" => --LSR_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"21";
						when x"4A" => --LSR_ACC
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= acc_reg;
							new_op <= x"21";
						when x"46" => --LSR_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"21";
						when x"56" => --LSR_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"21";
							
						-- NOP -- simplified opcode: x"22" -- No Operation
						when x"EA" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"22";
							
<<<<<<< HEAD
						-- AND -- simplified opcode: x"01" -- Bitwise And with Accumulator
						when x"2D" => --AND_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"01";
							
						when x"3D" => --AND_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"01";
						
						when x"39" => --AND_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"01";
						
						when x"29" => --AND_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"01";
						
						when x"21" => --AND_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- (x"00" & operand1) + x_reg
							addr_2 <= addr_1 + x"01";
							addr_out <= data_2 & data_1;
							new_op <= x"01";
						
						when x"31" => --AND_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- x"00" & operand1
							addr_2 <= addr_1 + x"01";
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"01";
						
						when x"25" => --AND_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"01";
						
						when x"35" => --AND_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"01";
													
													
						-- ASL -- simplified opcode: x"02" -- Arithmetic Shift Left
						when x"0E" => --ASL_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"02";
							
						when x"1E" => --ASL_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"02";
						
						when x"0A" => --ASL_ACC
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							addr_out <= acc_reg;
							new_op <= x"02";
						
						when x"06" => --ASL_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"02";
						
						when x"16" => --ASL_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"02";		
			
						
						-- BIT -- simplified opcode: x"03" -- Test Bits
						when x"24" => --BIT_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"03";
							
						when x"2C" => --BIT_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"03";
						
						
--				-- branch					
						-- BCC -- simplified opcode: x"04" -- Branch on Carry Clear
						when x"90" =>
							new_op <= x"04";

						-- BCS -- simplified opcode: x"05" -- Branch on Carry Set
						when x"B0" =>
							new_op <= x"05";

						-- BEQ -- simplified opcode: x"06" -- Branch on Equal
						when x"F0" =>
							new_op <= x"06";

						-- BMI -- simplified opcode: x"07" -- Branch on Minus
						when x"30" =>
							new_op <= x"07";

						-- BNE -- simplified opcode: x"08" -- Branch on Not Equal
						when x"D0" =>
							new_op <= x"08";

						-- BPL -- simplified opcode: x"09" -- Branch on Plus
						when x"10" =>
							new_op <= x"09";

						-- BVC -- simplified opcode: x"0A" -- Branch on Overflow Clear
						when x"50" =>
							new_op <= x"0A";

						-- BVS -- simplified opcode: x"0B" -- Branch on Overflow Set
						when x"70" =>
							new_op <= x"0B";

							
--				
						-- BRK -- simplified opcode: x"0C" -- break
						when x"00" =>
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"0C";
							
							
--				-- flag instructions
						-- CLC -- simplified opcode: x"0D" -- Clear Carry
						when x"18" =>
							new_op <= x"0D";
						
						-- CLD -- simplified opcode: x"0E" -- Clear Decimal
						when x"D8" =>
							new_op <= x"0E";
						
						-- CLI -- simplified opcode: x"0F" -- Clear Interrupt
						when x"58" =>
							new_op <= x"0F";
						
						-- CLV -- simplified opcode: x"10" -- Clear Overflow
						when x"B8" =>
							new_op <= x"10";
							
							
						-- CMP -- simplified opcode: x"11" -- Compare Accumulator
						when x"CD" => --CMP_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"11";
							
						when x"DD" => --CMP_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"11";
						
						when x"D9" => --CMP_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"11";
						
						when x"C9" => --CMP_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"11";
						
						when x"C1" => --CMP_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- (x"00" & operand1) + x_reg
							addr_2 <= addr_1 + x"01";
							addr_out <= data_2 & data_1;
							new_op <= x"11";
						
						when x"D1" => --CMP_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- x"00" & operand1
							addr_2 <= addr_1 + x"01";
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"11";
						
						when x"C5" => --CMP_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"11";
						
						when x"D5" => --CMP_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"11";
							
							
						-- CPX -- simplified opcode: x"12" -- Compare X Register
						when x"EC" => --CPX_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"12";
							
						when x"E0" => --CPX_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"12";
							
						when x"E4" => --CPX_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"12";
							
							
						-- CPY -- simplified opcode: x"13" -- Compare Y Register
						when x"CC" => --CPY_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"13";
							
						when x"C0" => --CPY_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"13";
							
						when x"C4" => --CPY_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"13";
						
						
						-- DEC -- simplified opcode: x"14" -- Decrement Memory
						when x"CE" => --DEC_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"14";
							
						when x"DE" => --DEC_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"14";
						
						when x"C6" => --DEC_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"14";
						
						when x"D6" => --DEC_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"14";
						
						
--				-- register instructions
						-- DEX -- simplified opcode: x"15"
						when x"CA" =>
							new_op <= x"15";
							
						-- DEY -- simplified opcode: x"16"
						when x"88" =>
							new_op <= x"16";
							
							
						-- EOR -- simplified opcode: x"17" -- Bitwise Exclusive OR
						when x"4D" => --EOR_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"17";
							
						when x"5D" => --EOR_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"17";
						
						when x"59" => --EOR_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"17";
						
						when x"49" => --EOR_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"17";
						
						when x"41" => --EOR_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- (x"00" & operand1) + x_reg
							addr_2 <= addr_1 + x"01";
							addr_out <= data_2 & data_1;
							new_op <= x"17";
						
						when x"51" => --EOR_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- x"00" & operand1
							addr_2 <= addr_1 + x"01";
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"17";
						
						when x"45" => --EOR_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"17";
						
						when x"55" => --EOR_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"17";
							
							
--				-- halt
						-- HLT -- simplified opcode: x"18"
						when x"02" =>
							new_op <= x"18";
							
						
						-- INC -- simplified opcode: x"19" -- Increment Memory
						when x"EE" => --INC_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"19";
							
						when x"FE" => --INC_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"19";
						
						when x"E6" => --INC_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"19";
						
						when x"F6" => --INC_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"19";

							
--				-- register instructions
						-- INX -- simplified opcode: x"1A"
						when x"CA" =>
							new_op <= x"1A";
							
						-- INY -- simplified opcode: x"1B"
						when x"88" =>
							new_op <= x"1B";
							
							
						-- JMP -- simplified opcode: x"1C" -- Jump
						when x"4C" => --JMP_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"1C";

						when x"6C" => --JMP_IND
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_1 <= instr_reg[2] & instr_reg[1];
							addr_2 <= addr_1 + x"01";
							addr_out <= (data_2 & data_1);
							new_op <= x"1C";
							

						-- JSR -- simplified opcode: x"1D" -- Jump to Subroutine
						when x"20" => --JSR_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"1D";
							
						
						-- LDA -- simplified opcode: x"1E" -- Load Accumulator
						when x"AD" => --LDA_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"1E";
							
						when x"BD" => --LDA_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"1E";
						
						when x"B9" => --LDA_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"1E";
						
						when x"A9" => --LDA_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"1E";
						
						when x"A1" => --LDA_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- (x"00" & operand1) + x_reg
							addr_2 <= addr_1 + x"01";
							addr_out <= data_2 & data_1;
							new_op <= x"1E";
						
						when x"B1" => --LDA_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- x"00" & operand1
							addr_2 <= addr_1 + x"01";
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"1E";
						
						when x"A5" => --LDA_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"1E";
						
						when x"B5" => --LDA_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"1E";

							
						-- LDX -- simplified opcode: x"1F" -- Load X Register
						when x"AE" => --LDX_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"1F";
						when x"BE" => --LDX_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"1F";
						when x"A2" => --LDX_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"1F";
						when x"A6" => --LDX_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"1F";
						when x"B6" => --LDX_ZPY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + y_reg;
							new_op <= x"1F";
							
						-- LDY -- simplified opcode: x"20" -- Load Y Register
						when x"AC" => --LDY_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"20";
						when x"BC" => --LDY_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"20";
						when x"A0" => --LDY_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"20";
						when x"A4" => --LDY_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"20";
						when x"B4" => --LDY_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"20";
							
						-- LSR -- simplified opcode: x"21" -- Logical Shift Right
						when x"4E" => --LSR_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"21";
						when x"5E" => --LSR_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"21";
						when x"4A" => --LSR_ACC
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= acc_reg;
							new_op <= x"21";
						when x"46" => --LSR_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"21";
						when x"56" => --LSR_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"21";
							
						-- NOP -- simplified opcode: x"22" -- No Operation
						when x"EA" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"22";
							
						-- ORA -- simplified opcode: x"23" -- bitwise OR with Accumulator
						when x"0D" => --ORA_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"23";
						when x"1D" => --ORA_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"23";
						when x"19" => --ORA_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"23";
						when x"09" => --ORA_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"23";
						when x"01" => --ORA_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_2 <= addr_1 + x"01" 
							addr_out <= data_2 & data_1;
							new_op <= x"23";
						when x"11" => --ORA_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- "00" & LSB
							addr_2 <= addr_1 + x"01" 
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"23";
						when x"05" => --ORA_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"23";
						when x"15" => --ORA_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"23";
							
						-- PHA -- simplified opcode: x"24" -- Push Accumulator
						when x"48" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"24";
							
						-- PHP -- simplified opcode: x"25" -- Push Processor Status
						when x"08" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"25";
							
						-- PLA -- simplified opcode: x"26" -- Pull/Pop Accumulator
						when x"68" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"26";
							
						-- PLP -- simplified opcode: x"27" -- Pull/Pop Processor Status
						when x"28" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"27";
							
						-- ROL -- simplified opcode: x"28" -- Rotate Left
						when x"2E" => --ROL_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"28";
						when x"3E" => --ROL_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"28";
						when x"2A" => --ROL_ACC
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= acc_reg;
							new_op <= x"28";
						when x"26" => --ROL_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"28";
						when x"36" => --ROL_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"28";
						
						-- ROR -- simplified opcode: x"29" -- Rotate Right
						when x"6E" => --ROR_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"29";
						when x"7E" => --ROR_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"29";
						when x"6A" => --ROR_ACC
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= acc_reg;
							new_op <= x"29";
						when x"66" => --ROR_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"29";
						when x"76" => --ROR_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"29";
						
						-- RTI -- simplified opcode: x"2A" -- Return from Interrupt
						when x"40" => --RTI -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"2A";
							
						-- RTS -- simplified opcode: x"2B" -- Return from Subroutine
						when x"60" => --RTS -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"2B";
							
							
						-- SBC -- simplified opcode: x"2D" -- Subtract with Carry
						when x"ED" => --SBC_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"2D";
						when x"FD" => --SBC_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"2D";
						when x"F9" => --SBC_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"2D";
						when x"E9" => --SBC_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"2D";
						when x"E1" => --SBC_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_2 <= addr_1 + x"01" 
							addr_out <= data_2 & data_1;
							new_op <= x"2D";
						when x"F1" => --SBC_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- "00" & LSB
							addr_2 <= addr_1 + x"01" 
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"2D";
						when x"E5" => --SBC_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"2D";
						when x"F5" => --SBC_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"2D";
							
						-- SEC -- simplified opcode: x"2E" -- Set Carry
						when x"38" => --SEC -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"2E";
							
						-- SED -- simplified opcode: x"2F" -- Set Decimal
						when x"F8" => --SED -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"2F";
							
						-- SEI -- simplified opcode: x"30" -- Set Interrupt
						when x"78" => --SEI -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"30";
							
						-- STA -- simplified opcode: x"31" -- Store Accumulator
						when x"8D" => --STA_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"31";
						when x"9D" => --STA_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"31";
						when x"99" => --STA_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"31";
						when x"81" => --STA_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_2 <= addr_1 + x"01" 
							addr_out <= data_2 & data_1;
							new_op <= x"31";
						when x"91" => --STA_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- "00" & LSB
							addr_2 <= addr_1 + x"01" 
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"31";
						when x"85" => --STA_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"31";
						when x"95" => --STA_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
=======
						-- ORA -- simplified opcode: x"23" -- bitwise OR with Accumulator
						when x"0D" => --ORA_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"23";
						when x"1D" => --ORA_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"23";
						when x"19" => --ORA_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"23";
						when x"09" => --ORA_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"23";
						when x"01" => --ORA_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_2 <= addr_1 + x"01" 
							addr_out <= data_2 & data_1;
							new_op <= x"23";
						when x"11" => --ORA_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- "00" & LSB
							addr_2 <= addr_1 + x"01" 
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"23";
						when x"05" => --ORA_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"23";
						when x"15" => --ORA_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"23";
							
						-- PHA -- simplified opcode: x"24" -- Push Accumulator
						when x"48" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"24";
							
						-- PHP -- simplified opcode: x"25" -- Push Processor Status
						when x"08" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"25";
							
						-- PLA -- simplified opcode: x"26" -- Pull/Pop Accumulator
						when x"68" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"26";
							
						-- PLP -- simplified opcode: x"27" -- Pull/Pop Processor Status
						when x"28" => --NOP -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"27";
							
						-- ROL -- simplified opcode: x"28" -- Rotate Left
						when x"2E" => --ROL_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"28";
						when x"3E" => --ROL_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"28";
						when x"2A" => --ROL_ACC
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= acc_reg;
							new_op <= x"28";
						when x"26" => --ROL_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"28";
						when x"36" => --ROL_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"28";
						
						-- ROR -- simplified opcode: x"29" -- Rotate Right
						when x"6E" => --ROR_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"29";
						when x"7E" => --ROR_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"29";
						when x"6A" => --ROR_ACC
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= acc_reg;
							new_op <= x"29";
						when x"66" => --ROR_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"29";
						when x"76" => --ROR_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"29";
						
						-- RTI -- simplified opcode: x"2A" -- Return from Interrupt
						when x"40" => --RTI -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"2A";
							
						-- RTS -- simplified opcode: x"2B" -- Return from Subroutine
						when x"60" => --RTS -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"2B";
							
							
						-- SBC -- simplified opcode: x"2D" -- Subtract with Carry
						when x"ED" => --SBC_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"2D";
						when x"FD" => --SBC_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"2D";
						when x"F9" => --SBC_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"2D";
						when x"E9" => --SBC_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"2D";
						when x"E1" => --SBC_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_2 <= addr_1 + x"01" 
							addr_out <= data_2 & data_1;
							new_op <= x"2D";
						when x"F1" => --SBC_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- "00" & LSB
							addr_2 <= addr_1 + x"01" 
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"2D";
						when x"E5" => --SBC_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"2D";
						when x"F5" => --SBC_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"2D";
							
						-- SEC -- simplified opcode: x"2E" -- Set Carry
						when x"38" => --SEC -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"2E";
							
						-- SED -- simplified opcode: x"2F" -- Set Decimal
						when x"F8" => --SED -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"2F";
							
						-- SEI -- simplified opcode: x"30" -- Set Interrupt
						when x"78" => --SEI -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"30";
							
						-- STA -- simplified opcode: x"31" -- Store Accumulator
						when x"8D" => --STA_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"31";
						when x"9D" => --STA_ABSX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"31";
						when x"99" => --STA_ABSY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1] + y_reg;
							new_op <= x"31";
						when x"81" => --STA_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= (x"00ff" and instr_reg[1]) + x_reg; -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_2 <= addr_1 + x"01" 
							addr_out <= data_2 & data_1;
							new_op <= x"31";
						when x"91" => --STA_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- "00" & LSB
							addr_2 <= addr_1 + x"01" 
							addr_out <= (data_2 & data_1) + y_reg;
							new_op <= x"31";
						when x"85" => --STA_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"31";
						when x"95" => --STA_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
>>>>>>> 3ba687d0b44fcd99341342186eac8bf933c5c584
							new_op <= x"31";
							
						-- STX -- simplified opcode: x"32" -- Store X Register
						when x"8E" => --STA_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"32";
						when x"86" => --STA_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"32";
						when x"96" => --STA_ZPY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + y_reg;
							new_op <= x"32";
							
						-- STY -- simplified opcode: x"33" -- Store Y Register
						when x"8C" => --STA_ABS
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
							addr_out <= instr_reg[2] & instr_reg[1];
							new_op <= x"33";
						when x"84" => --STA_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"33";
						when x"94" => --STA_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"33";
							
						-- TAX -- simplified opcode: x"34" -- Transfer A to X
						when x"AA" => --TAX -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"34";
							
						-- TAY -- simplified opcode: x"35" -- Transfer A to Y
						when x"A8" => --TAY -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"35";
							
						-- TSX -- simplified opcode: x"36" -- Transfer Stack Pointer to X
						when x"BA" => --TSX -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"36";
							
						-- TXA -- simplified opcode: x"37" -- Transfer X to A
						when x"8A" => --TXA -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"37";
							
						-- TXS -- simplified opcode: x"38" -- Transfer X to Stack Pointer
						when x"9A" => --TXS -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
							new_op <= x"38";
							
						-- TYA -- simplified opcode: x"39" -- Transfer Y to A
						when x"98" => --TYA -- GO OVER
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(1,8)); --length 1
<<<<<<< HEAD
							new_op <= x"39";	
							
=======
							new_op <= x"39";
>>>>>>> 3ba687d0b44fcd99341342186eac8bf933c5c584
						
				when OTHERS =>
					next_state <= idle;

			end case;
		end process comb_process;
	
	clk_proc: process(rst, clk)   
		begin
		if (rst = '1') then
			state <= s0;
			done_o<= '0';
		elsif(rising_edge(clk)) then
			state <= next_state;
			done_o<= done_c;
		end if;
	end process clk_proc;
	done<=done_o;
end architecture a;