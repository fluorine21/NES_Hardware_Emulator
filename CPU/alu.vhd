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
        
        ignore_ouput : out std_logic;
        proc_status_out : out std_logic_vector(7 downto 0);
        alu_out : out std_logic_vector(7 downto 0)

  );
end entity alu;

architecture a of alu is 

    signal temp_output : std_logic_vector(7 downto 0);
    signal unsigned_out : unsigned(7 downto 0);
    signal proc_status_temp : std_logic_vector(7 downto 0);
    signal shift_carry : std_logic;
    signal sbc_with_carry : unsigned(8 downto 0);

    begin

    comb_process: process(alu_op, inputA, inputB) 

    begin
    proc_status_temp <= proc_status_in ----set new proc status to old proc status then edit what you are allowed to

    case (alu_op) 
        when "000" => -------add
            if (opcode = to_std_logic_vector(x"00")) then ---add with carry

                unsigned_out <= unsigned(inputA) + unsigned(inputB) + unsigned(proc_status_in(0))
                temp_output <= std_logic_vector(unsigned_out);
                if (unsigned_out > to_unsigned(255,8) and proc_status_in(3) = '0') or (unsigned_out > to_unsigned(99,8) and proc_status_in(3) = '1') then
                    proc_status_temp(3) <= '1' ------ setting carry flag
                end if;
                -------------set overflow flag---------
            else ---inc,inx,iny all just increment and pla and plp pops PC, 
                temp_output <= std_logic_vector(unsigned(inputA) + to_unsigned(1,8));
            end if;

        when "001" => -----sub
        ---dec, dex,dey, jsr, pha,php
            if (opcode = to_std_logic_vector(x"14") or opcode = to_std_logic_vector(x"15") or opcode = to_std_logic_vector(x"16") 
            or opcode = to_std_logic_vector(x"24") or opcode = to_std_logic_vector(x"25") or opcode = to_std_logic_vector(x"1D")) then
                temp_output <= std_logic_vector(unsigned(inputA) - to_unsigned(1,8));
            ------ cpx, cpy, cmp
            elsif (opcode = to_std_logic_vector(x"11") or opcode = to_std_logic_vector(x"12") or opcode = to_std_logic_vector(x"13") then
                temp_output <= std_logic_vector(unsigned(inputA) - unsigned(inputB));
            else ----- sbc
                sbc_with_carry <= inputA
                if unsigned(inputA) > unsigned(inputB) then
                    sbc_with_carry <= std_logic_vector(unsigned(inputA) + to_unsigned(256,9));
                    proc_status_temp(3) <= '0' ------ reseting the carry flag
                end if;
                temp_output <= std_logic_vector(sbc_with_carry - unsigned(inputB));
            end if;
            
        when "010" => ------shift
            if  (opcode = to_std_logic_vector(x"28")) then--- rotate left
                temp_output <= inputA(6 downto 0) & proc_status_in(3);
                proc_status_temp(3) <= inputA(7); ----- carry flag
            elsif  (opcode = to_std_logic_vector(x"29")) then --- rotate right
                temp_output <= proc_status_in(3) & inputA(7 downto 1) ;
                proc_status_temp(3) <= inputA(0); ----- carry flag
            elsif  (opcode = to_std_logic_vector(x"02")) then--- arithmetic shift left
                proc_status_temp(3) <= inputA(7); --- carry flag
                temp_output <= inputA sla 1;
            elsif  (opcode = to_std_logic_vector(x"21")) then--- logical shift right
                proc_status_temp(3) <= inputA(0); ----- carry flag
                temp_output <= inputA srl 1;
            end if;

        when "011" => ----- and
            temp_output <= inputA and inputB;

        when "100" => ----- or 

            temp_output <= inputA or inputB;

        when "101" => ------ xor
            temp_output <= inputA xor inputB;

        when OTHERS => 
            temp_output <= null;
            ignore_ouput <= '1';
    end case;


    ------- do checks to set flags N Z VC

    if proc_status_edit(1) = '1' then   ---- zero (1)
        
        if temp_output = "00000000" then 
            proc_status_temp(1) <= '1';
        else
            proc_status_temp(1) <= '0';
        end if;
    end if;

    if proc_status_edit(7) = '1' then   ---- negative(7), carry(3)
        if (opcode = to_std_logic_vector(x"03")) then ------ BIT
            proc_status_temp(7) <= inputB(7) ----------n(7) bit 7 of byte in memory
            proc_status_temp(6) <= inputB(6)-----------v(6) bit 6 of byte in memory
            ignore_ouput <= '1';
        elsif temp_output(7) = '1' then 
            proc_status_temp(7) <= '1';
        else
            proc_status_temp(7) <= '0';
        end if;
    end if;

    


    alu_out <= temp_output;
    proc_status_out <= proc_status_temp;
    end process;
    

end architecture a;

