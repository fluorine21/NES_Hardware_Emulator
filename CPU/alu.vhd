library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port(
		inputA : in std_logic_vector(15 downto 0);
        inputB: in std_logic_vector(15 downto 0);
        alu_op: in std_logic_vector(2 downto 0);
        opcode : in std_logic_vector(7 downto 0);
        proc_status_in : in std_logic_vector(7 downto 0);
        proc_status_edit : in std_logic_vector(7 downto 0);

        proc_status_out : out std_logic_vector(7 downto 0);
        alu_out : out std_logic_vector(15 downto 0)

  );
end entity alu;

architecture a of alu is 

    signal temp_output : std_logic_vector(15 downto 0);
    signal proc_status_temp : std_logic_vector(7 downto 0);

    begin

    comb_process: process(alu_op, inputA, inputB) 

    begin

    case (alu_op) 
    when "000" => -------add

        alu_op <= inputA + inputB
    when "001" => -----sub

    when "010" => ------shift

    when "011" => ----- and
        temp_output <= inputA and inputB;

    when "100" => ----- or 
        temp_output <= inputA or inputB;
    when "101" => ------ xor
        temp_output <= inputA xor inputB;

    when OTHERS => ----- throw error?
        temp_output <= inputA
    end case;


    ------- do checks to set flags
    proc_status_temp <= proc_status_in

    if temp_output = '0' & proc_status_edit(1) = '1' then ---- zero (1)
        proc_status_out(1)
    end if;




    alu_out <= temp_output
    end process;
    

end architecture a;

