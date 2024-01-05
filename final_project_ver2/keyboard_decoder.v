module KeyboardDecoder(
	input wire rst,
	input wire clk,
	inout wire PS2_DATA,
	inout wire PS2_CLK,
	output reg [9:0] key_down,
	output wire [8:0] last_change,
	output reg key_valid
    );
    
    parameter [1:0] INIT			= 2'b00;
    parameter [1:0] WAIT_FOR_SIGNAL = 2'b01;
    parameter [1:0] GET_SIGNAL_DOWN = 2'b10;
    parameter [1:0] WAIT_RELEASE    = 2'b11;
    
	parameter [7:0] IS_INIT			= 8'hAA;
    parameter [7:0] IS_EXTEND		= 8'hE0;
    parameter [7:0] IS_BREAK		= 8'hF0;
    

    parameter [8:0] W_code = 9'b0_0001_1101;
    parameter [8:0] A_code = 9'b0_0001_1100;
    parameter [8:0] S_code = 9'b0_0001_1011;
    parameter [8:0] D_code = 9'b0_0010_0011;
    parameter [8:0] UP_code = 9'b0_0111_0101;
    parameter [8:0] LEFT_code = 9'b0_0110_1011;
    parameter [8:0] DOWN_code = 9'b0_0111_0010;
    parameter [8:0] RIGHT_code = 9'b1_0111_0100;
    parameter [8:0] ENTER_code = 9'b0_0101_1010;

    reg [9:0] key;		// key = {been_extend, been_break, key_in}
    reg [1:0] state;
    reg been_ready, been_extend, been_break;
    
    wire [7:0] key_in;
    wire is_extend;
    wire is_break;
    wire valid;
    wire err;
    wire [3:0] move;

    wire [9:0] key_decode = 1 << move;
    assign last_change = {key[9], key[7:0]};
    assign move =   (last_change == W_code) ? 0 :
	                (last_change == A_code) ? 1 :
				    (last_change == S_code) ? 2 :
					(last_change == D_code) ? 3 :
					(last_change == UP_code) ? 4 :
					(last_change == LEFT_code) ? 5 :
					(last_change == DOWN_code) ? 6 :
					(last_change == RIGHT_code) ? 7 :
                    (last_change == ENTER_code) ? 8 : 9;

    KeyboardCtrl_0 inst (
		.key_in(key_in),
		.is_extend(is_extend),
		.is_break(is_break),
		.valid(valid),
		.err(err),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);
	
	onepulse op (
		.signal(been_ready),
		.clk(clk),
		.op(pulse_been_ready)
	);
    
    always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		state <= INIT;
    		been_ready  <= 1'b0;
    		been_extend <= 1'b0;
    		been_break  <= 1'b0;
    		key <= 10'b0_0_0000_0000;
    	end else begin
    		state <= state;
			been_ready  <= been_ready;
			been_extend <= (is_extend) ? 1'b1 : been_extend;
			been_break  <= (is_break ) ? 1'b1 : been_break;
			key <= key;
    		case (state)
    			INIT : begin
    					if (key_in == IS_INIT) begin
    						state <= WAIT_FOR_SIGNAL;
    						been_ready  <= 1'b0;
							been_extend <= 1'b0;
							been_break  <= 1'b0;
							key <= 10'b0_0_0000_0000;
    					end else begin
    						state <= INIT;
    					end
    				end
    			WAIT_FOR_SIGNAL : begin
    					if (valid == 0) begin
    						state <= WAIT_FOR_SIGNAL;
    						been_ready <= 1'b0;
    					end else begin
    						state <= GET_SIGNAL_DOWN;
    					end
    				end
    			GET_SIGNAL_DOWN : begin
						state <= WAIT_RELEASE;
						key <= {been_extend, been_break, key_in};
						been_ready  <= 1'b1;
    				end
    			WAIT_RELEASE : begin
    					if (valid == 1) begin
    						state <= WAIT_RELEASE;
    					end else begin
    						state <= WAIT_FOR_SIGNAL;
    						been_extend <= 1'b0;
    						been_break  <= 1'b0;
    					end
    				end
    			default : begin
    					state <= INIT;
						been_ready  <= 1'b0;
						been_extend <= 1'b0;
						been_break  <= 1'b0;
						key <= 10'b0_0_0000_0000;
    				end
    		endcase
    	end
    end
    
    always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		key_valid <= 1'b0;
    		key_down <= 9'b0;
    	end else if (key_decode[move] && pulse_been_ready) begin
    		key_valid <= 1'b1;
    		if (key[8] == 0) begin
    			key_down <= key_down | key_decode;
    		end else begin
    			key_down <= key_down & (~key_decode);
    		end
    	end else begin
    		key_valid <= 1'b0;
			key_down <= key_down;
    	end
    end

endmodule

module onepulse (
    input clk,
    input signal,
    output reg op
);

	reg pb_in_delay;

	always @(posedge clk) begin
		if (signal == 1'b1 && pb_in_delay == 1'b0) begin
			op <= 1'b1;
		end else begin
			op <= 1'b0;
		end
	end
	
	always @(posedge clk) begin
		pb_in_delay <= signal;
	end
endmodule
