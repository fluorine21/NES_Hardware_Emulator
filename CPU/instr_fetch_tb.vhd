library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use std.textio.all;

entity instr_fetch_tb is 
	generic(
		constant addr_width: integer := 16
		);
end instr_fetch_tb;

architecture behavior of instr_fetch_tb is
		signal clk       : std_logic := '0';
	 	signal rst       : std_logic;
	--memory bus
		signal addr_out: std_logic_vector(15 downto 0); -- address bus going from IF to IE			
		signal new_op  : std_logic_vector(7 downto 0);
		signal alu_op  : std_logic_vector(2 downto 0); -- 000 = add, 001 = subtract, 010 = shift
		signal mem_addr_out: std_logic_vector(15 downto 0); -- address bus going from IF to mem
		signal mem_data_in: std_logic_vector(7 downto 0); -- data bus going from mem to IF
																			-- 011 = and, 100 = or, 101 = xor
		--signal pc_ie   : std_logic_vector(7 downto 0);
		signal pc		: std_logic_vector(15 downto 0); --going to IE

		
		-- special purpose registers
		signal x_reg: std_logic_vector(7 downto 0) := (others => '0'); 
		signal y_reg: std_logic_vector(7 downto 0):= (others => '0'); 
		signal acc_reg: std_logic_vector(7 downto 0):= (others => '0');
		
		--flags
		signal accessing_mem_bus	: std_logic := '0'; --	1 means ready	
		signal ie_ready				: std_logic := '1'; -- 0 is ie computing, 1 is ie is ready for instruction
		signal imm_mode				: std_logic := '0'; -- immediate addy mode flag, 0 if no, 1 if yes		
		signal store_flag				: std_logic_vector(2 downto 0) := "000"; -- 000 = not used, 001 = store in mem																										-- 010 = acc, 011 = xreg, 100 = yreg
		signal reg_load_flag			: std_logic_vector(1 downto 0) := "00";  -- 00 = not used, 01 = load from acc																										-- 10 = load from xreg, 11 = yreg 
		signal mem_load_flag			: std_logic := '0'; -- load to mem flag, 0 if no, 1 if loading from mem
		
		signal instr_valid			: std_logic;
		
		--generic ram signals
		signal cpu_mem_addr_1		: std_logic_vector(addr_width - 1 downto 0);
		signal cpu_mem_data_in		: std_logic_vector(7 downto 0);
		signal cpu_mem_wr_en 		: std_logic;
		signal cpu_mem_data_out_1	: std_logic_vector(7 downto 0);
		signal cpu_mem_addr_2		: std_logic_vector(addr_width - 1 downto 0);
		signal cpu_mem_data_out_2	: std_logic_vector(7 downto 0);
		
		--temp 
		signal addy1, data1			: integer := 0;
		

	component instr_fetch is
		port(
		  signal clk       : in std_logic;
		  signal rst       : in std_logic;

		--memory bus
		  signal addr_out  : out std_logic_vector(15 downto 0); -- address bus going from IF to IE			
		  signal new_op    : out std_logic_vector(7 downto 0);
		  signal alu_op    : out std_logic_vector(2 downto 0); 
		  signal pc_ie     : in std_logic_vector(15 downto 0);
		  signal pc	   : out std_logic_vector(15 downto 0); --going to IE
		  signal mem_addr_out_s: out std_logic_vector(15 downto 0); -- address bus going from IF to mem
	 	  signal mem_data_in: in std_logic_vector(7 downto 0); -- data bus going from mem to IF
			
		-- special purpose registers
		  signal x_reg     : in std_logic_vector(7 downto 0); 
		  signal y_reg     : in std_logic_vector(7 downto 0); 
		  signal acc_reg   : in std_logic_vector(7 downto 0);
		
		--flags
		  signal accessing_mem_bus	: out std_logic := '0'; --	1 means ready	
		  signal ie_ready		: in std_logic;         -- 0 is ie computing, 1 is ie is ready for instruction
		  signal imm_mode		: out std_logic := '0'; -- immediate addy mode flag, 0 if no, 1 if yes
		  signal store_flag		: out std_logic_vector(2 downto 0) := "000"; -- 000 = not used, 001 = store in mem																					-- 010 = acc, 011 = xreg, 100 = yreg
		  signal reg_load_flag		: out std_logic_vector(1 downto 0) := "00";  -- 00 = not used, 01 = load from acc																					-- 10 = load from xreg, 11 = yreg 
		  signal mem_load_flag		: out std_logic := '0'; -- load to mem flag, 0 if no, 1 if loading from mem
		  signal instr_valid		: out std_logic
		
		);
	end component instr_fetch; 
	
	component generic_ram is
		port(
			clk			: in std_logic;
			addr_1		: in std_logic_vector(addr_width - 1 downto 0);
			data_in_1	: in std_logic_vector(7 downto 0);
			data_out_1	: out std_logic_vector(7 downto 0);
			write_en		: in std_logic;
			addr_2		: in std_logic_vector(addr_width - 1 downto 0);
			data_out_2	: out std_logic_vector(7 downto 0)
		);
	end component generic_ram;
	
	begin 
	
