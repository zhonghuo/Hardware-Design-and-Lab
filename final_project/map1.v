module map1(
    input clk, 
    input rst, 
    input en, 
    input [2:0] level,
    input [2:0] map,
    input wire [9:0] vga_h, 
    input wire [9:0] vga_v,  
    inout PS2_DATA, 
    inout PS2_CLK, 
    output wire [16:0] addr, 
    output reg clear
);
    wire collision_with_player1, collision_with_player2;
    
    terrain map1_ceiling(
        .clk(clk),
        .rst(rst),
        .terrain_props({10'd0, 10'd0, 10'd320, 10'd10}),
        .addr(addr),
        .disp_h(0),
        .dir_disp_h(0),
        .disp_v(10'd220),
        .dir_disp_v(1),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_floor(
        .clk(clk),
        .rst(rst),
        .terrain_props({10'd0, 10'd230, 10'd320, 10'd10}),
        .addr(addr),
        .disp_h(0),
        .dir_disp_h(0),
        .disp_v(10'd10),
        .dir_disp_v(0),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

endmodule