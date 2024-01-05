module player (
    input clk,
    input rst,
    input wire [9:0] key_down, 
    input [1:0] player_jump,
    input [3:0] player_state,
    //input [4:0] cnt_terrain,
    //input [4:0] cnt_treasure, 
    //input [4:0] cnt_mech, 
    //input [31:0] collision_terrain, 
    //input [31:0] collision_treasure, 
    //input [31:0] collision_mech, 
    //another flag like: input[31:0] flag,

    //mem_addr related
    output wire [16:0] addr, 
    output wire en,
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

    wire [9:0] h, v;
    wire in_square;
    assign h = vga_h >> 1;
    assign v = vga_v >> 1;
    reg [9:0] disp_h, disp_v;
    reg [9:0] player_pivot_h, player_pivot_v;

    //assign addr = disp_h + mem_pivot_h + 320*(disp_v + mem_pivot_v);
    assign en = (player_state == stactic) ? (
        ((h >= (13+player_horizontal_displacement)) && (h <= (28+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v <= (230-player_vertical_displacement))) ? 1 : 0
    ) : (
        (player_state == left) ? (
            ((h >= (8+player_horizontal_displacement)) && (h <= (22+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v <= (230-player_vertical_displacement))) ? 1 : 0
        ) : (
            (player_state == right) ? (
                ((h >= (8+player_horizontal_displacement)) && (h <= (22+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v <= (230-player_vertical_displacement))) ? 1 : 0
            ) : (
                (player_state == up && player_jump == 1) ? (
                    ((h >= (10+player_horizontal_displacement)) && (h <= (25+player_horizontal_displacement)) && (v >= (199-player_vertical_displacement)) && (v <= (227-player_vertical_displacement))) ? 1 : 0
                ) : (
                    (player_state == up && player_jump == 2) ? (
                        ((h >= (13+player_horizontal_displacement)) && (h <= (28+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v <= (230-player_vertical_displacement))) ? 1 : 0
                    ) : (
                        0
                    )
                )
            )
        )
    );


    assign addr = (player_state == stactic) ? (
        ((h >= (13+player_horizontal_displacement)) && (h <= (28+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v <= (230-player_vertical_displacement))) ? (
            (h+40-player_horizontal_displacement) + (v+player_vertical_displacement-200)*320
        ) : (
            12900
        )
    ) : (
        (player_state == left) ? (
            ((h >= (8+player_horizontal_displacement)) && (h <= (22+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v <= (230-player_vertical_displacement))) ? (
                (h+78-player_horizontal_displacement) + (v+player_vertical_displacement-200)*320
            ) : (
                12900
            )
        ) : (
            (player_state == right) ? (
                ((h >= (8+player_horizontal_displacement)) && (h <= (22+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v <= (230-player_vertical_displacement))) ? (
                    (h+63-player_horizontal_displacement) + (v+player_vertical_displacement-200)*320
                ) : (
                    12900
                )
            ) : (
                (player_state == up && player_jump == 1) ? (
                    ((h >= (10+player_horizontal_displacement)) && (h <= (25+player_horizontal_displacement)) && (v >= (199-player_vertical_displacement)) && (v <= (227-player_vertical_displacement))) ? (
                        (h+43-player_horizontal_displacement) + (v+player_vertical_displacement-169)*320
                    ) : (
                        12900
                    )
                ) : (
                    (player_state == up && player_jump == 2) ? (
                        ((h >= (13+player_horizontal_displacement)) && (h <= (28+player_horizontal_displacement)) && (v >= (200-player_vertical_displacement)) && (v <= (230-player_vertical_displacement))) ? (
                            (h+43-player_horizontal_displacement) + (v+player_vertical_displacement-200)*320
                        ) : (
                            12900
                        )
                    ) : (
                        12900
                    )
                )
            )
        )
    );

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