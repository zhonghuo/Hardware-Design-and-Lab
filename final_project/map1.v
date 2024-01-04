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
    output reg [16:0] addr, 
    output reg clear
);
    wire collision_with_player1, collision_with_player2;
    wire en_ceiling, en_floor;
    wire [16:0] addr_ceiling, addr_floor;

    terrain map1_ceiling(
        .clk(clk),
        .rst(rst),
        .terrain_props({10'd0, 10'd0, 10'd320, 10'd10}),
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
        .terrain_props({10'd0, 10'd230, 10'd320, 10'd10}),
        .en(en_floor),
        .addr(addr_floor),
        .mem_pivot_h(10'd1),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    always @* begin
        if(en_ceiling) addr = addr_ceiling;
        else if(en_floor) addr = addr_floor;
        else addr = 12900;
    end

endmodule