module map1(
    input clk, 
    input rst, 
    input wire [9:0] key_down, 
    input en, 
    input [2:0] level,
    input [2:0] map,
    input wire [9:0] vga_h, 
    input wire [9:0] vga_v,  
    input [3:0] player_state,
    input [1:0] player_jump,
    //input [9:0] player_horizontal_displacement,
    //input [9:0] player_vertical_displacement,
    output wire [16:0] addr, 
    output reg clear,
    output reg [15:0] led
);
    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    wire collision_with_player1, collision_with_player2;
    wire en_ceiling, en_floor, en_LeftBoundary, en_RightBoundary, en_RedRiver, en_BlueRiver, en_Wall_1;
    wire en_GreenRiver, en_Wall_2, en_Wall_3, en_Wall_4, en_RedDoor, en_BlueDoor, en_Wall_5, en_Wall_6;
    wire en_stactic;
    wire [16:0] addr_ceiling, addr_floor, addr_LeftBoundary, addr_RightBoundary, addr_BlueRiver, addr_RedRiver;
    wire [16:0] addr_Wall_1;
    wire [16:0] addr_GreenRiver, addr_Wall_2, addr_Wall_3, addr_Wall_4, addr_RedDoor, addr_BlueDoor, addr_Wall_5, addr_Wall_6;
    wire [16:0] addr_stactic;
    //reg [1:0] player_jump;
    //reg [3:0] player_state;
    reg [29:0] cnt_player_jump = 0;
    //wire [9:0] player_pivot_h, player_pivot_v;
    wire [9:0] h, v;
    assign h = vga_h >> 1;
    assign v = vga_v >> 1;
    reg [9:0] player_horizontal_displacement = 0, player_vertical_displacement = 0;
    reg [24:0] player_cnt_horizontal = 25'b0, player_cnt_vertical = 25'b0;

    always @(posedge clk, posedge rst) begin
        if(rst) led <= 16'b0000_0000_0000_1111;
        else begin
            if(player_state == 4'd6) led <= 16'b1000_0000_0000_1111;
            else if(player_state == 4'd7) led <= 16'b1100_0000_0000_1111;
            else if(player_state == 4'd8) led <= 16'b1110_0000_0000_1111;
            else if(player_state == 4'd9) led <= 16'b1111_0000_0000_1111;
            else led <= 16'b0000_0000_0000_1111;
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
                player_horizontal_displacement <= player_horizontal_displacement;
                player_vertical_displacement <= player_vertical_displacement;
                player_cnt_horizontal <= 0;
            end
            else if(player_state == 4'd9) begin
                if(player_jump == 0) begin
                    player_vertical_displacement <= player_vertical_displacement;
                    player_cnt_vertical <= 0;
                end
                else if(player_jump == 1) begin
                    if(player_cnt_vertical < 25'd1500000) begin
                        player_cnt_vertical <= player_cnt_vertical + 1;
                        player_vertical_displacement <= player_vertical_displacement; 
                    end
                    else begin
                        player_vertical_displacement <= player_vertical_displacement + 1;
                        player_cnt_vertical <= 0;
                    end
                end
                else if(player_jump == 2) begin
                    if(player_cnt_vertical < 25'd1500000) begin
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
                if(player_cnt_horizontal < 25'd2000000) begin
                    player_cnt_horizontal <= player_cnt_horizontal + 1;
                    player_horizontal_displacement <= player_horizontal_displacement;
                end 
                else begin
                    if(player_horizontal_displacement <= 282) begin
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
                    if(player_cnt_vertical < 25'd1500000) begin
                        player_cnt_vertical <= player_cnt_vertical + 1;
                        player_vertical_displacement <= player_vertical_displacement; 
                    end
                    else begin
                        player_vertical_displacement <= player_vertical_displacement + 1;
                        player_cnt_vertical <= 0;
                    end
                end
                else if(player_jump == 2) begin
                    if(player_cnt_vertical < 25'd1500000) begin
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
                if(player_cnt_horizontal < 25'd2000000) begin
                    player_cnt_horizontal <= player_cnt_horizontal + 1;
                    player_horizontal_displacement <= player_horizontal_displacement;
                end else begin
                    if(player_horizontal_displacement >= 1) begin
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
                    if(player_cnt_vertical < 25'd1500000) begin
                        player_cnt_vertical <= player_cnt_vertical + 1;
                        player_vertical_displacement <= player_vertical_displacement; 
                    end
                    else begin
                        player_vertical_displacement <= player_vertical_displacement + 1;
                        player_cnt_vertical <= 0;
                    end
                end
                else if(player_jump == 2) begin
                    if(player_cnt_vertical < 25'd1500000) begin
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

    /*terrain map1_player1_stactic(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd13),
        .pivot_v(10'd200),
        .width(10'd15),
        .height(10'd30),
        .en(en_stactic),
        .addr(addr_stactic),
        .mem_pivot_h(10'd53),
        .mem_pivot_v(0),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_ceiling(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd0),
        .pivot_v(10'd0),
        .width(10'd320),
        .height(10'd10),
        .en(en_ceiling),
        .addr(addr_ceiling),
        .mem_pivot_h(0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_floor(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd0),
        .pivot_v(10'd230),
        .width(10'd320),
        .height(10'd10),
        .en(en_floor),
        .addr(addr_floor),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_LeftBoundary(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd0),
        .pivot_v(10'd10),
        .width(10'd10),
        .height(10'd220),
        .en(en_LeftBoundary),
        .addr(addr_LeftBoundary),
        .mem_pivot_h(10'd305),
        .mem_pivot_v(10'd10),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_RightBoundary(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd310),
        .pivot_v(10'd10),
        .width(10'd10),
        .height(10'd220),
        .en(en_RightBoundary),
        .addr(addr_RightBoundary),
        .mem_pivot_h(10'd305),
        .mem_pivot_v(10'd10),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_RedRiver(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd150),
        .pivot_v(10'd230),
        .width(10'd40),
        .height(10'd6),
        .en(en_RedRiver),
        .addr(addr_RedRiver),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd65),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_BlueRiver(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd210),
        .pivot_v(10'd230),
        .width(10'd40),
        .height(10'd6),
        .en(en_BlueRiver),
        .addr(addr_BlueRiver),
        .mem_pivot_h(10'd55),
        .mem_pivot_v(10'd70),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_1(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd10),
        .pivot_v(10'd182),
        .width(10'd240),
        .height(10'd8),
        .en(en_Wall_1),
        .addr(addr_Wall_1),
        .mem_pivot_h(10'd50),
        .mem_pivot_v(10'd215),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_GreenRiver(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd190),
        .pivot_v(10'd182),
        .width(10'd40),
        .height(10'd6),
        .en(en_GreenRiver),
        .addr(addr_GreenRiver),
        .mem_pivot_h(10'd165),
        .mem_pivot_v(10'd1),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_2(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd50),
        .pivot_v(10'd139),
        .width(10'd260),
        .height(10'd8),
        .en(en_Wall_2),
        .addr(addr_Wall_2),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_3(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd60),
        .pivot_v(10'd96),
        .width(10'd210),
        .height(10'd8),
        .en(en_Wall_3),
        .addr(addr_Wall_3),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_4(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd160),
        .pivot_v(10'd89),
        .width(10'd50),
        .height(10'd7),
        .en(en_Wall_4),
        .addr(addr_Wall_4),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_Wall_6(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd110),
        .pivot_v(10'd48),
        .width(10'd200),
        .height(10'd8),
        .en(en_Wall_6),
        .addr(addr_Wall_6),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_RedDoor(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd250),
        .pivot_v(10'd19),
        .width(10'd23),
        .height(10'd29),
        .en(en_RedDoor),
        .addr(addr_RedDoor),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd89),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    terrain map1_BlueDoor(
        .clk(clk),
        .rst(rst),
        .pivot_h(10'd280),
        .pivot_v(10'd19),
        .width(10'd21),
        .height(10'd29),
        .en(en_BlueDoor),
        .addr(addr_BlueDoor),
        .mem_pivot_h(10'd32),
        .mem_pivot_v(10'd89),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .collision_with_player1(collision_with_player1),
        .collision_with_player2(collision_with_player2)
    );

    player Player1(
        .clk(clk),
        .rst(rst),
        .key_down(key_down),
        .addr(addr_player1_stactic),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .en(en_player1_stactic)
        //.led(led),
        //.player_state(player_state),
        //.player_jump(player_jump)
    );*/

    assign addr = (h>=0 && h <320 && v>=0 && v < 10) ? (   // ceiling
        h+(v+220)*320
    ) : (
        (h >= 150 && h < 190 && v >= 230 && v < 236) ? (   //red river
            (h-150) + (v-230+65) * 320
        ) : (
            (h >= 210 && h < 250 && v >= 230 && v < 236) ? (  // blue river
                (h-210+55) + (v-230+70)*320
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
                                (h>=10 && h<250 && v >=182 && v<190) ? (    // wall 1
                                    (h-10+50) + (v-182+215)*320
                                ) : (
                                    (h>=50 && h<310 && v>=139 && v<147) ? (   // wall 2
                                        (h-50) + (v-139+220)*320
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
                                                            (player_state == 4'd6) ? (
                                                                (h >= 13+player_horizontal_displacement && h < 28+player_horizontal_displacement && v >= 200-player_vertical_displacement && v < 230-player_vertical_displacement) ? (
                                                                    (h+40-player_horizontal_displacement) + (v+player_vertical_displacement-200) * 320
                                                                ) : (
                                                                    12900
                                                                )
                                                            ) : (12900
                                                                /*(player_state == 4'd7) ? (
                                                                    (h >= 8+player_horizontal_displacement && h < 22+player_horizontal_displacement && v >= 200-player_vertical_displacement && v < 230-player_vertical_displacement) ? (
                                                                        (h+63-player_horizontal_displacement) + (v+player_vertical_displacement-200) * 320
                                                                    ) : (
                                                                        12900
                                                                    )
                                                                ) : (12900
                                                                    (player_state == 4'd8) ? (
                                                                        (h >= 8+player_horizontal_displacement && h < 22+player_horizontal_displacement && v >= 200-player_vertical_displacement && v < 230-player_vertical_displacement) ? (
                                                                            (h+78-player_horizontal_displacement) + (v+player_vertical_displacement-200) * 320
                                                                        ) : (
                                                                            12900
                                                                        )
                                                                    ) : (
                                                                        (player_state == 4'd9) ? (
                                                                            (player_jump == 1) ? (
                                                                                (h >= 10+player_horizontal_displacement && h < 25+player_horizontal_displacement && v >= 199-player_vertical_displacement && v < 227-player_vertical_displacement) ? (
                                                                                    (h+43-player_horizontal_displacement) + (v+player_vertical_displacement-169) * 320
                                                                                ) : (   
                                                                                    12900
                                                                                )
                                                                            ) : (
                                                                                (h >= 10+player_horizontal_displacement && h < 25+player_horizontal_displacement && v >= 200-player_vertical_displacement && v < 230-player_vertical_displacement) ? (
                                                                                    (h+43-player_horizontal_displacement) + (v+player_vertical_displacement-200) * 320
                                                                                ) : (   
                                                                                    12900
                                                                                )
                                                                            )
                                                                        ) : (
                                                                            12900
                                                                        )
                                                                    )
                                                                )*/
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

    /*assign addr = (en_stactic) ? addr_stactic :
                    //(en_ceiling) ? addr_ceiling :
                    (en_RedRiver) ? addr_RedRiver :
                    (en_BlueRiver) ? addr_BlueRiver :
                    (en_GreenRiver) ? addr_GreenRiver :
                    (en_floor) ? addr_floor :
                    (en_LeftBoundary) ? addr_LeftBoundary :
                    (en_RightBoundary) ? addr_RightBoundary :
                    (en_Wall_1) ? addr_Wall_1 :
                    (en_Wall_2) ? addr_Wall_2 :
                    (en_Wall_3) ? addr_Wall_3 :
                    (en_Wall_4) ? addr_Wall_4 :
                    (en_Wall_6) ? addr_Wall_6 :
                    (en_RedDoor) ? addr_RedDoor :
                    (en_BlueDoor) ? addr_BlueDoor : 12900;*/

    /*always @* begin
        if(en_stactic) addr = addr_stactic;
        else if(en_ceiling) addr = addr_ceiling;
        else if(en_RedRiver) addr = addr_RedRiver;
        else if(en_BlueRiver) addr = addr_BlueRiver;        
        else if(en_GreenRiver) addr = addr_GreenRiver;
        else if(en_floor) addr = addr_floor;
        else if(en_LeftBoundary) addr = addr_LeftBoundary;
        else if(en_RightBoundary) addr = addr_RightBoundary;
        else if(en_Wall_1) addr = addr_Wall_1;
        else if(en_Wall_2) addr = addr_Wall_2;
        else if(en_Wall_3) addr = addr_Wall_3;
        else if(en_Wall_4) addr = addr_Wall_4;
        else if(en_Wall_6) addr = addr_Wall_6;
        //else if(en_player1_stactic) addr = addr_player1_stactic;
        else if(en_RedDoor) addr = addr_RedDoor;
        else if(en_BlueDoor) addr = addr_BlueDoor;
        //else if(en_player1_stactic) addr = addr_player1_stactic;
        else addr = 12900;
    end*/

endmodule