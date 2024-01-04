module menu(
    input clk, 
    input rst, 
    input en, 
    input wire [9:0] vga_h, //640 現在螢幕輸出到哪個pixel
    input wire [9:0] vga_v,  //480 現在螢幕輸出到哪個pixel
    input wire [9:0] key_down,
    output wire [16:0] addr
);



endmodule