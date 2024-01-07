module map2(
    input clk, 
    input rst, 
    input en, 
    input wire [9:0] vga_h, 
    input wire [9:0] vga_v,  
    input [3:0] player_state, player2_state,
    input [1:0] player_jump, player2_jump,
    output reg [16:0] addr, 
    //output reg clear,
    output reg [15:0] led,
    output wire p1_collision, p2_collision,
    output wire p1_land, p2_land,
    output wire should_down, should_down2,
    output wire button1_tounch
);
    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    reg [29:0] cnt_player_jump = 0;

    wire [9:0] h, v;
    assign h = vga_h >> 1;
    assign v = vga_v >> 1;

    wire dimond1_touch, button2_tounch;
    wire p1_on_mech1;
    reg dimond1_flag = 1, botton1_flag = 1, botton2_flag = 1;
    reg [9:0] player_horizontal_displacement = 0, player_vertical_displacement = 0, player2_h_dis = 0, player2_v_dis = 0;
    reg [24:0] player_cnt_horizontal = 25'b0, player_cnt_vertical = 25'b0, player2_cnt_h = 25'b0, player2_cnt_v = 25'b0;
    reg [9:0] mech_1_v_displacement = 0, mech_2_h_displacement = 0;
    reg [24:0] mech_cnt_v = 25'b0, mech_2_cnt_h = 0;

    //led
    //indicate the player1 is on mech or is in collision
    always @(posedge clk) begin
        if(rst || !en) led <= 16'b0000_0000_0000_1111;
        else begin
            if(p1_on_mech1) led <= 16'b1111_1111_1111_1111;
            else if(p1_collision) led <= 16'b0000_1111_1111_1111;
            else led <= 16'b0000_0000_0000_1111;
        end
    end

    //obj state
    assign p1_on_mech1 = ((25+player_horizontal_displacement) < 50 && (230-player_vertical_displacement)==(139+mech_1_v_displacement));

    assign dimond1_touch = (dimond1_flag) ? (
        (22+player_horizontal_displacement == 197 && player_state == right && player_vertical_displacement >= 0 && player_vertical_displacement < 3) ? 1 : 0
    ) : (
        1
    );

    assign p1_collision = (player_jump == 1 && (199 - player_vertical_displacement) == 190 && (10 + player_horizontal_displacement) < 240) ||
    (player_state == right && (28+player_horizontal_displacement) >= 275 && (230-player_vertical_displacement) >= 220) ||     // wall 7
    (player_jump == 1 && (199-player_vertical_displacement) == 147 && (10+player_horizontal_displacement) >= 90) ||   // wall 2
    (button1_tounch && player_state == left && (10+player_horizontal_displacement) <= 40 && (230-player_vertical_displacement) <= 182 && (230-player_vertical_displacement) >= 165) ||//mech 1
    (!button1_tounch && (10+player_horizontal_displacement)<40 && (199-player_vertical_displacement) <=147 && (199-player_vertical_displacement) >=139) ||
    (player_jump == 1 && (199-player_vertical_displacement) == 104 && (10+player_horizontal_displacement) >= 75 && (10+player_horizontal_displacement) < 270) || //wall 3
    (player_state == right && button2_tounch && (28+player_horizontal_displacement) >= 295 && (230-player_vertical_displacement) >= 130)   // mech 2
    ; 

    assign p2_collision = (player2_jump == 1 && (199 - player2_v_dis) == 190 && (10 + player2_h_dis) < 240) ||
    (player2_state == right && (28+player2_h_dis) >= 275 && (230-player2_v_dis) >= 220) ||     // wall 7
    (player2_jump == 1 && (199-player2_v_dis) == 147 && (10+player2_h_dis) >= 90) ||    // wall 2
    (button1_tounch && player2_state == left && (10+player2_h_dis) <= 40 && (230-player2_v_dis) <= 182 && (230-player2_v_dis) >= 165) ||//mech 1
    (!button1_tounch && (10+player2_h_dis)<40 && (199-player2_v_dis) <=147 && (199-player2_v_dis) >= 139) ||
    (player2_jump == 1 && (199-player2_v_dis) == 104 && (10+player2_h_dis) >= 75 && (10+player2_h_dis) < 270) || //wall 3
    (player2_state == right && button2_tounch && (28+player2_h_dis)>=295 && (230-player2_v_dis) >= 130) // mech 2
    ; 

    assign p1_land = (player_jump == 2 && (230-player_vertical_displacement) == 230 && (28+player_horizontal_displacement) < 276) ||  // floor
    (player_jump == 2 && (13 + player_horizontal_displacement) >= 274 && (28+player_horizontal_displacement) <= 320 && (230-player_vertical_displacement) == 210) ||  // wall 7
    (player_jump == 2 && (230 -player_vertical_displacement) == 182 && (8+player_horizontal_displacement) >= 8 && (25+player_horizontal_displacement) < 255) ||
    (button1_tounch && player_jump == 2 && (230-player_vertical_displacement) == 161 && (8+player_horizontal_displacement) <= 40) ||  // mech 1
    (player_jump == 2 && (13+player_horizontal_displacement)>=80 && (13+player_horizontal_displacement)<310 && (230-player_vertical_displacement)==139) || // wall 2
    (button2_tounch && player_jump == 2 && (230-player_vertical_displacement) == 124 && (8+player_horizontal_displacement) >= 295) || // mech 2
    (player_jump == 2 && (13+player_horizontal_displacement)>=85 && (13+player_horizontal_displacement)<270 && (230-player_vertical_displacement)==96)   // wall 3
    ;

    assign p2_land = (player2_jump == 2 && (230-player2_v_dis) == 230 && (28+player2_h_dis) < 276) ||  // floor
    (player2_jump == 2 && (13 + player2_h_dis) >= 274 && (28+player2_h_dis) <= 320 && (230-player2_v_dis) == 210) ||  // wall 7
    (player2_jump == 2 && (230 -player2_v_dis) == 182 && (8+player2_h_dis) >= 8 && (25+player2_h_dis) < 255) ||
    (button1_tounch && player2_jump == 2 && (230-player2_v_dis) == 161 && (8+player2_h_dis) <= 40) ||   // mech 1
    (player2_jump == 2 && (13+player2_h_dis)>=80 && (13+player2_h_dis)<310 && (230-player2_v_dis)==139) || // wall 2
    (button2_tounch && player2_jump == 2 && (230-player2_v_dis)==124 && (8+player2_h_dis) >= 295) || // mech 2
    (player2_jump == 2 && (13+player2_h_dis)>=85 && (13+player2_h_dis)<270 && (230-player2_v_dis)==96)  // wall 3
    ;

    assign should_down = (player_state == left && (22+player_horizontal_displacement) <= 277 && (230-player_vertical_displacement)>= 210 && (230-player_vertical_displacement) < 212) ||
    (player_state == right && (8+player_horizontal_displacement) >= 230 && (230-player_vertical_displacement) >= 182 && (230-player_vertical_displacement) < 184) ||
    (player_state == right && (8+player_horizontal_displacement) >= 35 &&  (230-player_vertical_displacement) >= 161 && (230-player_vertical_displacement) < 163) ||
    (player_state == left && (22+player_horizontal_displacement) <= 90 && (230-player_vertical_displacement) >= 137 && (230-player_vertical_displacement) <= 139) ||
    (player_state == left && (22+player_horizontal_displacement)  <= 295 && (230-player_vertical_displacement) >= 122 && (230-player_vertical_displacement) <= 124)
    ;

    assign should_down2 = (player2_state == left && (22+player2_h_dis) <= 277 && (230-player2_v_dis)>= 210 && (230-player2_v_dis) < 212) ||
    (player2_state == right && (8+player2_h_dis) >= 230 && (230-player2_v_dis) >= 182 && (230-player2_v_dis) < 184) ||
    (player2_state == right && (8+player2_h_dis) >= 35 &&  (230-player2_v_dis) >= 161 && (230-player2_v_dis) < 163) ||
    (player2_state == left && (22+player2_h_dis) <= 90 && (230-player2_v_dis) >= 137 && (230-player2_v_dis) <= 139) ||
    (player2_state == left && (22+player2_h_dis) <= 295 && (230-player2_v_dis) >= 122 && (230-player2_v_dis) <= 124)
    ;

    assign button1_tounch = (botton1_flag) ? (
        (((22+player_horizontal_displacement) >=100 && (8+player_horizontal_displacement) < 105 && (230-player_vertical_displacement) <= 182 && (230-player_vertical_displacement) >=180 ) ||
    ((30+player2_h_dis) >= 100 && (10+player2_h_dis) < 105 && (230-player2_v_dis) <= 182 && (230-player2_v_dis) >= 180)) ? 1 : 0
    ) : (
        1
    ) ;

    assign button2_tounch = (botton2_flag) ? (
        (((22+player_horizontal_displacement) >= 244 && (8+player_horizontal_displacement) <250 && (200-player_vertical_displacement) >= 104 && (200-player_vertical_displacement) <= 106) || 
        ((30+player2_h_dis) >= 244 && (10+player2_h_dis) < 250 && (200-player2_v_dis) >= 104 && (200-player2_v_dis) <= 106)) ? 1 : 0
    ) : (
        1
    );

    always @(posedge clk) begin
        if(rst || !en) begin
            dimond1_flag <= 1;
        end else begin
            if(dimond1_flag && dimond1_touch) dimond1_flag <= 0;
            else dimond1_flag <= dimond1_flag;
        end
    end

    always @(posedge clk) begin
        if(rst || !en) begin
            botton1_flag <= 1;
        end else begin
            if(botton1_flag && button1_tounch) botton1_flag <= 0;
            else botton1_flag <= botton1_flag;
        end
    end

    always @(posedge clk) begin
        if(rst || !en) begin
            botton2_flag <= 1;
        end else begin
            if(botton2_flag && button2_tounch) botton2_flag <= 0;
            else botton2_flag <= botton2_flag;
        end
    end

    always @(posedge clk) begin
        if(rst || !en) begin
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

    always @(posedge clk) begin
        if(rst || !en) begin
            mech_2_h_displacement <= 0;
            mech_2_cnt_h <= 0;
        end else begin
            if(button2_tounch) begin
                if(mech_2_cnt_h < 25'd2000000) begin
                    mech_2_cnt_h <= mech_2_cnt_h + 1;
                    mech_2_h_displacement <= mech_2_h_displacement;
                end
                else begin
                    if(mech_2_h_displacement < 15) mech_2_h_displacement <= mech_2_h_displacement + 1;
                    else mech_2_h_displacement <= mech_2_h_displacement;
                    mech_2_cnt_h <= 0;
                end
            end else begin
                    mech_2_h_displacement <= mech_2_h_displacement;
                    mech_2_cnt_h <= 0;         
            end
        end
    end

    always @(posedge clk) begin
        if(rst || !en) begin
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

    always @(posedge clk) begin
        if(rst || !en) begin
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
                    if(player2_h_dis >= 1 && !p2_collision) begin
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

    //part of terrain objs

    wire en_ceiling, en_floor, en_LeftBoundary, en_RightBoundary, en_RedRiver, en_BlueRiver;
    wire en_Wall_1, en_Wall_2, en_Wall_3, en_Wall_4, en_Wall_5, en_Wall_6, en_Wall_7;
    wire en_red_door, en_blue_door;
    wire [16:0] addr_ceiling, addr_floor, addr_LeftBoundary, addr_RightBoundary, addr_BlueRiver, addr_RedRiver;
    wire [16:0] addr_Wall_1, addr_Wall_2, addr_Wall_3, addr_Wall_4, addr_Wall_5, addr_Wall_6, addr_Wall_7;
    wire [16:0] addr_red_door, addr_blue_door;

    terrain map1_ceiling(
        .pivot_h(10'd0),
        .pivot_v(10'd0),
        .width(10'd320),
        .height(10'd10),
        .en(en_ceiling),
        .addr(addr_ceiling),
        .mem_pivot_h(0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_floor(
        .pivot_h(10'd0),
        .pivot_v(10'd230),
        .width(10'd320),
        .height(10'd10),
        .en(en_floor),
        .addr(addr_floor),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_LeftBoundary(
        .pivot_h(10'd0),
        .pivot_v(10'd10),
        .width(10'd10),
        .height(10'd220),
        .en(en_LeftBoundary),
        .addr(addr_LeftBoundary),
        .mem_pivot_h(10'd305),
        .mem_pivot_v(10'd10),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_RightBoundary(
        .pivot_h(10'd310),
        .pivot_v(10'd10),
        .width(10'd10),
        .height(10'd220),
        .en(en_RightBoundary),
        .addr(addr_RightBoundary),
        .mem_pivot_h(10'd305),
        .mem_pivot_v(10'd10),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_RedRiver(
        .pivot_h(10'd150),
        .pivot_v(10'd230),
        .width(10'd40),
        .height(10'd6),
        .en(en_RedRiver),
        .addr(addr_RedRiver),
        .mem_pivot_h(10'd0),
        .mem_pivot_v(10'd65),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_BlueRiver(
        .pivot_h(10'd210),
        .pivot_v(10'd230),
        .width(10'd40),
        .height(10'd6),
        .en(en_BlueRiver),
        .addr(addr_BlueRiver),
        .mem_pivot_h(10'd55),
        .mem_pivot_v(10'd70),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    /*
    terrain map1_Wall_(
        .pivot_h(),
        .pivot_v(),
        .width(),
        .height(),
        .en(en_Wall_),
        .addr(addr_Wall_),
        .mem_pivot_h(),
        .mem_pivot_v(),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );
    */

    terrain map1_Wall_1(
        .pivot_h(10'd10),
        .pivot_v(10'd182),
        .width(10'd230),
        .height(10'd8),
        .en(en_Wall_1),
        .addr(addr_Wall_1),
        .mem_pivot_h(10'd50),
        .mem_pivot_v(10'd215),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_Wall_2(
        .pivot_h(90),
        .pivot_v(139),
        .width(220),
        .height(8),
        .en(en_Wall_2),
        .addr(addr_Wall_2),
        .mem_pivot_h(0),
        .mem_pivot_v(220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_Wall_3(
        .pivot_h(85),
        .pivot_v(96),
        .width(185),
        .height(8),
        .en(en_Wall_3),
        .addr(addr_Wall_3),
        .mem_pivot_h(0),
        .mem_pivot_v(220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_Wall_4(
        .pivot_h(160),
        .pivot_v(89),
        .width(50),
        .height(8),
        .en(en_Wall_4),
        .addr(addr_Wall_4),
        .mem_pivot_h(0),
        .mem_pivot_v(220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_Wall_5(
        .pivot_h(110),
        .pivot_v(48),
        .width(200),
        .height(8),
        .en(en_Wall_5),
        .addr(addr_Wall_5),
        .mem_pivot_h(0),
        .mem_pivot_v(220),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain map1_Wall_6(
        .pivot_h(275),
        .pivot_v(210),
        .width(35),
        .height(20),
        .en(en_Wall_6),
        .addr(addr_Wall_6),
        .mem_pivot_h(0),
        .mem_pivot_v(218),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain red_door(
        .pivot_h(250),
        .pivot_v(19),
        .width(23),
        .height(29),
        .en(en_red_door),
        .addr(addr_red_door),
        .mem_pivot_h(0),
        .mem_pivot_v(89),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    terrain blue_door(
        .pivot_h(280),
        .pivot_v(19),
        .width(23),
        .height(29),
        .en(en_blue_door),
        .addr(addr_blue_door),
        .mem_pivot_h(32),
        .mem_pivot_v(89),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

    //addr
    always @* begin
        if(en_ceiling) addr = addr_ceiling;
        else if(en_RedRiver) addr = addr_RedRiver;
        else if(en_BlueRiver) addr = addr_BlueRiver;        
        else if(en_floor) addr = addr_floor;
        else if(en_LeftBoundary) addr = addr_LeftBoundary;
        else if(en_RightBoundary) addr = addr_RightBoundary;
        else if(en_Wall_1) addr = addr_Wall_1;
        else if(en_Wall_2) addr = addr_Wall_2;
        else if(en_Wall_3) addr = addr_Wall_3;
        else if(en_Wall_4) addr = addr_Wall_4;
        else if(en_Wall_5) addr = addr_Wall_5;
        else if(en_Wall_6) addr = addr_Wall_6;
        else if(en_red_door) addr = addr_red_door;
        else if(en_blue_door) addr = addr_blue_door;

        //obj without obj oriented ctrl
        //player diamond button mech 
        else if((h>=194 && h <206 && v>=203 && v<220)) //red diamond 1
            addr = dimond1_touch ? 12900 : (((h-99)+(v-66)*320));
        else if((h>=100 && h<105 && v>=177 && v<182)) // button1
            addr = button1_tounch ? 60800 : 540;
        else addr = 12900;
    end
    

endmodule