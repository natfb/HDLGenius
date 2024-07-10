library verilog;
use verilog.vl_types.all;
entity datapath is
    generic(
        p_key           : integer := 4;
        p_counter_tempo : integer := 4;
        p_switch        : integer := 8;
        p_hex           : integer := 7;
        p_led           : integer := 4
    );
    port(
        CLOCK_50        : in     vl_logic;
        KEY             : in     vl_logic_vector;
        SWITCH          : in     vl_logic_vector;
        R1              : in     vl_logic;
        R2              : in     vl_logic;
        E1              : in     vl_logic;
        E2              : in     vl_logic;
        E3              : in     vl_logic;
        E4              : in     vl_logic;
        SEL             : in     vl_logic;
        hex0            : out    vl_logic_vector;
        hex1            : out    vl_logic_vector;
        hex2            : out    vl_logic_vector;
        hex3            : out    vl_logic_vector;
        hex4            : out    vl_logic_vector;
        hex5            : out    vl_logic_vector;
        leds            : out    vl_logic_vector;
        end_FPGA        : out    vl_logic;
        end_User        : out    vl_logic;
        end_time        : out    vl_logic;
        win             : out    vl_logic;
        match           : out    vl_logic;
        SEQFPGA         : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of p_key : constant is 1;
    attribute mti_svvh_generic_type of p_counter_tempo : constant is 1;
    attribute mti_svvh_generic_type of p_switch : constant is 1;
    attribute mti_svvh_generic_type of p_hex : constant is 1;
    attribute mti_svvh_generic_type of p_led : constant is 1;
end datapath;
