library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity instr_fetch_tb is 
end entity instr_fetch_tb;

architecture of behavior in instr_fetch_tb is
	component instr_fetch is
	port(

			signal clk: in std_logic;
			signal rst: in std_logic;
		
			--memory bus
			signal addr_out: out std_logic_vector(15 downto 0); -- address bus going from IF to IE			
			signal new_op  : out std_logic_vector(7 downto 0);
			signal alu_op  : out std_logic_vector(2 downto 0); -- 000 = add, 001 = subtract, 010 = shift
																				-- 011 = and, 100 = or, 101 = xor
			signal pc_ie   : in std_logic_vector(7 downto 0);
			signal pc		: out std_logic_vector(7 downto 0); --going to IE

			
			-- special purpose registers
			signal x_reg: in std_logic_vector(7 downto 0); 
			signal y_reg: in std_logic_vector(7 downto 0); 
			signal acc_reg: in std_logic_vector(7 downto 0);
			
		-- PORT MAP
			-- b2b memory access
			signal addr_1		: out std_logic_vector(15 downto 0);
			signal addr_2		: out std_logic_vector(15 downto 0);
			
			signal data_1		: in std_logic_vector(7 downto 0);
			signal data_2		: in std_logic_vector(7 downto 0);
			
			
			--flags
			signal accessing_mem_bus	: out std_logic := '0'; --	1 means ready	
			signal ie_ready				: in std_logic; -- 0 is ie computing, 1 is ie is ready for instruction
			signal imm_mode				: out std_logic := '0'; -- immediate addy mode flag, 0 if no, 1 if yes
			
			signal store_flag				: out std_logic_vector(2 downto 0) := "000"; -- 000 = not used, 001 = store in mem
																											-- 010 = acc, 011 = xreg, 100 = yreg
			signal reg_load_flag			: out std_logic_vector(1 downto 0) := "00";  -- 00 = not used, 01 = load from acc
																											-- 10 = load from xreg, 11 = yreg 
			signal mem_load_flag			: out std_logic := '0'; -- load to mem flag, 0 if no, 1 if loading from mem
			
			signal instr_valid			: out std_logic;
			
		);
	end component 

	--memory bus
		signal addr_out: out std_logic_vector(15 downto 0); -- address bus going from IF to IE			
		signal new_op  : out std_logic_vector(7 downto 0);
		signal alu_op  : out std_logic_vector(2 downto 0); -- 000 = add, 001 = subtract, 010 = shift
																			-- 011 = and, 100 = or, 101 = xor
		signal pc_ie   : in std_logic_vector(7 downto 0);
		signal pc		: out std_logic_vector(7 downto 0); --going to IE

		
		-- special purpose registers
		signal x_reg: in std_logic_vector(7 downto 0); 
		signal y_reg: in std_logic_vector(7 downto 0); 
		signal acc_reg: in std_logic_vector(7 downto 0);
		
	-- PORT MAP
		-- b2b memory access
		signal addr_1		: out std_logic_vector(15 downto 0);
		signal addr_2		: out std_logic_vector(15 downto 0);
		
		signal data_1		: in std_logic_vector(7 downto 0);
		signal data_2		: in std_logic_vector(7 downto 0);
		
		
		--flags
		signal accessing_mem_bus	: out std_logic := '0'; --	1 means ready	
		signal ie_ready				: in std_logic; -- 0 is ie computing, 1 is ie is ready for instruction
		signal imm_mode				: out std_logic := '0'; -- immediate addy mode flag, 0 if no, 1 if yes
		
		signal store_flag				: out std_logic_vector(2 downto 0) := "000"; -- 000 = not used, 001 = store in mem
																										-- 010 = acc, 011 = xreg, 100 = yreg
		signal reg_load_flag			: out std_logic_vector(1 downto 0) := "00";  -- 00 = not used, 01 = load from acc
																										-- 10 = load from xreg, 11 = yreg 
		signal mem_load_flag			: out std_logic := '0'; -- load to mem flag, 0 if no, 1 if loading from mem
		
		signal instr_valid			: out std_logic;
	
	begin instr_fetch_inst: 
		component instr_fetch
			port map(
				

				);
		
		
		instr_fetch: process is
			constant period: time := 50 ns;
			begin
			wait for 1 ns;
			
		--stuff
			
			wait;
		end process instr_fetch;
		
		
--		clk_process : process is
--			begin	
--				clk <= '0';
--				wait for 1 ns;
--				for i in 0 to 20 loop
--				clk <= '1';
--				wait for 5 ns;
--				clk <= '0';
--				wait for 5 ns;
--				end loop;
--				wait;
--		end process clk_process;
--
--			
--		rst_process: process is
--			begin
--				rst <= '0'; 
--				wait until (clock = '0');
--				wait until (clock = '1');
--				rst <= '1';
--				wait until (clock = '0');
--				wait until (clock = '1');
--				reset <= '0';
--				wait;
--		end process rst_process;
		
		wait;

end architecture behavior;
		