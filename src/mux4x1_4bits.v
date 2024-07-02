module mux4x1_4bits (
	SEL,
	ENT0,
	ENT1,
	ENT2,
	ENT3,
	saida
);

localparam p_SEL = 2;
localparam p_ent = 4;

input wire [p_ent - 1:0] ENT0, ENT1, ENT2, ENT3;
input wire [p_SEL - 1:0] SEL;

output reg [p_ent - 1:0] saida;

always @ (ENT0 or ENT1 or ENT2 or ENT3 or SEL) begin
	case (SEL)
		2'b00 : saida <= ENT0;
		2'b01 : saida <= ENT1;
		2'b10 : saida <= ENT2;
		2'b11 : saida <= ENT3;
	endcase
end

endmodule