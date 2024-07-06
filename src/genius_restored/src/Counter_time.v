module Counter_time(
 CLKT, R, E, 
 TEMPO,
 end_time
);

parameter SIZE = 4;
input wire CLKT, R, E;

output reg [SIZE - 1:0] TEMPO;
output reg end_time;

always @(posedge CLKT or posedge R) begin
	if (R == 1'b1) begin TEMPO <= 4'b0000; end_time <= 1'b0; end
	else begin 
	if (E == 1'b1)	begin
	  	TEMPO <= TEMPO + 1'b1;
		 end_time <= 1'b0;
	  
		if (TEMPO <= 1'b1001) begin
			TEMPO <= 4'b0000;
			end_time <= 1'b1;
		end
	
		end
	end
end

endmodule