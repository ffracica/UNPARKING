module placausada(clk, ingplaca, teclado, placa, placafake,);

input clk;
input ingplaca;
input [3:0]teclado;
output reg [23:0]placa;
output reg [23:0]placafake;


//dígitos de la placa (6)
reg [3:0]d1=0;
reg [3:0]d2=0;
reg [3:0]d3=0;
reg [3:0]d4=0;
reg [3:0]d5=0;
reg [3:0]d6=0;


//el cero podría generar problemas

always @(posedge clk)begin



if(ingplaca)begin
	if(teclado != 0)begin
			if(d1 == 0)begin
				d1 = teclado;
				placafake[23:20] = teclado;
				end
			else if(d2 == 0)begin
				d2 = teclado;
				placafake[19:16] = teclado;
				end
			else if(d3 == 0)begin
				d3 = teclado;
				placafake[15:12] = teclado;
				end
			else if(d4 == 0)begin
				d4 = teclado;
				placafake[11:8] = teclado;
				end
			else if(d5 == 0)begin
				d5 = teclado;
				placafake[7:4] = teclado;
				end
			else if(d6 == 0)begin
				d6 = teclado;
				placafake[3:0] = teclado;
				end
	end
	
	
	if(d1 != 0 && d2 != 0 && d3 != 0 && d4 != 0 && d5 != 0 && d6 != 0)begin
			placa[23:20] = d1;
			placa[19:16] = d2;
			placa[15:12] = d3;
			placa[11:8] = d4;
			placa[7:4] = d5;
			placa[3:0] = d6;
	end
end

else begin
	d1 = 0;
	d2 = 0;
	d3 = 0;
	d4 = 0;
	d5 = 0;
	d6 = 0;
	placa = 24'b000000000000000000000000;
	placafake = 24'b000000000000000000000000;
end




end


endmodule 