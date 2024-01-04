module map(
    input clk, 
    input rst, 
    input en, 
    input wire [9:0] vga_h, //640 現在螢幕輸出到哪個pixel
    input wire [9:0] vga_v,  //480 現在螢幕輸出到哪個pixel
    inout PS2_DATA, 
    inout PS2_CLK, 
    output wire [16:0] addr, 
    output reg clear
);

//player player1(...);
//player player2(...);
//terrain t1(...); ...
//mech m1(...); ...

endmodule