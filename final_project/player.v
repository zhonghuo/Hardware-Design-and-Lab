module player (
    //在map創建player的時候，應該要告訴player這張map各種物件各有多少個
    //其中treasure還有門紀錄對應顏色就好(為了不要錯誤觸發)
    input [4:0] cnt_terrain,
    input [4:0] cnt_treasure, 
    input [4:0] cnt_mech, 
    //player是否和對應物件發生碰撞
    //將所有flag接到以下陣列，如果有其他flag也請拉到以下
    input [31:0] collision_terrain, 
    input [31:0] collision_treasure, 
    input [31:0] collision_mech, 
    //another flag like: input[31:0] flag,

    //mem_addr related
    output wire [16:0] addr, 
    input wire [9:0] disp_h, disp_v, 

    //角色的props要用output給其他obj使用
    //因此只需要輸入init_value給map
    //大概長這樣:
    /*
    always @(posedge clk or posedge rst) begin
        if(rst) pivot <= init_pivot;
        else 角色的各種行為巴拉巴拉小魔仙

        end
    */
    input [9:0] init_pivot_h, init_pivot_v,
    input [9:0] width, height, 
    //這裡的圖寬圖高在map用整數輸入
    //接到其他module的player圖高圖寬也可以直接接整數(反正角色大小應該都一樣)

    //給其他module用的player相關props
    output [9:0] player_pivot_h, 
    output [9:0] player_pivot_v
);

endmodule