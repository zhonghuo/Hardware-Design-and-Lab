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
    parameter [8:0] W_code = 9'b0_0001_1101;
    parameter [8:0] A_code = 9'b0_0001_1100;
    parameter [8:0] S_code = 9'b0_0001_1011;
    parameter [8:0] D_code = 9'b0_0010_0011;
    parameter [8:0] UP_code = 9'b0_0111_0101;
    parameter [8:0] LEFT_code = 9'b0_0110_1011;
    parameter [8:0] DOWN_code = 9'b0_0111_0010;
    parameter [8:0] RIGHT_code = 9'b1_0111_0100;
    parameter [8:0] ENTER_code = 9'b0_0101_1010;
    wire [11:0] data;
    wire clk_25MHz;
    wire clk_22;
    wire [16:0] pixel_addr;
    wire [11:0] pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480
    wire [15:0] nums;

    wire player1_collide, player2_collide;
    reg [2:0] state = 3'b000, select_level = 3'b001;
    reg [3:0] player1_state = 4'd6, player2_state = 4'd6;
    reg en_select = 1;
    reg [1:0] player1_jump = 2'b0, player2_jump = 2'b0;
    reg [29:0] cnt_player1_jump = 30'b0, cnt_player2_jump = 30'b0;

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;
    wire [9:0] key_down;
    wire [8:0] last_change;
    wire been_ready;
    wire [3:0] move;
    wire [9:0] key_decode = 1 << move;
    assign move =   (last_change == W_code) ? 0 :
	                (last_change == A_code) ? 1 :
				    (last_change == S_code) ? 2 :
					(last_change == D_code) ? 3 :
					(last_change == UP_code) ? 4 :
					(last_change == LEFT_code) ? 5 :
					(last_change == DOWN_code) ? 6 :
					(last_change == RIGHT_code) ? 7 :
                    (last_change == ENTER_code) ? 8 : 9;
    /*
    W -> key_down[0]
    A -> 1
    S -> 2
    D -> 3
    up -> 4
    left -> 5
    down -> 6
    right -> 7
    enter -> 8 9
    */
    parameter menu_state = 3'b000;
    parameter level_1_state = 3'd1;
    parameter level_2_state = 3'd2;
    parameter level_3_state = 3'd3;
    parameter level_4_state = 3'd4;
    parameter level_5_state = 3'd5;
    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    
    KeyboardDecoder k(
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

    clock_divider clk_wiz_0_inst(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );

    /*mem_addr_gen mem_addr_gen_inst(
        .clk(clk_22),
        .origine_clk(clk),
        .rst(rst),
        .player1_jump(player1_jump),
        .player2_jump(player2_jump),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .state(state),
        .player1_state(player1_state),
        .player2_state(player2_state),
        .select_level(select_level),
        .pixel_addr(pixel_addr),
        .player1_collide(player1_collide),
        .led(led)
    );*/

    blk_mem_gen_0 blk_mem_gen_0_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr),
        .dina(data[11:0]),
        .douta(pixel)
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
    wire is_menu;
    assign is_menu = (select == 0);
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
        .select(select)
    );

endmodule