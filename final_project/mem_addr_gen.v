module mem_addr_gen(
    input clk,
    input origine_clk,
    input rst,
    input [1:0] player1_jump,
    input [1:0] player2_jump,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [2:0] state,
    input [3:0] player1_state,
    input [3:0] player2_state,
    input [2:0] select_level,
    output [16:0] pixel_addr,
    output wire player1_collide,
    output wire player1_land,
    output wire player2_collide,
    output wire player2_land,
    output reg [15:0] led
);
    
    reg [7:0] position;
    reg [8:0] player1_horizontal_displacement = 9'b0, player1_vertical_displacement = 9'b0;
    reg [24:0] player1_cnt_horizontal = 25'b0, player1_cnt_vertical = 25'b0;
    reg [8:0] player2_horizontal_displacement = 9'b0, player2_vertical_displacement = 9'b0;
    reg [24:0] player2_cnt_horizontal = 25'b0, player2_cnt_vertical = 25'b0;
    reg [8:0] player2_BaseHeight = 9'd41;

    reg [8:0] floor_height [0:1] = {
        9'd230, 9'd190
    };
    reg [8:0] floor_left_boundary [0:1] = {
        9'd10, 9'd10
    };
    reg [8:0] floor_right_boundary [0:1] = {
        9'd310, 9'd115
    };
    reg [8:0] ceiling_height [0:1] = {
        9'd198, 9'd198
    };
    reg [8:0] ceiling_left_boundary [0:1] = {
        9'd10, 9'd10
    };
    reg [8:0] ceiling_right_boundary [0:1] = {
        9'd115, 9'd115
    };

    parameter menu_state = 3'b000, level_1_state = 3'd1, level_2_state = 3'd2, level_3_state = 3'd3, level_4_state = 3'd4, level_5_state = 3'd5;
    parameter stactic = 4'd6, right = 4'd7, left = 4'd2, up = 4'd8;


    assign pixel_addr = (state == menu_state && select_level == level_1_state) ? (
        ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 40 && (v_cnt>>1) <= 65) ? (
            ((h_cnt >> 1)-150 + ((v_cnt >> 1)-39)*320)
        ) : (
            ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 80 && (v_cnt>>1) <= 105) ? (
                ((h_cnt >> 1)-150 + ((v_cnt >> 1)-79)*320)
            ): (
                ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 120 && (v_cnt>>1) <= 145) ? (
                    ((h_cnt >> 1)-150 + ((v_cnt >> 1)-119)*320)
                ) : (
                    ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 160 && (v_cnt>>1) <= 185) ? (
                        ((h_cnt >> 1)-150 + ((v_cnt >> 1)-159)*320)
                    ) : (
                        ((h_cnt>>1) >= 148 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 200 && (v_cnt>>1) <= 225) ? (
                            ((h_cnt >> 1)-127 + ((v_cnt >> 1)-199)*320)
                        ) : (
                            0
                        )
                    )
                )
            )
        )
    ) : (
        (state == menu_state && select_level == level_2_state) ? (
            ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 40 && (v_cnt>>1) <= 65) ? (
                ((h_cnt >> 1)-150 + ((v_cnt >> 1)-39)*320)
            ) : (
                ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 80 && (v_cnt>>1) <= 105) ? (
                    ((h_cnt >> 1)-150 + ((v_cnt >> 1)-79)*320)
                ) : (
                    ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 120 && (v_cnt>>1) <= 145) ? (
                        ((h_cnt >> 1)-150 + ((v_cnt >> 1)-119)*320)
                    ) : (
                        ((h_cnt>>1) >= 148 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 160 && (v_cnt>>1) <= 185) ? (
                            ((h_cnt >> 1)-127 + ((v_cnt >> 1)-159)*320)
                        ) : (
                            ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 200 && (v_cnt>>1) <= 225) ? (
                                ((h_cnt >> 1)-150 + ((v_cnt >> 1)-199)*320)
                            ) : (
                                0
                            )
                        )
                    )
                )
            )
        ) : (
            (state == menu_state && select_level == level_3_state) ? (
                ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 40 && (v_cnt>>1) <= 65) ? (
                    ((h_cnt >> 1)-150 + ((v_cnt >> 1)-39)*320)
                ) : (
                    ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 80 && (v_cnt>>1) <= 105) ? (
                        ((h_cnt >> 1)-150 + ((v_cnt >> 1)-79)*320)
                    ) : (
                        ((h_cnt>>1) >= 148 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 120 && (v_cnt>>1) <= 145) ? (
                            ((h_cnt >> 1)-127 + ((v_cnt >> 1)-119)*320)
                        ) : (
                            ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 160 && (v_cnt>>1) <= 185) ? (
                                ((h_cnt >> 1)-150 + ((v_cnt >> 1)-159)*320)
                            ) : (
                                ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 200 && (v_cnt>>1) <= 225) ? (
                                    ((h_cnt >> 1)-150 + ((v_cnt >> 1)-199)*320)
                                ) : (
                                    0
                                )
                            )
                        )
                    )
                )
            ) : (
                (state == menu_state && select_level == level_4_state) ? (
                    ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 40 && (v_cnt>>1) <= 65) ? (
                        ((h_cnt >> 1)-150 + ((v_cnt >> 1)-39)*320)
                    ) : (
                        ((h_cnt>>1) >= 148 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 80 && (v_cnt>>1) <= 105) ? (
                            ((h_cnt >> 1)-127 + ((v_cnt >> 1)-79)*320)
                        ) : (
                            ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 120 && (v_cnt>>1) <= 145) ? (
                                ((h_cnt >> 1)-150 + ((v_cnt >> 1)-119)*320)
                            ) : (
                                ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 160 && (v_cnt>>1) <= 185) ? (
                                    ((h_cnt >> 1)-150 + ((v_cnt >> 1)-159)*320)
                                ) : (
                                    ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 200 && (v_cnt>>1) <= 225) ? (
                                        ((h_cnt >> 1)-150 + ((v_cnt >> 1)-199)*320)
                                    ) : (
                                        0
                                    )
                                )
                            )
                        )
                    )
                ) : (
                    (state == menu_state && select_level == level_5_state) ? (
                        ((h_cnt>>1) >= 148 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 40 && (v_cnt>>1) <= 65) ? (
                            ((h_cnt >> 1)-127 + ((v_cnt >> 1)-39)*320)
                        ) : (
                            ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 80 && (v_cnt>>1) <= 105) ? (
                                ((h_cnt >> 1)-150 + ((v_cnt >> 1)-79)*320)
                            ) : (
                                ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 120 && (v_cnt>>1) <= 145) ? (
                                    ((h_cnt >> 1)-150 + ((v_cnt >> 1)-119)*320)
                                ) : (
                                    ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 160 && (v_cnt>>1) <= 185) ? (
                                        ((h_cnt >> 1)-150 + ((v_cnt >> 1)-159)*320)
                                    ) : (
                                        ((h_cnt>>1) >= 150 && (h_cnt>>1) <= 170 && (v_cnt>>1) >= 200 && (v_cnt>>1) <= 225) ? (
                                            ((h_cnt >> 1)-150 + ((v_cnt >> 1)-199)*320)
                                        ) : (
                                            0
                                        )
                                    )
                                )
                            )
                        )
                    ) : (
                        (state == level_1_state) ? (
                            (((h_cnt >> 1) >= 0) && ((h_cnt >> 1) <= 320) && ((v_cnt>>1) >= 0) && ((v_cnt>>1) <= 10)) ? (  // up boundary
                                (h_cnt >> 1) + ((v_cnt >> 1) +220)*320
                            ) : (
                                (((h_cnt >> 1) >= 150) && ((h_cnt >> 1) <= 190) && ((v_cnt>>1) >= 230) && ((v_cnt>>1) <= 236)) ? (  // red river
                                    19521
                                ) : (
                                    (((h_cnt >> 1) >= 210) && ((h_cnt >> 1) <= 250) && ((v_cnt>>1) >= 230) && ((v_cnt>>1) <= 236)) ? (  //blue river
                                        22470
                                    ) : (
                                        (((h_cnt >> 1) >= 0) && ((h_cnt >> 1) <= 320) && ((v_cnt>>1) >= 230) && ((v_cnt>>1) <= 240)) ? (  //down boundary
                                            (h_cnt >> 1) + ((v_cnt >> 1) - 10)*320
                                        ) : (
                                            (((h_cnt >> 1) >= 0) && ((h_cnt >> 1) <= 10) && ((v_cnt>>1) >= 10) && ((v_cnt>>1) <= 230)) ? (  //left boundary
                                                ((h_cnt >> 1) + 305) + ((v_cnt >> 1))*320
                                            ) : (
                                                (((h_cnt >> 1) >= 310) && ((h_cnt >> 1) <= 320) && ((v_cnt>>1) >= 10) && ((v_cnt>>1) <= 230)) ? (  //right boundary
                                                    ((h_cnt >> 1) - 5) + ((v_cnt >> 1))*320
                                                ) : (
                                                    (((h_cnt >> 1) >= 10) && ((h_cnt >> 1) <= 115) && ((v_cnt>>1) >= 190) && ((v_cnt>>1) <= 198)) ?(
                                                        (h_cnt >> 1) + 40 + ((v_cnt >> 1) +25)*320
                                                    ) : (
                                                        (player1_state == stactic) ? (
                                                            (((h_cnt >> 1) >= (13+player1_horizontal_displacement)) && ((h_cnt >> 1) <= (28+player1_horizontal_displacement)) && ((v_cnt>>1) >= (200-player1_vertical_displacement)) && ((v_cnt>>1) <= (230-player1_vertical_displacement))) ? (
                                                                ((h_cnt >> 1)+40-player1_horizontal_displacement) + ((v_cnt >> 1)+player1_vertical_displacement-200)*320
                                                            ) : (
                                                                (player2_state == stactic) ? (
                                                                    (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (200-player2_BaseHeight-player2_vertical_displacement)) && ((v_cnt>>1) <= (230-player2_BaseHeight-player2_vertical_displacement))) ? (
                                                                        ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
                                                                    ) : (
                                                                        12900
                                                                    )
                                                                ) : (
                                                                    (player2_state == right) ? (
                                                                        (((h_cnt >> 1) >= (1+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (200-player2_BaseHeight-player2_vertical_displacement)) && ((v_cnt>>1) <= (230-player2_BaseHeight-player2_vertical_displacement))) ? (
                                                                            ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-101)*320
                                                                        ) : (
                                                                            12900
                                                                        )
                                                                    ) : (
                                                                        (player2_state == left) ? (
                                                                            (((h_cnt >> 1) >= (10+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (200-player2_BaseHeight-player2_vertical_displacement)) && ((v_cnt>>1) <= (229-player2_BaseHeight-player2_vertical_displacement))) ? (
                                                                                ((h_cnt >> 1)+151-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                            ) : (
                                                                                12900
                                                                            )
                                                                        ) : (
                                                                            (player2_state == up) ? (
                                                                                (player2_jump == 1) ? (
                                                                                    (((h_cnt >> 1) >= (9+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (25+player2_horizontal_displacement)) && ((v_cnt>>1) >= (200-player2_BaseHeight-player2_vertical_displacement)) && ((v_cnt>>1) <= (229-player2_BaseHeight-player2_vertical_displacement))) ? (
                                                                                        ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                                    ) : (
                                                                                        12900
                                                                                    )
                                                                                ) : (
                                                                                    (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (200-player2_BaseHeight-player2_vertical_displacement)) && ((v_cnt>>1) <= (230-player2_BaseHeight-player2_vertical_displacement))) ? (
                                                                                        ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
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
                                                            (player1_state == right) ? (
                                                                (((h_cnt >> 1) >= (8+player1_horizontal_displacement)) && ((h_cnt >> 1) <= (22+player1_horizontal_displacement)) && ((v_cnt>>1) >= (200-player1_vertical_displacement)) && ((v_cnt>>1) <= (230-player1_vertical_displacement))) ? (
                                                                    ((h_cnt >> 1) + 63 - player1_horizontal_displacement) + ((v_cnt >> 1)+ player1_vertical_displacement -200 ) * 320
                                                                ) : (
                                                                    (player2_state == stactic) ? (
                                                                        (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                            ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
                                                                        ) : (
                                                                            12900
                                                                        )
                                                                    ) : (
                                                                        (player2_state == right) ? (
                                                                            (((h_cnt >> 1) >= (1+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-101)*320
                                                                            ) : (
                                                                                12900
                                                                            )
                                                                        ) : (
                                                                            (player2_state == left) ? (
                                                                                (((h_cnt >> 1) >= (10+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (188-player2_vertical_displacement))) ? (
                                                                                    ((h_cnt >> 1)+151-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                                ) : (
                                                                                    12900
                                                                                )
                                                                            ) : (
                                                                                (player2_state == up) ? (
                                                                                    (player2_jump == 1) ? (
                                                                                        (((h_cnt >> 1) >= (9+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (25+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (188-player2_vertical_displacement))) ? (
                                                                                            ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                                        ) : (
                                                                                            12900
                                                                                        )
                                                                                    ) : (
                                                                                        (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                            ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
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
                                                                (player1_state == left) ? (
                                                                    (((h_cnt >> 1) >= (8+player1_horizontal_displacement)) && ((h_cnt >> 1) <= (22+player1_horizontal_displacement)) && ((v_cnt>>1) >= (200-player1_vertical_displacement)) && ((v_cnt>>1) <= (230-player1_vertical_displacement))) ? (
                                                                        ((h_cnt >> 1) + 78 - player1_horizontal_displacement) + ((v_cnt >> 1)+ player1_vertical_displacement -200) * 320
                                                                    ) : (
                                                                        (player2_state == stactic) ? (
                                                                            (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
                                                                            ) : (
                                                                                12900
                                                                            )
                                                                        ) : (
                                                                            (player2_state == right) ? (
                                                                                (((h_cnt >> 1) >= (1+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                    ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-101)*320
                                                                                ) : (
                                                                                    12900
                                                                                )
                                                                            ) : (
                                                                                (player2_state == left) ? (
                                                                                    (((h_cnt >> 1) >= (10+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (188-player2_vertical_displacement))) ? (
                                                                                        ((h_cnt >> 1)+151-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                                    ) : (
                                                                                        12900
                                                                                    )
                                                                                ) : (
                                                                                    (player2_state == up) ? (
                                                                                        (player2_jump == 1) ? (
                                                                                            (((h_cnt >> 1) >= (9+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (25+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (188-player2_vertical_displacement))) ? (
                                                                                                ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                                            ) : (
                                                                                                12900
                                                                                            )
                                                                                        ) : (
                                                                                            (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                                ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
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
                                                                    (player1_state == up) ? (
                                                                        (player1_jump == 1) ? (
                                                                            (((h_cnt >> 1) >= (10+player1_horizontal_displacement)) && ((h_cnt >> 1) <= (25+player1_horizontal_displacement)) && ((v_cnt>>1) >= (199-player1_vertical_displacement)) && ((v_cnt>>1) <= (227-player1_vertical_displacement))) ? (
                                                                                ((h_cnt >> 1) + 43 - player1_horizontal_displacement) + ((v_cnt >> 1)+ player1_vertical_displacement -169) * 320
                                                                            ) : (
                                                                                (player2_state == stactic) ? (
                                                                                    (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                        ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
                                                                                    ) : (
                                                                                        12900
                                                                                    )
                                                                                ) : (
                                                                                    (player2_state == right) ? (
                                                                                        (((h_cnt >> 1) >= (1+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                            ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-101)*320
                                                                                        ) : (
                                                                                            12900
                                                                                        )
                                                                                    ) : (
                                                                                        (player2_state == left) ? (
                                                                                            (((h_cnt >> 1) >= (10+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (188-player2_vertical_displacement))) ? (
                                                                                                ((h_cnt >> 1)+151-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                                            ) : (
                                                                                                12900
                                                                                            )
                                                                                        ) : (
                                                                                            (player2_state == up) ? (
                                                                                                (player2_jump == 1) ? (
                                                                                                    (((h_cnt >> 1) >= (9+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (25+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (188-player2_vertical_displacement))) ? (
                                                                                                        ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                                                    ) : (
                                                                                                        12900
                                                                                                    )
                                                                                                ) : (
                                                                                                    (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                                        ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
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
                                                                            (((h_cnt >> 1) >= (10+player1_horizontal_displacement)) && ((h_cnt >> 1) <= (25+player1_horizontal_displacement)) && ((v_cnt>>1) >= (200-player1_vertical_displacement)) && ((v_cnt>>1) <= (230-player1_vertical_displacement))) ? (
                                                                                ((h_cnt >> 1)+43-player1_horizontal_displacement) + ((v_cnt >> 1)+player1_vertical_displacement-200)*320
                                                                            ) : (
                                                                                (player2_state == stactic) ? (
                                                                                    (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                        ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
                                                                                    ) : (
                                                                                        12900
                                                                                    )
                                                                                ) : (
                                                                                    (player2_state == right) ? (
                                                                                        (((h_cnt >> 1) >= (1+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                            ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-101)*320
                                                                                        ) : (
                                                                                            12900
                                                                                        )
                                                                                    ) : (
                                                                                        (player2_state == left) ? (
                                                                                            (((h_cnt >> 1) >= (10+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (33+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (188-player2_vertical_displacement))) ? (
                                                                                                ((h_cnt >> 1)+151-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                                            ) : (
                                                                                                12900
                                                                                            )
                                                                                        ) : (
                                                                                            (player2_state == up) ? (
                                                                                                (player2_jump == 1) ? (
                                                                                                    (((h_cnt >> 1) >= (9+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (25+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (188-player2_vertical_displacement))) ? (
                                                                                                        ((h_cnt >> 1)+175-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-69)*320
                                                                                                    ) : (
                                                                                                        12900
                                                                                                    )
                                                                                                ) : (
                                                                                                    (((h_cnt >> 1) >= (13+player2_horizontal_displacement)) && ((h_cnt >> 1) <= (27+player2_horizontal_displacement)) && ((v_cnt>>1) >= (159-player2_vertical_displacement)) && ((v_cnt>>1) <= (189-player2_vertical_displacement))) ? (
                                                                                                        ((h_cnt >> 1)+148-player2_horizontal_displacement) + ((v_cnt >> 1)+player2_vertical_displacement-100)*320
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
                        ) : (
                            0
                        )
                    )
                )
            )
        )
    );

    assign player1_collide = (player1_jump == 1) ? (
        (((h_cnt >> 1) >= (10+player1_horizontal_displacement)) && ((h_cnt >> 1) <= (25+player1_horizontal_displacement)) && ((v_cnt>>1) >= (199-player1_vertical_displacement)) && ((v_cnt>>1) <= (227-player1_vertical_displacement))) ? (
            (((199-player1_vertical_displacement) <= ceiling_height[0]) && ((10+player1_horizontal_displacement) >= ceiling_left_boundary[0]) && ((10+player1_horizontal_displacement) <= ceiling_right_boundary[0])) ? (
                1
            ) : (
                0
            )
        ) : (
            0
        )
    ) : (
        0
    );

    //player1
    always @(posedge origine_clk, posedge rst) begin
        if(rst) begin
            player1_horizontal_displacement <= 0;
            player1_vertical_displacement <= 0;
            player1_cnt_horizontal <= 0;
            player1_cnt_vertical <= 0;
        end else begin
            if(player1_state == stactic) begin
                player1_horizontal_displacement <= player1_horizontal_displacement;
                player1_vertical_displacement <= player1_vertical_displacement;
                player1_cnt_horizontal <= 0;
            end
            else if(player1_state == up) begin
                if(player1_jump != 0) begin
                    if(player1_jump == 1) begin
                        if(player1_cnt_vertical < 25'd2500000) begin
                            player1_cnt_vertical <= player1_cnt_vertical + 1;
                            player1_vertical_displacement <= player1_vertical_displacement;                 
                        end else begin
                            player1_vertical_displacement <= player1_vertical_displacement + 1;
                            player1_cnt_vertical <= 0;
                        end
                    end else begin
                        if(player1_cnt_vertical < 25'd2500000) begin
                            player1_cnt_vertical <= player1_cnt_vertical + 1;
                            player1_vertical_displacement <= player1_vertical_displacement;                 
                        end else begin
                            if(player1_vertical_displacement > 0) player1_vertical_displacement <= player1_vertical_displacement - 1;
                            else player1_vertical_displacement <= player1_vertical_displacement;
                            player1_cnt_vertical <= 0;
                        end
                    end
                end
                else begin
                    player1_vertical_displacement <= player1_vertical_displacement;
                    player1_cnt_vertical <= 0;
                end
            end
            else if(player1_state == right) begin
                if(player1_cnt_horizontal < 25'd1666666) begin
                    player1_cnt_horizontal <= player1_cnt_horizontal + 1;
                    player1_horizontal_displacement <= player1_horizontal_displacement;
                end else begin
                    if(player1_horizontal_displacement <= 282) begin
                        player1_horizontal_displacement <= player1_horizontal_displacement + 1;
                        player1_cnt_horizontal <= 0;
                    end else begin
                        player1_horizontal_displacement <= player1_horizontal_displacement;
                        player1_cnt_horizontal <= 0;                   
                    end
                end
                if(player1_jump != 0) begin
                    if(player1_jump == 1) begin
                        if(player1_cnt_vertical < 25'd2500000) begin
                            player1_cnt_vertical <= player1_cnt_vertical + 1;
                            player1_vertical_displacement <= player1_vertical_displacement;                 
                        end else begin
                            player1_vertical_displacement <= player1_vertical_displacement + 1;
                            player1_cnt_vertical <= 0;
                        end
                    end else begin
                        if(player1_cnt_vertical < 25'd2500000) begin
                            player1_cnt_vertical <= player1_cnt_vertical + 1;
                            player1_vertical_displacement <= player1_vertical_displacement;                 
                        end else begin
                            if(player1_vertical_displacement > 0) player1_vertical_displacement <= player1_vertical_displacement - 1;
                            else player1_vertical_displacement <= player1_vertical_displacement;
                            player1_cnt_vertical <= 0;
                        end
                    end
                end
                else begin
                    player1_vertical_displacement <= player1_vertical_displacement;
                    player1_cnt_vertical <= 0;
                end
            end
            else if(player1_state == left) begin
                if(player1_cnt_horizontal < 25'd1666666) begin
                    player1_cnt_horizontal <= player1_cnt_horizontal + 1;
                    player1_horizontal_displacement <= player1_horizontal_displacement;
                end else begin
                    if(player1_horizontal_displacement >= 10) begin
                        player1_horizontal_displacement <= player1_horizontal_displacement - 1;
                        player1_cnt_horizontal <= 0;
                    end else begin
                        player1_horizontal_displacement <= player1_horizontal_displacement;
                        player1_cnt_horizontal <= 0;                   
                    end         
                end
                if(player1_jump != 0) begin
                    if(player1_jump == 1) begin
                        if(player1_cnt_vertical < 25'd2500000) begin
                            player1_cnt_vertical <= player1_cnt_vertical + 1;
                            player1_vertical_displacement <= player1_vertical_displacement;                 
                        end else begin
                            player1_vertical_displacement <= player1_vertical_displacement + 1;
                            player1_cnt_vertical <= 0;
                        end
                    end else begin
                        if(player1_cnt_vertical < 25'd2500000) begin
                            player1_cnt_vertical <= player1_cnt_vertical + 1;
                            player1_vertical_displacement <= player1_vertical_displacement;                 
                        end else begin
                            if(player1_vertical_displacement > 0) player1_vertical_displacement <= player1_vertical_displacement - 1;
                            else player1_vertical_displacement <= player1_vertical_displacement;
                            player1_cnt_vertical <= 0;
                        end
                    end
                end
                else begin
                    player1_vertical_displacement <= player1_vertical_displacement;
                    player1_cnt_vertical <= 0;
                end
            end
            else begin
                    player1_horizontal_displacement <= player1_horizontal_displacement;
                    player1_vertical_displacement <= player1_vertical_displacement;
            end
        end
    end

    //player2
    always @(posedge origine_clk, posedge rst) begin
        if(rst) begin
            player2_horizontal_displacement <= 0;
            player2_vertical_displacement <= 0;
            player2_cnt_horizontal <= 0;
            player2_cnt_vertical <= 0;
        end else begin
            if(player2_state == stactic) begin
                player2_horizontal_displacement <= player2_horizontal_displacement;
                player2_vertical_displacement <= player2_vertical_displacement;
                player2_cnt_horizontal <= 0;
            end
            else if(player2_state == up) begin
                if(player2_jump != 0) begin
                    if(player2_jump == 1) begin
                        if(player2_cnt_vertical < 25'd2500000) begin
                            player2_cnt_vertical <= player2_cnt_vertical + 1;
                            player2_vertical_displacement <= player2_vertical_displacement;                 
                        end else begin
                            player2_vertical_displacement <= player2_vertical_displacement + 1;
                            player2_cnt_vertical <= 0;
                        end
                    end else begin
                        if(player2_cnt_vertical < 25'd2500000) begin
                            player2_cnt_vertical <= player2_cnt_vertical + 1;
                            player2_vertical_displacement <= player2_vertical_displacement;                 
                        end else begin
                            if(player2_vertical_displacement > 0) player2_vertical_displacement <= player2_vertical_displacement - 1;
                            else player2_vertical_displacement <= player2_vertical_displacement;
                            player2_cnt_vertical <= 0;
                        end
                    end
                end
                else begin
                    player2_vertical_displacement <= player2_vertical_displacement;
                    player2_cnt_vertical <= 0;
                end
            end
            else if(player2_state == right) begin
                if(player2_cnt_horizontal < 25'd1666666) begin
                    player2_cnt_horizontal <= player2_cnt_horizontal + 1;
                    player2_horizontal_displacement <= player2_horizontal_displacement;
                end else begin
                    if(player2_horizontal_displacement <= 282) begin
                        player2_horizontal_displacement <= player2_horizontal_displacement + 1;
                        player2_cnt_horizontal <= 0;
                    end else begin
                        player2_horizontal_displacement <= player2_horizontal_displacement;
                        player2_cnt_horizontal <= 0;                   
                    end
                end
                if(player2_jump != 0) begin
                    if(player2_jump == 1) begin
                        if(player2_cnt_vertical < 25'd2500000) begin
                            player2_cnt_vertical <= player2_cnt_vertical + 1;
                            player2_vertical_displacement <= player2_vertical_displacement;                 
                        end else begin
                            player2_vertical_displacement <= player2_vertical_displacement + 1;
                            player2_cnt_vertical <= 0;
                        end
                    end else begin
                        if(player2_cnt_vertical < 25'd2500000) begin
                            player2_cnt_vertical <= player2_cnt_vertical + 1;
                            player2_vertical_displacement <= player2_vertical_displacement;                 
                        end else begin
                            if(player2_vertical_displacement > 0) player2_vertical_displacement <= player2_vertical_displacement - 1;
                            else player2_vertical_displacement <= player2_vertical_displacement;
                            player2_cnt_vertical <= 0;
                        end
                    end
                end
                else begin
                    player2_vertical_displacement <= player2_vertical_displacement;
                    player2_cnt_vertical <= 0;
                end
            end
            else if(player2_state == left) begin
                if(player2_cnt_horizontal < 25'd1666666) begin
                    player2_cnt_horizontal <= player2_cnt_horizontal + 1;
                    player2_horizontal_displacement <= player2_horizontal_displacement;
                end else begin
                    if(player2_horizontal_displacement >= 10) begin
                        player2_horizontal_displacement <= player2_horizontal_displacement - 1;
                        player2_cnt_horizontal <= 0;
                    end else begin
                        player2_horizontal_displacement <= player2_horizontal_displacement;
                        player2_cnt_horizontal <= 0;                   
                    end         
                end
                if(player2_jump != 0) begin
                    if(player2_jump == 1) begin
                        if(player2_cnt_vertical < 25'd2500000) begin
                            player2_cnt_vertical <= player2_cnt_vertical + 1;
                            player2_vertical_displacement <= player2_vertical_displacement;                 
                        end else begin
                            player2_vertical_displacement <= player2_vertical_displacement + 1;
                            player2_cnt_vertical <= 0;
                        end
                    end else begin
                        if(player2_cnt_vertical < 25'd2500000) begin
                            player2_cnt_vertical <= player2_cnt_vertical + 1;
                            player2_vertical_displacement <= player2_vertical_displacement;                 
                        end else begin
                            if(player2_vertical_displacement > 0) player2_vertical_displacement <= player2_vertical_displacement - 1;
                            else player2_vertical_displacement <= player2_vertical_displacement;
                            player2_cnt_vertical <= 0;
                        end
                    end
                end
                else begin
                    player2_vertical_displacement <= player2_vertical_displacement;
                    player2_cnt_vertical <= 0;
                end
            end
            else begin
                    player2_horizontal_displacement <= player2_horizontal_displacement;
                    player2_vertical_displacement <= player2_vertical_displacement;
            end
        end
    end
endmodule
