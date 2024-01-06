module player(
    output reg collision_with_player1,
    output reg collision_with_player2, 
    output wire [16:0] addr, 
    output reg en,
    //input wire [39:0] player1_props, 
    //input wire [39:0] player2_props, 
    input wire [9:0] vga_h,
    input wire [9:0] vga_v,
    input wire [3:0] player_state,
    input wire [1:0] player_jump,
    input clk,
    input rst
);

    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    wire [9:0] pivot_h_stactic, pivot_h_left, pivot_h_right, pivot_h_up;
    wire [9:0] pivot_v_stactic, pivot_v_left, pivot_v_right, pivot_v_up;
    wire [9:0] mem_pivot_h_stactic, mem_pivot_h_left, mem_pivot_h_right, mem_pivot_h_up;
    wire [9:0] mem_pivot_v_stactic, mem_pivot_v_left, mem_pivot_v_right, mem_pivot_v_up;
    wire [9:0] width_stactic, width_left, width_right, width_up;
    wire [9:0] height_stactic, height_left, height_right, height_up;

    assign pivot_h_stactic = 10'd13;
    assign pivot_v_stactic = 10'd200;
    assign mem_pivot_h_stactic = 10'd53;
    assign mem_pivot_v_stactic = 10'd0;
    assign width_stactic = 10'd15;
    assign height_stactic = 10'd30;

    assign pivot_h_left = 10'd8;
    assign pivot_v_left = 10'd200;
    assign mem_pivot_h_left = 10'd86;
    assign mem_pivot_v_left = 10'd0;
    assign width_left = 10'd14;
    assign height_left = 10'd30;

    assign pivot_h_right = 10'd8;
    assign pivot_v_right = 10'd200;
    assign mem_pivot_h_right = 10'd71;
    assign mem_pivot_v_right = 10'd0;
    assign width_right = 10'd14;
    assign height_right = 10'd30;

    assign pivot_h_up = 10'd10;
    assign pivot_v_up = 10'd199;
    assign mem_pivot_h_up = 10'd53;
    assign mem_pivot_v_up = 10'd30;
    assign width_up = 10'd15;
    assign height_up = 10'd28;
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
            if(player_state == stactic && v-pivot_v_stactic>=0 && v-pivot_v_stactic<height_stactic && h-pivot_h_stactic>=0 && h-pivot_h_stactic<width_stactic) begin
                en = 1;
                disp_h = h-pivot_h_stactic;
                disp_v = v-pivot_v_stactic;
            end
            else begin
                en = 0;
                disp_h = 0;
                disp_v = 0;
            end
    end

    assign addr = disp_h + mem_pivot_h_stactic + 320*(disp_v + mem_pivot_v_stactic);

endmodule