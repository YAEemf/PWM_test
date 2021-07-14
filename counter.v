module counter(
	input clk,
	output reg[7:0] cnt_out
	);
	
	
	initial begin
		cnt_out = 0;
	end
	
	always@(posedge clk) begin
		if(cnt_out == 11111111) begin
			cnt_out <= 0;
		end else begin
			cnt_out <= cnt_out + 8'b1;
		end
	end
endmodule
