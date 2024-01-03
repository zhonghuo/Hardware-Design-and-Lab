module game_engine_ver1(
    input clk, 
    input rst, 
    input [9:0] key_down, 
    output reg [2:0] state, 
    output reg [2:0] select_level, 
    output reg[3:0] player1_state, 
    output reg en_select, 
    output reg [1:0] player1_jump, 
    output reg [29:0] cnt_player1_jump
);
parameter menu_state = 3'b000;
parameter level_1_state = 3'd1;
parameter level_2_state = 3'd2;
parameter level_3_state = 3'd3;
parameter level_4_state = 3'd4;
parameter level_5_state = 3'd5;
parameter stactic = 4'd6, right = 4'd7, left = 4'd2, up = 4'd8;
always @(posedge clk, posedge rst) begin
        if(rst) begin
            select_level <= 3'd1;
            en_select <= 1;
            state <= menu_state;
            player1_state <= stactic;
            player1_jump <= 0;
            cnt_player1_jump <= 30'b0;
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
                if(key_down == 0) begin
                    if(!player1_jump) begin
                        player1_state <= stactic;
                        player1_jump <= 0;
                        cnt_player1_jump <= 30'b0;
                    end
                    else begin
                        if(cnt_player1_jump < 30'd50000000) begin
                            player1_jump <= 2'd1;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else if(cnt_player1_jump >= 30'd50000000 && cnt_player1_jump < 30'd100000000) begin
                            player1_jump <= 2'd2;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else player1_jump <= 0;
                    end
                end
                else if(key_down == 10'b0000010000) begin
                    player1_state <= up;
                    if(cnt_player1_jump >= 30'd100000000) cnt_player1_jump <= 0;
                    else cnt_player1_jump <= cnt_player1_jump;
                    if(cnt_player1_jump < 30'd50000000) begin
                        player1_jump <= 2'd1;
                        cnt_player1_jump <= cnt_player1_jump + 1;
                    end
                    else if(cnt_player1_jump >= 30'd50000000 && cnt_player1_jump < 30'd100000000) begin
                        player1_jump <= 2'd2;
                        cnt_player1_jump <= cnt_player1_jump + 1;
                    end
                    else player1_jump <= 2'd0;
                end
                else if((key_down[5] || key_down[4]) && !key_down[7]) begin
                    player1_state <= left;
                    if(cnt_player1_jump >= 30'd100000000) cnt_player1_jump <= 0;
                    else cnt_player1_jump <= cnt_player1_jump;
                    if(key_down[4] || player1_jump) begin
                        if(cnt_player1_jump < 30'd50000000) begin
                            player1_jump <= 2'd1;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else if(cnt_player1_jump >= 30'd50000000 && cnt_player1_jump < 30'd100000000) begin
                            player1_jump <= 2'd2;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else player1_jump <= 2'd0;
                    end
                    else player1_jump <= 2'd0;
                end
                else if((key_down[7] || key_down[4]) && !key_down[5]) begin
                    player1_state <= right;
                    if(cnt_player1_jump >= 30'd100000000) cnt_player1_jump <= 0;
                    else cnt_player1_jump <= cnt_player1_jump;
                    if(key_down[4] || player1_jump) begin
                        if(cnt_player1_jump < 30'd50000000) begin
                            player1_jump <= 2'd1;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else if(cnt_player1_jump >= 30'd50000000 && cnt_player1_jump < 30'd100000000) begin
                            player1_jump <= 2'd2;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else player1_jump <= 2'd0;
                    end
                    else player1_jump <= 2'd0;
                end
                else begin
                    if(!player1_jump) player1_state <= player1_state;
                    else begin
                        if(cnt_player1_jump < 30'd50000000) begin
                            player1_jump <= 2'd1;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else if(cnt_player1_jump >= 30'd50000000 && cnt_player1_jump < 30'd100000000) begin
                            player1_jump <= 2'd2;
                            cnt_player1_jump <= cnt_player1_jump + 1;
                        end
                        else player1_jump <= 0;
                    end
                end
            end
        end
    end
endmodule