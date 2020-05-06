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
        
        ignore_output : out std_logic;
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
        
    signal ignore_output :  std_logic;
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
            
            ignore_output  => ignore_output,
            proc_status_out  => proc_status_out,
            alu_out  => alu_out
		); 


	
	alu_process : process is
	begin
	-- INX -- check negative flag
	inputA <= "01111111";
    inputB <= "00000000";
    alu_op <= "000";
    opcode <= x"1A";
    proc_status_in <= "00000000";
    proc_status_edit <= "11111111";
 	wait for 5 ns;
	--DEX -- check zero flag
	inputA <= "00000001";
    inputB <= "00000000";
    alu_op <= "001";
    opcode <= x"15";
    proc_status_in <= "00000000";
    proc_status_edit <= "11111111";
 	wait for 5 ns;
	--SBC with carry
	inputA <= "00000011";
    inputB <= "00000100";
    alu_op <= "001";
    opcode <= x"2D";
    proc_status_in <= "00000001";
    proc_status_edit <= "11111111";
	wait for 5 ns;
	--SBC without carry
	inputB <= "00000001";
	wait for 5 ns;
	--ADC with carry
	opcode <= x"00";
	alu_op <= "000";
	wait for 5 ns;
	--ADC without carry
	proc_status_in <= "00000000";
	wait for 5 ns;
	--ADC with overflow, no carry
	inputA <= "11111011";
	inputB <= "00001000";
	wait for 5 ns;
	--ADC with overflow and carry
	proc_status_in <= "00000001";
	wait for 5 ns;
	--BIT - make sure ignore output flag on
	opcode <= x"03";
	alu_op <= "011";
	inputA <= "11110000";
	inputB <= "10101010";
	wait for 5 ns;
    	--CPX
	proc_status_in <= "00000000";
  	proc_status_edit <= "11111111";
	alu_op <=  "001";
	opcode <= x"11";
	inputA <= "01101100";
	inputB <= "00001011";
	wait for 5 ns;
	inputA <= "00000001";
	wait for 5 ns;
	--OR
	inputA <= "11110000";
	inputB <= "10101010";
	alu_op <= "100";
	wait for 5 ns;
	--XOR
	alu_op <= "101";
	wait for 5 ns;
	--ROL
	inputA <= "10101010";
	alu_op <= "010";
	opcode <= x"28";
	wait for 5 ns;
	--ROR
	opcode <= x"29";
	wait for 5 ns;
	--ASL
	opcode <= x"02";
	wait for 5 ns;
	--LSR
	opcode <= x"21";
 	wait for 5 ns;
	wait;
	

	end process;
end architecture;