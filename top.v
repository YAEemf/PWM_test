module top(
	input clk,
	output U_H, U_L,
	output V_H, V_L,
	output W_H, W_L,
	output probe
	);
	
wire div_clk_w;
wire[1:0] flag_U, flag_V, flag_W;
wire[7:0] cnt_UH_w, cnt_VH_w, cnt_WH_w;
wire[7:0] cnt_UL_w, cnt_VL_w, cnt_WL_w;
wire[7:0] duty_UH_w, duty_VH_w, duty_WH_w;
wire[7:0] duty_UL_w, duty_VL_w, duty_WL_w;
wire[7:0] pwm_UH_w, pwm_VH_w, pwm_WH_w;
wire[7:0] pwm_UL_w, pwm_VL_w, pwm_WL_w;

div_clk div_clk(
	.clk(clk),
	.div_clk(div_clk_w)
	);
	
flag flag(
	.clk(clk),
	.flag_U(flag_U),
	.flag_V(flag_V),
	.flag_W(flag_W)
	);

counter counter_U(
	.clk(div_clk_w),
	.flag(flag_U),
	.cnt_H(cnt_UH_w),
	.cnt_L(cnt_UL_w)
	);
	
counter counter_V(
	.clk(div_clk_w),
	.flag(flag_V),
	.cnt_H(cnt_VH_w),
	.cnt_L(cnt_VL_w)
	);
	
counter counter_W(
	.clk(div_clk_w),
	.flag(flag_W),
	.cnt_H(cnt_WH_w),
	.cnt_L(cnt_WL_w)
	);

	
sin_pwm pwmgen_UH(
	.theta(cnt_UH_w),
	.duty(duty_UH_w)
	);
	
sin_pwm pwmgen_VH(
	.theta(cnt_VH_w),
	.duty(duty_VH_w)
	);
	
sin_pwm pwmgen_WH(
	.theta(cnt_WH_w),
	.duty(duty_WH_w)
	);
	
sin_pwm pwmgen_UL(
	.theta(cnt_UL_w),
	.duty(duty_UL_w)
	);
	
sin_pwm pwmgen_VL(
	.theta(cnt_VL_w),
	.duty(duty_VL_w)
	);
	
sin_pwm pwmgen_WL(
	.theta(cnt_WL_w),
	.duty(duty_WL_w)
	);
	
	
pwm pwm_UH(
	.clk_in(clk),
	.duty(duty_UH_w),
	.clk_out(U_H)
	);
	
pwm pwm_VH(
	.clk_in(clk),
	.duty(duty_VH_w),
	.clk_out(V_H)
	);

pwm pwm_WH(
	.clk_in(clk),
	.duty(duty_WH_w),
	.clk_out(W_H)
	);

pwm pwm_UL(
	.clk_in(clk),
	.duty(duty_UL_w),
	.clk_out(U_L)
	);
	
pwm pwm_VL(
	.clk_in(clk),
	.duty(duty_VL_w),
	.clk_out(V_L)
	);

pwm pwm_WL(
	.clk_in(clk),
	.duty(duty_WL_w),
	.clk_out(W_L)
	);
//assign U_H = pwm_U_w;
endmodule
