library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity instr_execute is
  port(
			signal clk: in std_logic;
    	signal rst: in std_logic;
    
  		signal new_op: in std_logic_vector(7 downto 0);
    	signal addr_out: in std_logic_vector(15 downto 0);
    	signal pc_in : in std_logic_vector(7 downto 0);
    	signal instr_valid : in std_logic;
      signal accessing_mem : in std_logic;
    	signal addr_out_is_imm : in std_logic;
    	
    	signal mem_load: in std_logic;
    	signal reg_load: in std_logic_vector(1 downto 0);
    	signal store_flag : in std_logic_vector(2 downto 0);
    	signal alu_op : in std_logic_vector(2 downto 0);    
    
    	signal y_in : in std_logic_vector(7 downto 0);
    	signal x_in : in std_logic_vector(7 downto 0);
    	signal acc_in : in std_logic_vector(7 downto 0);

    	signal y_out : out std_logic_vector(7 downto 0);
    	signal x_out : out std_logic_vector(7 downto 0);
    	signal acc_out : out std_logic_vector(7 downto 0);
    	signal pc_out : out std_logic_vector(7 downto 0);
    	signal ie_ready: out std_logic
  );
  
end entity instr_execute;
  
architecture a of instr_execute is
  
	TYPE state_type is (idle, setup, load, ALU, store, interrupts, done);
  signal state, next_state: state_type;

	signal input_mem : std_logic_vector(7 downto 0);
	signal input_reg : std_logic_vector(7 downto 0);

	signal proccessor_status: std_logic_vector(7 downto 0);

	begin
    
  comb_process: process(state, instr_valid, mem_load, reg_load, alu_op, store)
    
  begin
    
    case(state) is
      
      when idle =>
      		ie_ready <= '0';
      		if instr_valid = '1' then
            next_state <= setup;
      		end if;
            
            
      when setup =>
      		if (mem_load /= '0' or reg_load /= "00") then
            next_state <= load;
          elsif (alu_op /= "000") then
            next_state <= ALU;
          elsif (store /= "000") then
            next_state <= store;
          elsif ( --------------------)
            next_state <= interrupts;
          else 
            next_state <= state;
          end if;
            
            
      when load =>
      	if (alu_op /= "000") then
          next_state <= ALU;
        elsif (store /= "000") then
          next_state <= store;
        else 
          next_state <= done;
        end if;
            
        if mem_load = '1' and addr_out_is_imm = '0' then
            ----------load memory into input_mem with addr_out
        elsif mem_load = '1' and addr_out_is_imm = '1' then
            input_mem <= std_logic_vector(resize(unsigned(addr_out),8));
        else 
            input_mem <= "00000000";
        end if;
            
        if reg_load = "01" then
            input_reg <= acc_in;
        elsif reg_load = "10" then
            input_reg <= x_in;
        elsif reg_load = "11" then
            input_reg <= x_in;
        else 
            input_reg <= "00000000";
        end if;
            
            
      when ALU =>
      	if (store /= "000") then
          next_state <= store;
        else 
          next_state <= done;
            
            
      when store =>
      	next_state <= done;
        
            
            
      when interrupts =>
        next_state <= idle;
            
      when done =>
      	ie_ready <= '1';
        next_state <= idle;
      
            
    	when OTHERS =>
      	next_state <= idle;
            
            
    end case;    
  end process comb_process;
      
  clk_proc: process(rst, clk) 
    
		begin
      
		if (rst = '1') then
			state <= idle;
		elsif(rising_edge(clk)) then
			state <= next_state;
		end if;
      
	end process clk_proc;

  
end architecture a;