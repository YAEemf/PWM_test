module counter(
	input clk,
	output reg[7:0] cnt_out
	);
	
	
	initial begin
		cnt_out = 8'b0;
	end
	
	always@(posedge clk) begin
		if(cnt_out == 8'b10110100) begin //180
			cnt_out <= 8'b0;
		end else begin
			cnt_out <= cnt_out + 8'b1;
		end
	end
endmodule
