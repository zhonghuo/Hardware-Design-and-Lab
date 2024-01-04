 //??��?��?�是?��?��??�物�?
 //?��?��角色??��?��?��?�到?��?�地�?
 //以�?�在?��幕輸?��?��?��?�地形�?��?��?��?��?��?�給?��addr
 //props <= {ph, pv, w, h}(水平位置，�?�直位置，�?�寬，�?��??)
module terrain(
    output reg collision_with_player1,
    output reg collision_with_player2, 
    output wire [16:0] addr, 
    input wire [39:0] terrain_props, 
    //input wire [39:0] player1_props, 
    //input wire [39:0] player2_props, 
    input wire [9:0] disp_h, disp_v,
    input wire dir_disp_h, dir_disp_v,
    input wire [9:0] vga_h,
    input wire [9:0] vga_v,
    input clk,
    input rst
);
    wire [9:0] pivot_h = terrain_props[39:30];
    wire [9:0] pivot_v = terrain_props[29:20];
    wire [9:0] width = terrain_props[19:10];
    wire [9:0] height = terrain_props[9:0];
    /*wire [9:0] player1_pivot_h = player1_props[39:30];
    wire [9:0] player1_pivot_v = player1_props[29:20];
    wire [9:0] player1_width = player1_props[19:10];
    wire [9:0] player1_height = player1_props[9:0];
    wire [9:0] player2_pivot_h = player2_props[39:30];
    wire [9:0] player2_pivot_v = player2_props[29:20];
    wire [9:0] player2_width = player2_props[19:10];
    wire [9:0] player2_height = player2_props[9:0];*/

    assign addr = (dir_disp_h == 1 && dir_disp_v == 1) ? (
        ((vga_h >> 1) + disp_h) + ((vga_v) + disp_v) * 320
    ) : (
        0
    );

endmodule