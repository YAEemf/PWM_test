module pwm(
    input clk_in,
	 input[7:0] duty,
    output reg clk_out
	 );

    wire a;

    reg [2:0] state = 3'b000;
    reg [7:0] cnt = 8'b0;

    always @(negedge clk_in) begin
        if(cnt < 8'b1100100 - duty) begin
            clk_out <= 1'b0;
            cnt = cnt + 1;
        end else begin
            clk_out <= 1'b1;
            cnt = cnt + 1;
        end

        if(cnt == 99) begin
            cnt <= 0;
            case(state)
                3'b000: begin
                state <= state + 1;
                end
            endcase
        end
    end
endmodule
