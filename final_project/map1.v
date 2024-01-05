module map1(
    input clk, 
    input rst, 
    input wire [9:0] key_down, 
    input en, 
    input [2:0] level,
    input [2:0] map,
    input wire [9:0] vga_h, 
    input wire [9:0] vga_v,  
    input [3:0] player1_state,
    input [1:0] player1_jump,
    input [9:0] player1_horizontal_displacement,
    input [9:0] player1_vertical_displacement,
    output reg [16:0] addr, 
    output reg clear
);
    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    wire collision_with_player1, collision_with_player2;
    wire en_ceiling, en_floor, en_LeftBoundary, en_RightBoundary, en_RedRiver, en_BlueRiver, en_Wall_1, en_player1_stactic;
    wire en_player1_left, en_player1_right, en_player1_up;
    wire [16:0] addr_ceiling, addr_floor, addr_LeftBoundary, addr_RightBoundary, addr_BlueRiver, addr_RedRiver;
    wire [16:0] addr_Wall_1, addr_player1_stactic, addr_player1_left, addr_player1_right, addr_player1_up;
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
        .pivot_v(10'd190),
        .width(10'd105),
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

    player1_state_cal player1_state_cal(
        .clk(clk),
        .rst(rst),
        .key_down(key_down),
        .addr(addr_player1_stactic),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .player_jump(player_jump),
        .player_state(player_state),
        .en(en_player1_stactic)
    );

    always @* begin
        if(en_ceiling) addr = addr_ceiling;
        else if(en_RedRiver) addr = addr_RedRiver;
        else if(en_BlueRiver) addr = addr_BlueRiver;        
        else if(en_floor) addr = addr_floor;
        else if(en_LeftBoundary) addr = addr_LeftBoundary;
        else if(en_RightBoundary) addr = addr_RightBoundary;
        else if(en_Wall_1) addr = addr_Wall_1;
        else if(en_player1_stactic) addr = addr_player1_stactic;
        //else if(en_player1_left) addr = addr_player1_left;
        else addr = 12900;
    end

endmodule