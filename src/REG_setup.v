module REG_setup
#(parameter N = 8)
(
	CLK,
	R,
	E,
	SW,
	setup
);

//clock, reset, habilitaçao
input wire CLK, R, E;
input wire [N-1:0] SW; 
output reg [N-1:0] setup;

always@(posedge CLK or posedge R)
begin
	if (R == 1'b1) //1 ou 0?
		setup <= 4'b0000;
	else
		if (E == 1'b1)
			setup <= SW; //recebe switch
		else 
		   setup <= setup;
end

endmodule