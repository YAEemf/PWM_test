module top(
	input clk,
	output prove,
	output pulse
	);
	
wire div_clk_w;
wire[7:0] PWM_w;
wire[7:0] cnt_w;

div_clk div_clk(
	.clk(clk),
	.div_clk(div_clk_w)
	);

counter counter(
	.clk(div_clk_w),
	.cnt_out(cnt_w)
	);

sin_pwm sin_pwm(
	.theta(cnt_w),
	.duty(PWM_w)
	);
	
pwm pwm(
	.clk_in(clk),
	.duty(PWM_w),
	.clk_out(pulse)
	);
	
assign prove = cnt_w;
endmodule
