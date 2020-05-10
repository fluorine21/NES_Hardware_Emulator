library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;



package instr_fetch_pkg is
 
	--ALU operations
	constant ADD_OP   : std_logic_vector(3 downto 0) := "0000";
	constant SUB_OP   : std_logic_vector(3 downto 0) := "0001";
	constant SHIFT_OP : std_logic_vector(3 downto 0) := "0010";
	constant AND_OP   : std_logic_vector(3 downto 0) := "0011";
	constant OR_OP    : std_logic_vector(3 downto 0) := "0100";
	constant XOR_OP   : std_logic_vector(3 downto 0) := "0101";
	constant TRA_OP   : std_logic_vector(3 downto 0) := "0110";
	constant TRB_OP   : std_logic_vector(3 downto 0) := "0111";
	
	--reg load flags
	constant A_REG_F   : std_logic_vector(1 downto 0) := "01";
	constant X_REG_F   : std_logic_vector(1 downto 0) := "10";
	constant Y_REG_F   : std_logic_vector(1 downto 0) := "11";
	constant MEM_REG_F : std_logic_vector(1 downto 0) := "00";
	
	
	--Store flags
	constant A_STORE 	  : std_logic_vector(2 downto 0) := "010";
	constant X_STORE 	  : std_logic_vector(2 downto 0) := "011";
	constant Y_STORE 	  : std_logic_vector(2 downto 0) := "100";
	constant MEM_STORE 	  : std_logic_vector(2 downto 0) := "001";
	constant STATUS_STORE : std_logic_vector(2 downto 0) := "111";
	
	
	function indirect_addr(
		instr_byte : in std_logic_vector(7 downto 0);
		offset_reg : in std_logic_vector(7 downto 0);
		offset_const: in std_logic_vector(7 downto 0))
		return std_logic_vector;
   
end;

-- Package Body Section
package body instr_fetch_pkg is
  
  function indirect_addr(
		instr_byte : in std_logic_vector(7 downto 0);
		offset_reg : in std_logic_vector(7 downto 0);
		offset_const: in std_logic_vector(7 downto 0))
		return std_logic_vector is variable addr : std_logic_vector(15 downto 0) := x"0000";
	begin
		
		if(offset_const /= x"00") then
		
			addr := (x"00" & (instr_byte + offset_reg + x"01"));
		
		else
		
			addr := (x"00" & (instr_byte + offset_reg));
	
		end if;
	
		return addr;
	end;
 
end package body;