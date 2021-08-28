module UNPARKING( clk,                                //CLOCK 50MHz
						LCD_RW, LCD_EN, LCD_RS, LCD_DATA,   //PANTALLA LCD
						filas,columnas,                                  //TECLADO (cambiarlo)
						count,                              //CONTADORES EN CADA PARQUEADERO
						s,                                  //SENSOR INFRARROJO
						m,                                  //MOTOR
						l,                                  //LEDS EN CADA PARQUEADERO
						c,                                  //BOTÓN PARA INDICAR QUE YA CANCELO
						);
//INPUT-OUTPUT/////////////////////////////////////////////////////////////////////////////
input clk;
inout [7:0] LCD_DATA; //LCD Data bus 8 bits
output LCD_RW;        //LCD Read/Write Select, 0 = Write, 1 = Read
output LCD_EN;        //LCD Enable
output LCD_RS;        //LCD Command/Data Select, 0 = Command, 1 = UNParking

input [5:0]count;
input s;
output reg [1:0]m;
output [5:0]l;
input c;

output [3:0]filas; 
input [3:0]columnas;

///////////////////////////////////////////////////////////////////////////////////////////


//REGISTROS////////////////////////////////////////////////////////////////////////////////
reg [3:0]status;
reg [10:0]counter;
reg [3:0]message;
reg [2:0]estacionados;
reg reset;
reg ingplaca;
reg ingzona;
reg abrir;
reg cerrar;
reg fin;
reg cancelo;
reg decidir;
reg swws;

///////////////////////////////////////////////////////////////////////////////////////////

//WIRES////////////////////////////////////////////////////////////////////////////////////
wire led;
wire ocupado;
wire estaba;
wire llego;
wire [23:0]placa;
wire [23:0]pl;
wire [3:0]pasignado;
wire [3:0]zona;
wire [3:0]teclado;
wire [20:0]counterp;
wire [3:0]dmin;
wire [3:0]umin;
wire [3:0]dseg;
wire [3:0]useg;
wire [2:0]carros;
///////////////////////////////////////////////////////////////////////////////////////////


//PARÁMETROS///////////////////////////////////////////////////////////////////////////////
parameter   START  = 4'b0000,//INICIO DE LA MAQUINA DE ESTADOS
				PLACA  = 4'b0001,//INGRESA PLACA
				DECIDE = 4'b0010,//DECIDE (ZONE-CANCEL)
				ZONE   = 4'b0011,//SELECCIONA ZONA
				CANCEL = 4'b0100,//DEBE CANCELAR
				OPEN   = 4'b0101,//ABRE EL PARQUEADERO
				CLOSE  = 4'b0110,//CIERRA EL PARQUEADERO
				ASIGNAR= 4'b0111,//ASIGNA UN PARQUEADERO
				LED    = 4'b1000,//LED DEL PARQUEADERO ASIGNADO
				PARK   = 4'b1001,//INICIAL EL COUNTER
				END    = 4'b1010;//FIN DE LA MAQUINA DE ESTADOS
///////////////////////////////////////////////////////////////////////////////////////////


//MÓDULOS//////////////////////////////////////////////////////////////////////////////////
divfreq DF0(clk, clock);
LCD_Top L0(clk,    LCD_RW, LCD_EN, LCD_RS, LCD_DATA, message, pl[23:20], pl[19:16], pl[15:12], pl[11:8], pl[7:4], pl[3:0], pasignado, dmin, umin, dseg, useg);
switch S00(clk, led, pasignado, count, swws);
ledparqueadero LP0(clock, led, pasignado, l);
placausada PU0(clock, ingplaca, teclado, placa, pl,);
lecturateclado T0(clk, filas, columnas, teclado);
asignar A0(clock, ingzona, cancelo, decidir, teclado, placa, pasignado, estaba, ocupado, counterp, carros);
factura F0(clk, counterp, dmin, umin, dseg, useg);


///////////////////////////////////////////////////////////////////////////////////////////



always@(posedge clock)begin


//MÁQUINA DE ESTADOS///////////////////////////////////////////////////////////////////////
case(status)
		START:begin
					reset = 1;
					if(ocupado)
						message = 4'b1100;//PARQUEADERO OCUPADO
					else
						message = 4'b0000;//BIENVENIDOS - UN-PARKING
					if(s == 0)
						status = PLACA;
				end
				
				
		PLACA:begin
					message = 4'b0010;//INGRESE SU PLACA - ====>XXXXXX<====
					ingplaca = 1;
					reset = 0;
					if(placa != 0)
						status = DECIDE;
						decidir = 1;
				end
				
				
		DECIDE:begin
					if(estaba)
						status = CANCEL;
					else
						status = ZONE;
				 end
				
				
		ZONE:begin
					decidir = 0;
					if(ocupado == 0)begin
						ingzona = 1;
						message = 4'b0011;//ELIJA LA ZONA - Z1>1 Z2>2 Z3>3
						if(pasignado != 0)
							status = ASIGNAR;
					end
					else if(ocupado) begin
						message = 4'b1100;//PARQUEADERO OCUPADO
						status = END;
					end
			 end
				
				
		CANCEL:begin
					ingzona = 0;
					decidir = 0;
					if(cancelo)begin
						status = OPEN;
						message = 4'b0111;//GRACIAS POR SU VISITA
						fin = 1;
						end
					else
						message = 4'b1111;//TOTAL A PAGAR - $X0000
				end
				
				
		ASIGNAR:begin
					message = 4'b0100;//SU PARQUEADERO - ASIGNADO >>> ZX PX
					status = OPEN;
					ingzona = 0;
				end
				
				OPEN:begin
					abrir = 1;
				end
				
				
		CLOSE:begin
					abrir = 0;
					cerrar = 1;
				end
				
		LED:begin
					cerrar = 0;
					message = 4'b0000;//BIENVENIDOS - UN-PARKING
					swws = 1;
					//if(estacionados == carros)
						status = PARK;
				end
				
				
		PARK:begin
					if(led == 0)begin
					   swws = 0;
						status = END;
					end
				end
				
				
		END:begin
					//swws = 0;
					cerrar = 0;
					fin = 0;
					status = START;
				end
endcase
///////////////////////////////////////////////////////////////////////////////////////////


//OPEN-CLOSE///////////////////////////////////////////////////////////////////////////////
if(abrir)begin
	if(counter < 'd3)begin
		m[0] = 1;
		m[1] = 0;
		counter = counter + 1;
	end
	if(counter == 'd3)begin
		m[0] = 0;
		if(s)begin//el carro ya no está
			counter = 0;
			status = CLOSE;
		end
	end
end


if(cerrar)begin
	message = 4'b1110;//CERRANDO - PARQUEADERO
	if(counter < 'd3)begin
		m[0] = 0;
		m[1] = 1;
		counter = counter + 1;
	end
	if(counter == 'd3)begin
		m[1] = 0;
		if(fin)begin
			counter = 0;
			status = END;
			
		end
		else
			status = LED;
	end
end
///////////////////////////////////////////////////////////////////////////////////////////


//RESET////////////////////////////////////////////////////////////////////////////////////
if(reset)begin
ingplaca = 0;
counter = 0;
//swws = 0;

end
///////////////////////////////////////////////////////////////////////////////////////////


//BOTÓN YA CANCELÓ/////////////////////////////////////////////////////////////////////////
if(c == 0)
	cancelo = 1;
else
	cancelo = 0;
///////////////////////////////////////////////////////////////////////////////////////////
//estacionados = count[0]+count[1]+count[2]+count[3]+count[4]+count[5];
end



endmodule
						