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

/////////////////////////////////////////////////////////////////////
//A=1//
//B=0//


//hex5
wire w_win; //DEVE CONCATENAR COM A SAÍDA WIN DE COUNTER_ROUND
assign win = w_win;
wire [6:0] w_mux2x1_hex5;
mux2x1 Uhex05(
	.a_i(7'b1000_111), ///U
	.b_i(7'b1011_011), //F
	.sel_i(w_win),
	.d_o(w_mux2x1_hex5)
);

mux2x1 Uhex05_1(
	.a_i(w_mux2x1_hex5),
	.b_i(7'b0001_110), //L
	.sel_i(SEL),
	.d_o(hex5)
);


//hex4
wire[7:0] SETUP;
wire[6:0] w_hex4_dec;
wire[6:0] w_mux2x1_hex4;
mux2x1 Uhex04(
	.a_i(7'b1011_011), //S
	.b_i(7'b1100_111), //P
	.sel_i(w_win),
	.d_o(w_mux2x1_hex4)
);

dec7seg hex4_D4(
    .bcd_i({2'b00, SETUP[7:6]}), //concatenação
    .seg_o(w_hex4_dec)
);

mux2x1 Uhex04_1(
	.a_i(w_mux2x1_hex4),
	.b_i(w_hex4_dec),
	.sel_i(SEL),
	.d_o(hex4)
);


//hex3
wire [6:0] w_mux2x1_hex3;
mux2x1 Uhex03(
	.a_i(7'b1001_111), ///E
	.b_i(7'b1111_011), //g
	.sel_i(w_win),
	.d_o(w_mux2x1_hex3)
);

mux2x1 Uhex03_1(
	.a_i(w_mux2x1_hex3),
	.b_i(7'b0001_111), //t
	.sel_i(SEL),
	.d_o(hex3)
);


//hex2
wire[3:0] TIME;
wire[6:0] w_hex2_dec;
wire[6:0] w_mux2x1_hex2;

mux2x1 Uhex02(
	.a_i(7'b1011_011), // r
	.b_i(7'b1100_111), // A
	.sel_i(w_win),
	.d_o(w_mux2x1_hex2)
);

dec7seg hex2_D2(
    .bcd_i(TIME),
    .seg_o(w_hex2_dec)
);

mux2x1 Uhex02_1(
	.a_i(w_mux2x1_hex2),
	.b_i(w_hex2_dec),
	.sel_i(SEL),
	.d_o(hex2)
);


//hex1
wire [7:0] POINTS;
wire [6:0] w_hex1_dec;

mux2x1 Uhex01(
	.a_i(w_hex1_dec), 
	.b_i(7'b0000_101), //r 
	.sel_i(SEL),
	.d_o(hex1)
);

dec7seg hex1_D1(
    .bcd_i(POINTS[7:4]),  //points[7:4}
    .seg_o(w_hex1_dec)
);


//hex0
wire[3:0] ROUND;
wire[6:0] w_hex0_dec;
wire[6:0] w_hex0_dec_2;

mux2x1 Uhex00(
	.a_i(w_hex0_dec), 
	.b_i(w_hex0_dec_2), 
	.sel_i(SEL),     
	.d_o(hex0)
);

dec7seg hex0_D2(
    .bcd_i(ROUND),
    .seg_o(w_hex0_dec_2)
);

dec7seg hex0_D1(
    .bcd_i(POINTS[3:0]), //points[3:0]
    .seg_o(w_hex0_dec)
);

////////////////////////////////////////////////////////////////////

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