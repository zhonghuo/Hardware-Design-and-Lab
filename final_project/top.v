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
    
    /*KeyboardDecoder k(
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);*/

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

    background_music Background_music1(
        .clk(clk),
        .rst(rst),
        .en(1),
        .audio_mclk(audio_mclk),
        .audio_lrck(audio_lrck),
        .audio_sck(audio_sck),
        .audio_sdin(audio_sdin)
    );

    map_switch Map_switch(
        .clk(clk),
        .rst(rst),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .vga_h(h_cnt),
        .vga_v(v_cnt),
        .pixel_addr(pixel_addr)
    );

    /*always @(posedge clk, posedge rst) begin
        if(rst) begin
            select_level <= 3'd1;
            en_select <= 1;
            state <= menu_state;
        end else begin
            if(state == menu_state) begin
                if(key_down == 0) begin
                    select_level <= select_level;
                    en_select <= 1;
                end else begin
                    if(!en_select) begin
                        select_level <= select_level;
                        en_select <= en_select;
                    end else begin
                        if(key_down[0] || key_down[4]) begin
                            if(select_level < 5) select_level <= select_level + 1;
                            else select_level <= select_level;
                            en_select <= 0;
                        end
                        else if(key_down[2] || key_down[6]) begin
                            if(select_level > 1) select_level <= select_level - 1;
                            else select_level <= select_level;
                            en_select <= 0;
                        end
                        else if(key_down[8]) begin
                            state <= select_level;
                            select_level <= select_level;
                            en_select <= en_select;
                        end
                        else begin
                            select_level <= select_level;
                            en_select <= en_select;
                        end
                    end
                end
            end else begin
                select_level <= select_level;
                en_select <= 1;
            end
        end
    end
    
    //player_1
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            player1_state <= stactic;
            player1_jump <= 0;
            cnt_player1_jump <= 30'b0;
        end else begin
            if(state != menu_state) begin
                if(!key_down[4] && !key_down[5] && !key_down[6] && !key_down[7]) begin
                    if(!player1_jump) begin
                        player1_state <= stactic;
                        player1_jump <= 0;
                        cnt_player1_jump <= 30'b0;
                    end
                    else begin
                        if(cnt_player1_jump < 30'd50000000 && !player1_collide && player1_jump != 2) begin
                            player1_jump <= 2'd1;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else begin
                            player1_jump <= 2'd2;
                            if(cnt_player1_jump < 30'd100000000) begin
                                cnt_player1_jump <= cnt_player1_jump + 1;
                            end
                            else player1_jump <= 0;
                        end
                    end
                end
                else if(key_down[4] && !key_down[5] && !key_down[6] && !key_down[7]) begin
                    player1_state <= up;
                    if(cnt_player1_jump >= 30'd100000000) cnt_player1_jump <= 0;
                    else cnt_player1_jump <= cnt_player1_jump;
                    if(cnt_player1_jump < 30'd50000000 && !player1_collide && player1_jump != 2) begin
                        player1_jump <= 2'd1;
                        cnt_player1_jump <= cnt_player1_jump + 1;
                    end
                    else begin
                        player1_jump <= 2'd2;
                        if(cnt_player1_jump < 30'd100000000) begin
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else player1_jump <= 0;
                    end
                end
                else if((key_down[5] || key_down[4]) && !key_down[7]) begin
                    player1_state <= left;
                    if(cnt_player1_jump >= 30'd100000000) cnt_player1_jump <= 0;
                    else cnt_player1_jump <= cnt_player1_jump;
                    if(key_down[4] || player1_jump) begin
                        if(cnt_player1_jump < 30'd50000000 && !player1_collide && player1_jump != 2) begin
                            player1_jump <= 2'd1;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else begin
                            player1_jump <= 2'd2;
                            if(cnt_player1_jump < 30'd100000000) begin
                                cnt_player1_jump <= cnt_player1_jump + 1;
                            end
                            else player1_jump <= 0;
                        end
                    end
                    else player1_jump <= 2'd0;
                end
                else if((key_down[7] || key_down[4]) && !key_down[5]) begin
                    player1_state <= right;
                    if(cnt_player1_jump >= 30'd100000000) cnt_player1_jump <= 0;
                    else cnt_player1_jump <= cnt_player1_jump;
                    if(key_down[4] || player1_jump) begin
                        if(cnt_player1_jump < 30'd50000000 && !player1_collide && player1_jump != 2) begin
                            player1_jump <= 2'd1;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else begin
                            player1_jump <= 2'd2;
                            if(cnt_player1_jump < 30'd100000000) begin
                                cnt_player1_jump <= cnt_player1_jump + 1;
                            end
                            else player1_jump <= 0;
                        end
                    end
                    else player1_jump <= 2'd0;
                end
                else begin
                    if(!player1_jump) player1_state <= player1_state;
                    else begin
                        if(cnt_player1_jump < 30'd50000000 && !player1_collide && player1_jump != 2) begin
                            player1_jump <= 2'd1;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else begin
                            player1_jump <= 2'd2;
                            if(cnt_player1_jump < 30'd100000000) begin
                                cnt_player1_jump <= cnt_player1_jump + 1;
                            end
                            else player1_jump <= 0;
                        end
                    end
                end
            end
            else begin
                cnt_player1_jump <= cnt_player1_jump;
                player1_jump <= player1_jump;
                player1_state <= player1_state;
            end
        end
    end

    //player_2
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            player2_state <= stactic;
            player2_jump <= 0;
            cnt_player2_jump <= 30'b0;
        end else begin
            if(state != menu_state) begin
                if(!key_down[0] && !key_down[1] && !key_down[2] && !key_down[3]) begin
                    if(!player2_jump) begin
                        player2_state <= stactic;
                        player2_jump <= 0;
                        cnt_player2_jump <= 30'b0;
                    end
                    else begin
                        if(cnt_player2_jump < 30'd50000000 && !player2_collide && player2_jump != 2) begin
                            player2_jump <= 2'd1;
                            cnt_player2_jump <= cnt_player2_jump + 1;
                        end
                        else begin
                            player2_jump <= 2'd2;
                            if(cnt_player2_jump < 30'd100000000) begin
                                cnt_player2_jump <= cnt_player2_jump + 1;
                            end
                            else player2_jump <= 0;
                        end
                    end
                end
                else if(key_down[0] && !key_down[1] && !key_down[2] && !key_down[3]) begin
                    player2_state <= up;
                    if(cnt_player2_jump >= 30'd100000000) cnt_player2_jump <= 0;
                    else cnt_player2_jump <= cnt_player2_jump;
                    if(cnt_player2_jump < 30'd50000000 && !player2_collide && player2_jump != 2) begin
                        player2_jump <= 2'd1;
                        cnt_player2_jump <= cnt_player2_jump + 1;
                    end
                    else begin
                        player2_jump <= 2'd2;
                        if(cnt_player2_jump < 30'd100000000) begin
                            cnt_player2_jump <= cnt_player2_jump + 1;
                        end
                        else player2_jump <= 0;
                    end
                end
                else if((key_down[0] || key_down[1]) && !key_down[3]) begin
                    player2_state <= left;
                    if(cnt_player2_jump >= 30'd100000000) cnt_player2_jump <= 0;
                    else cnt_player2_jump <= cnt_player2_jump;
                    if(key_down[0] || player2_jump) begin
                        if(cnt_player2_jump < 30'd50000000 && !player2_collide && player2_jump != 2) begin
                            player2_jump <= 2'd1;
                            cnt_player2_jump <= cnt_player2_jump + 1;
                        end
                        else begin
                            player2_jump <= 2'd2;
                            if(cnt_player2_jump < 30'd100000000) begin
                                cnt_player2_jump <= cnt_player2_jump + 1;
                            end
                            else player2_jump <= 0;
                        end
                    end
                    else player2_jump <= 2'd0;
                end
                else if((key_down[0] || key_down[3]) && !key_down[1]) begin
                    player2_state <= right;
                    if(cnt_player2_jump >= 30'd100000000) cnt_player2_jump <= 0;
                    else cnt_player2_jump <= cnt_player2_jump;
                    if(key_down[0] || player2_jump) begin
                        if(cnt_player2_jump < 30'd50000000 && !player2_collide && player2_jump != 2) begin
                            player2_jump <= 2'd1;
                            cnt_player2_jump <= cnt_player2_jump + 1;
                        end
                        else begin
                            player2_jump <= 2'd2;
                            if(cnt_player2_jump < 30'd100000000) begin
                                cnt_player2_jump <= cnt_player2_jump + 1;
                            end
                            else player2_jump <= 0;
                        end
                    end
                    else player2_jump <= 2'd0;
                end
                else begin
                    if(!player2_jump) player2_state <= player2_state;
                    else begin
                        if(cnt_player2_jump < 30'd50000000 && !player2_collide && player2_jump != 2) begin
                            player2_jump <= 2'd1;
                            cnt_player2_jump <= cnt_player2_jump + 1;
                        end
                        else begin
                            player2_jump <= 2'd2;
                            if(cnt_player2_jump < 30'd100000000) begin
                                cnt_player2_jump <= cnt_player2_jump + 1;
                            end
                            else player2_jump <= 0;
                        end
                    end
                end
            end
            else begin
                cnt_player2_jump <= cnt_player2_jump;
                player2_jump <= player2_jump;
                player2_state <= player2_state;
            end
        end
    end*/

endmodule

