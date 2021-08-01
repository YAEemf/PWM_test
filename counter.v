module counter(
	input clk,
	input flag,
	output reg[7:0] cnt_H,
	output reg[7:0] cnt_L
	);
	
	//reg state = 0;
	reg[8:0] main_cnt = 9'b0;
	
	
	always@(posedge clk && flag) begin
		if(main_cnt == 9'b101101000) begin //360
			main_cnt <= 9'b0;
			end else if(main_cnt < 9'b10110101) begin //0~180
				cnt_L <= 8'b0;
				main_cnt <= main_cnt + 9'b1;
				if(cnt_H == 8'b10110100) begin
					cnt_H <= 8'b0;
				end else begin
					cnt_H <= cnt_H + 8'b1;
				end
			end else begin //181~360
			cnt_H <= 8'b0;
			main_cnt <= main_cnt + 9'b1;
			if(cnt_L == 8'b10110100) begin
				cnt_L <= 8'b0;
			end else begin
				cnt_L <= cnt_L + 8'b1;
			end
		end
	end
	
	
	/*always@(posedge clk && flag) begin
		if(cnt_out == 9'b101101000) begin //180　10110100 360 101101000
			cnt_out <= 9'b0;
			cnt_H <= cnt_out;
		end else begin
			cnt_out <= cnt_out + 9'b1;
		end
	end
	
	always@(posedge clk) begin
		if(cnt_out == 9'b101101000) begin //180　10110100 360 101101000
			cnt_out <= 9'b0;
		end else begin
			cnt_out <= cnt_out + 9'b1;
		end
	end*/
endmodule
