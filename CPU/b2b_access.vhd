library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity b2b_access is
	port(
			addr_1		: in std_logic_vector(15 downto 0);
			addr_2		: in std_logic_vector(15 downto 0);
			
			data_1		: out std_logic_vector(7 downto 0);
			data_2		: out std_logic_vector(7 downto 0);
			
			mem_read		: out std_logic
	);
	
architecture b of b2b_access is
	type state_type is (s0, s1, s2, s3);
	signal state, next_state: state_type;
	
	signal mem_addr : std_logic_vector(15 downto 0);
	signal mem_data_in : std_logic_vector(7 downto 0);
	
	begin 
		comb_proc: process ()
			
		begin
			case (state) is
			
				when s0 =>
					
					mem_addr <= addr_1;
					mem_read <= '1';
					state <= s1;
					
				when s1 =>
					
					mem_read <= '1';
					mem_addr <= addr_2;
					state <= s2;
					
				when s2 =>
				
					data_1 <= std_logic_vector(resize(unsigned(mem_data_in), 16));
					mem_read <= '0';
					state <= s3;
					
				when s3 =>
				
					data_2 <= std_logic_vector(resize(unsigned(mem_data_in), 16));
					
			end case;
		end process comb_proc;
end architecture;