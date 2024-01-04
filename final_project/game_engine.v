module map_switch(
    input clk, 
    input rst, 
    inout PS2_DATA, 
    inout PS2_CLK, 
    input wire [9:0] vga_h, //640 現在螢幕輸出到哪個pixel
    input wire [9:0] vga_v,  //480 現在螢幕輸出到哪個pixel
    output reg [16:0] pixel //給top輸出到螢幕
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

    //keyboard
    wire [9:0] key_down;
    wire [8:0] last_change;
    wire been_ready;
    KeyboardDecoder kd1(
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

    //map
    reg [2:0] map;//標註現在這是哪個畫面
    always @(posedge clk or posedge rst) begin
        if(rst) map <= 0;
        else begin
            //根據map是否輸出clear訊號來決定要不要切換畫面
            //或是menu的時候用鍵盤來決定要不要切畫面
        end
    end 
        //下面map module的變數
    reg [16:0] pixel_addr;
    wire [16:0] map1_addr, map2_addr, map3_addr, map4_addr, map5_addr, menu_addr;
    wire [5:0] map_en = 1<<map;
    wire map1_clear, map2_clear, map3_clear, map4_clear, map5_clear;
        //addr switch
    always @* begin
        if(rst) begin
            pixel_addr = menu_addr;
        end else begin
            //根據map來輸出addr
            case(map)
            0: pixel_addr = menu_addr;
            1: pixel_addr = map1_addr;
            2: pixel_addr = map2_addr;
            3: pixel_addr = map3_addr;
            4: pixel_addr = map4_addr;
            5: pixel_addr = map5_addr;
            default: pixel_addr = menu_addr;
            endcase
        end
    end
    //map choose

    //map modules~~
    map menu(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[0]), 
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(menu_addr), 
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );
    map map1(
        .clk(clk), .rst(rst), 
        .en(map_en[1]), 
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map1_addr), 
        .clear(map1_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );
    map map2(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[2]), 
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map2_addr), 
        .clear(map2_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );
    map map3(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[3]), 
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map3_addr), 
        .clear(map3_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );
    map map4(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[4]), 
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map4_addr), 
        .clear(map4_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );
    map map5(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[5]), 
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map5_addr), 
        .clear(map5_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );

    //pixel
    wire [11:0] data;
    blk_mem_gen_0 blk_mem_gen_0_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr),
        .dina(data[11:0]),
        .douta(pixel)
    ); 
endmodule