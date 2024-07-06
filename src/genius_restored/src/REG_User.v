module REG_User
#(parameter N = 64)
(
	CLK,
	R,
	E,
	data,
	q
);

//clock, reset, habilitaçao
input wire CLK, R, E;
input wire [N-1:0] data;
output reg [N-1:0] q; 

always@(posedge CLK or negedge R)
begin
	if (R == 1'b1) //1 ou 0?
		q <= 4'b0000;
	else
		if (E == 1'b1)
			q <= data;
		else 
		   q <= q;
end

endmodule
