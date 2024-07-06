module FSM_clock(
	reset,
	CLOCK_50,
	C025Hz,
	C05Hz,
	C1Hz,
	C2Hz
);

input wire reset,  CLOCK_50;
output reg C025Hz, C05Hz, C1Hz, C2Hz;
 
reg [27:0] r_C025Hz; reg [27:0] r_C05Hz; 
reg [27:0] r_C2Hz;  reg [27:0] r_C1Hz; 

//C025Hz
always @(posedge CLOCK_50 or posedge reset)
begin
	if(reset == 1'b1)
	begin
		C025Hz <= 1'b0;
		r_C025Hz <= 28'h0000000;
	end
	else 
	begin
		r_C025Hz <= r_C025Hz + 1;
		if (C025Hz == 28'h0000000)
		begin
			r_C025Hz <= 28'h0000000;
			C025Hz =~ r_C025Hz;
		end
	end
end

//C2Hz
always @(posedge CLOCK_50 or posedge reset)
begin
	if(reset == 1'b1)
	begin
		C2Hz <= 1'b0;
		r_C2Hz <= 28'h0000000;
	end
	else 
	begin
		r_C2Hz <= r_C2Hz + 1;
		if (C2Hz == 28'h0BEBC1F)
		begin
			r_C2Hz <= 28'h0000000;
			C2Hz <= ~r_C2Hz;
		end
	end
end

//C1Hz
always @(posedge CLOCK_50 or posedge reset)
begin
	if(reset == 1'b1)
	begin
		C1Hz <= 1'b0;
		r_C1Hz <= 28'h0000000;
	end
	else 
	begin
		r_C1Hz <= r_C1Hz + 1;
		if (C1Hz == 28'h0000000)
		begin
			r_C1Hz <= 28'h0000000;
			C1Hz <= ~r_C1Hz;
		end
	end
end

//C05Hz
always @(posedge CLOCK_50 or posedge reset)
begin
	if(reset == 1'b1)
	begin
		C05Hz <= 1'b0;
		r_C05Hz <= 28'h0000000;
	end
	else 
	begin
		r_C05Hz <= r_C05Hz + 1;
		if (C05Hz == 28'h0000000)
		begin
			r_C05Hz <= 28'h0000000;
			C05Hz <= ~r_C05Hz;
		end
	end
end

endmodule