//吃到之後消失
//type 表示顏色 
//後續變數只需要輸入相應的角色
//要寫被吃掉的行為(消失)
module treasure(
    output reg collision, 
    output wire [16:0] addr, 
    input wire [9:0] disp_h, disp_v, 
    input wire [39:0] treasure_props, 
    input wire [39:0] player_props
);
    wire [9:0] pivot_h = treasure_props[39:30];
    wire [9:0] pivot_v = treasure_props[29:20];
    wire [9:0] width = treasure_props[19:10];
    wire [9:0] height = treasure_props[9:0];
    wire [9:0] player_pivot_h = player_props[39:30];
    wire [9:0] player_pivot_v = player_props[29:20];
    wire [9:0] player_width = player_props[19:10];
    wire [9:0] player_height = player_props[9:0];
endmodule