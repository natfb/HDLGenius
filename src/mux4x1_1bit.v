module mux4x1_1bit (
	level,
	CL1,
	CL2,
	CL3,
	CL4,
	CLKHZ
);

localparam p_level = 2;

input wire CL1, CL2, CL3, CL4;
input wire [p_level - 1:0] level;

output reg CLKHZ;

always @ (CL1 or CL2 or CL3 or CL4 or level) begin
	case (level)
		2'b00 : CLKHZ <= CL1;
		2'b01 : CLKHZ <= CL2;
		2'b10 : CLKHZ <= CL3;
		2'b11 : CLKHZ <= CL4;
	endcase
end

endmodule