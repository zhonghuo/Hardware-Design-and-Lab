module clear_scene(
    input clk, 
    input wire [9:0] vga_h, 
    input wire [9:0] vga_v, 
    output reg [15:0] addr
);
    wire en_s, en_u, en_c, en_c2, en_e, en_s2, en_s3;
    wire [15:0] addr_s, addr_u, addr_c, addr_c2, addr_e, addr_s2, addr_s3;

    abc  s(
        .addr(addr_s), 
        .en(en_s),
        .vga_h(vga_h), 
        .vga_v(vga_v), 
        .mem_pivot_h(5), 
        .mem_pivot_v(90),
        .pivot_h(33),
        .pivot_v(60),
        .width(23),
        .height(40)
    );

    abc  u(
        .addr(addr_u), 
        .en(en_u),
        .vga_h(vga_h), 
        .vga_v(vga_v), 
        .mem_pivot_h(55), 
        .mem_pivot_v(90),
        .pivot_h(58),
        .pivot_v(60),
        .width(25),
        .height(40)
    );

    abc  c(
        .addr(addr_c), 
        .en(en_c),
        .vga_h(vga_h), 
        .vga_v(vga_v), 
        .mem_pivot_h(55), 
        .mem_pivot_v(5),
        .pivot_h(83),
        .pivot_v(60),
        .width(25),
        .height(40)
    );

    abc  c2(
        .addr(addr_c2), 
        .en(en_c2),
        .vga_h(vga_h), 
        .vga_v(vga_v), 
        .mem_pivot_h(55), 
        .mem_pivot_v(5),
        .pivot_h(108),
        .pivot_v(60),
        .width(25),
        .height(40)
    );

    abc  e(
        .addr(addr_e), 
        .en(en_e),
        .vga_h(vga_h), 
        .vga_v(vga_v), 
        .mem_pivot_h(108), 
        .mem_pivot_v(5),
        .pivot_h(133),
        .pivot_v(60),
        .width(25),
        .height(40)
    );

    abc  s2(
        .addr(addr_s2), 
        .en(en_s2),
        .vga_h(vga_h), 
        .vga_v(vga_v), 
        .mem_pivot_h(5), 
        .mem_pivot_v(90),
        .pivot_h(158),
        .pivot_v(60),
        .width(23),
        .height(40)
    );

    abc  s3(
        .addr(addr_s3), 
        .en(en_s3),
        .vga_h(vga_h), 
        .vga_v(vga_v), 
        .mem_pivot_h(5), 
        .mem_pivot_v(90),
        .pivot_h(183),
        .pivot_v(60),
        .width(23),
        .height(40)
    );

    always @* begin
        if(en_s) addr = addr_s;
        else if(en_u) addr = addr_u;
        else if(en_c) addr = addr_c;
        else if(en_c2) addr = addr_c2;
        else if(en_e) addr = addr_e;
        else if(en_s2) addr = addr_s2;
        else if(en_s3) addr = addr_s3;
        else addr = 0;
    end
endmodule