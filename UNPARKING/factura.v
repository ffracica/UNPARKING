module factura(clk, counterp, dmin, umin, dseg, useg);

input clk;
input [20:0]counterp;
output reg[3:0]dmin;
output reg[3:0]umin;
output reg[3:0]dseg;
output reg[3:0]useg;


always@(posedge clk)begin

if(counterp >= 'd00 && counterp < 'd600)begin
		dmin = 'd0;
		umin = 'd0;
		dseg = 'd0;
		useg = 'd0;
	end
else if(counterp >= 'd600 && counterp < 'd1200)begin
		dmin = 'd0;
		umin = 'd1;
		dseg = 'd0;
		useg = 'd2;
	end
else if(counterp >= 'd1200 && counterp < 'd1800)begin
		dmin = 'd0;
		umin = 'd2;
		dseg = 'd0;
		useg = 'd4;
	end
else if(counterp >= 'd1800 && counterp < 'd2400)begin
		dmin = 'd0;
		umin = 'd3;
		dseg = 'd0;
		useg = 'd6;
	end
else if(counterp >= 'd2400 && counterp < 'd3000)begin
		dmin = 'd0;
		umin = 'd4;
		dseg = 'd0;
		useg = 'd8;
	end
else if(counterp >= 'd3000 && counterp < 'd3600)begin
		dmin = 'd0;
		umin = 'd5;
		dseg = 'd1;
		useg = 'd0;
	end
else if(counterp >= 'd3600 && counterp < 'd4200)begin
		dmin = 'd0;
		umin = 'd6;
		dseg = 'd1;
		useg = 'd2;
	end
else if(counterp >= 'd4200 && counterp < 'd4800)begin
		dmin = 'd0;
		umin = 'd7;
		dseg = 'd1;
		useg = 'd4;
	end
else if(counterp >= 'd4800 && counterp < 'd5400)begin
		dmin = 'd0;
		umin = 'd8;
		dseg = 'd1;
		useg = 'd6;
	end
else if(counterp >= 'd5400 && counterp < 'd6000)begin
		dmin = 'd0;
		umin = 'd9;
		dseg = 'd1;
		useg = 'd8;
	end
else if(counterp >= 'd6000 && counterp < 'd6600)begin
		dmin = 'd1;
		umin = 'd0;
		dseg = 'd2;
		useg = 'd0;
	end
else if(counterp >= 'd6600 && counterp < 'd7200)begin
		dmin = 'd1;
		umin = 'd1;
		dseg = 'd2;
		useg = 'd2;
	end
else if(counterp >= 'd7200 && counterp < 'd7800)begin
		dmin = 'd1;
		umin = 'd2;
		dseg = 'd2;
		useg = 'd4;
	end
else begin
		dmin = 4'b0000;
		umin = 4'b0000;
		dseg = 4'b0000;
		useg = 4'b0000;
	end

end
endmodule 