module asignar(clk, ingzona, cancelo, decidir, teclado, placa, pasignado, estaba, ocupado, counterp, carros);

input clk;
input ingzona;
input cancelo;
input decidir;
input [3:0]teclado;
input [23:0]placa;
output reg [3:0]pasignado;
output reg estaba;
output reg ocupado=0;
output reg [20:0]counterp;
output reg [2:0]carros;


reg [23:0]p1; 
reg [23:0]p2;
reg [23:0]p3;
reg [23:0]p4;
reg [23:0]p5;
reg [23:0]p6;

reg pu1;
reg pu2;
reg pu3;
reg pu4;
reg pu5;
reg pu6;

reg [20:0]countp1;
reg [20:0]countp2;
reg [20:0]countp3;
reg [20:0]countp4;
reg [20:0]countp5;
reg [20:0]countp6;

reg counter;


always@(posedge clk)begin

	

///////////////////////////////////////////////////////////////////////
if(decidir)begin
	case(placa)
		p1: begin estaba = 1; counterp = countp1; end
		p2: begin estaba = 1; counterp = countp2; end
		p3: begin estaba = 1; counterp = countp3; end
		p4: begin estaba = 1; counterp = countp4; end
		p5: begin estaba = 1; counterp = countp5; end
		p6: begin estaba = 1; counterp = countp6; end
		default begin
			estaba = 0;  counterp = 0; end
	endcase
end

if(ingzona == 1 && teclado != 0 && teclado <= 4'b0011)begin
//	case(placa)
//		p1: estaba = 1;
//		p2: estaba = 1;
//		p3: estaba = 1;
//		p4: estaba = 1;
//		p5: estaba = 1;
//		p6: estaba = 1;
//		default
//			estaba = 0;
//	endcase
	
case(teclado)
	4'b0001:begin
				if(p1==0) begin
						pasignado = 4'b0001;
						p1 = placa;
				end
				else if(p2==0) begin
						pasignado = 4'b0010;
						p2 = placa;
				end
				else if(p3==0) begin
						pasignado = 4'b0011;
						p3 = placa;
				end
				else if(p4==0) begin
						pasignado = 4'b0100;
						p4 = placa;
				end
				else if(p5==0) begin
						pasignado = 4'b0101;
						p5 = placa;
				end
				else if(p6==0) begin
						pasignado = 4'b0110;
						p6 = placa;
				end
		end
		
		4'b0010:begin
				if(p3==0) begin
						pasignado = 4'b0011;
						p3 = placa;
				end
				else if(p4==0) begin
						pasignado = 4'b0100;
						p4 = placa;
				end
				else if(p5==0) begin
						pasignado = 4'b0101;
						p5 = placa;
				end
				else if(p6==0) begin
						pasignado = 4'b0110;
						p6 = placa;
				end
				else if(p1==0) begin
						pasignado = 4'b0001;
						p1 = placa;
				end
				else if(p2==0) begin
						pasignado = 4'b0010;
						p2 = placa;
				end
		end
		
		4'b0011:begin
				if(p5==0) begin
						pasignado = 4'b0101;
						p5 = placa;
				end
				else if(p6==0) begin
						pasignado = 4'b0110;
						p6 = placa;
				end
				else if(p1==0) begin
						pasignado = 4'b0001;
						p1 = placa;
				end
				else if(p2==0) begin
						pasignado = 4'b0010;
						p2 = placa;
				end
				else if(p3==0) begin
						pasignado = 4'b0011;
						p3 = placa;
				end
				else if(p4==0) begin
						pasignado = 4'b0100;
						p4 = placa;
				end
		end
endcase
end
else if(ingzona == 0 && placa == 0)
	pasignado = 0;
///////////////////////////////////////////////////////////////////////

if(p1 != 0 && p2 != 0 && p3 != 0 && p4 != 0 && p5 != 0 && p6 != 0 && pasignado != 0)begin
	if(counter < 1)
		counter = counter + 1;
	else if(counter == 1)begin
		ocupado = 1;
		counter = 0;
	end
end
else if(p1 == 0 || p2 == 0 || p3 == 0 || p4 == 0 || p5 == 0 || p6 == 0)
	ocupado = 0;
	
if(cancelo)begin
	case(placa)
		p1: begin p1 = 0; countp1 = 0;end
		p2: begin p2 = 0; countp2 = 0;end
		p3: begin p3 = 0; countp3 = 0;end
		p4: begin p4 = 0; countp4 = 0;end
		p5: begin p5 = 0; countp5 = 0;end
		p6: begin p6 = 0; countp6 = 0;end
	endcase
end

if(p1 != 0)
		countp1 = countp1 + 1;
if(p2 != 0)
		countp2 = countp2 + 1;
if(p3 != 0)
		countp3 = countp3 + 1;
if(p4 != 0)
		countp4 = countp4 + 1;
if(p5 != 0)
		countp5 = countp5 + 1;
if(p6 != 0)
		countp6 = countp6 + 1;
	

if(p1 != 0)
		pu1 = 1;
else
		pu1 = 0;
if(p2 != 0)
		pu2 = 1;
else
		pu2 = 0;
if(p3 != 0)
		pu3 = 1;
else
		pu3 = 0;
if(p4 != 0)
		pu4 = 1;
else
		pu4 = 0;
if(p5 != 0)
		pu5 = 1;
else
		pu5 = 0;
if(p6 != 0)
		pu6 = 1;
else
		pu6 = 0;
		
carros = pu1 + pu2 + pu3 + pu4 + pu5 + pu6;
	
end
endmodule 