-------------------------------------------------------------
	generic_ram_inst: generic_ram --uut: generic_ram 
			port map(clk, cpu_mem_addr_1, cpu_mem_data_in, cpu_mem_data_out_1, cpu_mem_wr_en, cpu_mem_addr_2, cpu_mem_data_out_2);
			
	instr_fetch_inst: instr_fetch
			port map(
				clk      => clk, 
				rst      => rst,
				addr_out => addr_out,			
				new_op   => new_op,   
				alu_op   => alu_op,   
				pc_ie    => pc,
				pc       => pc,	   	
				x_reg    => x_reg, 
				y_reg    => y_reg,
				acc_reg  => acc_reg,		
			
				accessing_mem_bus => accessing_mem_bus,
				ie_ready	  => ie_ready,
				imm_mode       	=> imm_mode,		
				store_flag        => store_flag,																			
				reg_load_flag     => reg_load_flag,																		
				mem_load_flag     => mem_load_flag,	
				instr_valid       => instr_valid,
				mem_addr_out_s	=> cpu_mem_addr_2,
				mem_data_in 	=> cpu_mem_data_out_2
			);
			
-------------------------------------------------------------

	-- NEED TO UPDATE !!!!
		
--		--MUX statements (inputs of generic ram) to write to mem
--		cpu_mem_addr_1 <= addy1 when rst = '0' else (others => '0');		
--		cpu_mem_data_in <= data1 when rst = '0' else (others => '0');	
--		cpu_mem_wr_en <= cpu_wr_en when rst = '0' else '0';
	
-------------------------------------------------------------
	
--		clk_process : process is
--			begin	
--				clk <= '0';
--				wait for 1 ns;
--				for i in 0 to 40 loop
--				clk <= '1';
--				wait for 5 ns;
--				clk <= '0';
--				wait for 5 ns;
--				end loop;
--				wait;
--		end process clk_process;

		clk <= not clk after 1 ns / 2;

-------------------------------------------------------------
		
		file_process : process is
						
			--required variables
			variable my_line	: line;
			variable addy1		: std_logic_vector(15 downto 0);
			variable data1		: std_logic_vector(7 downto 0);
			
			file infile : text open read_mode is "cpu_if_mem_listing.txt";
		
				begin
					rst <= '0'; -- setting rst to 0 bc we want testbench to write to mem	
					ie_ready <= '1';
					cpu_mem_wr_en <= '1';
					wait for 1 ns;

					while not (endfile(infile)) loop 
						
						wait until (clk = '1');
						wait until (clk = '0');
											
						--if (ie_ready = '1' and rst = '0') then 
							
							--read from input file
							readline(infile, my_line);
							hread(my_line, addy1);
							cpu_mem_addr_1 <= addy1;
							
							hread(my_line, data1);
							cpu_mem_data_in <= data1;
							
							
						
						--else
						
							--cpu_mem_wr_en <= '0';
							
						--end if;
						
					end loop;
					rst <= '1';
				wait for 1000ns;
		end process file_process;
end architecture behavior;