library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity b2b_access is
	port(
			clk			: in std_logic;
			rst			: in std_logic;
			
			addr_1			: in std_logic_vector(15 downto 0);
			addr_2			: in std_logic_vector(15 downto 0);
				
			data_1			: out std_logic_vector(7 downto 0);
			data_2			: out std_logic_vector(7 downto 0);
			
			mem_read		: out std_logic;
			mem_done		: out std_logic;
			b2b_start		: in std_logic;
			b2b_busy		: out std_logic;
			
			mem_addr 		: out std_logic_vector(15 downto 0);
			mem_data_in 		: in std_logic_vector(7 downto 0)
	);
end entity b2b_access;
	
architecture b of b2b_access is

	type state_type is (s0, s1, s2, s3);
	signal state: state_type;
	
	--signal mem_addr : std_logic_vector(15 downto 0);
	--signal mem_data_in : std_logic_vector(7 downto 0);
	
	begin 

		b2b_busy <= '1' when (state /= s0) else '0';
		b2b_access_process: process (clk, rst)
			
		begin

		if rst = '0' then
			state <= s0;
			mem_done <= '0';
			mem_addr <= (others => '0');
			mem_read <= '0';
			data_1 <= (others => '0');
			data_2 <= (others => '0');
			
		elsif (rising_edge(clk)) then
			
			case (state) is
			
				when s0 =>
				  mem_done <= '0';--Reset this flag by default
				  if b2b_start = '1' then
					mem_done <= '0';
					mem_addr <= addr_1;
					mem_read <= '1';
					state <= s1;
				  else state <= s0;
				  end if;
					
				when s1 =>
					mem_done <= '0';
					mem_read <= '1';
					mem_addr <= addr_2;
					state <= s2;
					
				when s2 =>
					mem_done <= '0';
					data_1 <= mem_data_in;
					mem_read <= '0';
					state <= s3;
					
				when s3 =>
					mem_done <= '1';
					data_2 <= mem_data_in;
					state <= s0;
					
				when OTHERS =>
					mem_done <= '0';
					state <= s0;
					
			end case;
		end if;
		end process b2b_access_process;
		
		
--		clk_process: process(rst, clk)   
--		begin
--		if (rst = '1') then
--			state <= s0;
--		elsif(rising_edge(clk)) then
--			state <= state;
--		end if;
--		end process clk_process;
	
end architecture b;