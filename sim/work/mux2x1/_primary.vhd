library verilog;
use verilog.vl_types.all;
entity mux2x1 is
    port(
        a_i             : in     vl_logic;
        b_i             : in     vl_logic;
        sel_i           : in     vl_logic;
        d_o             : out    vl_logic
    );
end mux2x1;
