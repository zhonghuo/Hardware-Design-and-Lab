module map_switch(
    input clk, 
    input rst, 
    inout PS2_DATA, 
    inout PS2_CLK, 
    input wire [9:0] vga_h, //640 
    input wire [9:0] vga_v,  //480 
    output reg [16:0] pixel_addr 
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
    reg [2:0] map = 1;//????{?b?o?O????e??
    reg [2:0] select = 0; //???Uenter?T?w??????d??Aselect = 1
    reg en_key = 1; //??????L?u?|??o?@????????enable

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            map <= 1;
            select <= 0;
            en_key <= 1;
        end
        else begin
            //???map?O?_??Xclear?T????M?w?n???n?????e??
            //??Omenu????????L??M?w?n???n???e??
            if(select == 0) begin
                if(key_down == 0) begin
                    map <= map;
                    en_key <= 1;
                end else begin
                    if(!en_key) begin
                        map <= map;
                        en_key <= en_key;
                    end else begin
                        if(key_down[0] || key_down[4]) begin   
                            if(map < 5) map <= map + 1;
                            else map <= map;
                            en_key <= 0;
                        end
                        else if(key_down[2] || key_down[6]) begin
                            if(map > 1) map <= map - 1;
                            else map <= map;
                            en_key <= 0;
                        end
                        else if(key_down[8]) begin
                            select <= 1;
                            map <= map;
                            en_key <= en_key;
                        end
                    end
                end
            end
            else map <= map;
        end
    end 
        //?U??map module?????
    //reg [16:0] pixel_addr;
    wire [16:0] map1_addr, map2_addr, map3_addr, map4_addr, map5_addr, menu_addr;
    wire [5:0] map_en = 1<<map;
    wire map1_clear, map2_clear, map3_clear, map4_clear, map5_clear;
        //addr switch
    always @* begin
        if(rst) begin
            pixel_addr = menu_addr;
        end else begin
            //???map???Xaddr
            if(!select) begin
                pixel_addr = menu_addr;
            end else begin
                case(map)
                1: pixel_addr = map1_addr;
                2: pixel_addr = map2_addr;
                3: pixel_addr = map3_addr;
                4: pixel_addr = map4_addr;
                5: pixel_addr = map5_addr;
                default: pixel_addr = menu_addr;
                endcase                
            end
        end
    end
    //map choose

    //map modules~~
    map menu(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[0] && !select), 
        .level(3'd0), 
        .map(map),
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(menu_addr), 
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );
    map1 map1(
        .clk(clk), 
        .rst(rst), 
        .en(map_en[1] && select), 
        .level(3'd1), 
        .map(map),
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
        .en(map_en[2] && select), 
        .level(3'd2), 
        .map(map),
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
        .en(map_en[3] && select), 
        .level(3'd3), 
        .map(map),
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
        .en(map_en[4] && select), 
        .level(3'd4), 
        .map(map),
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
        .en(map_en[5] && select), 
        .level(3'd5), 
        .map(map),
        .PS2_CLK(PS2_CLK), 
        .PS2_DATA(PS2_DATA), 
        .addr(map5_addr), 
        .clear(map5_clear),
        .vga_h(vga_h), 
        .vga_v(vga_v)
    );

    //pixel
    wire [11:0] data;

    /*blk_mem_gen_0 blk_mem_gen_0_inst(
        .clka(clk_25MHz),
        .wea(0),
        .addra(pixel_addr),
        .dina(data[11:0]),
        .douta(pixel)
    );*/
endmodule