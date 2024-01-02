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
    output [15:0] led
);
    wire [11:0] data;
    wire clk_25MHz;
    wire clk_22;
    wire [16:0] pixel_addr;
    wire [11:0] pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480
    wire [15:0] nums;

    //game engine IO
    wire [2:0] state = 3'b000, select_level = 3'b001;
    wire[3:0] player1_state = 4'd6;
    wire en_select = 1;
    wire [1:0] player1_jump = 2'b0;
    wire [29:0] cnt_player1_jump = 30'b0;

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;
    wire [9:0] key_down;
    wire [8:0] last_change;
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

    mem_addr_gen mem_addr_gen_inst(
        .clk(clk_22),
        .origine_clk(clk),
        .rst(rst),
        .player1_jump(player1_jump),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .state(state),
        .player1_state(player1_state),
        .select_level(select_level),
        .pixel_addr(pixel_addr),
        .led(led)
    );

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

    game_engine_ver1 GE_ver1(
        .clk(clk), 
        .rst(rst), 
        .key_down(key_down), 
        .state(state), 
        .select_level(select_level), 
        .player1_jump(player1_jump), 
        .player1_state(player1_state), 
        .en_select(en_select),
        .cnt_player1_jump(cnt_player1_jump)
    );
endmodule

