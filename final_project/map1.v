module map1(
    input clk, 
    input rst, 
    //input wire [9:0] key_down, 
    //input en, 
    //input [2:0] level,
    //input [2:0] map,
    input wire [9:0] vga_h, 
    input wire [9:0] vga_v,  
    input [3:0] player_state, player2_state,
    input [1:0] player_jump, player2_jump,
    //input [9:0] player_horizontal_displacement,
    //input [9:0] player_vertical_displacement,
    output wire [16:0] addr, 
    //output reg clear,
    output reg [15:0] led,
    output wire p1_collision, p2_collision,
    output wire p1_land, p2_land,
    output wire should_down, should_down2,
    output wire button1_tounch
);
    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    wire collision_with_player1, collision_with_player2;
    //wire p1_collision;
    //reg [1:0] player_jump;
    //reg [3:0] player_state;
    reg [29:0] cnt_player_jump = 0;

    wire [9:0] h, v;
    assign h = vga_h >> 1;
    assign v = vga_v >> 1;

    wire dimond1_touch;
    wire p1_on_mech1;
    reg dimond1_flag = 1, botton1_flag = 1;
    reg [9:0] player_horizontal_displacement = 0, player_vertical_displacement = 0, player2_h_dis = 0, player2_v_dis = 0;
    reg [24:0] player_cnt_horizontal = 25'b0, player_cnt_vertical = 25'b0, player2_cnt_h = 25'b0, player2_cnt_v = 25'b0;
    reg [9:0] mech_1_v_displacement = 0;
    reg [24:0] mech_cnt_v = 25'b0;

    always @(posedge clk, posedge rst) begin
        if(rst) led <= 16'b0000_0000_0000_1111;
        else begin
            if(p1_on_mech1) led <= 16'b1111_1111_1111_1111;
            else if(p1_collision) led <= 16'b0000_1111_1111_1111;
            else led <= 16'b0000_0000_0000_1111;
        end
    end

    assign p1_on_mech1 = ((25+player_horizontal_displacement) < 50 && (230-player_vertical_displacement)==(139+mech_1_v_displacement));

    assign dimond1_touch = (dimond1_flag) ? (
        (22+player_horizontal_displacement == 197 && player_state == right && player_vertical_displacement >= 0 && player_vertical_displacement < 3) ? 1 : 0
    ) : (
        1
    );

    assign p1_collision = (player_jump == 1 && (199 - player_vertical_displacement) == 190 && (10 + player_horizontal_displacement) < 240) ||
    (player_state == right && (28+player_horizontal_displacement) >= 275 && (230-player_vertical_displacement) >= 220) ||     // wall 7
    (player_jump == 1 && (199-player_vertical_displacement) == 147 && (10+player_horizontal_displacement) >= 60) ||   // wall 2
    (button1_tounch && player_state == left && (10+player_horizontal_displacement) <= 40 && (230-player_vertical_displacement) <= 182 && (230-player_vertical_displacement) >= 165) ||//mech 1
    (!button1_tounch && player_jump == 1 && (10+player_horizontal_displacement)<40 && (199-player_vertical_displacement) ==147)
    ; 

    assign p2_collision = (player2_jump == 1 && (199 - player2_v_dis) == 190 && (10 + player2_h_dis) < 240) ||
    (player2_state == right && (28+player2_h_dis) >= 275 && (230-player2_v_dis) >= 220) ||     // wall 7
    (player2_jump == 1 && (199-player2_v_dis) == 147 && (10+player2_h_dis) >= 60) ||    // wall 2
    (button1_tounch && player2_state == left && (10+player2_h_dis) <= 40 && (230-player2_v_dis) <= 182 && (230-player2_v_dis) >= 165) ||//mech 1
    (!button1_tounch && player2_jump == 1 && (10+player2_h_dis)<40 && (199-player2_v_dis) ==147)
    ; 

    assign p1_land = (player_jump == 2 && (230-player_vertical_displacement) == 230 && (28+player_horizontal_displacement) < 276) ||  // floor
    (player_jump == 2 && (13 + player_horizontal_displacement) >= 274 && (28+player_horizontal_displacement) <= 320 && (230-player_vertical_displacement) == 210) ||  // wall 7
    (player_jump == 2 && (230 -player_vertical_displacement) == 182 && (8+player_horizontal_displacement) >= 8 && (25+player_horizontal_displacement) < 255) ||
    (button1_tounch && player_jump == 2 && (230-player_vertical_displacement) == 161 && (8+player_horizontal_displacement) <= 40);

    assign p2_land = (player2_jump == 2 && (230-player2_v_dis) == 230 && (28+player2_h_dis) < 276) ||  // floor
    (player2_jump == 2 && (13 + player2_h_dis) >= 274 && (28+player2_h_dis) <= 320 && (230-player2_v_dis) == 210) ||  // wall 7
    (player2_jump == 2 && (230 -player2_v_dis) == 182 && (8+player2_h_dis) >= 8 && (25+player2_h_dis) < 255) ||
    (button1_tounch && player2_jump == 2 && (230-player2_v_dis) == 161 && (8+player2_h_dis) <= 40);

    assign should_down = (player_state == left && (22+player_horizontal_displacement) <= 277 && (230-player_vertical_displacement)>= 210 && (230-player_vertical_displacement) < 212) ||
    (player_state == right && (8+player_horizontal_displacement) >= 230 && (230-player_vertical_displacement) >= 182 && (230-player_vertical_displacement) < 184) ||
    (player_state == right && (8+player_horizontal_displacement) >= 50 && (230-player_vertical_displacement) >= 171 && (230-player_vertical_displacement) < 173) ||     //mech 1
    (player_state == right && (8+player_horizontal_displacement) >= 40 &&  (230-player_vertical_displacement) >= 159 && (230-player_vertical_displacement) < 161);

    assign should_down2 = (player2_state == left && (22+player2_h_dis) <= 277 && (230-player2_v_dis)>= 210 && (230-player2_v_dis) < 212) ||
    (player2_state == right && (8+player2_h_dis) >= 230 && (230-player2_v_dis) >= 182 && (230-player2_v_dis) < 184) ||
    (player2_state == right && (8+player2_h_dis) >= 50 && (230-player2_v_dis) >= 171 && (230-player2_v_dis) < 173) ||   //mech 1
    (player2_state == right && (8+player2_h_dis) >= 40 &&  (230-player2_v_dis) >= 159 && (230-player2_v_dis) < 161)
    ;

    assign button1_tounch = (botton1_flag) ? (
        (((22+player_horizontal_displacement) >=100 && (8+player_horizontal_displacement) < 105 && (230-player_vertical_displacement) <= 182 && (230-player_vertical_displacement) > 180) ||
    ((30+player2_h_dis) >= 100 && (10+player2_h_dis) < 105 && (230-player2_v_dis) <= 182 && (230-player2_v_dis) > 180)) ? 1 : 0
    ) : (
        1
    ) ;


    assign addr = (h>=0 && h <320 && v>=0 && v < 10) ? (   // ceiling
        h+(v+220)*320
    ) : (
        (h >= 160 && h < 180 && v >= 230 && v < 236) ? (   //red river
            19521
        ) : (
            (h >= 220 && h < 240 && v >= 230 && v < 236) ? (  // blue river
                22470
            ) : (
                (h >= 190 && h < 230 && v >= 182 && v < 188) ? (  // green river
                    (h-190+165) + (v-182+1)*320
                ) : (
                    (h >=0 && h < 320 && v >= 230 && v < 240) ? (   // floor
                        h + (v-230+220)*320
                    ) : (
                        (h >=0 && h<10 && v>=10 && v<230) ? (    // left boundary
                            (h+305) + v*320
                        ) : (
                            (h>=310 && h<320 && v>=10 && v<230) ? (  // right boundary
                                (h-310+305) + v*320
                            ) : (
                                (h>=10 && h<240 && v >=182 && v<190) ? (    // wall 1
                                    (h-10+50) + (v-182+215)*320
                                ) : (
                                    (h>=70 && h<310 && v>=139 && v<147) ? (   // wall 2
                                        (h-70) + (v-139+220)*320
                                    ) : (
                                        (h>=60 && h < 270 && v >= 96 && v<104) ? (  // wall 3
                                            (h-60) + (v-96+220)*320
                                        ) : (
                                            (h>=160 && h<210 && v>=89 && v<96) ? (  // wall 4
                                                (h-160)+(v-89+220)*320
                                            ) : (
                                                (h>=110 && h<310 && v>=48 && v<56) ? (  // wall 6
                                                    (h-110) + (v-48+220)*320
                                                ) : (
                                                    (h>=250 && h<273 && v>=19 && v<48) ? (   // red door
                                                        (h-250) + (v-19+89)*320
                                                    ) : (
                                                        (h>=280 && h<301 && v>=19 && v<48) ? (  // blue door
                                                            (h-280+32) + (v-19+89)*320
                                                        ) : (
                                                            (h >= 275 && h < 310 && v >= 210 && v < 230) ? (  // wall 7
                                                                (h-290) + (v-215+218)*320
                                                            ) : (
                                                                (h>=194 && h <206 && v>=203 && v<220) ? (       // reg dimond 1
                                                                    dimond1_touch ? 12900 : (((h-99)+(v-66)*320))
                                                                ) : (
                                                                    (h>=100 && h<106 && v>=176 && v<182) ? (     //button 1
                                                                        (button1_tounch) ? (
                                                                            60800
                                                                        ) : (
                                                                            540
                                                                        )
                                                                    ) : (
                                                                        (h>=10 && h<40 && v>=(139+mech_1_v_displacement) && v<(147+mech_1_v_displacement)) ? (
                                                                            48220
                                                                        ) : (
                                                                            (player_state == right) ? (
                                                                                ((h >= (8+player_horizontal_displacement)) && (h < (22+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v < (230-player_vertical_displacement))) ? (
                                                                                    (h+63-player_horizontal_displacement) + (v+player_vertical_displacement-200) * 320
                                                                                ) : (
                                                                                    (player2_state == stactic) ? (
                                                                                        (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                            (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                        ) : (
                                                                                            12900
                                                                                        )
                                                                                    ) : (
                                                                                        (player2_state == left) ? (
                                                                                            (h>=(10+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                (h+151-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                            ) : (
                                                                                                12900
                                                                                            )
                                                                                        ) : (
                                                                                            (player2_state == right) ? (
                                                                                                (h>=(1+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                    (h+175-player2_h_dis) + (v+player2_v_dis-142) * 320
                                                                                                ) : (
                                                                                                    12900
                                                                                                )
                                                                                            ) : (
                                                                                                (player2_state == up) ? (
                                                                                                    (player2_jump == 1) ? (
                                                                                                        (h>=(9+player2_h_dis) && h<(25+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                            (h+175-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                                        ) : (
                                                                                                            12900
                                                                                                        )
                                                                                                    ) : (
                                                                                                        (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                            (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                                        ) : (
                                                                                                            12900
                                                                                                        )                                                                                                  
                                                                                                    )
                                                                                                ) : (
                                                                                                    12900
                                                                                                )
                                                                                            )
                                                                                        )
                                                                                    )
                                                                                )
                                                                            ) : (
                                                                                (player_state == stactic) ? (
                                                                                    ((h >= (13+player_horizontal_displacement)) && (h < (28+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v < (230-player_vertical_displacement))) ? (
                                                                                        (h+40-player_horizontal_displacement) + (v+player_vertical_displacement-200) * 320
                                                                                    ) : (
                                                                                        (player2_state == stactic) ? (
                                                                                            (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                            ) : (
                                                                                                12900
                                                                                            )
                                                                                        ) : (
                                                                                            (player2_state == left) ? (
                                                                                                (h>=(10+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                    (h+151-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                                ) : (
                                                                                                    12900
                                                                                                )
                                                                                            ) : (
                                                                                                (player2_state == right) ? (
                                                                                                    (h>=(1+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                        (h+175-player2_h_dis) + (v+player2_v_dis-142) * 320
                                                                                                    ) : (
                                                                                                        12900
                                                                                                    )
                                                                                                ) : (
                                                                                                    (player2_state == up) ? (
                                                                                                        (player2_jump == 1) ? (
                                                                                                            (h>=(9+player2_h_dis) && h<(25+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                                (h+175-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                                            ) : (
                                                                                                                12900
                                                                                                            )
                                                                                                        ) : (
                                                                                                            (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                                (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                                            ) : (
                                                                                                                12900
                                                                                                            )                                                                                                  
                                                                                                        )
                                                                                                    ) : (
                                                                                                        12900
                                                                                                    )
                                                                                                )
                                                                                            )
                                                                                        )
                                                                                    )
                                                                                ) : (
                                                                                    (player_state == left) ? (
                                                                                        ((h >= (8+player_horizontal_displacement)) && (h < (22+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v < (230-player_vertical_displacement))) ? (
                                                                                            (h+78-player_horizontal_displacement) + (v+player_vertical_displacement-200) * 320
                                                                                        ) : (
                                                                                            (player2_state == stactic) ? (
                                                                                                (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                    (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                                ) : (
                                                                                                    12900
                                                                                                )
                                                                                            ) : (
                                                                                                (player2_state == left) ? (
                                                                                                    (h>=(10+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                        (h+151-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                                    ) : (
                                                                                                        12900
                                                                                                    )
                                                                                                ) : (
                                                                                                    (player2_state == right) ? (
                                                                                                        (h>=(1+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                            (h+175-player2_h_dis) + (v+player2_v_dis-142) * 320
                                                                                                        ) : (
                                                                                                            12900
                                                                                                        )
                                                                                                    ) : (
                                                                                                        (player2_state == up) ? (
                                                                                                            (player2_jump == 1) ? (
                                                                                                                (h>=(9+player2_h_dis) && h<(25+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                                    (h+175-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                                                ) : (
                                                                                                                    12900
                                                                                                                )
                                                                                                            ) : (
                                                                                                                (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                                    (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                                                ) : (
                                                                                                                    12900
                                                                                                                )                                                                                                  
                                                                                                            )
                                                                                                        ) : (
                                                                                                            12900
                                                                                                        )
                                                                                                    )
                                                                                                )
                                                                                            )
                                                                                        )
                                                                                    ) : (
                                                                                        (player_state == up) ? (
                                                                                            (player_jump == 1) ? (
                                                                                                ((h >= (10+player_horizontal_displacement)) && (h < (25+player_horizontal_displacement)) && (v >= (199-player_vertical_displacement)) && (v < (227-player_vertical_displacement))) ? (
                                                                                                    (h+43-player_horizontal_displacement) + (v+player_vertical_displacement-169) * 320
                                                                                                ) : (   
                                                                                                    (player2_state == stactic) ? (
                                                                                                        (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                            (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                                        ) : (
                                                                                                            12900
                                                                                                        )
                                                                                                    ) : (
                                                                                                        (player2_state == left) ? (
                                                                                                            (h>=(10+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                                (h+151-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                                            ) : (
                                                                                                                12900
                                                                                                            )
                                                                                                        ) : (
                                                                                                            (player2_state == right) ? (
                                                                                                                (h>=(1+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                                    (h+175-player2_h_dis) + (v+player2_v_dis-142) * 320
                                                                                                                ) : (
                                                                                                                    12900
                                                                                                                )
                                                                                                            ) : (
                                                                                                                (player2_state == up) ? (
                                                                                                                    (player2_jump == 1) ? (
                                                                                                                        (h>=(9+player2_h_dis) && h<(25+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                                            (h+175-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                                                        ) : (
                                                                                                                            12900
                                                                                                                        )
                                                                                                                    ) : (
                                                                                                                        (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                                            (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                                                        ) : (
                                                                                                                            12900
                                                                                                                        )                                                                                                  
                                                                                                                    )
                                                                                                                ) : (
                                                                                                                    12900
                                                                                                                )
                                                                                                            )
                                                                                                        )
                                                                                                    )
                                                                                                )
                                                                                            ) : (
                                                                                                ((h >= (10+player_horizontal_displacement)) && (h < (25+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v < (230-player_vertical_displacement))) ? (
                                                                                                    (h+43-player_horizontal_displacement) + (v+player_vertical_displacement-200) * 320
                                                                                                ) : (   
                                                                                                    (player2_state == stactic) ? (
                                                                                                        (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                            (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                                        ) : (
                                                                                                            12900
                                                                                                        )
                                                                                                    ) : (
                                                                                                        (player2_state == left) ? (
                                                                                                            (h>=(10+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                                (h+151-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                                            ) : (
                                                                                                                12900
                                                                                                            )
                                                                                                        ) : (
                                                                                                            (player2_state == right) ? (
                                                                                                                (h>=(1+player2_h_dis) && h<(33+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                                    (h+175-player2_h_dis) + (v+player2_v_dis-142) * 320
                                                                                                                ) : (
                                                                                                                    12900
                                                                                                                )
                                                                                                            ) : (
                                                                                                                (player2_state == up) ? (
                                                                                                                    (player2_jump == 1) ? (
                                                                                                                        (h>=(9+player2_h_dis) && h<(25+player2_h_dis) && v>=(200-player2_v_dis) && v<(229-player2_v_dis)) ? (
                                                                                                                            (h+175-player2_h_dis) + (v+player2_v_dis-110) * 320
                                                                                                                        ) : (
                                                                                                                            12900
                                                                                                                        )
                                                                                                                    ) : (
                                                                                                                        (h>=(13+player2_h_dis) && h<(27+player2_h_dis) && v>=(200-player2_v_dis) && v<(230-player2_v_dis)) ? (
                                                                                                                            (h+148-player2_h_dis) + (v+player2_v_dis-141) * 320
                                                                                                                        ) : (
                                                                                                                            12900
                                                                                                                        )                                                                                                  
                                                                                                                    )
                                                                                                                ) : (
                                                                                                                    12900
                                                                                                                )
                                                                                                            )
                                                                                                        )
                                                                                                    )
                                                                                                )
                                                                                            )
                                                                                        ) : (
                                                                                            12900
                                                                                        )
                                                                                    )
                                                                                )
                                                                            )                                                                                  
                                                                        )
                                                                    )
                                                                )                                                         
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    );

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            dimond1_flag <= 1;
        end else begin
            if(dimond1_flag && dimond1_touch) dimond1_flag <= 0;
            else dimond1_flag <= dimond1_flag;
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            botton1_flag <= 1;
        end else begin
            if(botton1_flag && button1_tounch) botton1_flag <= 0;
            else botton1_flag <= botton1_flag;
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            mech_1_v_displacement <= 0;
            mech_cnt_v <= 0;
        end else begin
            if(button1_tounch) begin
                if(mech_cnt_v < 25'd2000000) begin
                    mech_cnt_v <= mech_cnt_v + 1;
                    mech_1_v_displacement <= mech_1_v_displacement;
                end
                else begin
                    if(mech_1_v_displacement < 22) mech_1_v_displacement <= mech_1_v_displacement + 1;
                    else mech_1_v_displacement <= mech_1_v_displacement;
                    mech_cnt_v <= 0;
                end
            end else begin
                    mech_1_v_displacement <= mech_1_v_displacement;
                    mech_cnt_v <= 0;         
            end
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            player_horizontal_displacement <= 0;
            player_vertical_displacement <= 0;
            player_cnt_horizontal <= 25'b0;
            player_cnt_vertical <= 25'b0;
        end else begin
            if(player_state == 4'd6) begin
                player_vertical_displacement <= player_vertical_displacement;
                player_horizontal_displacement <= player_horizontal_displacement;
                player_cnt_horizontal <= 0;
            end
            else if(player_state == 4'd9) begin
                if(player_jump == 0) begin
                    player_vertical_displacement <= player_vertical_displacement;
                    player_cnt_vertical <= 0;
                end
                else if(player_jump == 1) begin
                    if(player_cnt_vertical < 25'd2000000) begin
                        player_cnt_vertical <= player_cnt_vertical + 1;
                        player_vertical_displacement <= player_vertical_displacement; 
                    end
                    else begin
                        player_vertical_displacement <= player_vertical_displacement + 1;
                        player_cnt_vertical <= 0;
                    end
                end
                else if(player_jump == 2) begin
                    if(player_cnt_vertical < 25'd2000000) begin
                        player_cnt_vertical <= player_cnt_vertical + 1;
                        player_vertical_displacement <= player_vertical_displacement; 
                    end
                    else begin
                        if(player_vertical_displacement > 0) player_vertical_displacement <= player_vertical_displacement - 1;
                        else player_vertical_displacement <= player_vertical_displacement;
                        player_cnt_vertical <= 0;
                    end
                end
            end
            else if(player_state == 4'd7) begin
                if(player_cnt_horizontal < 25'd1500000) begin
                    player_cnt_horizontal <= player_cnt_horizontal + 1;
                    player_horizontal_displacement <= player_horizontal_displacement;
                end 
                else begin
                    if(player_horizontal_displacement <= 282 && !p1_collision) begin
                        player_horizontal_displacement <= player_horizontal_displacement + 1;
                        player_cnt_horizontal <= 0;
                    end else begin
                        player_horizontal_displacement <= player_horizontal_displacement;
                        player_cnt_horizontal <= 0;                   
                    end
                end
                if(player_jump == 0) begin
                    player_vertical_displacement <= player_vertical_displacement;
                    player_cnt_vertical <= 0;
                end
                else if(player_jump == 1) begin
                    if(player_cnt_vertical < 25'd2000000) begin
                        player_cnt_vertical <= player_cnt_vertical + 1;
                        player_vertical_displacement <= player_vertical_displacement; 
                    end
                    else begin
                        player_vertical_displacement <= player_vertical_displacement + 1;
                        player_cnt_vertical <= 0;
                    end
                end
                else if(player_jump == 2) begin
                    if(player_cnt_vertical < 25'd2000000) begin
                        player_cnt_vertical <= player_cnt_vertical + 1;
                        player_vertical_displacement <= player_vertical_displacement; 
                    end
                    else begin
                        if(player_vertical_displacement > 0) player_vertical_displacement <= player_vertical_displacement - 1;
                        else player_vertical_displacement <= player_vertical_displacement;
                        player_cnt_vertical <= 0;
                    end
                end
            end
            else if(player_state == 4'd8) begin
                if(player_cnt_horizontal < 25'd1500000) begin
                    player_cnt_horizontal <= player_cnt_horizontal + 1;
                    player_horizontal_displacement <= player_horizontal_displacement;
                end else begin
                    if(player_horizontal_displacement >= 1 && !p1_collision) begin
                        player_horizontal_displacement <= player_horizontal_displacement - 1;
                        player_cnt_horizontal <= 0;
                    end else begin
                        player_horizontal_displacement <= player_horizontal_displacement;
                        player_cnt_horizontal <= 0;                   
                    end         
                end
                if(player_jump == 0) begin
                    player_vertical_displacement <= player_vertical_displacement;
                    player_cnt_vertical <= 0;
                end
                else if(player_jump == 1) begin
                    if(player_cnt_vertical < 25'd2000000) begin
                        player_cnt_vertical <= player_cnt_vertical + 1;
                        player_vertical_displacement <= player_vertical_displacement; 
                    end
                    else begin
                        player_vertical_displacement <= player_vertical_displacement + 1;
                        player_cnt_vertical <= 0;
                    end
                end
                else if(player_jump == 2) begin
                    if(player_cnt_vertical < 25'd2000000) begin
                        player_cnt_vertical <= player_cnt_vertical + 1;
                        player_vertical_displacement <= player_vertical_displacement; 
                    end
                    else begin
                        if(player_vertical_displacement > 0) player_vertical_displacement <= player_vertical_displacement - 1;
                        else player_vertical_displacement <= player_vertical_displacement;
                        player_cnt_vertical <= 0;
                    end
                end
            end
            else begin
                player_horizontal_displacement <= player_horizontal_displacement;
                player_vertical_displacement <= player_vertical_displacement;
            end
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            player2_h_dis <= 0;
            player2_v_dis <= 0;
            player2_cnt_h <= 0;
            player2_cnt_v <= 0;
        end else begin
            if(player2_state == 4'd6) begin
                player2_h_dis <= player2_h_dis;
                player2_v_dis <= player2_v_dis;
                player2_cnt_h <= 0;
            end
            else if(player2_state == 4'd9) begin
                if(player2_jump == 0) begin
                    player2_v_dis <= player2_v_dis;
                    player2_cnt_v <= 0;
                end
                else if(player2_jump == 1) begin
                    if(player2_cnt_v < 25'd2000000) begin
                        player2_cnt_v <= player2_cnt_v + 1;
                        player2_v_dis <= player2_v_dis; 
                    end
                    else begin
                        player2_v_dis <= player2_v_dis + 1;
                        player2_cnt_v <= 0;
                    end
                end
                else if(player2_jump == 2) begin
                    if(player2_cnt_v < 25'd2000000) begin
                        player2_cnt_v <= player2_cnt_v + 1;
                        player2_v_dis <= player2_v_dis; 
                    end
                    else begin
                        if(player2_v_dis > 0) player2_v_dis <= player2_v_dis - 1;
                        else player2_v_dis <= player2_v_dis;
                        player2_cnt_v <= 0;
                    end
                end
            end
            else if(player2_state == 4'd7) begin
                if(player2_cnt_h < 25'd1500000) begin
                    player2_cnt_h <= player2_cnt_h + 1;
                    player2_h_dis <= player2_h_dis;
                end 
                else begin
                    if(player2_h_dis <= 282 && !p2_collision) begin
                        player2_h_dis <= player2_h_dis + 1;
                        player2_cnt_h <= 0;
                    end else begin
                        player2_h_dis <= player2_h_dis;
                        player2_cnt_h <= 0;                   
                    end
                end
                if(player2_jump == 0) begin
                    player2_v_dis <= player2_v_dis;
                    player2_cnt_v <= 0;
                end
                else if(player2_jump == 1) begin
                    if(player2_cnt_v < 25'd2000000) begin
                        player2_cnt_v <= player2_cnt_v + 1;
                        player2_v_dis <= player2_v_dis; 
                    end
                    else begin
                        player2_v_dis <= player2_v_dis + 1;
                        player2_cnt_v <= 0;
                    end
                end
                else if(player2_jump == 2) begin
                    if(player2_cnt_v < 25'd2000000) begin
                        player2_cnt_v <= player2_cnt_v + 1;
                        player2_v_dis <= player2_v_dis; 
                    end
                    else begin
                        if(player2_v_dis > 0) player2_v_dis <= player2_v_dis - 1;
                        else player2_v_dis <= player2_v_dis;
                        player2_cnt_v <= 0;
                    end
                end
            end
            else if(player2_state == 4'd8) begin
                if(player2_cnt_h < 25'd1500000) begin
                    player2_cnt_h <= player2_cnt_h + 1;
                    player2_h_dis <= player2_h_dis;
                end else begin
                    if(player2_h_dis >= 1) begin
                        player2_h_dis <= player2_h_dis - 1;
                        player2_cnt_h <= 0;
                    end else begin
                        player2_h_dis <= player2_h_dis;
                        player2_cnt_h <= 0;                   
                    end         
                end
                if(player2_jump == 0) begin
                    player2_v_dis <= player2_v_dis;
                    player2_cnt_v <= 0;
                end
                else if(player2_jump == 1) begin
                    if(player2_cnt_v < 25'd2000000) begin
                        player2_cnt_v <= player2_cnt_v + 1;
                        player2_v_dis <= player2_v_dis; 
                    end
                    else begin
                        player2_v_dis <= player2_v_dis + 1;
                        player2_cnt_v <= 0;
                    end
                end
                else if(player2_jump == 2) begin
                    if(player2_cnt_v < 25'd2000000) begin
                        player2_cnt_v <= player2_cnt_v + 1;
                        player2_v_dis <= player2_v_dis; 
                    end
                    else begin
                        if(player2_v_dis > 0) player2_v_dis <= player2_v_dis - 1;
                        else player2_v_dis <= player2_v_dis;
                        player2_cnt_v <= 0;
                    end
                end
            end
            else begin
                player2_h_dis <= player2_h_dis;
                player2_v_dis <= player2_v_dis;
            end
        end
    end

endmodule