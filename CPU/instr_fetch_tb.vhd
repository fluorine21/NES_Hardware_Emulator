library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity instr_fetch_tb is 
	generic(
		constant filename: string := "/cpu_if_mem_listing.txt";
		constant addr_width: integer := 16
		);
end instr_fetch_tb;

architecture behavior of instr_fetch_tb is
		signal clk       : std_logic;
	 	signal rst       : std_logic;
	--memory bus
		signal addr_out: std_logic_vector(15 downto 0); -- address bus going from IF to IE			
		signal new_op  : std_logic_vector(7 downto 0);
		signal alu_op  : std_logic_vector(2 downto 0); -- 000 = add, 001 = subtract, 010 = shift
																			-- 011 = and, 100 = or, 101 = xor
		signal pc_ie   : std_logic_vector(7 downto 0);
		signal pc		: std_logic_vector(7 downto 0); --going to IE

		
		-- special purpose registers
		signal x_reg: std_logic_vector(7 downto 0); 
		signal y_reg: std_logic_vector(7 downto 0); 
		signal acc_reg: std_logic_vector(7 downto 0);
		
	-- PORT MAP
		-- b2b memory access
		signal addr_1		: std_logic_vector(15 downto 0);
		signal addr_2		: std_logic_vector(15 downto 0);
		
		signal data_1		: std_logic_vector(7 downto 0);
		signal data_2		: std_logic_vector(7 downto 0);
		
		
		--flags
		signal accessing_mem_bus	: std_logic := '0'; --	1 means ready	
		signal ie_ready				: std_logic; -- 0 is ie computing, 1 is ie is ready for instruction
		signal imm_mode				: std_logic := '0'; -- immediate addy mode flag, 0 if no, 1 if yes
		
		signal store_flag				: std_logic_vector(2 downto 0) := "000"; -- 000 = not used, 001 = store in mem
																										-- 010 = acc, 011 = xreg, 100 = yreg
		signal reg_load_flag			: std_logic_vector(1 downto 0) := "00";  -- 00 = not used, 01 = load from acc
																										-- 10 = load from xreg, 11 = yreg 
		signal mem_load_flag			: std_logic := '0'; -- load to mem flag, 0 if no, 1 if loading from mem
		
		signal instr_valid			: std_logic;

	component instr_fetch 
	port(
	  signal clk       : in std_logic;
	  signal rst       : in std_logic;

	--memory bus
	  signal addr_out  : out std_logic_vector(15 downto 0); -- address bus going from IF to IE			
	  signal new_op    : out std_logic_vector(7 downto 0);
	  signal alu_op    : out std_logic_vector(2 downto 0); 
	  signal pc_ie     : in std_logic_vector(7 downto 0);
	  signal pc	   : out std_logic_vector(7 downto 0); --going to IE
		
	-- special purpose registers
	  signal x_reg     : in std_logic_vector(7 downto 0); 
	  signal y_reg     : in std_logic_vector(7 downto 0); 
	  signal acc_reg   : in std_logic_vector(7 downto 0);
	
	-- PORT MAP
	-- b2b memory access
	  signal addr_1		: out std_logic_vector(15 downto 0);
	  signal addr_2		: out std_logic_vector(15 downto 0);
	
	  signal data_1		: in std_logic_vector(7 downto 0);
	  signal data_2		: in std_logic_vector(7 downto 0);
	
	
	--flags
	  signal accessing_mem_bus	: out std_logic := '0'; --	1 means ready	
	  signal ie_ready		: in std_logic;         -- 0 is ie computing, 1 is ie is ready for instruction
	  signal imm_mode		: out std_logic := '0'; -- immediate addy mode flag, 0 if no, 1 if yes
	  signal store_flag		: out std_logic_vector(2 downto 0) := "000"; -- 000 = not used, 001 = store in mem																					-- 010 = acc, 011 = xreg, 100 = yreg
	  signal reg_load_flag		: out std_logic_vector(1 downto 0) := "00";  -- 00 = not used, 01 = load from acc																					-- 10 = load from xreg, 11 = yreg 
	  signal mem_load_flag		: out std_logic := '0'; -- load to mem flag, 0 if no, 1 if loading from mem
	  signal instr_valid		: out std_logic
	
	);
	end component; 

	
	begin instr_fetch_inst: 
		
		component generic_ram
			--uut: generic_ram 
			port map(
				cpu_mem_addr_1 => addr_1,
				cpu_mem_data_in => data_in_1, --what is this for? aren't we only inputting addresses?
				cpu_mem_wr_en => write_en,
				cpu_mem_data_out_1 => data_out_1 -- is the backwards arrow ok - or facing same way for outputs coming in?
				);
		end component;
			
			
		component instr_fetch
			port map(
					clk      => clk, 
					rst      => rst,
					addr_out => addr_out,			
					new_op   => new_op,   
					alu_op   => alu_op,   
					pc_ie    => pc_ie,
					pc       => pc,	   	
					x_reg    => x_reg, 
					y_reg    => y_reg,
					acc_reg  => acc_reg,
					
					addr_1 => cpu_mem_addr_1,		
					addr_2 => cpu_mem_addr_2,		
					
					cpu_mem_data_out_1 => data_1,		
					cpu_mem_data_out_2 => data_2,				
				
					accessing_mem_bus => accessing_mem_bus,
					ie_ready	  => ie_ready,
					imm_mode       	  => imm_mode,		
					store_flag        => store_flag,																			
					reg_load_flag     => reg_load_flag,																		
					mem_load_flag     => mem_load_flag,	
					instr_valid       => instr_valid
				);
			
		--mux statements (inputs of generic ram) to write to mem
			cpu_mem_addr_1 <= testbench_addr_1 when rst = '0' else cpu_addr_1;
			
			cpu_mem_data_in <= testbench_data_in when rst = '0' else cpu_data_in;
			
			cpu_mem_wr_en <= testbench_wr_en when rst = '0' else cpu_wr_en;
		instr_fetch: process is
			constant period: time := 50 ns;
			
			begin
				FILE asm_prog:TEXT; 
				
				variable L: line := 1;
				variable addy1, data1: integer := 0;
				
				begin
					rst <= '0'; -- setting rst to 0 bc we want testbench to write to mem

					file_open(f, filename, read_mode);
		
					while (not ENDFILE(asm_prog)) loop 
						wait until (clk = '1');
						wait until (clk = '0');
						write_addy_data_mem: for ii in 0 to 37 loop
						
							if (ie_ready = '1') then 
								readline(asm_prog, L);
								hread(L, addy1);	
								cpu_addr_line <= std_logic_vector(addy1);
								hread(L, data1);	
								cpu_data_line <= data1;
							
								cpu_wr_en<= '1';
							
							end loop write_addy_data_mem;
							
						else 
							cpu_wr_en<= '0';
						end if;
					end loop;
			
			wait;
		end process instr_fetch;
		
		
		clk_process : process is
			begin	
				clk <= '0';
				wait for 1 ns;
				for i in 0 to 20 loop
				clk <= '1';
				wait for 5 ns;
				clk <= '0';
				wait for 5 ns;
				end loop;
				wait;
		end process clk_process;

		
		wait;

end architecture behavior;
		