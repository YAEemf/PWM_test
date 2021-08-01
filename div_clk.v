module div_clk(
	input clk,
	output reg div_clk
	);
	
	reg[7:0] cntr;
	
	initial begin
		cntr = 8'b0;
	end
	
	always@(posedge clk) begin
		if(cntr == 8'b11101111) begin //b10111(1M) b1011(2M) 約11kHz　250 11111010 b11101111(100kHz)
			cntr <= 8'b0;
			div_clk <= !div_clk;
		end else begin
			cntr <= cntr + 8'b1;
			div_clk <= div_clk;
		end
	end
endmodule
