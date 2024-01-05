module player (
    input clk,
    input rst,
    input wire [9:0] key_down, 
    //output reg [1:0] player_jump,
    //output reg [3:0] player_state,
    //input [4:0] cnt_terrain,
    //input [4:0] cnt_treasure, 
    //input [4:0] cnt_mech, 
    //input [31:0] collision_terrain, 
    //input [31:0] collision_treasure, 
    //input [31:0] collision_mech, 
    //another flag like: input[31:0] flag,

    //mem_addr related
    output wire [16:0] addr, 
    output reg en,
    //input wire [9:0] disp_h, disp_v, 
    /*
    always @(posedge clk or posedge rst) begin
        if(rst) pivot <= init_pivot;
        else ?????U????????p?]?P

        end
    */
    //input [9:0] init_pivot_h, init_pivot_v,
    //input [9:0] width, height,
    input wire [9:0] vga_h,
    input wire [9:0] vga_v
    //output reg [15:0] led
    //input wire [9:0] mem_pivot_h,
    //input wire [9:0] mem_pivot_v
    //output reg [9:0] player_pivot_h, 
    //output reg [9:0] player_pivot_v
);

    parameter stactic = 4'd6, right = 4'd7, left = 4'd8, up = 4'd9;
    reg [29:0] cnt_player_jump = 0;
    reg [9:0] player_horizontal_displacement = 0, player_vertical_displacement = 0;
    reg [24:0] player_cnt_horizontal = 25'b0, player_cnt_vertical = 25'b0;
    reg en1, en2, en3, en4;
    reg [3:0] player_state;
    reg [1:0] player_jump;
    
    wire [9:0] h, v;
    wire in_square;
    assign h = vga_h >> 1;
    assign v = vga_v >> 1;
    reg [9:0] disp_h, disp_v;
    reg [9:0] player_pivot_h, player_pivot_v;

    //assign addr = disp_h + mem_pivot_h + 320*(disp_v + mem_pivot_v);
    /*always @* begin
        if(v+player_vertical_displacement-200>=0 && v+player_vertical_displacement-200<30 && h+player_horizontal_displacement-13>=0 && h+player_horizontal_displacement-13<15) begin
            en = 1;
            disp_h = h+player_vertical_displacement-13;
            disp_v = v+player_horizontal_displacement-200;
        end else begin
            en = 0;
            disp_h = 0;
            disp_v = 0;
        end
    end

    assign addr = disp_h + 53 + 320*(disp_v + 0);*/

    /*assign led = (en && player_state == stactic) ? 16'b0000_0000_0000_0001 :
                 (en && player_state == left) ? 16'b0000_0000_0000_0011 :
                 (en && player_state == right) ? 16'b0000_0000_0000_0111 :
                 (en && player_state == up && player_jump == 1) ? 16'b0000_0000_0000_1111 :
                 (en && player_state == up && player_jump == 2) ? 16'b0000_0000_0001_1111 : 16'b1111_0000_0000_1111;*/
    
    /*always @(posedge clk, posedge rst) begin
        if(rst) begin
            led <= 16'b1111_0000_0000_1111;
        end else begin
            if(player_state == stactic) led <= 16'b0000_0000_0000_1111;
            else if(player_state == left) led <= 16'b0000_0000_0011_1111;
            else if(player_state == right) led <= 16'b0000_0000_1111_1111;
            else if(player_state == up && player_jump == 1) led <= 16'b0000_0011_1111_1111;
            else if(player_state == up && player_jump == 2) led <= 16'b0000_1111_1111_1111;
            else led <= 16'b1111_0000_0000_1111;
        end
    end*/

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
                //if(cnt_player_jump >= 30'd100000000) cnt_player_jump <= 0;
                //else cnt_player_jump <= cnt_player_jump;
                if(cnt_player_jump < 30'd50000000 && player_jump != 2) begin
                    player_jump <= 2'd1;
                    cnt_player_jump <= cnt_player_jump + 1;
                end
                else begin
                    player_jump <= 2'd2;
                    if(cnt_player_jump < 30'd100000000) begin
                        cnt_player_jump <= cnt_player_jump + 1;
                    end
                    else begin
                        player_jump <= 0;
                        cnt_player_jump <= 0;
                    end
                end
            end
            else if((key_down[5] || key_down[4]) && !key_down[7]) begin
                player_state <= left;
                //if(cnt_player_jump >= 30'd100000000) cnt_player_jump <= 0;
                //else cnt_player_jump <= cnt_player_jump;
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
                        else begin
                            player_jump <= 0;
                            cnt_player_jump <= 0;
                        end
                    end
                end
                else player_jump <= 2'd0;
            end
            else if((key_down[7] || key_down[4]) && !key_down[5]) begin
                player_state <= right;
                //if(cnt_player_jump >= 30'd100000000) cnt_player_jump <= 0;
                //else cnt_player_jump <= cnt_player_jump;
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
                        else begin
                            player_jump <= 0;
                            cnt_player_jump <= 0;
                        end
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