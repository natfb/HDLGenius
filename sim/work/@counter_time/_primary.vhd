library verilog;
use verilog.vl_types.all;
entity Counter_time is
    generic(
        SIZE            : integer := 4
    );
    port(
        CLKT            : in     vl_logic;
        R               : in     vl_logic;
        E               : in     vl_logic;
        TEMPO           : out    vl_logic_vector;
        end_time        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end Counter_time;
