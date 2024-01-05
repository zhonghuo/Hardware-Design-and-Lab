module player (
    input clk,
    input rst,
    input wire [9:0] key_down, 
    //input [4:0] cnt_terrain,
    //input [4:0] cnt_treasure, 
    //input [4:0] cnt_mech, 
    //input [31:0] collision_terrain, 
    //input [31:0] collision_treasure, 
    //input [31:0] collision_mech, 
    //another flag like: input[31:0] flag,

    //mem_addr related
    //output wire [16:0] addr, 
    //input wire [9:0] disp_h, disp_v, 
    /*
    always @(posedge clk or posedge rst) begin
        if(rst) pivot <= init_pivot;
        else ?????U????????p?]?P

        end
    */
    input [9:0] init_pivot_h, init_pivot_v,
    input [9:0] width, height,
    //input [9:0] width, height, 
    output wire [9:0] player_pivot_h, 
    output wire [9:0] player_pivot_v
);

    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    reg [29:0] cnt_player_jump = 0;
    reg [9:0] player_horizontal_displacement = 0, player_vertical_displacement = 0;
    reg [24:0] player_cnt_horizontal = 25'b0, player_cnt_vertical = 25'b0;
    reg [3:0] player_state;
    reg [1:0] player_jump;

    assign player_pivot_h = (init_pivot_h + player_horizontal_displacement);
    assign player_pivot_v = (init_pivot_v + player_vertical_displacement);


    always @(posedge clk, posedge rst) begin
        if(rst) begin
            player_state <= stactic;
            player_jump <= 0;
            cnt_player_jump <= 30'b0;
        end else begin
            if(!key_down[4] && !key_down[5] && !key_down[6] && !key_down[7]) begin
                if(!player_jump) begin
                    player_state <= stactic;
                    player_jump <= 0;
                    cnt_player_jump <= 30'b0;
                end
                else begin
                    if(cnt_player_jump < 30'd50000000 && player_jump != 2) begin
                        player_jump <= 2'd1;
                        cnt_player_jump <= cnt_player_jump + 1;
                    end
                    else begin
                        player_jump <= 2'd2;
                        if(cnt_player_jump < 30'd100000000) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                        end
                        else player_jump <= 0;
                    end
                end
            end
            else if(key_down[4] && !key_down[5] && !key_down[6] && !key_down[7]) begin
                player_state <= up;
                if(cnt_player_jump >= 30'd100000000) cnt_player_jump <= 0;
                else cnt_player_jump <= cnt_player_jump;
                if(cnt_player_jump < 30'd50000000 && player_jump != 2) begin
                    player_jump <= 2'd1;
                    cnt_player_jump <= cnt_player_jump + 1;
                end
                else begin
                    player_jump <= 2'd2;
                    if(cnt_player_jump < 30'd100000000) begin
                        cnt_player_jump <= cnt_player_jump + 1;
                    end
                    else player_jump <= 0;
                end
            end
            else if((key_down[5] || key_down[4]) && !key_down[7]) begin
                player_state <= left;
                if(cnt_player_jump >= 30'd100000000) cnt_player_jump <= 0;
                else cnt_player_jump <= cnt_player_jump;
                if(key_down[4] || player_jump) begin
                    if(cnt_player_jump < 30'd50000000 && player_jump != 2) begin
                        player_jump <= 2'd1;
                        cnt_player_jump <= cnt_player_jump + 1;
                    end
                    else begin
                        player_jump <= 2'd2;
                        if(cnt_player_jump < 30'd100000000) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                        end
                        else player_jump <= 0;
                    end
                end
                else player_jump <= 2'd0;
            end
            else if((key_down[7] || key_down[4]) && !key_down[5]) begin
                player_state <= right;
                if(cnt_player_jump >= 30'd100000000) cnt_player_jump <= 0;
                else cnt_player_jump <= cnt_player_jump;
                if(key_down[4] || player_jump) begin
                    if(cnt_player_jump < 30'd50000000 && player_jump != 2) begin
                        player_jump <= 2'd1;
                        cnt_player_jump <= cnt_player_jump + 1;
                    end
                    else begin
                        player_jump <= 2'd2;
                        if(cnt_player_jump < 30'd100000000) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                        end
                        else player_jump <= 0;
                    end
                end
                else player_jump <= 2'd0;
            end
            else begin
                if(!player_jump) player_state <= player_state;
                else begin
                    if(cnt_player_jump < 30'd50000000 && player_jump != 2) begin
                        player_jump <= 2'd1;
                        cnt_player_jump <= cnt_player_jump + 1;
                    end
                    else begin
                        player_jump <= 2'd2;
                        if(cnt_player_jump < 30'd100000000) begin
                            cnt_player_jump <= cnt_player_jump + 1;
                        end
                        else player_jump <= 0;
                    end
                end
            end
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            player_horizontal_displacement <= 0;
            player_vertical_displacement <= 0;
            player_cnt_horizontal <= 0;
            player_cnt_vertical <= 0;
        end else begin
            if(player_state == stactic) begin
                player_horizontal_displacement <= player_horizontal_displacement;
                player_vertical_displacement <= player_vertical_displacement;
                player_cnt_horizontal <= 0;
            end
            else if(player_state == up) begin
                if(player_jump != 0) begin
                    if(player_jump == 1) begin
                        if(player_cnt_vertical < 25'd2500000) begin
                            player_cnt_vertical <= player_cnt_vertical + 1;
                            player_vertical_displacement <= player_vertical_displacement;                 
                        end else begin
                            player_vertical_displacement <= player_vertical_displacement + 1;
                            player_cnt_vertical <= 0;
                        end
                    end else begin
                        if(player_cnt_vertical < 25'd2500000) begin
                            player_cnt_vertical <= player_cnt_vertical + 1;
                            player_vertical_displacement <= player_vertical_displacement;                 
                        end else begin
                            if(player_vertical_displacement > 0) player_vertical_displacement <= player_vertical_displacement - 1;
                            else player_vertical_displacement <= player_vertical_displacement;
                            player_cnt_vertical <= 0;
                        end
                    end
                end
                else begin
                    player_vertical_displacement <= player_vertical_displacement;
                    player_cnt_vertical <= 0;
                end
            end
            else if(player_state == right) begin
                if(player_cnt_horizontal < 25'd1666666) begin
                    player_cnt_horizontal <= player_cnt_horizontal + 1;
                    player_horizontal_displacement <= player_horizontal_displacement;
                end else begin
                    if(player_horizontal_displacement <= 282) begin
                        player_horizontal_displacement <= player_horizontal_displacement + 1;
                        player_cnt_horizontal <= 0;
                    end else begin
                        player_horizontal_displacement <= player_horizontal_displacement;
                        player_cnt_horizontal <= 0;                   
                    end
                end
                if(player_jump != 0) begin
                    if(player_jump == 1) begin
                        if(player_cnt_vertical < 25'd2500000) begin
                            player_cnt_vertical <= player_cnt_vertical + 1;
                            player_vertical_displacement <= player_vertical_displacement;                 
                        end else begin
                            player_vertical_displacement <= player_vertical_displacement + 1;
                            player_cnt_vertical <= 0;
                        end
                    end else begin
                        if(player_cnt_vertical < 25'd2500000) begin
                            player_cnt_vertical <= player_cnt_vertical + 1;
                            player_vertical_displacement <= player_vertical_displacement;                 
                        end else begin
                            if(player_vertical_displacement > 0) player_vertical_displacement <= player_vertical_displacement - 1;
                            else player_vertical_displacement <= player_vertical_displacement;
                            player_cnt_vertical <= 0;
                        end
                    end
                end
                else begin
                    player_vertical_displacement <= player_vertical_displacement;
                    player_cnt_vertical <= 0;
                end
            end
            else if(player_state == left) begin
                if(player_cnt_horizontal < 25'd1666666) begin
                    player_cnt_horizontal <= player_cnt_horizontal + 1;
                    player_horizontal_displacement <= player_horizontal_displacement;
                end else begin
                    if(player_horizontal_displacement >= 10) begin
                        player_horizontal_displacement <= player_horizontal_displacement - 1;
                        player_cnt_horizontal <= 0;
                    end else begin
                        player_horizontal_displacement <= player_horizontal_displacement;
                        player_cnt_horizontal <= 0;                   
                    end         
                end
                if(player_jump != 0) begin
                    if(player_jump == 1) begin
                        if(player_cnt_vertical < 25'd2500000) begin
                            player_cnt_vertical <= player_cnt_vertical + 1;
                            player_vertical_displacement <= player_vertical_displacement;                 
                        end else begin
                            player_vertical_displacement <= player_vertical_displacement + 1;
                            player_cnt_vertical <= 0;
                        end
                    end else begin
                        if(player_cnt_vertical < 25'd2500000) begin
                            player_cnt_vertical <= player_cnt_vertical + 1;
                            player_vertical_displacement <= player_vertical_displacement;                 
                        end else begin
                            if(player_vertical_displacement > 0) player_vertical_displacement <= player_vertical_displacement - 1;
                            else player_vertical_displacement <= player_vertical_displacement;
                            player_cnt_vertical <= 0;
                        end
                    end
                end
                else begin
                    player_vertical_displacement <= player_vertical_displacement;
                    player_cnt_vertical <= 0;
                end
            end
            else begin
                    player_horizontal_displacement <= player_horizontal_displacement;
                    player_vertical_displacement <= player_vertical_displacement;
            end
        end
    end
endmodule