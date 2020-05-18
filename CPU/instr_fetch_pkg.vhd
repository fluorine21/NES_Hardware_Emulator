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
	constant STACK_STORE  : std_logic_vector(2 downto 0) := "110";
	
	
	function indirect_addr(
		instr_byte : in std_logic_vector(7 downto 0);
		offset_reg : in std_logic_vector(7 downto 0);
		offset_const: in std_logic_vector(7 downto 0))
		return std_logic_vector;
		
	function branch_addr(
		pc_in : in std_logic_vector(15 downto 0);
		instr_byte_1 : in std_logic_vector(7 downto 0))
		return std_logic_vector;
		
	function abs_addr(
		instr_byte_1 : in std_logic_vector(7 downto 0);--LO
		instr_byte_2 : in std_logic_vector(7 downto 0);--HI
		reg_byte : in std_logic_vector(7 downto 0))
		return std_logic_vector;
		
	function zpg_addr(
		instr_byte_1 : in std_logic_vector(7 downto 0);--LO
		reg_byte : in std_logic_vector(7 downto 0))
		return std_logic_vector;
   
end;

-- Package Body Section
package body instr_fetch_pkg is
  
  --Set reg to 0 for y
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
	
	
	function abs_addr(
		instr_byte_1 : in std_logic_vector(7 downto 0);--LO
		instr_byte_2 : in std_logic_vector(7 downto 0);--HI
		reg_byte : in std_logic_vector(7 downto 0))
		return std_logic_vector is variable addr : std_logic_vector(15 downto 0) := x"0000";
	begin
	
	
		addr := (instr_byte_2 & instr_byte_1) + (x"00" & reg_byte);	
		return addr;	
	
	end;
	
	--Use 0 in reg_byte for zpg direct
	function zpg_addr(
		instr_byte_1 : in std_logic_vector(7 downto 0);--LO
		reg_byte : in std_logic_vector(7 downto 0))
		return std_logic_vector is variable addr : std_logic_vector(15 downto 0) := x"0000";
	begin
	
		addr := (x"00" & (x"FF" AND (instr_byte_1 + reg_byte)));	
		return addr;		
	
	end;
	
	
	function branch_addr(
			pc_in : in std_logic_vector(15 downto 0);
			instr_byte_1 : in std_logic_vector(7 downto 0))
			return std_logic_vector is variable pc_out : std_logic_vector(15 downto 0) := x"0000";
	begin
	
		--Add two because it's relative to next address
		pc_out := std_logic_vector(to_unsigned(to_integer(unsigned(pc_in)) + to_integer(signed(instr_byte_1)) + 2, 16));
		return pc_out;
		
	end;
 
end package body;