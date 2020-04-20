library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity instr_fetch is
	port(

			signal clk: in std_logic;
			signal rst: in std_logic;
			signal ready:	in std_logic; --start
		
--			--interrupts
--			signal int_nmi_in: in std_logic;
--			signal int_rst_in: in std_logic;
--			signal int_irq_in: in std_logic;
		
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
			signal acc_reg: in std_logic_vector(7 downto 0)	
			
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

	constant SAX_ABS	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"8F");
	constant SAX_INDX	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"83");
	constant SAX_ZP	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"87");
	constant SAX_ZPY	: std_logic_vector(7 downto 0) := to_stdlogicvector(x"97");

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
		
--------------------------------------------------------------------------------------
--	--interrupts
--	constant INTERRUPT_RST	: std_logic_vector(1 downto 0) := "00";
--	constant INTERRUPT_NMI	: std_logic_vector(1 downto 0) := "01";
--	constant INTERRUPT_IRQ	: std_logic_vector(1 downto 0) := "10";
--	constant INTERRUPT_BRK	: std_logic_vector(1 downto 0) := "11";
--	
--	--accumulator, x-index, y-index registers
--	signal q_ac: std_logic_vector(7 downto 0);
--	signal d_ac: std_logic_vector(7 downto 0);
--	signal q_x: std_logic_vector(7 downto 0);
--	signal d_x: std_logic_vector(7 downto 0);
--	signal q_y: std_logic_vector(7 downto 0);
--	signal d_y: std_logic_vector(7 downto 0);
--	
--	--processor status register
--	signal proc_status: std_logic_vector(7 downto 0);
--	signal q_carry: std_logic;
--	signal d_carry: std_logic;
--	signal q_decmode: std_logic;
--	signal d_decmode: std_logic;
--	signal q_int: std_logic;
--	signal d_int: std_logic;
--	signal q_neg: std_logic;
--	signal q_ovflow: std_logic;
--	signal d_ovflow: std_logic;
--	signal q_zero: std_logic;
--	signal d_zero: std_logic;
--	--address bus high/low
--	signal q_abh: std_logic_vector(7 downto 0);
--	signal d_abh: std_logic_vector(7 downto 0);
--	signal q_abl: std_logic_vector(7 downto 0);
--	signal d_abl: std_logic_vector(7 downto 0);
--	--data in and out 
--	signal d_neg: std_logic;
--	signal q_data_in: std_logic_vector(7 downto 0);
--	signal d_data_in: std_logic_vector(7 downto 0);
--	signal q_data_out: std_logic_vector(7 downto 0);
--	signal d_data_out: std_logic_vector(7 downto 0);
--	--instruction reg
--	signal q_inst: std_logic_vector(7 downto 0);
--	signal d_inst: std_logic_vector(7 downto 0);
--   --program counter bus high/low
--	signal q_pch: std_logic_vector(7 downto 0);
--	signal d_pch: std_logic_vector(7 downto 0);
--	signal q_pcl: std_logic_vector(7 downto 0);
--	signal d_pcl: std_logic_vector(7 downto 0);
--	--stack pointer
--	signal q_st_pnt: std_logic_vector(7 downto 0);
--	signal d_st_pnt: std_logic_vector(7 downto 0);
---------------------------------------------------------------------------------------



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
					counter<= addr_in - PC - '1'; --conversion needed
					if counter >= '3' then
						state<= decode_op;
					else	
						--QUESTION: indexing syntax? is counter correct type? 
						instr_reg[counter] <= addr_in; -- addr_in would go into decoder module, and the data would go into instr_reg
						addr_in <= std_logic_vector(unsigned(addr_in)+to_unsigned(1,16));
						state <= read_op;
					end if 
					
				
				when decode_op => --update pc, mem address, simplify opcode
					case (instr_reg[0]) is
					
					--QUESTION: If pc increments by length, will it point at the next instruction? If so, IE will not need to increment pc?
					
					
					--DATA MODULE: I/P ADDRESS, O/P DATA MEMORY
					
						-- ADC -- simplified opcode: x"00"
						when x"6D" => --ADC_ABS
							pc_out <= std_logic_vector(unsigned(pc) + to_unsigned(3,8)); --length 3
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
							addr_temp <= instr_reg[1] + x_reg; -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_out <= data_module_out;
							new_op <= x"00";
							--indx <= '1';
						when x"71" => --ADC_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_1 <= x"00ff" and instr_reg[1]; -- "00" & LSB
							addr_2 <= addr_1 + x"01" 
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
							
							
						-- AND -- simplified opcode: x"01"
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
							addr_out <= instr_reg[2] & instr_reg[1] + x_reg;
							new_op <= x"01";
						when x"29" => --AND_IMM
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= instr_reg[1];
							new_op <= x"01";
						when x"21" => --AND_INDX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_temp <= instr_reg[1] + x_reg; -- have to get data from this address (and address+1) and concatenate and put into data_module
							addr_out <= data_module;
							new_op <= x"01";
						when x"31" => --AND_INDY
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_temp <= x"00" & instr_reg[1]; -- find the data at this address
							addr_out <= data_module + y_reg;
							new_op <= x"01";
						when x"25" => --ADC_ZP
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1];
							new_op <= x"01";
						when x"35" => --ADC_ZPX
							pc <= std_logic_vector(unsigned(pc) + to_unsigned(2,8)); --length 2
							addr_out <= x"00" & instr_reg[1] + x_reg;
							new_op <= x"01";
						
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