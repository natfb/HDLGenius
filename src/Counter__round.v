module Counter_round
#(parameter SIZE = 4)
(
	data,
	clk,
	R,
	E,
	win,
	ROUND
);

input wire [SIZE-1:0] data;
input wire clk, R, E;
output reg [SIZE-1:0] ROUND;
output reg win;

always @(posedge clk or posedge R) begin
	if (R == 1'b1) begin ROUND <= 4'b0000; win <= 1'b0; end
	else begin 
	if (E == 1'b1)	begin
	  	ROUND <= ROUND + 1'b1;
		win <= 1'b0;
	  
		if (ROUND == data) begin
			ROUND <= 4'b0000;
			win <= 1'b1;
		end
	
		end
	end
end

endmodule