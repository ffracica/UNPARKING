module switch(clk, led, pasignado, count, swws);

input clk;
input swws;
input [3:0]pasignado;
input [5:0]count;

output reg led = 1;

always@(posedge clk)begin

led = 1;

if(swws)begin

if(count[0] == 1 && pasignado == 4'b0001)
	led = 0;
if(count[1] == 1 && pasignado == 4'b0010)
	led = 0;
if(count[2] == 1 && pasignado == 4'b0011)
	led = 0;
if(count[3] == 1 && pasignado == 4'b0100)
	led = 0;
if(count[4] == 1 && pasignado == 4'b0101)
	led = 0;
if(count[5] == 1 && pasignado == 4'b0110)
	led = 0;		

end




end


endmodule 