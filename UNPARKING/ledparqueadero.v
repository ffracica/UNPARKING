module ledparqueadero(clk, led, pasignado, l);

input clk;
input led;
input [3:0]pasignado;
output reg [5:0]l;
//output reg [2:0]b;

reg [9:0]counter3 = 0;


always@(posedge clk)begin


if(led)begin

	if(counter3< 4)begin
		case(pasignado)
				4'b0000: l = 6'b000000;
				4'b0001: l = 6'b000001;
				4'b0010: l = 6'b000010;
				4'b0011: l = 6'b000100;
				4'b0100: l = 6'b001000;
				4'b0101: l = 6'b010000;
				4'b0110: l = 6'b100000;
			//default
				//l = 6'b000000;
		endcase	
		
		counter3 = counter3 +1;
	end
	else begin
	
			counter3 = 0;

		l = 6'b000000;

	end
				



end

else
	l = 6'b000000;





end


endmodule 
