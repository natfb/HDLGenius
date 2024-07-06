module logica (
	REG_SetupLEVEL,
	ROUND,
	REG_SetupMAPA,
	POINTS

);

input wire [1:0] REG_SetupLEVEL, REG_SetupMAPA;
input wire [3:0] ROUND;
output reg [7:0] POINTS;


//Para cada valor de REG_SetupLEVEL, a pontuação é calculada multiplicando o nível pelo número de sequências acertadas (ROUND)
always @(posedge REG_SetupLEVEL or posedge ROUND) begin
		case (REG_SetupLEVEL)
			2'b00: POINTS = 1 * ROUND;        // Nível 1
			2'b01: POINTS = 2 * ROUND;        // Nível 2
			2'b10: POINTS = 3 * ROUND;        // Nível 3
			2'b11: POINTS = 4 * ROUND;        // Nível 4
			default: POINTS = 8'b0;           
	  endcase
 end
 
 endmodule
 