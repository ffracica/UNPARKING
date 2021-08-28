module barrido(clk, filas);

input clk;
output reg [3:0] filas = 0;

reg [1:0] selector = 0;

always@(posedge clk)begin

selector = selector + 1;

	case(selector)
			2'b00: filas = 4'b1000;
			2'b01: filas = 4'b0100;
			2'b10: filas = 4'b0010;
			2'b11: filas = 4'b0001;
	endcase
	
end

endmodule
