create_clock -name clk_50_clk -period 20.000 [get_ports {clk_50}]
create_clock -name clk_25 -period 40.000 [get_nets {clkdiv2_inst|out}]
create_clock -name kb_c -period 100.000 [get_ports {k_c}]

create_clock -name s_r -period 100.000 k_to_j:k_to_j_inst|ps2:ps2_inst|keyboard:u1|scan_ready
create_clock -name key_c_int -period 100.000 k_to_j:k_to_j_inst|ps2:ps2_inst|keyboard:u1|keyboard_clk_filtered
create_clock -name r_s -period 100.000 k_to_j:k_to_j_inst|ps2:ps2_inst|keyboard:u1|ready_set

derive_clock_uncertainty
