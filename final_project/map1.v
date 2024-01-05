module map1(
    input clk, 
    input rst, 
    input wire [9:0] key_down, 
    input en, 
    input [2:0] level,
    input [2:0] map,
    input wire [9:0] vga_h, 
    input wire [9:0] vga_v,  
    //output reg [3:0] player_state,
    //input [1:0] player_jump,
    //input [9:0] player_horizontal_displacement,
    //input [9:0] player_vertical_displacement,
    output reg [16:0] addr, 
    output reg clear,
    output reg [15:0] led
);
    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    wire collision_with_player1, collision_with_player2;
    wire en_ceiling, en_floor, en_LeftBoundary, en_RightBoundary, en_RedRiver, en_BlueRiver, en_Wall_1, en_player1_stactic;
    wire en_GreenRiver, en_Wall_2, en_Wall_3, en_Wall_4, en_RedDoor, en_BlueDoor, en_Wall_5, en_Wall_6;
    wire en_player1_left, en_player1_right, en_player1_up;
    wire [16:0] addr_ceiling, addr_floor, addr_LeftBoundary, addr_RightBoundary, addr_BlueRiver, addr_RedRiver;
    wire [16:0] addr_Wall_1, addr_player1_stactic, addr_player1_left, addr_player1_right, addr_player1_up;
    wire [16:0] addr_GreenRiver, addr_Wall_2, addr_Wall_3, addr_Wall_4, addr_RedDoor, addr_BlueDoor, addr_Wall_5, addr_Wall_6;
    wire [1:0] player_jump;
    wire [3:0] player_state;
    //wire [9:0] player_pivot_h, player_pivot_v;

    

    terrain map1_ceiling(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd0),
        .pivot_v(10'd0),
        .width(10'd320),
        .height(10'd10),
        .en(en_ceiling),
        .addr(addr_ceiling),
        .mem_pivot_h(0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_floor(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd0),
        .pivot_v(10'd230),
        .width(10'd320),
        .height(10'd10),
        .en(en_floor),
        .addr(addr_floor),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_LeftBoundary(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd0),
        .pivot_v(10'd10),
        .width(10'd10),
        .height(10'd220),
        .en(en_LeftBoundary),
        .addr(addr_LeftBoundary),
        .mem_pivot_h(10'd305),
        .mem_pivot_v(10'd10),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_RightBoundary(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd310),
        .pivot_v(10'd10),
        .width(10'd10),
        .height(10'd220),
        .en(en_RightBoundary),
        .addr(addr_RightBoundary),
        .mem_pivot_h(10'd305),
        .mem_pivot_v(10'd10),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_RedRiver(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd150),
        .pivot_v(10'd230),
        .width(10'd40),
        .height(10'd6),
        .en(en_RedRiver),
        .addr(addr_RedRiver),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd65),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_BlueRiver(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd210),
        .pivot_v(10'd230),
        .width(10'd40),
        .height(10'd6),
        .en(en_BlueRiver),
        .addr(addr_BlueRiver),
        .mem_pivot_h(10'd55),
        .mem_pivot_v(10'd70),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_1(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd10),
        .pivot_v(10'd182),
        .width(10'd240),
        .height(10'd8),
        .en(en_Wall_1),
        .addr(addr_Wall_1),
        .mem_pivot_h(10'd50),
        .mem_pivot_v(10'd215),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_GreenRiver(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd190),
        .pivot_v(10'd182),
        .width(10'd40),
        .height(10'd6),
        .en(en_GreenRiver),
        .addr(addr_GreenRiver),
        .mem_pivot_h(10'd165),
        .mem_pivot_v(10'd1),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_2(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd50),
        .pivot_v(10'd139),
        .width(10'd260),
        .height(10'd8),
        .en(en_Wall_2),
        .addr(addr_Wall_2),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_3(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd60),
        .pivot_v(10'd96),
        .width(10'd210),
        .height(10'd8),
        .en(en_Wall_3),
        .addr(addr_Wall_3),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_4(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd160),
        .pivot_v(10'd89),
        .width(10'd50),
        .height(10'd7),
        .en(en_Wall_4),
        .addr(addr_Wall_4),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_6(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd110),
        .pivot_v(10'd48),
        .width(10'd200),
        .height(10'd8),
        .en(en_Wall_6),
        .addr(addr_Wall_6),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_RedDoor(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd250),
        .pivot_v(10'd19),
        .width(10'd23),
        .height(10'd29),
        .en(en_RedDoor),
        .addr(addr_RedDoor),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd89),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_BlueDoor(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd280),
        .pivot_v(10'd19),
        .width(10'd21),
        .height(10'd29),
        .en(en_BlueDoor),
        .addr(addr_BlueDoor),
        .mem_pivot_h(10'd32),
        .mem_pivot_v(10'd89),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    player Player1(
        .clk(clk),
        .rst(rst),
        .key_down(key_down),
        .addr(addr_player1_stactic),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .en(en_player1_stactic)
        //.led(led),
        //.player_state(player_state),
        //.player_jump(player_jump)
    );

    always @* begin
        if(en_ceiling) addr = addr_ceiling;
        else if(en_RedRiver) addr = addr_RedRiver;
        else if(en_BlueRiver) addr = addr_BlueRiver;        
        else if(en_GreenRiver) addr = addr_GreenRiver;
        else if(en_floor) addr = addr_floor;
        else if(en_LeftBoundary) addr = addr_LeftBoundary;
        else if(en_RightBoundary) addr = addr_RightBoundary;
        else if(en_Wall_1) addr = addr_Wall_1;
        else if(en_Wall_2) addr = addr_Wall_2;
        else if(en_Wall_3) addr = addr_Wall_3;
        else if(en_Wall_4) addr = addr_Wall_4;
        else if(en_Wall_6) addr = addr_Wall_6;
        else if(en_RedDoor) addr = addr_RedDoor;
        else if(en_BlueDoor) addr = addr_BlueDoor;
        //else if(en_player1_stactic) addr = addr_player1_stactic;
        else addr = 12900;
    end

endmodule