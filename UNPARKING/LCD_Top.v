`timescale 1ns / 1ps
module LCD_Top(
                CLOCK_50,  //50 MZ
                 LCD_RW,   //LCD Read/Write Select, 0 = Write, 1 = Read
                 LCD_EN,   //LCD Enable
                 LCD_RS,   //LCD Command/Data Select, 0 = Command, 1 = Data
                 LCD_DATA, //LCD Data bus 8 bits
						m,
						PL1,
						PL2,
						PL3,
						PL4,
						PL5,
						PL6,
//						zona,
						pasignado,
						dmin,
						umin,
						dseg,
						useg,
					  );


reg [8:0] Mostrar_10;
reg [8:0] Mostrar_11;
reg [8:0] Mostrar_12;
reg [8:0] Mostrar_13;
reg [8:0] Mostrar_14;
reg [8:0] Mostrar_15;
reg [8:0] Mostrar_16;
reg [8:0] Mostrar_17;
reg [8:0] Mostrar_18;
reg [8:0] Mostrar_19;
reg [8:0] Mostrar_110;
reg [8:0] Mostrar_111;
reg [8:0] Mostrar_112;
reg [8:0] Mostrar_113;
reg [8:0] Mostrar_114;
reg [8:0] Mostrar_115;
reg [8:0] Mostrar_20;
reg [8:0] Mostrar_21;
reg [8:0] Mostrar_22;
reg [8:0] Mostrar_23;
reg [8:0] Mostrar_24;
reg [8:0] Mostrar_25;
reg [8:0] Mostrar_26;
reg [8:0] Mostrar_27;
reg [8:0] Mostrar_28;
reg [8:0] Mostrar_29;
reg [8:0] Mostrar_210;
reg [8:0] Mostrar_211;
reg [8:0] Mostrar_212;
reg [8:0] Mostrar_213;
reg [8:0] Mostrar_214;
reg [8:0] Mostrar_215;               


input CLOCK_50;       //50 MHz
inout [7:0] LCD_DATA; //LCD Data bus 8 bits

input [3:0]m;
input [3:0]PL1;
input [3:0]PL2;
input [3:0]PL3;
input [3:0]PL4;
input [3:0]PL5;
input [3:0]PL6;
//input [8:0]zona;
input [8:0]pasignado;
input [3:0]dmin;
input [3:0]umin;
input [3:0]dseg;
input [3:0]useg;

output LCD_RW;        //LCD Read/Write Select, 0 = Write, 1 = Read
output LCD_EN;        //LCD Enable
output LCD_RS;        //LCD Command/Data Select, 0 = Command, 1 = Data


//reg [10:0]placa1 = pl1;
reg [10:0]placa2 = 9'h142;
reg [10:0]placa3 = 9'h143;
reg [10:0]placa4 = 9'h144;
reg [10:0]placa5 = 9'h145;
reg [10:0]placa6 = 9'h146;

reg [8:0]paga;

reg [8:0]zn;

wire [8:0]D1;
wire [8:0]D2;
wire [8:0]D3;
wire [8:0]D4;
wire [8:0]D5;
wire [8:0]D6;

wire [8:0]pa;

wire [8:0]DM;
wire [8:0]UM;
wire [8:0]DS;
wire [8:0]US;



wire DLY_RST;


Reset_Delay r0 ( .iCLK(CLOCK_50),.oRESET(DLY_RST)    );

convertidorah d1(PL1, D1);
convertidorah d2(PL2, D2);
convertidorah d3(PL3, D3);
convertidorah d4(PL4, D4);
convertidorah d5(PL5, D5);
convertidorah d6(PL6, D6);
//convertidorah z0(zona, zn);

convertidorah Pasig(pasignado, pa);
convertidorahcero dm(dmin, DM);
convertidorahcero um(umin, UM);
convertidorahcero ds(dseg, DS);
convertidorahcero us(useg, US);



always @ ( CLOCK_50)begin
case(pasignado)
		4'b0000: zn = 9'h130;
		4'b0001: zn = 9'h131;
		4'b0010: zn = 9'h131;
		4'b0011: zn = 9'h132;
		4'b0100: zn = 9'h132;
		4'b0101: zn = 9'h133;
		4'b0110: zn = 9'h133;
endcase



case(m)

	4'b0000:begin//BIENVENIDOS UN PARKING
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h120;//ESPACIO
      Mostrar_12 <=9'h142;//B
      Mostrar_13 <=9'h149;//I
      Mostrar_14 <=9'h145;//E
      Mostrar_15 <=9'h14E;//N
      Mostrar_16 <=9'h156;//V
      Mostrar_17 <=9'h145;//E
      Mostrar_18 <=9'h14E;//N
      Mostrar_19 <=9'h149;//I
      Mostrar_110<=9'h144;//D
      Mostrar_111<=9'h14F;//O
      Mostrar_112<=9'h153;//S
      Mostrar_113<=9'h120;//ESPACIO
      Mostrar_114<=9'h120;//ESPACIO
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h120;//ESPACIO
      Mostrar_21 <=9'h120;//ESPACIO
      Mostrar_22 <=9'h120;//ESPACIO
      Mostrar_23 <=9'h155;//U
      Mostrar_24 <=9'h14E;//N
      Mostrar_25 <=9'h120;//ESPACIO----
      Mostrar_26 <=9'h150;//P
      Mostrar_27 <=9'h141;//A
      Mostrar_28 <=9'h152;//R
      Mostrar_29 <=9'h14B;//K
      Mostrar_210<=9'h149;//I
      Mostrar_211<=9'h14E;//N
      Mostrar_212<=9'h147;//G
      Mostrar_213<=9'h120;//ESPACIO
      Mostrar_214<=9'h120;//ESPACIO
      Mostrar_215<=9'h120;//ESPACIO
		end

	4'b0001:begin//ESTE MENSAJE ESTA LIBRE--------------------
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h120;//ESPACIO
      Mostrar_12 <=9'h120;//P
		Mostrar_13 <=9'h150;//A
      Mostrar_14 <=9'h14F;//R
      Mostrar_15 <=9'h152;//Q
      Mostrar_16 <=9'h120;//U
      Mostrar_17 <=9'h146;//E
      Mostrar_18 <=9'h141;//A
      Mostrar_19 <=9'h156;//D
      Mostrar_110<=9'h14F;//E
      Mostrar_111<=9'h152;//R
      Mostrar_112<=9'h120;//O
      Mostrar_113<=9'h120;//ESPACIO
      Mostrar_114<=9'h120;//ESPACIO
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h149;//I
      Mostrar_21 <=9'h14E;//N
      Mostrar_22 <=9'h147;//G
      Mostrar_23 <=9'h152;//R
      Mostrar_24 <=9'h145;//E
      Mostrar_25 <=9'h153;//S
      Mostrar_26 <=9'h145;//E
      Mostrar_27 <=9'h120;//ESPACIO
      Mostrar_28 <=9'h153;//S
      Mostrar_29 <=9'h155;//U
      Mostrar_210<=9'h120;//ESPACIO
      Mostrar_211<=9'h150;//P
      Mostrar_212<=9'h14C;//L
      Mostrar_213<=9'h141;//A
      Mostrar_214<=9'h143;//C
      Mostrar_215<=9'h141;//A
		end
	
	4'b0010:begin//INGRESE SU PLACA//////////////////////////
		Mostrar_10 <=9'h149;//I
      Mostrar_11 <=9'h14E;//N
      Mostrar_12 <=9'h147;//G
      Mostrar_13 <=9'h152;//R
      Mostrar_14 <=9'h145;//E
      Mostrar_15 <=9'h153;//S
      Mostrar_16 <=9'h145;//E
      Mostrar_17 <=9'h120;//ESPACIO
      Mostrar_18 <=9'h153;//S
      Mostrar_19 <=9'h155;//U
      Mostrar_110<=9'h120;//ESPACIO
      Mostrar_111<=9'h150;//P
      Mostrar_112<=9'h14C;//L
      Mostrar_113<=9'h141;//A
      Mostrar_114<=9'h143;//C
      Mostrar_115<=9'h141;//A
		
      Mostrar_20 <=9'h13d;//-
      Mostrar_21 <=9'h13d;//-
      Mostrar_22 <=9'h13d;//-
      Mostrar_23 <=9'h13d;//-
      Mostrar_24 <=9'h13e;//>
      Mostrar_25 <=    D1;//PL1
      Mostrar_26 <=    D2;//PL2
      Mostrar_27 <=    D3;//PL3
      Mostrar_28 <=    D4;//PL4
      Mostrar_29 <=    D5;//PL5
      Mostrar_210<=    D6;//PL6
      Mostrar_211<=9'h13c;//<
      Mostrar_212<=9'h13d;//-
      Mostrar_213<=9'h13d;//-
      Mostrar_214<=9'h13d;//-
      Mostrar_215<=9'h13d;//-
		end
	
	4'b0011:begin//ELIJA LA ZONA/////////////////////////////
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h145;//E
      Mostrar_12 <=9'h14C;//L
      Mostrar_13 <=9'h149;//I
      Mostrar_14 <=9'h14A;//J
      Mostrar_15 <=9'h141;//A
      Mostrar_16 <=9'h120;//ESPACIO
      Mostrar_17 <=9'h14C;//L
      Mostrar_18 <=9'h141;//A
      Mostrar_19 <=9'h120;//ESPACIO
      Mostrar_110<=9'h15A;//Z
      Mostrar_111<=9'h14F;//O
      Mostrar_112<=9'h14E;//N
      Mostrar_113<=9'h141;//A
      Mostrar_114<=9'h120;//ESPACIO
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h120;//ESPACIO 
      Mostrar_21 <=9'h15a;//Z
      Mostrar_22 <=9'h131;//1
      Mostrar_23 <=9'h13e;//>
      Mostrar_24 <=9'h131;//1
      Mostrar_25 <=9'h120;//ESPACIO
      Mostrar_26 <=9'h15a;//Z
      Mostrar_27 <=9'h132;//2
      Mostrar_28 <=9'h13e;//>
      Mostrar_29 <=9'h132;//2
      Mostrar_210<=9'h120;//ESPACIO
      Mostrar_211<=9'h15a;//Z
      Mostrar_212<=9'h133;//3
      Mostrar_213<=9'h13e;//>
      Mostrar_214<=9'h133;//3
      Mostrar_215<=9'h120;//ESPACIO
		end
	
	4'b0100:begin//SU PARQUEADERO ASIGNADO ES///////////////////////
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h153;//S
      Mostrar_12 <=9'h155;//U
      Mostrar_13 <=9'h120;//ESPACIO
      Mostrar_14 <=9'h150;//P
      Mostrar_15 <=9'h141;//A
      Mostrar_16 <=9'h152;//R
      Mostrar_17 <=9'h151;//Q
      Mostrar_18 <=9'h155;//U
      Mostrar_19 <=9'h145;//E
      Mostrar_110<=9'h141;//A
      Mostrar_111<=9'h144;//D
      Mostrar_112<=9'h145;//E
      Mostrar_113<=9'h152;//R
      Mostrar_114<=9'h14F;//O
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h141;//A
      Mostrar_21 <=9'h153;//S
      Mostrar_22 <=9'h149;//I
      Mostrar_23 <=9'h147;//G
      Mostrar_24 <=9'h14E;//N
      Mostrar_25 <=9'h141;//A
      Mostrar_26 <=9'h144;//D
      Mostrar_27 <=9'h14F;//O
      Mostrar_28 <=9'h13e;//>
      Mostrar_29 <=9'h13e;//>
      Mostrar_210<=9'h13e;//>
      Mostrar_211<=9'h15a;//z
      Mostrar_212<=    zn;//zasignada
      Mostrar_213<=9'h12c;//-
      Mostrar_214<=9'h150;//P
      Mostrar_215<=    pa;//PARQUEADERO ASIGNADO
	end
	
	4'b0101:begin
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h153;//S
      Mostrar_12 <=9'h149;//I
      Mostrar_13 <=9'h147;//G
      Mostrar_14 <=9'h141;//A
      Mostrar_15 <=9'h120;//ESPACIO
      Mostrar_16 <=9'h150;//P
      Mostrar_17 <=9'h14F;//O
      Mostrar_18 <=9'h152;//R
      Mostrar_19 <=9'h120;//ESPACIO
      Mostrar_110<=9'h146;//F
      Mostrar_111<=9'h141;//A
      Mostrar_112<=9'h156;//V
      Mostrar_113<=9'h14F;//O
      Mostrar_114<=9'h152;//R
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h150;//P
      Mostrar_21 <=9'h141;//A
      Mostrar_22 <=9'h152;//R
      Mostrar_23 <=9'h151;//Q
      Mostrar_24 <=9'h155;//U
      Mostrar_25 <=9'h145;//E
      Mostrar_26 <=9'h141;//A
      Mostrar_27 <=9'h144;//D
      Mostrar_28 <=9'h145;//E
      Mostrar_29 <=9'h152;//R
      Mostrar_210<=9'h14F;//O
      Mostrar_211<=9'h120;//ESPACIO
      Mostrar_212<=9'h15A;//Z
      Mostrar_213<=    zn;//ZONA ELEGIDA
      Mostrar_214<=9'h150;//P
      Mostrar_215<=    pa;//PARQUEADERO ASIGNADO
	end
	
	4'b0110:begin
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h154;//T
      Mostrar_12 <=9'h14F;//O
      Mostrar_13 <=9'h154;//T
      Mostrar_14 <=9'h141;//A
      Mostrar_15 <=9'h14C;//L
      Mostrar_16 <=9'h120;//ESPACIO
      Mostrar_17 <=9'h141;//A
      Mostrar_18 <=9'h120;//ESPACIO
      Mostrar_19 <=9'h150;//P
      Mostrar_110<=9'h141;//A
      Mostrar_111<=9'h147;//G
      Mostrar_112<=9'h141;//A
      Mostrar_113<=9'h152;//R
      Mostrar_114<=9'h120;//ESPACIO
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h120;//ESPACIO
      Mostrar_21 <=9'h120;//ESPACIO
      Mostrar_22 <=9'h120;//ESPACIO
      Mostrar_23 <=9'h120;//ESPACIO
      Mostrar_24 <=9'h120;//ESPACIO
      Mostrar_25 <=9'h124;//$
      Mostrar_26 <=9'h133;//PAGAR
      Mostrar_27 <=9'h130;//0
      Mostrar_28 <=9'h130;//0
      Mostrar_29 <=9'h130;//0
      Mostrar_210<=9'h120;//ESPACIO
      Mostrar_211<=9'h120;//ESPACIO
      Mostrar_212<=9'h120;//ESPACIO
      Mostrar_213<=9'h120;//ESPACIO
      Mostrar_214<=9'h120;//ESPACIO
      Mostrar_215<=9'h120;//ESPACIO
	end
	
	4'b0111:begin
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h120;//ESPACIO
      Mostrar_12 <=9'h147;//G
      Mostrar_13 <=9'h152;//R
      Mostrar_14 <=9'h141;//A
      Mostrar_15 <=9'h143;//C
      Mostrar_16 <=9'h149;//I
      Mostrar_17 <=9'h141;//A
      Mostrar_18 <=9'h153;//S
      Mostrar_19 <=9'h120;//ESPACIO
      Mostrar_110<=9'h150;//P
      Mostrar_111<=9'h14F;//O
      Mostrar_112<=9'h152;//R
      Mostrar_113<=9'h120;//ESPACIO
      Mostrar_114<=9'h120;//ESPACIO
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h120;//ESPACIO
      Mostrar_21 <=9'h120;//ESPACIO
      Mostrar_22 <=9'h120;//ESPACIO
      Mostrar_23 <=9'h153;//S
      Mostrar_24 <=9'h155;//U
      Mostrar_25 <=9'h120;//ESPACIO
      Mostrar_26 <=9'h156;//V
      Mostrar_27 <=9'h149;//I
      Mostrar_28 <=9'h153;//S
      Mostrar_29 <=9'h149;//I
      Mostrar_210<=9'h154;//T
      Mostrar_211<=9'h141;//A
      Mostrar_212<=9'h121;//!
      Mostrar_213<=9'h120;//ESPACIO
      Mostrar_214<=9'h120;//ESPACIO
      Mostrar_215<=9'h120;//ESPACIO
	end
	
//	4'b1000:begin
//		Mostrar_10 <=9'h;//
//      Mostrar_11 <=9'h;//
//      Mostrar_12 <=9'h;//
//      Mostrar_13 <=9'h;//
//      Mostrar_14 <=9'h;//
//      Mostrar_15 <=9'h;//
//      Mostrar_16 <=9'h;//
//      Mostrar_17 <=9'h;//
//      Mostrar_18 <=9'h;//
//      Mostrar_19 <=9'h;//
//      Mostrar_110<=9'h;//
//      Mostrar_111<=9'h;//
//      Mostrar_112<=9'h;//
//      Mostrar_113<=9'h;//
//      Mostrar_114<=9'h;//
//      Mostrar_115<=9'h;//
//      Mostrar_20 <=9'h;//
//      Mostrar_21 <=9'h;//
//      Mostrar_22 <=9'h;//
//      Mostrar_23 <=9'h;//
//      Mostrar_24 <=9'h;//
//      Mostrar_25 <=9'h;//
//      Mostrar_26 <=9'h;//
//      Mostrar_27 <=9'h;//
//      Mostrar_28 <=9'h;//
//      Mostrar_29 <=9'h;//
//      Mostrar_210<=9'h;//
//      Mostrar_211<=9'h;//
//      Mostrar_212<=9'h;//
//      Mostrar_213<=9'h;//
//      Mostrar_214<=9'h;//
//      Mostrar_215<=9'h;//
//	end
//	
//	4'b1001:begin
//		Mostrar_10 <=9'h;//
//      Mostrar_11 <=9'h;//
//      Mostrar_12 <=9'h;//
//      Mostrar_13 <=9'h;//
//      Mostrar_14 <=9'h;//
//      Mostrar_15 <=9'h;//
//      Mostrar_16 <=9'h;//
//      Mostrar_17 <=9'h;//
//      Mostrar_18 <=9'h;//
//      Mostrar_19 <=9'h;//
//      Mostrar_110<=9'h;//
//      Mostrar_111<=9'h;//
//      Mostrar_112<=9'h;//
//      Mostrar_113<=9'h;//
//      Mostrar_114<=9'h;//
//      Mostrar_115<=9'h;//
//      Mostrar_20 <=9'h;//
//      Mostrar_21 <=9'h;//
//      Mostrar_22 <=9'h;//
//      Mostrar_23 <=9'h;//
//      Mostrar_24 <=9'h;//
//      Mostrar_25 <=9'h;//
//      Mostrar_26 <=9'h;//
//      Mostrar_27 <=9'h;//
//      Mostrar_28 <=9'h;//
//      Mostrar_29 <=9'h;//
//      Mostrar_210<=9'h;//
//      Mostrar_211<=9'h;//
//      Mostrar_212<=9'h;//
//      Mostrar_213<=9'h;//
//      Mostrar_214<=9'h;//
//      Mostrar_215<=9'h;//
//	end
//	
//	4'b1010:begin
//		Mostrar_10 <=9'h;//
//      Mostrar_11 <=9'h;//
//      Mostrar_12 <=9'h;//
//      Mostrar_13 <=9'h;//
//      Mostrar_14 <=9'h;//
//      Mostrar_15 <=9'h;//
//      Mostrar_16 <=9'h;//
//      Mostrar_17 <=9'h;//
//      Mostrar_18 <=9'h;//
//      Mostrar_19 <=9'h;//
//      Mostrar_110<=9'h;//
//      Mostrar_111<=9'h;//
//      Mostrar_112<=9'h;//
//      Mostrar_113<=9'h;//
//      Mostrar_114<=9'h;//
//      Mostrar_115<=9'h;//
//      Mostrar_20 <=9'h;//
//      Mostrar_21 <=9'h;//
//      Mostrar_22 <=9'h;//
//      Mostrar_23 <=9'h;//
//      Mostrar_24 <=9'h;//
//      Mostrar_25 <=9'h;//
//      Mostrar_26 <=9'h;//
//      Mostrar_27 <=9'h;//
//      Mostrar_28 <=9'h;//
//      Mostrar_29 <=9'h;//
//      Mostrar_210<=9'h;//
//      Mostrar_211<=9'h;//
//      Mostrar_212<=9'h;//
//      Mostrar_213<=9'h;//
//      Mostrar_214<=9'h;//
//      Mostrar_215<=9'h;//
//	end
//	
//	4'b1011:begin
//		Mostrar_10 <=9'h;//
//      Mostrar_11 <=9'h;//
//      Mostrar_12 <=9'h;//
//      Mostrar_13 <=9'h;//
//      Mostrar_14 <=9'h;//
//      Mostrar_15 <=9'h;//
//      Mostrar_16 <=9'h;//
//      Mostrar_17 <=9'h;//
//      Mostrar_18 <=9'h;//
//      Mostrar_19 <=9'h;//
//      Mostrar_110<=9'h;//
//      Mostrar_111<=9'h;//
//      Mostrar_112<=9'h;//
//      Mostrar_113<=9'h;//
//      Mostrar_114<=9'h;//
//      Mostrar_115<=9'h;//
//      Mostrar_20 <=9'h;//
//      Mostrar_21 <=9'h;//
//      Mostrar_22 <=9'h;//
//      Mostrar_23 <=9'h;//
//      Mostrar_24 <=9'h;//
//      Mostrar_25 <=9'h;//
//      Mostrar_26 <=9'h;//
//      Mostrar_27 <=9'h;//
//      Mostrar_28 <=9'h;//
//      Mostrar_29 <=9'h;//
//      Mostrar_210<=9'h;//
//      Mostrar_211<=9'h;//
//      Mostrar_212<=9'h;//
//      Mostrar_213<=9'h;//
//      Mostrar_214<=9'h;//
//      Mostrar_215<=9'h;//
//	end
	
	4'b1100:begin//PARQUEADERO OCUPADO
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h120;//ESPACIO
      Mostrar_12 <=9'h150;//P
      Mostrar_13 <=9'h141;//A
      Mostrar_14 <=9'h152;//R
      Mostrar_15 <=9'h151;//Q
      Mostrar_16 <=9'h155;//U
      Mostrar_17 <=9'h145;//E
      Mostrar_18 <=9'h141;//A
      Mostrar_19 <=9'h144;//D
      Mostrar_110<=9'h145;//E
      Mostrar_111<=9'h152;//R
      Mostrar_112<=9'h14f;//O
      Mostrar_113<=9'h120;//ESPACIO
      Mostrar_114<=9'h120;//ESPACIO
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h120;//ESPACIO
      Mostrar_21 <=9'h120;//ESPACIO
      Mostrar_22 <=9'h120;//ESPACIO
      Mostrar_23 <=9'h120;//ESPACIO
      Mostrar_24 <=9'h14f;//O
      Mostrar_25 <=9'h143;//C
      Mostrar_26 <=9'h155;//U
      Mostrar_27 <=9'h150;//P
      Mostrar_28 <=9'h141;//A
      Mostrar_29 <=9'h144;//D
      Mostrar_210<=9'h14f;//O
      Mostrar_211<=9'h120;//ESPACIO
      Mostrar_212<=9'h120;//ESPACIO
      Mostrar_213<=9'h120;//ESPACIO
      Mostrar_214<=9'h120;//ESPACIO
      Mostrar_215<=9'h120;//ESPACIO
	end
	
	4'b1101:begin//ABRIENDO PARQUEADERO
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h120;//ESPACIO
      Mostrar_12 <=9'h120;//ESPACIO
      Mostrar_13 <=9'h120;//ESPACIO
      Mostrar_14 <=9'h141;//A
      Mostrar_15 <=9'h142;//B
      Mostrar_16 <=9'h152;//R
      Mostrar_17 <=9'h149;//I
      Mostrar_18 <=9'h145;//E
      Mostrar_19 <=9'h14e;//N
      Mostrar_110<=9'h144;//D
      Mostrar_111<=9'h14f;//O
      Mostrar_112<=9'h120;//ESPACIO
      Mostrar_113<=9'h120;//ESPACIO
      Mostrar_114<=9'h120;//ESPACIO
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h120;//ESPACIO
      Mostrar_21 <=9'h120;//ESPACIO
      Mostrar_22 <=9'h150;//P
      Mostrar_23 <=9'h141;//A
      Mostrar_24 <=9'h152;//R
      Mostrar_25 <=9'h151;//Q
      Mostrar_26 <=9'h155;//U
      Mostrar_27 <=9'h145;//E
      Mostrar_28 <=9'h141;//A
      Mostrar_29 <=9'h144;//D
      Mostrar_210<=9'h145;//E
      Mostrar_211<=9'h152;//R
      Mostrar_212<=9'h14f;//O
      Mostrar_213<=9'h120;//ESPACIO
      Mostrar_214<=9'h120;//ESPACIO
      Mostrar_215<=9'h120;//ESPACIO
	end
	
	4'b1110:begin//CERRANDO PARQUEADERO
		Mostrar_10 <=9'h120;//ESPACIO
      Mostrar_11 <=9'h120;//ESPACIO
      Mostrar_12 <=9'h120;//ESPACIO
      Mostrar_13 <=9'h120;//ESPACIO
      Mostrar_14 <=9'h143;//C
      Mostrar_15 <=9'h145;//E
      Mostrar_16 <=9'h152;//R
      Mostrar_17 <=9'h152;//R
      Mostrar_18 <=9'h141;//A
      Mostrar_19 <=9'h14e;//N
      Mostrar_110<=9'h144;//D
      Mostrar_111<=9'h14f;//O
      Mostrar_112<=9'h120;//ESPACIO
      Mostrar_113<=9'h120;//ESPACIO
      Mostrar_114<=9'h120;//ESPACIO
      Mostrar_115<=9'h120;//ESPACIO
		
      Mostrar_20 <=9'h120;//ESPACIO
      Mostrar_21 <=9'h120;//ESPACIO
      Mostrar_22 <=9'h150;//P
      Mostrar_23 <=9'h141;//A
      Mostrar_24 <=9'h152;//R
      Mostrar_25 <=9'h151;//Q
      Mostrar_26 <=9'h155;//U
      Mostrar_27 <=9'h145;//E
      Mostrar_28 <=9'h141;//A
      Mostrar_29 <=9'h144;//D
      Mostrar_210<=9'h145;//E
      Mostrar_211<=9'h152;//R
      Mostrar_212<=9'h14f;//O
      Mostrar_213<=9'h120;//ESPACIO
      Mostrar_214<=9'h120;//ESPACIO
      Mostrar_215<=9'h120;//ESPACIO
	end
	
4'b1111:begin//TIEMPO===>XXMIN - TOTAL ===> $12
		Mostrar_10 <=9'h154;//T
      Mostrar_11 <=9'h149;//I
      Mostrar_12 <=9'h145;//E
      Mostrar_13 <=9'h14D;//M
      Mostrar_14 <=9'h150;//P
      Mostrar_15 <=9'h14F;//O
      Mostrar_16 <=9'h120;//ESPACIO
      Mostrar_17 <=9'h13D;//=
      Mostrar_18 <=9'h13D;//=
      Mostrar_19 <=9'h13E;//>
      Mostrar_110<=9'h120;//ESPACIO
      Mostrar_111<=    DM;//DM
      Mostrar_112<=    UM;//UM
      Mostrar_113<=9'h14D;//M
      Mostrar_114<=9'h149;//I
      Mostrar_115<=9'h14E;//N
		
		Mostrar_20 <=9'h154;//T
      Mostrar_21 <=9'h14F;//O
      Mostrar_22 <=9'h154;//T
      Mostrar_23 <=9'h141;//A
      Mostrar_24 <=9'h14C;//L
      Mostrar_25 <=9'h120;//ESPACIO
      Mostrar_26 <=9'h120;//ESPACIO
      Mostrar_27 <=9'h13D;//=
      Mostrar_28 <=9'h13D;//=
      Mostrar_29 <=9'h13E;//>
      Mostrar_210<=9'h120;//ESPACIO
      Mostrar_211<=9'h124;//$
      Mostrar_212<=    DS;//DP
      Mostrar_213<=    US;//UP
      Mostrar_214<=9'h120;//ESPACIO
      Mostrar_215<=9'h120;//ES
	end


endcase

end

LCD_TEST u5 (//Host Side
         .iCLK(CLOCK_50),
         .iRST_N(DLY_RST),
             //    LCD Side
         .LCD_DATA(LCD_DATA),
         .LCD_RW(LCD_RW),
         .LCD_EN(LCD_EN),
         .LCD_RS(LCD_RS),   
         .Mostrar_10(Mostrar_10),
		   .Mostrar_11(Mostrar_11),
			.Mostrar_12(Mostrar_12),
			.Mostrar_13(Mostrar_13),
			.Mostrar_14(Mostrar_14),
			.Mostrar_15(Mostrar_15),
			.Mostrar_16(Mostrar_16),
			.Mostrar_17(Mostrar_17),
			.Mostrar_18(Mostrar_18),
			.Mostrar_19(Mostrar_19),
			.Mostrar_110(Mostrar_110),
			.Mostrar_111(Mostrar_111),
			.Mostrar_112(Mostrar_112),
			.Mostrar_113(Mostrar_113),
			.Mostrar_114(Mostrar_114),
			.Mostrar_115(Mostrar_115),
			.Mostrar_20(Mostrar_20),
			.Mostrar_21(Mostrar_21),
			.Mostrar_22(Mostrar_22),
			.Mostrar_23(Mostrar_23),
			.Mostrar_24(Mostrar_24),
			.Mostrar_25(Mostrar_25),
			.Mostrar_26(Mostrar_26),
			.Mostrar_27(Mostrar_27),
			.Mostrar_28(Mostrar_28),
			.Mostrar_29(Mostrar_29),
			.Mostrar_210(Mostrar_210),
			.Mostrar_211(Mostrar_211),
			.Mostrar_212(Mostrar_212),
			.Mostrar_213(Mostrar_213),
			.Mostrar_214(Mostrar_214),
			.Mostrar_215(Mostrar_215)
             );

endmodule
