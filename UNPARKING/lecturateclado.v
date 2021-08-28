module lecturateclado (clk, filas, columnas, numer);

//entradas
input [3:0]columnas;
input clk;

//salidas
output [3:0]filas;
output [3:0]numer;


//módulos llamados
 
divfreq F1(clk, clke);//divfreqbarrido por si acaso
barrido R1(clke, filas);
comparador C1(filas, columnas, numer);

endmodule 

