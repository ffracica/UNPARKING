module comparador(filas, columnas, num);

input [3:0] filas;
input [3:0] columnas;

output reg [3:0] num=0;

always@(*)begin

		
		if (filas == 4'b1000)begin
				case(columnas)
						4'b1000: num = 4'd0001;//1
						4'b0100: num = 4'b0010;//2
						4'b0010: num = 4'b0011;//3
						4'b0001: num = 4'b1010;//a
				default: num = 4'b0000;
				endcase
			end
		if (filas == 4'b0100)begin
				case(columnas)
						4'b1000: num = 4'b0100;//4
						4'b0100: num = 4'b0101;//5
						4'b0010: num = 4'b0110;//6
						4'b0001: num = 4'b1011;//b
				default: num = 4'b0000;
				endcase
			end
		if (filas == 4'b0010)begin
				case(columnas)
						4'b1000: num = 4'b0111;//7
						4'b0100: num = 4'b1000;//8
						4'b0010: num = 4'b1001;//9
						4'b0001: num = 4'b1100;//c
				default: num = 4'b0000;
				endcase
			end
		if (filas == 4'b0001)begin
				case(columnas)
						4'b1000: num = 4'b1110;//e*
						4'b0100: num = 4'b0000;//0
						4'b0010: num = 4'b1111;//f# nossirve
						4'b0001: num = 4'b1101;//d
				default: num = 4'b0000;
				endcase
			end


end

endmodule

