module final_project(
    input clk,
    input rst,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,
    output wire [6:0] DISPLAY,    
    output wire [3:0] DIGIT,
    inout PS2_DATA, 
    inout PS2_CLK, 
    output [15:0] led,
    output audio_mclk, // master clock
    output audio_lrck, // left-right clock
    output audio_sck,  // serial clock
    output audio_sdin // serial audio data input
);
    //vga variables
    wire clk_25MHz;
    wire clk_22;
    wire [16:0] pixel_addr;
    wire [11:0] pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480

    //7segment
    wire [15:0] nums;

    wire flag_alphabet;//to show cover or not
    
    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;
    wire [9:0] key_down;
    wire [8:0] last_change;
    wire been_ready;

    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;

    clock_divider clk_wiz_0_inst(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );
    
    KeyboardDecoder k(
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

    mem_ctrl MC(
        .clk(clk), .flag_alphabet(flag_alphabet), 
        .pixel_addr(pixel_addr), .pixel(pixel)
    );

    vga_controller   vga_inst(
        .pclk(clk_25MHz),
        .reset(rst),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );

    T TT(
        .clk(clk),
        .rst(rst),
        .DISPLAY(DISPLAY),
        .DIGIT(DIGIT)
    );

    //music choose
    wire [2:0] select;
    music_ctrl MusicControl(
        .clk(clk), .rst(rst), .is_menu(select == 0), 
        .audio_mclk(audio_mclk), .audio_lrck(audio_lrck), 
        .audio_sck(audio_sck), .audio_sdin(audio_sdin)
    );

    map_switch Map_switch(
        .clk(clk),
        .rst(rst),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .key_down(key_down),
        .vga_h(h_cnt),
        .vga_v(v_cnt),
        .pixel_addr(pixel_addr),
        .led(led), 
        .select(select), 
        .flag_alphabet(flag_alphabet), 
        .been_ready(been_ready)
    );

endmodule