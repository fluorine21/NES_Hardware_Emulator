library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity b2b_access is
	port(
			clk			: in std_logic;
			rst			: in std_logic;
			
			addr_1		: in std_logic_vector(15 downto 0);
			addr_2		: in std_logic_vector(15 downto 0);
			
			data_1		: out std_logic_vector(7 downto 0);
			data_2		: out std_logic_vector(7 downto 0);
			
			mem_read		: out std_logic
	);
end entity;
	
architecture b of b2b_access is
	type state_type is (s0, s1, s2, s3);
	signal state, next_state: state_type;
	
	signal mem_addr : std_logic_vector(15 downto 0);
	signal mem_data_in : std_logic_vector(7 downto 0);
	
	begin 
		comb_proc: process (addr_1, addr_2, mem_data_in, state)
			
		begin
		
			state <= next_state;
			
			case (state) is
			
				when s0 =>
					
					mem_addr <= addr_1;
					mem_read <= '1';
					next_state <= s1;
					
				when s1 =>
					
					mem_read <= '1';
					mem_addr <= addr_2;
					next_state <= s2;
					
				when s2 =>
				
					data_1 <= std_logic_vector(resize(unsigned(mem_data_in), 16));
					mem_read <= '0';
					next_state <= s3;
					
				when s3 =>
				
					data_2 <= std_logic_vector(resize(unsigned(mem_data_in), 16));
					
				when OTHERS =>
					
					next_state <= s0;
					
			end case;
		end process comb_proc;
		
		clk_proc: process(rst, clk)   
		begin
		if (rst = '1') then
			state <= idle;
		elsif(rising_edge(clk)) then
			state <= next_state;
		end if;
	end process clk_proc;
	
end architecture;