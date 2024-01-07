module map_switch(
    input clk, 
    input rst, 
    inout PS2_DATA, 
    inout PS2_CLK, 
    input [9:0] key_down,
    input been_ready,
    input wire [9:0] vga_h, //640 
    input wire [9:0] vga_v,  //480 
    output [16:0] pixel_addr,
    output reg [15:0] led, 
    output reg [2:0] select,
    output reg flag_cover
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


    //map
    reg [2:0] map = 1;
    reg en_key = 1;
    reg [3:0] player_state = 4'd6, player2_state = 4'd6;
    reg [1:0] player_jump = 2'b0, player2_jump = 2'b0;
    reg [29:0] cnt_player_jump = 0, cnt_player2_jump = 0;

    //map1 wires
    //wire map1_reg clear,
    wire [15:0] map1_led;
    wire map1_p1_collision, map1_p2_collision;
    wire map1_p1_land, map1_p2_land;
    wire map1_should_down, map1_should_down2;
    wire map1_button1_tounch;

    //map2 wires
    //wire map2_reg clear,
    wire [15:0] map2_led;
    wire map2_p1_collision, map2_p2_collision;
    wire map2_p1_land, map2_p2_land;
    wire map2_should_down, map2_should_down2;
    wire map2_button1_tounch;

    //map3 wires
    //wire map3_reg clear,
    wire [15:0] map3_led;
    wire map3_p1_collision, map3_p2_collision;
    wire map3_p1_land, map3_p2_land;
    wire map3_should_down, map3_should_down2;
    wire map3_button1_tounch;

    //map4 wires
    //wire map4_reg clear,
    wire [15:0] map4_led;
    wire map4_p1_collision, map4_p2_collision;
    wire map4_p1_land, map4_p2_land;
    wire map4_should_down, map4_should_down2;
    wire map4_button1_tounch;

    //map5 wires
    //wire map5_reg clear,
    wire [15:0] map5_led;
    wire map5_p1_collision, map5_p2_collision;
    wire map5_p1_land, map5_p2_land;
    wire map5_should_down, map5_should_down2;
    wire map5_button1_tounch;

    //wires of maps
    //using selector to choose the final output
    reg p1_collision, p2_collision;
    reg p1_land, p2_land;
    reg should_down, should_down2;
    reg button1_tounch;


    //cover related variables
    //cover_gen
    wire [15:0] cover_addr;
    game_cover escape_from_NTHU(
        .clk(clk), 
        .vga_h(vga_h), 
        .vga_v(vga_v), 
        .addr(cover_addr)
    );

    //map choose
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            map <= 1;
            select <= 0;
            en_key <= 1;
            player_state <= 4'd6;
            player_jump <= 2'b0;
            cnt_player_jump <= 0;
            flag_cover <= 1;
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
                            if(flag_cover) flag_cover <= 0;
                            else select <= 1;
                            map <= map;
                            en_key <= 0;
                        end
                    end
                end
            end
            else begin
                map <= map;
                if(key_down[8] && been_ready) select <= 0;
                else if(!key_down[4] && !key_down[5] && !key_down[6] && !key_down[7]) begin
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

   
    wire [16:0] map1_addr, map2_addr, map3_addr, map4_addr, map5_addr, menu_addr;
    wire [5:0] map_en = 1<<map;
    wire map1_clear, map2_clear, map3_clear, map4_clear, map5_clear;
    
    wire [9:0] h, v;
    assign h = vga_h >> 1;
    assign v = vga_v >> 1;

    /*assign pixel_addr = (!select) ? menu_addr :
                        (map==1) ? map1_addr :
                        (map==2) ? map2_addr :
                        (map==3) ? map3_addr :
                        (map==4) ? map4_addr : map5_addr;*/
    wire [16:0] map_and_menu_addr;
    assign map_and_menu_addr = (!select && map == 1) ? (
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
                        ) : (select && map == 2) ?(
                            map2_addr
                        ) : (select && map == 3) ?(
                            map3_addr
                        ) : (select && map == 4) ?(
                            map4_addr
                        ) : (select && map == 5) ?(
                            map5_addr
                        ) :(
                            0
                        )
                    )
                )
            )
        )
    );

    assign pixel_addr  = flag_cover ? {1'b0, cover_addr} : map_and_menu_addr;

    map1 Map1(
        .clk(clk), 
        .rst(rst), 
        .en((map == 1) && select),
        .addr(map1_addr), 
        .vga_h(vga_h), 
        .vga_v(vga_v),
        .player_state(player_state),
        .player2_state(player2_state),
        .player_jump(player_jump),
        .player2_jump(player2_jump),
        .led(map1_led),
        .p1_collision(map1_p1_collision),
        .p2_collision(map1_p2_collision),
        .p1_land(map1_p1_land),
        .p2_land(map1_p2_land),
        .should_down(map1_should_down),
        .should_down2(map1_should_down2),
        .button1_tounch(map1_button1_tounch),
        .success(success),
        .fail(fail)
    );

    map2 Map2(
        .clk(clk), 
        .rst(rst), 
        .en((map == 2) && select),
        .addr(map2_addr), 
        .vga_h(vga_h), 
        .vga_v(vga_v),
        .player_state(player_state),
        .player2_state(player2_state),
        .player_jump(player_jump),
        .player2_jump(player2_jump),
        .led(map2_led),
        .p1_collision(map2_p1_collision),
        .p2_collision(map2_p2_collision),
        .p1_land(map2_p1_land),
        .p2_land(map2_p2_land),
        .should_down(map2_should_down),
        .should_down2(map2_should_down2),
        .button1_tounch(map2_button1_tounch)
    );

    map3 Map3(
        .clk(clk), 
        .rst(rst), 
        .en((map == 3) && select),
        .addr(map3_addr), 
        .vga_h(vga_h), 
        .vga_v(vga_v),
        .player_state(player_state),
        .player2_state(player2_state),
        .player_jump(player_jump),
        .player2_jump(player2_jump),
        .led(map3_led),
        .p1_collision(map3_p1_collision),
        .p2_collision(map3_p2_collision),
        .p1_land(map3_p1_land),
        .p2_land(map3_p2_land),
        .should_down(map3_should_down),
        .should_down2(map3_should_down2),
        .button1_tounch(map3_button1_tounch)
    );

    map4 Map4(
        .clk(clk), 
        .rst(rst), 
        .en((map == 4) && select),
        .addr(map4_addr), 
        .vga_h(vga_h), 
        .vga_v(vga_v),
        .player_state(player_state),
        .player2_state(player2_state),
        .player_jump(player_jump),
        .player2_jump(player2_jump),
        .led(map4_led),
        .p1_collision(map4_p1_collision),
        .p2_collision(map4_p2_collision),
        .p1_land(map4_p1_land),
        .p2_land(map4_p2_land),
        .should_down(map4_should_down),
        .should_down2(map4_should_down2),
        .button1_tounch(map4_button1_tounch)
    );

    map5 Map5(
        .clk(clk), 
        .rst(rst), 
        .en((map == 5) && select),
        .addr(map5_addr), 
        .vga_h(vga_h), 
        .vga_v(vga_v),
        .player_state(player_state),
        .player2_state(player2_state),
        .player_jump(player_jump),
        .player2_jump(player2_jump),
        .led(map5_led),
        .p1_collision(map5_p1_collision),
        .p2_collision(map5_p2_collision),
        .p1_land(map5_p1_land),
        .p2_land(map5_p2_land),
        .should_down(map5_should_down),
        .should_down2(map5_should_down2),
        .button1_tounch(map5_button1_tounch)
    );

    //wires of maps selector
    /*
    //wires of maps
    //using selector to choose the final output
    led
    reg p1_collision, p2_collision;
    reg p1_land, p2_land;
    reg should_down, should_down2;
    reg button1_tounch;
    */
    //map1_
    //map2_
    always @* begin
        if(select) begin
            case(map)
            1: begin
                led <= map1_led;
                p1_collision <= map1_p1_collision;
                p2_collision <= map1_p2_collision;
                p1_land <= map1_p1_land;
                p2_land <= map1_p2_land;
                should_down <= map1_should_down;
                should_down2 <= map1_should_down2;
                button1_tounch <= map1_button1_tounch;
            end
            2: begin
                led <= map2_led;
                p1_collision <= map2_p1_collision;
                p2_collision <= map2_p2_collision;
                p1_land <= map2_p1_land;
                p2_land <= map2_p2_land;
                should_down <= map2_should_down;
                should_down2 <= map2_should_down2;
                button1_tounch <= map2_button1_tounch;
            end
            3: begin
                led <= map3_led;
                p1_collision <= map3_p1_collision;
                p2_collision <= map3_p2_collision;
                p1_land <= map3_p1_land;
                p2_land <= map3_p2_land;
                should_down <= map3_should_down;
                should_down2 <= map3_should_down2;
                button1_tounch <= map3_button1_tounch;
            end
            4: begin
                led <= map4_led;
                p1_collision <= map4_p1_collision;
                p2_collision <= map4_p2_collision;
                p1_land <= map4_p1_land;
                p2_land <= map4_p2_land;
                should_down <= map4_should_down;
                should_down2 <= map4_should_down2;
                button1_tounch <= map4_button1_tounch;
            end
            5:begin
                led <= map5_led;
                p1_collision <= map5_p1_collision;
                p2_collision <= map5_p2_collision;
                p1_land <= map5_p1_land;
                p2_land <= map5_p2_land;
                should_down <= map5_should_down;
                should_down2 <= map5_should_down2;
                button1_tounch <= map5_button1_tounch;
            end
            default: begin
                led <= led;
                p1_collision <= p1_collision;
                p2_collision <= p2_collision;
                p1_land <= p1_land;
                p2_land <= p2_land;
                should_down <= should_down;
                should_down2 <= should_down2;
                button1_tounch <= button1_tounch;
            end
            endcase
        end else begin
            led <= 16'b0000_0000_0000_1111;
            p1_collision <= 0;
            p2_collision <= 0;
            p1_land <= 0;
            p2_land <= 0;
            should_down <= 0;
            should_down2 <= 0;
            button1_tounch <= 0;
        end
    end

endmodule