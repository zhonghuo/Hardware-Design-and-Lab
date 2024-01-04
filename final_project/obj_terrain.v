 //牆壁或是地板的物件
 //判斷角色有沒有撞到這塊地形
 //以及在螢幕輸出到這塊地形上的時候，要給出addr
 //props <= {ph, pv, w, h}(水平位置，垂直位置，圖寬，圖高)
module terrain(
    output reg collision_with_player1,
    output reg collision_with_player2, 
    output wire [16:0] addr, 
    input wire [39:0] terrain_props, 
    input wire [39:0] player1_props, 
    input wire [39:0] player2_props, 
    input wire [9:0] disp_h, disp_v
);
    wire [9:0] pivot_h = terrain_props[39:30];
    wire [9:0] pivot_v = terrain_props[29:20];
    wire [9:0] width = terrain_props[19:10];
    wire [9:0] height = terrain_props[9:0];
    wire [9:0] player1_pivot_h = player1_props[39:30];
    wire [9:0] player1_pivot_v = player1_props[29:20];
    wire [9:0] player1_width = player1_props[19:10];
    wire [9:0] player1_height = player1_props[9:0];
    wire [9:0] player2_pivot_h = player2_props[39:30];
    wire [9:0] player2_pivot_v = player2_props[29:20];
    wire [9:0] player2_width = player2_props[19:10];
    wire [9:0] player2_height = player2_props[9:0];
endmodule