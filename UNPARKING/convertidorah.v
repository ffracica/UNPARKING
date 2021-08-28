module convertidorah(caracter, tecla);

input [3:0]caracter;
output reg [8:0]tecla = 0;


always@(*)begin
 
case (caracter)
		 4'b0000: tecla = 9'h15f;//0
		 4'b0001: tecla = 9'h131;//1
		 4'b0010: tecla = 9'h132;//2
		 4'b0011: tecla = 9'h133;//3
		 4'b0100: tecla = 9'h134;//4
		 4'b0101: tecla = 9'h135;//5
		 4'b0110: tecla = 9'h136;//6
		 4'b0111: tecla = 9'h137;//7
		 4'b1000: tecla = 9'h138;//8
		 4'b1001: tecla = 9'h139;//9
		 4'b1010: tecla = 9'h141;//A
		 4'b1011: tecla = 9'h142;//B
		 4'b1100: tecla = 9'h143;//C
		 4'b1101: tecla = 9'h144;//D
		 4'b1110: tecla = 9'h12A;//*
		 4'b1111: tecla = 9'h123;//#
		 
		 
   endcase



end
endmodule
