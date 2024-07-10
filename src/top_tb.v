`timescale 1ns/100ps

module top_tb;

reg clk_tb;
reg R_R2, R_E2, R_R1;
reg [7:0] sw;
reg [63:0] data;
reg [3:0] key;

initial clk_tb <= 0;
initial sw <= 3'd0;

always #10 clk_tb <= ~clk_tb;

top U00(
	.CLOCK_50(clk_tb),
	.KEY(key[3:0]),
	.SW({sw[7:0], R_E2, R_R2}), 
	.LEDR(),
	.HEX0(),
	.HEX1(),
	.HEX2(),
	.HEX3(),
	.HEX4(),
	.HEX5()
);

REG_User R00(
  .CLK(clk_tb),
	.R(R_R2),
	.E(R_E2),
	.data(data[63:0]),
	.q()
);

initial
begin
R_R2 <= 1;
R_E2 <= 0;
sw <= 8'd0;

#50;
sw <= 8'd0;
R_E2 <= 1;

#50

sw <= 3'b100;
data <= 7'b1000000;

#50

R_R2 <= 1;
R_E2 <= 0;

#50
R_E2 <= 1;

#200000000;
$stop ; 
end

endmodule