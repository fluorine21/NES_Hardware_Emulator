library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tb is
end entity alu_tb;

architecture behavioral of alu_tb is
	component alu is
		port(
		inputA : in std_logic_vector(7 downto 0);
        inputB: in std_logic_vector(7 downto 0);
        alu_op: in std_logic_vector(2 downto 0);
        opcode : in std_logic_vector(7 downto 0);
        proc_status_in : in std_logic_vector(7 downto 0);
        proc_status_edit : in std_logic_vector(7 downto 0);
        
        ignore_ouput : out std_logic;
        proc_status_out : out std_logic_vector(7 downto 0);
        alu_out : out std_logic_vector(7 downto 0)
        );
	end component alu;
	
	signal inputA : std_logic_vector(7 downto 0);
    signal inputB:  std_logic_vector(7 downto 0);
    signal alu_op:  std_logic_vector(2 downto 0);
    signal opcode :  std_logic_vector(7 downto 0);
    signal proc_status_in :  std_logic_vector(7 downto 0);
    signal proc_status_edit :  std_logic_vector(7 downto 0);
        
    signal ignore_ouput :  std_logic;
    signal proc_status_out :  std_logic_vector(7 downto 0);
    signal alu_out :  std_logic_vector(7 downto 0);
	
	begin 
	alu_inst : alu
		port map(
			inputA => inputA,
            inputB => inputB,
            alu_op => alu_op,
            opcode => opcode,
            proc_status_in => proc_status_in,
            proc_status_edit =>  proc_status_edit,
            
            ignore_ouput  => ignore_ouput,
            proc_status_out  => proc_status_out,
            alu_out  => alu_out
		); 

	clk_process : process is
	begin	
		clk <= '0';
		wait for 1 ns;
		for i in 0 to 5 loop
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
		end loop;
		wait;
	end process;
	
	alu_process : process is
	begin
		wait for 1 ns;
		inputA <= "10101010"
        inputB <= "10101010"
        alu_op <= "000"
        opcode <= "00011010"
        proc_status_in <= "00000000"
        proc_status_edit <= "11111111"
            
        wait for 5 ns;
		
		wait;

	end process;
end architecture;