library verilog;
use verilog.vl_types.all;
entity mux2x1 is
    port(
        a_i             : in     vl_logic_vector(6 downto 0);
        b_i             : in     vl_logic_vector(6 downto 0);
        sel_i           : in     vl_logic;
        d_o             : out    vl_logic_vector(6 downto 0)
    );
end mux2x1;
