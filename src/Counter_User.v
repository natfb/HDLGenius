module Counter_User
#(parameter SIZE = 4)
(
	data,
	clk,
	R,
	E,
	tc,
	SEQUSER
);

input wire [SIZE-1:0] data;
input wire clk, R, E;
output reg tc;
output reg [SIZE-1:0] SEQUSER; 

always @(posedge clk or posedge R) begin
	if (R == 1'b1) begin SEQUSER <= 4'b0000; tc <= 1'b0; end
	else begin 
	if (E == 1'b1)	begin
	  	SEQUSER <= SEQUSER + 1'b1;
		tc <= 1'b0;
	  
		if (SEQUSER == data) begin
			SEQUSER <= 4'b0000;
			tc <= 1'b1;
		end
	
		end
	end
end

endmodule