module REG_FPGA
#(parameter N = 64)
(
	CLK,
	R,
	E,
	data,
	q,
	q3
);

//clock, reset, habilitaçao
input wire CLK, R, E;
input wire [N-1:0] data;
output reg [N-1:0] q; 
output reg [3:0] q3;

always@(posedge CLK or negedge R)
begin
	if (R == 1'b1) //1 ou 0?
		begin
		q <= 4'b0000;
		q3 <= 4'b0000;
		end
	else
		if (E == 1'b1)
			begin
			q <= data;
			q3 <= data[N:N-3];
			end
		else 
		   q <= q;
			q3 <= q3;
end

endmodule