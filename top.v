module top(
	input clk,
	output pulse
	);
	
wire[7:0] PWM_w;
wire cnt_w;

block counter(
	.clk(clk),
	.cnt_out(cnt_w)
	);

block sin_pwm(
	.theta(cnt_w),
	.duty(PWM_w)
	);
	
block pwm(
	.clk_in(clk),
	.duty(PWM_w),
	.clk_out(pulse)
	);
	
endmodule
