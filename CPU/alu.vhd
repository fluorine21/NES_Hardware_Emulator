library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port(
		inputA : in std_logic_vector(7 downto 0);
        inputB: in std_logic_vector(7 downto 0);
        alu_op: in std_logic_vector(2 downto 0);
        opcode : in std_logic_vector(7 downto 0);
        proc_status_in : in std_logic_vector(7 downto 0);
        proc_status_edit : in std_logic_vector(7 downto 0);

        proc_status_out : out std_logic_vector(7 downto 0);
        alu_out : out std_logic_vector(7 downto 0)

  );
end entity alu;

architecture a of alu is 

    signal temp_output : std_logic_vector(7 downto 0);
    signal unsigned_out : unsigned(7 downto 0);
    signal proc_status_temp : std_logic_vector(7 downto 0);

    begin

    comb_process: process(alu_op, inputA, inputB) 

    begin

    case (alu_op) 
    when "000" => -------add
        if (opcode = to_std_logic_vector(x"00")) then ---add with carry

            unsigned_out <= unsigned(inputA) + unsigned(inputB) + unsigned(proc_status_in(0))
            temp_output <= std_logic_vector(unsigned_out);
            if (unsigned_out > to_unsigned(255,8) and proc_status_in(3) = '0') or (unsigned_out > to_unsigned(99,8) and proc_status_in(3) = '1')
                proc_status_temp(3) <= '1' ------ setting carry flag
            end if;
            
        elsif (opcode = to_std_logic_vector(x"19") or opcode = to_std_logic_vector(x"19") or opcode = to_std_logic_vector(x"19")) then -- inc
            temp_output <= std_logic_vector(unsigned(inputB) + to_unsigned(1,8));

    when "001" => -----sub
        if (opcode = to_std_logic_vector(x"2D")) then ---SUBTRACT with carry
            temp_output <= std_logic_vector(unsigned(inputA) - unsigned(inputB) + unsigned(proc_status_in(0)));
        elsif (opcode = to_std_logic_vector(x"14")) then -- DEC
            temp_output <= std_logic_vector(unsigned(inputB) - to_unsigned(1,8));
    when "010" => ------shift
    

    when "011" => ----- and
        temp_output <= inputA and inputB;

    when "100" => ----- or 
        temp_output <= inputA or inputB;
    when "101" => ------ xor
        temp_output <= inputA xor inputB;

    when OTHERS => ----- throw error?
        temp_output <= inputA;
    end case;


    ------- do checks to set flags N Z VC
    proc_status_temp <= proc_status_in ----set new proc status to old proc status then edit what you are allowed to

    if proc_status_edit(1) = '1' then   ---- zero (1)
        if temp_output = "00000000" then 
            proc_status_out(1) <= '1';
        else
            proc_status_out(1) <= '0';
        end if;
    end if;

    if proc_status_edit(7) = '1' then   ---- negative(7)
        if temp_output(7) = '1' then 
            proc_status_out(7) <= '1';
        else
            proc_status_out(1) <= '0';
        end if;
    end if;

    


    alu_out <= temp_output
    end process;
    

end architecture a;

