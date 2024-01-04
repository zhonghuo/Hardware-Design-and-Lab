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
    wire en_ceiling, en_floor, en_LeftBoundary, en_RightBoundary, en_RedRiver, en_BlueRiver;
    wire [16:0] addr_ceiling, addr_floor, addr_LeftBoundary, addr_RightBoundary, addr_BlueRiver, addr_RedRiver;

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

    always @* begin
        if(en_ceiling) addr = addr_ceiling;
        else if(en_RedRiver) addr = addr_RedRiver;
        else if(en_BlueRiver) addr = addr_BlueRiver;        
        else if(en_floor) addr = addr_floor;
        else if(en_LeftBoundary) addr = addr_LeftBoundary;
        else if(en_RightBoundary) addr = addr_RightBoundary;
        else addr = 12900;
    end

endmodule