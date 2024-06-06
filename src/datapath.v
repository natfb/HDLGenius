module datapath(
	CLOCK_50,
	KEY,
	SWITCH,
	R1, 
	R2, 
	E1, 
	E2, 
	E3, 
	E4,
	SEL,
	hex0, 
	hex1, 
	hex2, 
	hex3, 
	hex4, 
	hex5,
	leds,
	end_FPGA, 
	end_User, 
	end_time, 
	win, 
	match
);

parameter p_key = 4;
parameter p_counter_tempo = 4;
parameter p_switch = 8;
parameter p_hex = 7;
parameter p_led = 4;

input wire CLOCK_50, R1, R2, E1, E2, E3, E4, SEL;
input wire [p_key - 1:0] KEY; 
input wire [p_switch - 1:0] SWITCH;

output wire [p_led - 1:0] leds;
output wire [p_hex - 1:0] hex0, hex1, hex2, hex3, hex4, hex5;
output wire end_FPGA, end_User, end_time, win, match;

wire w_win;
wire w_mux2x1_hex5;

mux2x1 U01(
	.a_i(7'b011_1000), ///mudar numeros
	.b_i(7'b011_1000), //mudar numeros
	.sel_i(w_win),
	.d_o(w_mux2x1_hex5)
);

mux2x1 U00(
	.a_i(7'b011_1000),
	.b_i(w_mux2x1_hex5),
	.sel_i(SEL),
	.d_o(hex5)
);

wire [p_counter_tempo-1:0] w_TEMPO;
wire w_end_time;

Counter_time U02 (
	 .CLKT(CLOCK_50), 
	 .R(R2), 
	 .E(E2), 
	 .TEMPO(),
	 .end_time()
);

endmodule