library verilog;
use verilog.vl_types.all;
entity FSM_clock is
    port(
        reset           : in     vl_logic;
        CLOCK_50        : in     vl_logic;
        C025Hz          : out    vl_logic;
        C05Hz           : out    vl_logic;
        C1Hz            : out    vl_logic;
        C2Hz            : out    vl_logic
    );
end FSM_clock;
