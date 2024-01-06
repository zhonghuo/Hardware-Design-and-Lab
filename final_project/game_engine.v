module map_switch(
    input clk, 
    input rst, 
    inout PS2_DATA, 
    inout PS2_CLK, 
    input [9:0] key_down,
    input wire [9:0] vga_h, //640 
    input wire [9:0] vga_v,  //480 
    output [16:0] pixel_addr,
    output wire [15:0] led
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
    //wire [9:0] key_down;
    wire [8:0] last_change;
    wire been_ready;
    /*KeyboardDecoder kd1(
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);*/

    //map
    reg [2:0] map = 1;
    reg [2:0] select = 0;
    reg en_key = 1;
    reg [3:0] player_state = 4'd6, player2_state = 4'd6;
    reg [1:0] player_jump = 2'b0, player2_jump = 2'b0;
    reg [29:0] cnt_player_jump = 0, cnt_player2_jump = 0;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            map <= 1;
            select <= 0;
            en_key <= 1;
            player_state <= 4'd6;
            player_jump <= 2'b0;
            cnt_player_jump <= 0;
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
            else begin
                map <= map;
                if(!key_down[4] && !key_down[5] && !key_down[6] && !key_down[7]) begin
                    if(player_jump == 0) begin
                        player_state <= 4'd6;
                        player_jump <= 0;
                        cnt_player_jump <= 0;
                    end else begin
                        if(cnt_player_jump < 30'd70000000 && !p1_collision && player_jump != 2) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                            player_jump <= 1;
                        end else begin
                            player_jump <= 2'd2;
                            if(cnt_player_jump < 30'd240000000 && !p1_land) begin
                                cnt_player_jump <= cnt_player_jump + 1;
                            end else begin
                                player_jump <= 0;
                                cnt_player_jump <= 0;
                            end
                        end
                    end
                end
                else if(key_down[4] && !key_down[5] && !key_down[6] && !key_down[7]) begin
                    player_state <= 4'd9;
                    if(cnt_player_jump < 30'd70000000 && !p1_collision && player_jump != 2) begin
                        cnt_player_jump <= cnt_player_jump + 1;
                        player_jump <= 1;
                    end else begin
                        player_jump <= 2'd2;
                        if(cnt_player_jump < 30'd240000000 && !p1_land) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                        end else begin
                            player_jump <= 0;
                            cnt_player_jump <= 0;
                        end
                    end
                end
                else if((key_down[5] || key_down[4]) && !key_down[7]) begin
                    player_state <= 4'd8;
                    if((key_down[4] || player_jump != 0) && !should_down) begin
                        if(cnt_player_jump < 30'd70000000 && !p1_collision && player_jump != 2) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                            player_jump <= 1;
                        end else begin
                            player_jump <= 2'd2;
                            if(cnt_player_jump < 30'd240000000 && !p1_land) begin
                                cnt_player_jump <= cnt_player_jump + 1;
                            end else begin
                                player_jump <= 0;
                                cnt_player_jump <= 0;
                            end
                        end
                    end
                    else if(should_down) begin
                        player_jump <= 2'd2;
                        if(cnt_player_jump < 30'd240000000 && !p1_land) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                        end else begin
                            player_jump <= 0;
                            cnt_player_jump <= 0;
                        end
                    end
                    else player_jump <= 0;
                end
                else if((key_down[7] || key_down[4]) && !key_down[5]) begin
                    player_state <= 4'd7;
                    if((key_down[4] || player_jump != 0) && !should_down) begin
                        if(cnt_player_jump < 30'd70000000 && !p1_collision && player_jump != 2) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                            player_jump <= 1;
                        end else begin
                            player_jump <= 2'd2;
                            if(cnt_player_jump < 30'd240000000 && !p1_land) begin
                                cnt_player_jump <= cnt_player_jump + 1;
                            end else begin
                                player_jump <= 0;
                                cnt_player_jump <= 0;
                            end
                        end
                    end
                    else if(should_down) begin
                        player_jump <= 2'd2;
                        if(cnt_player_jump < 30'd240000000 && !p1_land) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                        end else begin
                            player_jump <= 0;
                            cnt_player_jump <= 0;
                        end
                    end
                    else player_jump <= 0;
                end
                else begin
                    if(player_jump == 0) player_state <= player_state;
                    else begin
                        if(cnt_player_jump < 30'd70000000 && !p1_collision && player_jump != 2) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                            player_jump <= 1;
                        end else begin
                            player_jump <= 2'd2;
                            if(cnt_player_jump < 30'd240000000 && !p1_land) begin
                                cnt_player_jump <= cnt_player_jump + 1;
                            end else begin
                                player_jump <= 0;
                                cnt_player_jump <= 0;
                            end
                        end
                    end
                end
            end
        end
    end 


    always @(posedge clk or posedge rst) begin
        if(rst) begin
            player2_state <= 4'd6;
            player2_jump <= 2'b0;
            cnt_player2_jump <= 0;
        end
        else begin
            if(select == 1) begin
                map <= map;
                if(!key_down[0] && !key_down[1] && !key_down[2] && !key_down[3]) begin
                    if(player2_jump == 0) begin
                        player2_state <= 4'd6;
                        player2_jump <= 0;
                        cnt_player2_jump <= 0;
                    end else begin
                        if(cnt_player2_jump < 30'd70000000 && !p2_collision && player2_jump != 2) begin
                            cnt_player2_jump <= cnt_player2_jump + 1;
                            player2_jump <= 1;
                        end else begin
                            player2_jump <= 2'd2;
                            if(cnt_player2_jump < 30'd240000000 && !p2_land) begin
                                cnt_player2_jump <= cnt_player2_jump + 1;
                            end else begin
                                player2_jump <= 0;
                                cnt_player2_jump <= 0;
                            end
                        end
                    end
                end
                else if(key_down[0] && !key_down[1] && !key_down[2] && !key_down[3]) begin
                    player2_state <= 4'd9;
                    if(cnt_player2_jump < 30'd70000000 && !p2_collision && player2_jump != 2) begin
                        cnt_player2_jump <= cnt_player2_jump + 1;
                        player2_jump <= 1;
                    end else begin
                        player2_jump <= 2'd2;
                        if(cnt_player2_jump < 30'd240000000 && !p2_land) begin
                            cnt_player2_jump <= cnt_player2_jump + 1;
                        end else begin
                            player2_jump <= 0;
                            cnt_player2_jump <= 0;
                        end
                    end
                end
                else if((key_down[0] || key_down[1]) && !key_down[3]) begin
                    player2_state <= 4'd8;
                    if((key_down[0] || player2_jump != 0) && !should_down2) begin
                        if(cnt_player2_jump < 30'd70000000 && !p2_collision && player2_jump != 2) begin
                            cnt_player2_jump <= cnt_player2_jump + 1;
                            player2_jump <= 1;
                        end else begin
                            player2_jump <= 2'd2;
                            if(cnt_player2_jump < 30'd240000000 && !p2_land) begin
                                cnt_player2_jump <= cnt_player2_jump + 1;
                            end else begin
                                player2_jump <= 0;
                                cnt_player2_jump <= 0;
                            end
                        end
                    end
                    else if(should_down2) begin
                        player2_jump <= 2'd2;
                        if(cnt_player2_jump < 30'd240000000 && !p2_land) begin
                            cnt_player2_jump <= cnt_player2_jump + 1;
                        end else begin
                            player2_jump <= 0;
                            cnt_player2_jump <= 0;
                        end
                    end
                    else player2_jump <= 0;
                end
                else if((key_down[3] || key_down[0]) && !key_down[1]) begin
                    player2_state <= 4'd7;
                    if((key_down[0] || player2_jump != 0) && !should_down2) begin
                        if(cnt_player2_jump < 30'd70000000 && !p2_collision && player2_jump != 2) begin
                            cnt_player2_jump <= cnt_player2_jump + 1;
                            player2_jump <= 1;
                        end else begin
                            player2_jump <= 2'd2;
                            if(cnt_player2_jump < 30'd240000000 && !p2_land) begin
                                cnt_player2_jump <= cnt_player2_jump + 1;
                            end else begin
                                player2_jump <= 0;
                                cnt_player2_jump <= 0;
                            end
                        end
                    end
                    else if(should_down2) begin
                        player2_jump <= 2'd2;
                        if(cnt_player2_jump < 30'd240000000 && !p2_land) begin
                            cnt_player2_jump <= cnt_player2_jump + 1;
                        end else begin
                            player2_jump <= 0;
                            cnt_player2_jump <= 0;
                        end
                    end
                    else player2_jump <= 0;
                end
                else begin
                    if(player2_jump == 0) player2_state <= player2_state;
                    else begin
                        if(cnt_player2_jump < 30'd70000000 && !p2_collision && player2_jump != 2) begin
                            cnt_player2_jump <= cnt_player2_jump + 1;
                            player2_jump <= 1;
                        end else begin
                            player2_jump <= 2'd2;
                            if(cnt_player2_jump < 30'd240000000 && !p2_land) begin
                                cnt_player2_jump <= cnt_player2_jump + 1;
                            end else begin
                                player2_jump <= 0;
                                cnt_player2_jump <= 0;
                            end
                        end
                    end
                end
            end else begin
                player2_state <= 4'd6;
                player2_jump <= 2'b0;
                cnt_player2_jump <= 0;
            end
        end
    end 

    //?U??map module?????
    //reg [16:0] pixel_addr;
    wire [16:0] map1_addr, map2_addr, map3_addr, map4_addr, map5_addr, menu_addr;
    wire [5:0] map_en = 1<<map;
    wire map1_clear, map2_clear, map3_clear, map4_clear, map5_clear;
        //addr switch
    /*always @(posedge clk, posedge rst) begin
        if(rst) begin
            pixel_addr <= menu_addr;
        end else begin
            if(!select) begin
                pixel_addr <= menu_addr;
            end else begin
                case(map)
                1: pixel_addr <= map1_addr;
                2: pixel_addr <= map2_addr;
                3: pixel_addr <= map3_addr;
                4: pixel_addr <= map4_addr;
                5: pixel_addr <= map5_addr;
                default: pixel_addr <= menu_addr;
                endcase                
            end
        end
    end*/
    wire [9:0] h, v;
    assign h = vga_h >> 1;
    assign v = vga_v >> 1;

    /*assign pixel_addr = (!select) ? menu_addr :
                        (map==1) ? map1_addr :
                        (map==2) ? map2_addr :
                        (map==3) ? map3_addr :
                        (map==4) ? map4_addr : map5_addr;*/

    assign pixel_addr = (!select && map == 1) ? (
        (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
            (h-150)+(v-39)*320
        ) : (
            (h >= 150 && h < 170 && v >= 80 && v < 105) ? (
                (h-150)+(v-79)*320
            ) : (
                (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                    (h-150)+(v-119)*320
                ) : (
                    (h >= 150 && h < 170 && v >= 160 && v < 185) ? (
                        (h-150)+(v-159)*320
                    ) : (
                        (h >= 148 && h < 170 && v >= 200 && v < 225) ? (
                            (h-127)+(v-199)*320
                        ) : (
                            0
                        )
                    )
                )
            )
        )
    ) : (
        (!select && map == 2) ? (
            (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
                (h-150)+(v-39)*320
            ) : (
                (h >= 150 && h < 170 && v >= 80 && v < 105) ? (
                    (h-150)+(v-79)*320
                ) : (
                    (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                        (h-150)+(v-119)*320
                    ) : (
                        (h >= 148 && h < 170 && v >= 160 && v < 185) ? (
                            (h-127)+(v-159)*320
                        ) : (
                            (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                                (h-150)+(v-199)*320
                            ) : (
                                0
                            )
                        )
                    )
                )
            )
        )  : (
            (!select && map == 3) ? (
                (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
                    (h-150)+(v-39)*320
                ) : (
                    (h >= 150 && h < 170 && v >= 80 && v < 105) ? (
                        (h-150)+(v-79)*320
                    ) : (
                        (h >= 148 && h < 170 && v >= 120 && v < 145) ? (
                            (h-127)+(v-119)*320
                        ) : (
                            (h >= 150 && h < 170 && v >= 160 && v < 185) ? (
                                (h-150)+(v-159)*320
                            ) : (
                                (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                                    (h-150)+(v-199)*320
                                ) : (
                                    0
                                )
                            )
                        )
                    )
                )
            ) : (
                (!select && map == 4) ? (
                    (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
                        (h-150)+(v-39)*320
                    ) : (
                        (h >= 148 && h < 170 && v >= 80 && v < 105) ? (
                            (h-127)+(v-79)*320
                        ) : (
                            (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                                (h-150)+(v-119)*320
                            ) : (
                                (h >= 150 && h < 170 && v >= 160 && v < 185) ? (
                                    (h-150)+(v-159)*320
                                ) : (
                                    (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                                        (h-150)+(v-199)*320
                                    ) : (
                                        0
                                    )
                                )
                            )
                        )
                    )
                ) : (
                    (!select && map == 5) ? (
                        (h >= 148 && h < 170 && v >= 40 && v < 65) ? (
                            (h-127)+(v-39)*320
                        ) : (
                            (h >= 150 && h < 170 && v >= 80 && v < 105) ? (
                                (h-150)+(v-79)*320
                            ) : (
                                (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                                    (h-150)+(v-119)*320
                                ) : (
                                    (h >= 150 && h < 170 && v >= 160 && v < 185) ? (
                                        (h-150)+(v-159)*320
                                    ) : (
                                        (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                                            (h-150)+(v-199)*320
                                        ) : (
                                            0
                                        )
                                    )
                                )
                            )
                        )
                    ) : (
                        (select && map == 1) ? (
                            map1_addr
                        ) : (
                            0
                        )
                    )
                )
            )
        )
    );

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

    /*menu Menu(
        .clk(clk),
        .rst(rst),
        .level(level),
        .map(map),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .key_down(key_down),
        .addr(menu_addr)
    );*/

    map1 Map1(
        .clk(clk), 
        .rst(rst), 
        .addr(map1_addr), 
        .vga_h(vga_h), 
        .vga_v(vga_v),
        .player_state(player_state),
        .player2_state(player2_state),
        .player_jump(player_jump),
        .player2_jump(player2_jump),
        .led(led),
        .p1_collision(p1_collision),
        .p2_collision(p2_collision),
        .p1_land(p1_land),
        .p2_land(p2_land),
        .should_down(should_down),
        .should_down2(should_down2),
        .button1_tounch(button1_tounch)
    );

    /*map map2(
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
    );*/

endmodule