//機關按鈕 升降梯 石頭
//根據collision判斷是否觸發
//player根據collision來變化位置(位置變化寫在player)
module mech(
    output reg active,
    output reg collision_with_player1, 
    output reg collision_with_player2,
    output wire [16:0] addr, 
    input wire [39:0] terrain_props, 
    input wire [39:0] player1_props, 
    input wire [39:0] player2_props,
    input wire[9:0] disp_h,
    input wire [9:0] disp_v
);
    //pivot會動，所以先不寫
endmodule
