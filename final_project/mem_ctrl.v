module mem_ctrl(
    input flag_alphabet, 
    input clk, 
    input [16:0] pixel_addr, 
    output wire [11:0] pixel
);
    wire clk_25MHz, clk_22;
    wire [11:0] data, alphabet_pixel, background_pixel;
    assign pixel = flag_alphabet ? alphabet_pixel : background_pixel;
    clock_divider clk_wiz_0_inst(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );

    blk_mem_gen_1 alphabet(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr[15:0]),
        .dina(data[11:0]),
        .douta(alphabet_pixel)
    );

    blk_mem_gen_0 blk_mem_gen_0_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr),
        .dina(data[11:0]),
        .douta(background_pixel)
    );
endmodule