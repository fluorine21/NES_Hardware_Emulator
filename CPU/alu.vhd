library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.instr_fetch_pkg.all;

entity alu is
    port(
	inputA : in std_logic_vector(7 downto 0);
        inputB: in std_logic_vector(7 downto 0);
        alu_op: in std_logic_vector(3 downto 0);
        opcode : in std_logic_vector(7 downto 0);
        proc_status_in : in std_logic_vector(7 downto 0);
        proc_status_edit : in std_logic;
        
        ignore_output : out std_logic;
        proc_status_out : out std_logic_vector(7 downto 0);
        alu_out : out std_logic_vector(7 downto 0)

  );
end entity alu;

architecture a of alu is 

    
    

    begin

    comb_process: process(alu_op, inputA, inputB, opcode, proc_status_in, proc_status_edit) 
	function to_integer( s : std_logic ) return natural is
		begin
	  if s = '1' then
	    return 1;
	  else
	    return 0;
	  end if;
	end function;
    variable sbc_with_carry : unsigned(8 downto 0) := (others => '0');
    variable unsigned_out : unsigned(8 downto 0) := (others => '0');
	variable proc_status_temp : std_logic_vector(7 downto 0);
	variable temp_output : std_logic_vector(7 downto 0);
	variable signed_diff : signed(8 downto 0);

    begin

    proc_status_temp := proc_status_in; ----set new proc status to old proc status then edit what you are allowed to
    ignore_output <= '0';

    case (alu_op) is
        when ADD_OP => -------add
            if (opcode = x"00") then ---add with carry

                unsigned_out := resize(unsigned(inputA),9) + resize(unsigned(inputB), 9) + to_integer(proc_status_in(0));
                temp_output := std_logic_vector(unsigned_out(7 downto 0));
                if (unsigned_out > to_unsigned(255,8) ) then
                    proc_status_temp(0) := '1'; ------ setting carry flag
		else
		    proc_status_temp(0) := '0';
                end if;
		if ( unsigned_out(7) /= inputA(7)) then
                    proc_status_temp(6) := '1'; ------ setting overflow flag
		else
		    proc_status_temp(6) := '0';
                end if;
                -------------set overflow flag---------
            else ---inc,inx,iny all just increment and pla and plp pops PC, 
                temp_output := std_logic_vector(unsigned(inputA) + to_unsigned(1,8));
            end if;

        when SUB_OP => -----sub
        ---dec, dex,dey, jsr, pha,php
            if (opcode = x"14" or opcode = x"15" or opcode = x"16"
            or opcode = x"24" or opcode = x"25" or opcode = x"1D") then
                temp_output := std_logic_vector(unsigned(inputA) - to_unsigned(1,8));
            ------ cpx, cpy, cmp inputA is from acc and input B from memory
            elsif (opcode = x"11" or opcode = x"12" or opcode = x"13") then
                temp_output := std_logic_vector(unsigned(inputA) - unsigned(inputB));
		if unsigned(inputA) >= unsigned(inputB) then
			proc_status_temp(0) := '1'; --------carry flag
		else 
			proc_status_temp(0) := '0';		
		end if;
            else ----- sbc
                sbc_with_carry := resize(unsigned(inputA),9);

                if unsigned(inputA) < unsigned(inputB) then
                    sbc_with_carry := unsigned(inputA) + to_unsigned(256,9);
                    proc_status_temp(0) := '0' ;------ reseting the carry flag
                end if;
		signed_diff := resize(signed(inputA),9)-resize(signed(inputB),9);
		if ((signed_diff > 127 ) or (signed_diff < -127)) then
			proc_status_temp(6) := '1'; --------overflow flag
		else
			proc_status_temp(6) := '0'; 
		end if;
                temp_output := std_logic_vector(resize((sbc_with_carry - unsigned(inputB)),8));
		
            end if;
            
        when SHIFT_OP => ------shift
            if  (opcode = x"28") then--- rotate left
                temp_output := inputA(6 downto 0) & proc_status_in(0);
                proc_status_temp(0) := inputA(7); ----- carry flag
            elsif  (opcode = x"29") then --- rotate right
                temp_output := proc_status_in(0) & inputA(7 downto 1) ;
                proc_status_temp(0) := inputA(0); ----- carry flag
            elsif  (opcode = x"02") then--- arithmetic shift left
                proc_status_temp(0) := inputA(7); --- carry flag
                temp_output := inputA(6 downto 0) & '0';
            elsif  (opcode = x"21") then--- logical shift right
                proc_status_temp(0) := inputA(0); ----- carry flag
                temp_output := '0' & inputA(7 downto 1) ;
            end if;

        when AND_OP => ----- and
            temp_output := inputA and inputB;

        when OR_OP => ----- or 

            temp_output := inputA or inputB;

        when XOR_OP => ------ xor
            temp_output := inputA xor inputB;

		when TRA_OP =>
			temp_output := inputA;
			
		when TRB_OP =>
			temp_output := inputB;
			
        when OTHERS => 
            temp_output := inputA;
            ignore_output <= '1';
    end case;

    ------- do checks to set flags N Z VC

    if proc_status_edit = '1' then   ---- zero (1)
        
        if temp_output = "00000000" then 
            proc_status_temp(1) := '1';
        else
            proc_status_temp(1) := '0';
        end if;
    end if;

    if proc_status_edit = '1' then   ---- negative(7), carry(0)
        if (opcode = x"03") then ------ BIT
            proc_status_temp(7) := inputB(7) ;----------n(7) bit 7 of byte in memory
            proc_status_temp(6) := inputB(6) ; -----------v(6) bit 6 of byte in memory
            ignore_output <= '1';
        elsif temp_output(7) = '1' then 
            proc_status_temp(7) := '1';
        else
            proc_status_temp(7) := '0';
        end if;
    end if;

	if (opcode = x"0D") then  -- CLC
		proc_status_temp(0) := '0';
	elsif (opcode = x"0E") then --CLD
		proc_status_temp(3) := '0';
	elsif (opcode = x"0F") then --CLI
		proc_status_temp(2) := '0';
	elsif (opcode = x"10") then --CLV
		proc_status_temp(6) := '0';
	elsif (opcode = x"2E") then --SEC
		proc_status_temp(0) := '1';
	elsif (opcode = x"30") then --SEI
		proc_status_temp(2) := '1';
	elsif (opcode = x"2F") then  --SED
		proc_status_temp(3) := '1';
	end if;
    


    proc_status_out <= proc_status_temp;
    alu_out <= temp_output;
    end process;
   
    

end architecture a;