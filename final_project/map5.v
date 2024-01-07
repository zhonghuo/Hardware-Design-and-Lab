module map5(
    input clk, 
    input rst, 
    input en, 
    input wire [9:0] vga_h, 
    input wire [9:0] vga_v,  
    input [3:0] player_state, player2_state,
    input [1:0] player_jump, player2_jump,
    output reg [16:0] addr, 
    //output reg clear,
    output wire [15:0] led,
    output wire p1_collision, p2_collision,
    output wire p1_land, p2_land,
    output wire should_down, should_down2,
    output wire button1_tounch, 
    output wire dimond1_touch
);
    wire [9:0] h, v;
    assign h = vga_h >> 1;
    assign v = vga_v >> 1;

    //obj state control
    obj_state_ctrl OSC(
        .clk(clk), .rst(rst), .en(en), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .player_state(player_state), .player2_state(player2_state), 
        .player_jump(player_jump), .player2_jump(player2_jump), 
        .led(led), 
        .p1_collision(p1_collision), .p2_collision(p2_collision), 
        .p1_land(p1_land), .p2_land(p2_land), 
        .should_down(should_down), .should_down2(should_down2), 
        .button1_tounch(button1_tounch), .dimond1_touch(dimond1_touch)
    );

    //part of terrain objs

    wire en_ceiling, en_floor, en_LeftBoundary, en_RightBoundary, en_RedRiver, en_BlueRiver;
    wire en_Wall_1, en_Wall_2, en_Wall_3, en_Wall_4, en_Wall_5, en_Wall_6, en_Wall_7;
    wire en_red_door, en_blue_door;
    wire [16:0] addr_ceiling, addr_floor, addr_LeftBoundary, addr_RightBoundary, addr_BlueRiver, addr_RedRiver;
    wire [16:0] addr_Wall_1, addr_Wall_2, addr_Wall_3, addr_Wall_4, addr_Wall_5, addr_Wall_6, addr_Wall_7;
    wire [16:0] addr_red_door, addr_blue_door;

    terrain ceiling(
        .pivot_h(10'd0),
        .pivot_v(10'd0),
        .width(10'd320),
        .height(10'd10),
        .en(en_ceiling),
        .addr(addr_ceiling),
        .mem_pivot_h(0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain floor(
        .pivot_h(10'd0),
        .pivot_v(10'd230),
        .width(10'd320),
        .height(10'd10),
        .en(en_floor),
        .addr(addr_floor),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain LeftBoundary(
        .pivot_h(10'd0),
        .pivot_v(10'd10),
        .width(10'd10),
        .height(10'd220),
        .en(en_LeftBoundary),
        .addr(addr_LeftBoundary),
        .mem_pivot_h(10'd305),
        .mem_pivot_v(10'd10),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain RightBoundary(
        .pivot_h(10'd310),
        .pivot_v(10'd10),
        .width(10'd10),
        .height(10'd220),
        .en(en_RightBoundary),
        .addr(addr_RightBoundary),
        .mem_pivot_h(10'd305),
        .mem_pivot_v(10'd10),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain RedRiver(
        .pivot_h(10'd150),
        .pivot_v(10'd230),
        .width(10'd40),
        .height(10'd6),
        .en(en_RedRiver),
        .addr(addr_RedRiver),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd65),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain BlueRiver(
        .pivot_h(10'd210),
        .pivot_v(10'd230),
        .width(10'd40),
        .height(10'd6),
        .en(en_BlueRiver),
        .addr(addr_BlueRiver),
        .mem_pivot_h(10'd55),
        .mem_pivot_v(10'd70),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    /*
    terrain Wall_(
        .pivot_h(),
        .pivot_v(),
        .width(),
        .height(),
        .en(en_Wall_),
        .addr(addr_Wall_),
        .mem_pivot_h(),
        .mem_pivot_v(),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );
    */

    terrain Wall_1(
        .pivot_h(10'd10),
        .pivot_v(10'd182),
        .width(10'd230),
        .height(10'd8),
        .en(en_Wall_1),
        .addr(addr_Wall_1),
        .mem_pivot_h(10'd50),
        .mem_pivot_v(10'd215),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain Wall_2(
        .pivot_h(90),
        .pivot_v(139),
        .width(220),
        .height(8),
        .en(en_Wall_2),
        .addr(addr_Wall_2),
        .mem_pivot_h(0),
        .mem_pivot_v(220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain Wall_3(
        .pivot_h(85),
        .pivot_v(96),
        .width(185),
        .height(8),
        .en(en_Wall_3),
        .addr(addr_Wall_3),
        .mem_pivot_h(0),
        .mem_pivot_v(220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain Wall_4(
        .pivot_h(160),
        .pivot_v(89),
        .width(50),
        .height(8),
        .en(en_Wall_4),
        .addr(addr_Wall_4),
        .mem_pivot_h(0),
        .mem_pivot_v(220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain Wall_5(
        .pivot_h(110),
        .pivot_v(48),
        .width(200),
        .height(8),
        .en(en_Wall_5),
        .addr(addr_Wall_5),
        .mem_pivot_h(0),
        .mem_pivot_v(220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain Wall_6(
        .pivot_h(275),
        .pivot_v(210),
        .width(35),
        .height(20),
        .en(en_Wall_6),
        .addr(addr_Wall_6),
        .mem_pivot_h(0),
        .mem_pivot_v(218),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain red_door(
        .pivot_h(250),
        .pivot_v(19),
        .width(23),
        .height(29),
        .en(en_red_door),
        .addr(addr_red_door),
        .mem_pivot_h(0),
        .mem_pivot_v(89),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain blue_door(
        .pivot_h(280),
        .pivot_v(19),
        .width(23),
        .height(29),
        .en(en_blue_door),
        .addr(addr_blue_door),
        .mem_pivot_h(32),
        .mem_pivot_v(89),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    //addr
    always @* begin
        if(en_ceiling) addr = addr_ceiling;
        else if(en_RedRiver) addr = addr_RedRiver;
        else if(en_BlueRiver) addr = addr_BlueRiver;        
        else if(en_floor) addr = addr_floor;
        else if(en_LeftBoundary) addr = addr_LeftBoundary;
        else if(en_RightBoundary) addr = addr_RightBoundary;
        else if(en_Wall_1) addr = addr_Wall_1;
        else if(en_Wall_2) addr = addr_Wall_2;
        else if(en_Wall_3) addr = addr_Wall_3;
        else if(en_Wall_4) addr = addr_Wall_4;
        else if(en_Wall_5) addr = addr_Wall_5;
        else if(en_Wall_6) addr = addr_Wall_6;
        else if(en_red_door) addr = addr_red_door;
        else if(en_blue_door) addr = addr_blue_door;
        else addr = 12900;
        //obj without obj oriented ctrl
        //player diamond button mech 
        /*
        else if((h>=194 && h <206 && v>=203 && v<220)) //red diamond 1
            addr = dimond1_touch ? 12900 : (((h-99)+(v-66)*320));
        else if((h>=100 && h<105 && v>=177 && v<182)) // button1
            addr = button1_tounch ? 60800 : 540;
        */
    end
    

endmodule