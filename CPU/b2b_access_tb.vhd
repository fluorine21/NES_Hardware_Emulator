library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity b2b_access_tb is 
end entity b2b_access_tb;

architecture behavior of b2b_access_tb is
	component b2b_access is
			port(
			clk			: in std_logic;
			rst			: in std_logic;
			
			addr_1		: in std_logic_vector(15 downto 0);
			addr_2		: in std_logic_vector(15 downto 0);
			
			data_1		: out std_logic_vector(7 downto 0);
			data_2		: out std_logic_vector(7 downto 0);
			
			mem_read		: out std_logic
			);
	end component; 

	signal clk			: std_logic;
	signal rst			: std_logic;
			
	signal addr_1		: std_logic_vector(15 downto 0);
	signal addr_2		: std_logic_vector(15 downto 0);
			
	signal data_1		: std_logic_vector(7 downto 0);
	signal data_2		: std_logic_vector(7 downto 0);
			
	signal mem_read	: std_logic;
	
	begin b2b_access_inst: 
		component b2b_access
			port map(
				
				clk => clk,
				rst => rst,
				
				addr_1 => addr_1,
				addr_2 => addr_2,
				
				data_1 => data_1,
				data_2 => data_2,
				
				mem_read => mem_read
				);
		
		
		b2b_access_process: process is
			constant period: time := 50 ns;
			begin
			wait for 1 ns;
			
			--test 1
			addr_1 <= "d3";
			addr_2 <= "d4";
		
			wait for period;
			
			assert ((data_1 = "00") and (data_2 = "00")); -- expected output
         report "test failed for address combo xx and yy" severity error; -- error will be reported if no match

			
			--test 2
			addr_1 <= "00";
			addr_2 <= "01";
		
			wait for period;
			
			assert ((data_1 = "00") and (data_2 = "00")); 
         report "test failed for address combo xx and yy" severity error;
			
			
			--test 3
			addr_1 <= "6d";
			addr_2 <= "6e";
		
			wait for period;
			
			assert ((data_1 = "00") and (data_2 = "00")); 
         report "test failed for address combo xx and yy" severity error;
			
			wait;
		end process b2b_access_process;
		
		
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
		
end architecture behavior;
		