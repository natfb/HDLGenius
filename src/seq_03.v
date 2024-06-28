module seq_03 //SEQ4
#(parameter SIZE = 4)
(
	address,
	saida
);

input wire [SIZE-1:0] address;
output reg [SIZE-1:0] saida;

always @(address) begin
        case (address)
				4'b0000: saida = 4'b0001;
				4'b0001: saida = 4'b1000;
				4'b0010: saida = 4'b0100;
				4'b0011: saida = 4'b1000;
				4'b0100: saida = 4'b0001;
				4'b0101: saida = 4'b0010;
				4'b0110: saida = 4'b0100;
				4'b0111: saida = 4'b1000;
				4'b1000: saida = 4'b0001;
				4'b1001: saida = 4'b0010;
				4'b1010: saida = 4'b1000;
				4'b1011: saida = 4'b0010;
				4'b1100: saida = 4'b0001;
				4'b1101: saida = 4'b1000;
				4'b1110: saida = 4'b0100;
				4'b1111: saida = 4'b0010;
        endcase
    end
    
endmodule