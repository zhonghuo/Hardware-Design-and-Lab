module player1_state_cal(
    input clk,
    input rst,
    input wire [9:0] key_down, 
    input wire [16:0] addr, 
    input wire [9:0] vga_h,
    input wire [9:0] vga_v,
    input wire en,
    output reg [1:0] player_jump,
    output reg [3:0] player_state
);

    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    reg [29:0] cnt_player_jump = 0;

    player player1(
        .clk(clk),
        .rst(rst),
        .key_down(key_down),
        .player_jump(player_jump),
        .player_state(player_state),
        .addr(addr),
        .en(en),
        .vga_h(vga_h),
        .vga_v(vga_v)
    );

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

endmodule