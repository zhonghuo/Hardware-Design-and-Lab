module tracker_sensor(
    input clk, 
    input reset, 
    input left_track, 
    input right_track, 
    input mid_track,
	input start_move,
    output reg [1:0] state, 
    output wire [6:0] DISPLAY, 
    output wire [3:0] DIGIT,
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
	parameter turn_left = 2'b10 ;
    parameter go_straight = 2'b11;
    parameter turn_right = 2'b01;
    parameter stop = 2'b00;
	reg direction, ninety_left = 0, ninety_right = 0;
	reg[29:0] cnt = 30'b0, cnt_left_turn = 30'b0, cnt_right_turn = 30'b0, cnt_calibrate = 30'b0;
	reg flag = 0, calibrate = 0;
	wire out_the_track = 0;
    wire [2:0] sensor;
    assign sensor = {left_track, mid_track, right_track} ;

    //flag
    // 0 for counter clock
    always @(posedge clk or posedge reset) begin
        if(reset) flag <= 0;
        else begin
            if(sensor == 3'b011 && state == stop) flag <= 1;
            else flag <= flag;
        end
    end
    //cnt
    //count the time of the sensor receiving 111
    always @(posedge clk or posedge reset) begin
        if(reset) cnt <= 0;
        else begin
            if(sensor == 3'b111) cnt <= cnt+1;
            else cnt <= 0;
        end
    end
    //state
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            state <= stop;
        end begin
            case(state)
            stop: begin
                case(sensor)
                3'b110, 3'b011: state <= go_straight; 
                default: state <= state;
                endcase
            end
            go_straight: begin
                if(cnt <= 30'd30000000 && sensor == 3'b111) state <= go_straight;
                else if (sensor == 3'b111 && flag) state <= turn_left;
                else if(sensor == 3'b111 && !flag) state <= turn_right;
                else if(flag) state <= turn_right;
                else state <= turn_left;
            end
            turn_left: begin
                if(sensor == 3'b111 && flag) state <= state;
                else if(sensor == 3'b111 && !flag) state <= go_straight;
                else if(flag) state <= go_straight;
                else state <= state; 
            end
            turn_right: begin
                if(sensor == 3'b111 && flag) state <= go_straight;
                else if(sensor == 3'b111 && !flag) state <= state;
                else if(flag) state <= state;
                else state <= go_straight; 
            end
            default: state <= state;
            endcase
        end
    end
    
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

