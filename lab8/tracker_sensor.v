module tracker_sensor(
    input clk, 
    input reset, 
    input left_track, 
    input right_track, 
    input mid_track, 
    output reg [1:0] state, 
    output wire [6:0] DISPLAY, 
    output wire [3:0] DIGIT,
	output wire is_out_the_track,
	output reg [1:0] pre_state
);

    // TODO: Receive three tracks and make your own policy.
    // Hint: You can use output state to change your action.

    SevenSegment S(
        .display(DISPLAY),
        .digit(DIGIT),
        .nums({2'b00, state , 3'b000, left_track, 3'b000, mid_track, 3'b000, right_track}),
        .rst(reset),
        .clk(clk)
    );
	
    always @* begin
        if(reset) begin
			state = 0;
			pre_state = 1;
		end else begin
			case({left_track, mid_track, right_track})
            3'b000, 3'b101, 3'b010: state = 2'b11;     // on the middle
            3'b011, 3'b001: state = 2'b10; // car veers to the right
            3'b110, 3'b100: state = 2'b01; // car veers to the left
            3'b111: state = 2'b11; // out the track
            default: state = 2'b10;
			endcase
			if(state != 2'b11 && state != 2'b00) pre_state = state;
			else pre_state = pre_state;
			//else if(state == 2'b00) pre_state = 2'b01;
		    //else pre_state = 2'b11;
		end
    end

	assign is_out_the_track = (state == 2'b00) ? 1 : 0;
    
endmodule

module SevenSegment(
	output reg [6:0] display,
	output reg [3:0] digit,
	input wire [15:0] nums,
	input wire rst,
	input wire clk
    );
    
    reg [15:0] clk_divider;
    reg [3:0] display_num;
    
    always @ (posedge clk, posedge rst) begin
    	if (rst) begin
    		clk_divider <= 15'b0;
    	end else begin
    		clk_divider <= clk_divider + 15'b1;
    	end
    end
    
    always @ (posedge clk_divider[15], posedge rst) begin
    	if (rst) begin
    		display_num <= 4'b0000;
    		digit <= 4'b1111;
    	end else begin
    		case (digit)
    			4'b1110 : begin
    					display_num <= nums[7:4];
    					digit <= 4'b1101;
    				end
    			4'b1101 : begin
						display_num <= nums[11:8];
						digit <= 4'b1011;
					end
    			4'b1011 : begin
						display_num <= nums[15:12];
						digit <= 4'b0111;
					end
    			4'b0111 : begin
						display_num <= nums[3:0];
						digit <= 4'b1110;
					end
    			default : begin
						display_num <= nums[3:0];
						digit <= 4'b1110;
					end				
    		endcase
    	end
    end
    
    always @ (*) begin
    	case (display_num)
    		0 : display = 7'b1000000;	//0000
			1 : display = 7'b1111001;   //0001                                                
			2 : display = 7'b0100100;   //0010                                                
			3 : display = 7'b0110000;   //0011                                             
			4 : display = 7'b0011001;   //0100                                               
			5 : display = 7'b0010010;   //0101                                               
			6 : display = 7'b0000010;   //0110
			7 : display = 7'b1111000;   //0111
			8 : display = 7'b0000000;   //1000
			9 : display = 7'b0010000;	//1001
            10: display = 7'b0111111;   //minus
			default : display = 7'b1111111;
    	endcase
    end
    
endmodule

