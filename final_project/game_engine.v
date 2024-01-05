module map_switch(
    input clk, 
    input rst, 
    inout PS2_DATA, 
    inout PS2_CLK, 
    input wire [9:0] vga_h, //640 
    input wire [9:0] vga_v,  //480 
    output reg [16:0] pixel_addr 
);
    parameter menu_state = 3'b000;
    parameter level_1_state = 3'd1;
    parameter level_2_state = 3'd2;
    parameter level_3_state = 3'd3;
    parameter level_4_state = 3'd4;
    parameter level_5_state = 3'd5;
    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;

    //clk_div
    wire clk_25MHz;
    wire clk_22;
    clock_divider clk_wiz_0_inst(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
    );

    //keyboard
    wire [9:0] key_down;
    wire [8:0] last_change;
    wire been_ready;
    KeyboardDecoder kd1(
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

    //map
    reg [2:0] map = 1;
    reg [2:0] select = 0;
    reg en_key = 1;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            map <= 1;
            select <= 0;
            en_key <= 1;
        end
        else begin
            if(select == 0) begin
                if(key_down == 0) begin
                    map <= map;
                    en_key <= 1;
                end else begin
                    if(!en_key) begin
                        map <= map;
                        en_key <= en_key;
                    end else begin
                        if(key_down[0] || key_down[4]) begin   
                            if(map < 5) map <= map + 1;
                            else map <= map;
                            en_key <= 0;
                        end
                        else if(key_down[2] || key_down[6]) begin
                            if(map > 1) map <= map - 1;
                            else map <= map;
                            en_key <= 0;
                        end
                        else if(key_down[8]) begin
                            select <= 1;
                            map <= map;
                            en_key <= en_key;
                        end
                    end
                end
            end
            else map <= map;
        end
    end 
        //?U??map module?????
    //reg [16:0] pixel_addr;
    wire [16:0] map1_addr, map2_addr, map3_addr, map4_addr, map5_addr, menu_addr;
    wire [5:0] map_en = 1<<map;
    wire map1_clear, map2_clear, map3_clear, map4_clear, map5_clear;
        //addr switch
    always @* begin
        if(rst) begin
            pixel_addr = menu_addr;
        end else begin
            if(!select) begin
                pixel_addr = menu_addr;
            end else begin
                case(map)
                1: pixel_addr = map1_addr;
                2: pixel_addr = map2_addr;
                3: pixel_addr = map3_addr;
                4: pixel_addr = map4_addr;
                5: pixel_addr = map5_addr;
                default: pixel_addr = menu_addr;
                endcase                
            end
        end
    end


    //player1
    reg [29:0] cnt_player1_jump = 0;
    reg [9:0] player1_horizontal_displacement = 0, player1_vertical_displacement = 0;
    reg [24:0] player1_cnt_horizontal = 25'b0, player1_cnt_vertical = 25'b0;
    reg [3:0] player1_state;
    reg [1:0] player1_jump;

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            player1_state <= stactic;
            player1_jump <= 0;
            cnt_player1_jump <= 30'b0;
        end else begin
            if(select) begin
                if(!key_down[4] && !key_down[5] && !key_down[6] && !key_down[7]) begin
                    if(!player1_jump) begin
                        player1_state <= stactic;
                        player1_jump <= 0;
                        cnt_player1_jump <= 30'b0;
                    end
                    else begin
                        if(cnt_player1_jump < 30'd50000000 && player1_jump != 2) begin
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
                    if(cnt_player1_jump < 30'd50000000 && player1_jump != 2) begin
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
                        if(cnt_player1_jump < 30'd50000000 && player1_jump != 2) begin
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
                        if(cnt_player1_jump < 30'd50000000 && player1_jump != 2) begin
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
                        if(cnt_player1_jump < 30'd50000000 && player1_jump != 2) begin
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


    //map choose

    //map modules~~
    /*map menu(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[0] && !select), 
        .level(3'd0), 
        .map(map),
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(menu_addr), 
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );*/

    menu Menu(
        .clk(clk),
        .rst(rst),
        .level(level),
        .map(map),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .key_down(key_down),
        .addr(menu_addr)
    );

    map1 map1(
        .clk(clk), 
        .rst(rst), 
        .key_down(key_down),
        .en(map_en[1] && select), 
        .level(3'd1), 
        .map(map),
        .addr(map1_addr), 
        .clear(map1_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v),
        .player1_state(player1_state),
        .player1_jump(player1_jump),
        .player1_horizontal_displacement(player1_horizontal_displacement),
        .player1_vertical_displacement(player1_vertical_displacement)
    );

    map map2(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[2] && select), 
        .level(3'd2), 
        .map(map),
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map2_addr), 
        .clear(map2_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );
    map map3(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[3] && select), 
        .level(3'd3), 
        .map(map),
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map3_addr), 
        .clear(map3_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );
    map map4(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[4] && select), 
        .level(3'd4), 
        .map(map),
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map4_addr), 
        .clear(map4_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );
    map map5(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[5] && select), 
        .level(3'd5), 
        .map(map),
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map5_addr), 
        .clear(map5_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );

endmodule