LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
    port( 
        keyboard_clk, keyboard_data, clock_50MHz ,
        reset : in std_logic;--, read : in std_logic;
        w_out, a_out , d_out, s_out, p_out, o_out, tab_out, space_out: out std_logic

    );
end entity top;


architecture structural of top is


component ps2 is
    port( keyboard_clk, keyboard_data, clock_50MHz ,
        reset : in std_logic;--, read : in std_logic;
        scan_code : out std_logic_vector( 7 downto 0 );
        scan_readyo : out std_logic;
        hist3 : out std_logic_vector(7 downto 0);
        hist2 : out std_logic_vector(7 downto 0);
        hist1 : out std_logic_vector(7 downto 0);
        hist0 : out std_logic_vector(7 downto 0)
    );
end component ps2;

signal scan, hist1,hist21,hist31,hist01 : std_logic_vector(7 downto 0);
signal  scan_readyo: std_logic;
signal next_state_a, prev_state_a : std_logic := '0';
signal next_state_W, prev_state_W : std_logic := '0';
signal next_state_s, prev_state_s : std_logic := '0';
signal next_state_d, prev_state_d : std_logic := '0';
signal next_state_tab, prev_state_tab : std_logic := '0';
signal next_state_space, prev_state_space : std_logic := '0';
signal next_state_o, prev_state_o : std_logic := '0';
signal next_state_p, prev_state_p : std_logic := '0';


begin

keymap: ps2 port map(keyboard_clk, keyboard_data, clock_50MHz ,reset, scan, scan_readyo, hist31,hist21,hist1,hist01);


logic_process: process(clock_50MHz, reset, hist01, hist1, next_state_a, prev_state_a, next_state_w,
prev_state_w, next_state_d, prev_state_d, next_state_s, prev_state_s, next_state_space, prev_state_space,
next_state_tab, prev_state_tab, next_state_o, prev_state_o, next_state_p, prev_state_p) is

    begin

    if reset = '0' then

        a_out <= '0';
        w_out <= '0';
        s_out <= '0';
        d_out <= '0';
        o_out <= '0';
        p_out <= '0';
        space_out <= '0';
        tab_out <= '0';


    elsif rising_edge(clock_50MHz) then

        -- a code is 1C
        if hist1 = x"F0" and hist01 = x"1C" then
            next_state_a <= '0';
        elsif  ((hist1 = x"1C" and hist01 = x"1C") or (hist1 /= x"F0" and hist01 = x"1C" )) and prev_state_a = '0' then
            next_state_a <= '1';
        else
            next_state_a <= prev_state_a;
        end if;


        -- w code is 1D
        if hist1 = x"F0" and hist01 = x"1D" then
            next_state_w <= '0';
        elsif  ((hist1 = x"1D" and hist01 = x"1D") or (hist1 /= x"F0" and hist01 = x"1D" )) and prev_state_w = '0' then
            next_state_w <= '1';
        else
            next_state_w <= prev_state_w;
        end if;

        -- s code is 1B
        if hist1 = x"F0" and hist01 = x"1B" then
            next_state_s <= '0';
        elsif  ((hist1 = x"1B" and hist01 = x"1B") or (hist1 /= x"F0" and hist01 = x"1B" )) and prev_state_s = '0' then
            next_state_s <= '1';
        else
            next_state_s <= prev_state_s;
        end if;


        -- d code is 23
        if hist1 = x"F0" and hist01 = x"23" then
            next_state_d <= '0';
        elsif  ((hist1 = x"23" and hist01 = x"23") or (hist1 /= x"F0" and hist01 = x"23" )) and prev_state_d = '0' then
            next_state_d <= '1';
        else
            next_state_d <= prev_state_d;
        end if;

        -- space code is 29
        if hist1 = x"F0" and hist01 = x"29" then
            next_state_space <= '0';
        elsif  ((hist1 = x"29" and hist01 = x"29") or (hist1 /= x"F0" and hist01 = x"29" )) and prev_state_space = '0' then
            next_state_space <= '1';
        else
            next_state_space <= prev_state_space;
        end if;


        -- tab code is 0D
        if hist1 = x"F0" and hist01 = x"0D" then
            next_state_tab <= '0';
        elsif  ((hist1 = x"0D" and hist01 = x"0D") or (hist1 /= x"F0" and hist01 = x"0D" )) and prev_state_tab = '0' then
            next_state_tab <= '1';
        else
            next_state_tab <= prev_state_tab;
        end if;

        -- o code is 44
        if hist1 = x"F0" and hist01 = x"44" then
         next_state_o <= '0';
        elsif  ((hist1 = x"44" and hist01 = x"44") or (hist1 /= x"F0" and hist01 = x"44" )) and prev_state_o = '0' then
         next_state_o <= '1';
        else
            next_state_o <= prev_state_o;
        end if;


        -- p code is 4D
        if hist1 = x"F0" and hist01 = x"4D" then
            next_state_p <= '0';
        elsif  ((hist1 = x"4D" and hist01 = x"4D") or (hist1 /= x"F0" and hist01 = x"4D" )) and prev_state_p = '1' then
            next_state_p <= '1';
        else
            next_state_p <= prev_state_p;
        end if;
    
    
    end if;

    prev_state_a <= next_state_a;
    a_out <= next_state_a;

    prev_state_w <= next_state_w;
    w_out <= next_state_w;

    prev_state_d <= next_state_d;
    d_out <= next_state_d;

    prev_state_s <= next_state_s;
    s_out <= next_state_s;

    prev_state_o <= next_state_o;
    o_out <= next_state_o;

    prev_state_p <= next_state_p;
    p_out <= next_state_p;

    prev_state_space <= next_state_space;
    space_out <= next_state_space;

    prev_state_tab <= next_state_tab;
    tab_out <= next_state_tab;

end process;

end architecture structural;