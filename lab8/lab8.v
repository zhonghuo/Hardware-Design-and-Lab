module Lab8(
    input clk,
    input rst,
    input echo,
    input left_track,
    input right_track,
    input mid_track,
    input start_move,    // if (start == 1) both engines can move
    input start_left_move, // only left engine can move
    input start_right_move, // onle right engine can move
    output trig,
    output IN1,
    output IN2,
    output IN3, 
    output IN4,
    output left_pwm,
    output right_pwm,
    output [15:0] _led,
    output wire [6:0] DISPLAY,    
    output wire [3:0] DIGIT
    // You may modify or add more input/ouput yourself.
);
    // We have connected the motor and sonic_top modules in the template file for you.
    // TODO: control the motors with the information you get from ultrasonic sensor and 3-way track sensor.
    wire [1:0] mode, pre_mode;
    
    sonic_top B(
        .clk(clk), 
        .rst(rst), 
        .Echo(echo), 
        .Trig(trig),
        .distance(distance),
        ._led(_led),
        ._en_left(en_left),
        ._en_right(en_right),
        ._start_move(start_move),
        ._start_left_move(start_left_move),
        ._start_right_move(start_right_move)
    );
    

    motor A(
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .pwm({left_pwm, right_pwm}),
        .l_IN({IN1, IN2}),
        .r_IN({IN3, IN4}),
        .en_left(en_left),
        .en_right(en_right),
        .pre_mode(pre_mode),
        .out_of_control(out_of_control)
    );

    tracker_sensor T(
        .clk(clk),
        .reset(rst),
        .left_track(left_track),
        .right_track(right_track),
        .mid_track(mid_track),
        .state(mode),
        .DISPLAY(DISPLAY),
        .DIGIT(DIGIT),
        .pre_state(pre_mode),
        .start_move(start_move),
        .out_of_control(out_of_control)
    );

endmodule