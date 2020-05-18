create_clock -name clk_50 -period 20.000 [get_ports {clk_50}]
create_clock -name clk_25 -period 40.000 [get_nets {clkdiv2_inst|out}]
derive_clock_uncertainty