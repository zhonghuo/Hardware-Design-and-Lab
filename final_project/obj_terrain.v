 //??????????O?????????????
 //??????????????????????????????a??
 //?H????b???????????????????a?????????????????????????addr
 //props <= {ph, pv, w, h}(??????m?A???????m?A????e?A??????)
module terrain(
    output reg collision_with_player1,
    output reg collision_with_player2, 
    output wire [16:0] addr, 
    output reg en,
    input wire [39:0] terrain_props, 
    //input wire [39:0] player1_props, 
    //input wire [39:0] player2_props, 
    input wire [9:0] vga_h,
    input wire [9:0] vga_v,
    input wire [9:0] mem_pivot_h,
    input wire [9:0] mem_pivot_v,
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

    wire [9:0] h, v;
    assign h = vga_h >> 1;
    assign v = vga_v >> 1;

    reg [9:0] disp_h, disp_v;
    always @* begin
        if(v-pivot_v>=0 && v-pivot_v<height && h-pivot_h>=0 && h-pivot_h<width) begin
            en = 1;
            disp_h = h-pivot_h;
            disp_v = v-pivot_v;
        end else begin
            en = 0;
            disp_h = 0;
            disp_v = 0;
        end
    end
    assign addr = disp_h + mem_pivot_h + 320*(disp_v + mem_pivot_v);

endmodule