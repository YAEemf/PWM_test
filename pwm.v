module pwm(
    input clk_in,
	 input[7:0] duty,
    output reg clk_out
	 );
	 
    reg [7:0] cnt = 8'b0;

    always @(negedge clk_in) begin
			if(cnt < 8'b1100100 - duty) begin //100
            clk_out <= 1'b0;
            cnt = cnt + 8'b1;
			end else begin
				clk_out <= 1'b1;
				cnt = cnt + 8'b1;
			end
			
			if(cnt == 8'b1100011) begin //99
				cnt <= 8'b0;
			end
    end
endmodule
