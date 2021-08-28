module divfreq(clk, clk1hz);
input clk;
output reg clk1hz = 0;

reg [27:0] count = 0;

always @ (posedge clk)begin

	if(count < 'd5_000_000)begin
		count = count + 1;
		end
	else begin
		count = 0;
		clk1hz = !clk1hz;
		end
end
endmodule
