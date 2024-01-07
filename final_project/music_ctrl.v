module music_ctrl(
    output audio_mclk, // master clock
    output audio_lrck, // left-right clock
    output audio_sck,  // serial clock
    output audio_sdin, // serial audio data input
    input is_menu, 
    input clk, 
    input rst
);

    wire mclk1, mclk2, lrck1, lrck2, sck1, sck2, sdin1, sdin2;
    assign audio_lrck = is_menu ? lrck2 : lrck1;
    assign audio_mclk = is_menu ? mclk2 : mclk1;
    assign audio_sck = is_menu ? sck2 : sck1;
    assign audio_sdin = is_menu ? sdin2 : sdin1;
    background_music Background_music2( //viyella
        .clk(clk),
        .rst(rst),
        .en(is_menu),
        .audio_mclk(mclk2),
        .audio_lrck(lrck2),
        .audio_sck(sck2),
        .audio_sdin(sdin2)
    );
    menu_background_music Background_music1(//unwelcome school
        .clk(clk),
        .rst(rst),
        .en(~is_menu),
        .audio_mclk(mclk1),
        .audio_lrck(lrck1),
        .audio_sck(sck1),
        .audio_sdin(sdin1)
    );

endmodule