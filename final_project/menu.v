module menu(
    input clk, 
    input rst, 
    input en, 
    input [2:0] level,
    input [2:0] map,
    input wire [9:0] vga_h, //640 
    input wire [9:0] vga_v,  //480 
    input [9:0] key_down, 
    output reg [16:0] addr
);
    wire [9:0] v, h;
    assign v = vga_v>>1;
    assign h = vga_h>>1;

    //objs
    wire [16:0] l_btn1_addr, l_btn2_addr, l_btn3_addr, l_btn4_addr, l_btn5_addr;
    wire [16:0]  d_btn1_addr, d_btn2_addr, d_btn3_addr, d_btn4_addr, d_btn5_addr;
    wire [9:0] obj_vga_en;
    light_button l_btn1(
        .pivot_h(150), .pivot_v(40), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(l_btn1_addr), .en(obj_vga_en[0])
    );
    light_button l_btn2(
        .pivot_h(150), .pivot_v(80), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(l_btn2_addr), .en(obj_vga_en[1])
    );
    light_button l_btn3(
        .pivot_h(150), .pivot_v(120), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(l_btn3_addr), .en(obj_vga_en[2])
    );
    light_button l_btn4(
        .pivot_h(150), .pivot_v(160), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(l_btn4_addr), .en(obj_vga_en[3])
    );
    light_button l_btn5(
        .pivot_h(150), .pivot_v(200), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(l_btn5_addr), .en(obj_vga_en[4])
    );
    dark_button d_btn1(
        .pivot_h(148), .pivot_v(40), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(d_btn1_addr), .en(obj_vga_en[5])
    );
    dark_button d_btn2(
        .pivot_h(148), .pivot_v(80), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(d_btn2_addr), .en(obj_vga_en[6])
    );
    dark_button d_btn3(
        .pivot_h(148), .pivot_v(120), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(d_btn3_addr), .en(obj_vga_en[7])
    );
    dark_button d_btn4(
        .pivot_h(148), .pivot_v(160), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(d_btn4_addr), .en(obj_vga_en[8])
    );
    dark_button d_btn5(
        .pivot_h(148), .pivot_v(200), 
        .vga_h(vga_h), .vga_v(vga_v), 
        .addr(d_btn5_addr), .en(obj_vga_en[9])
    );

    always @* begin
        case(map)
        0: begin
            if(obj_vga_en[9]) addr = d_btn5_addr;
            else if(obj_vga_en[0]) addr = l_btn1_addr;
            else if(obj_vga_en[1]) addr = l_btn2_addr;
            else if(obj_vga_en[2]) addr = l_btn3_addr;
            else if(obj_vga_en[3]) addr = l_btn4_addr;
            else addr = 0;
        end
        1: begin
            if(obj_vga_en[8]) addr = d_btn4_addr;
            else if(obj_vga_en[0]) addr = l_btn1_addr;
            else if(obj_vga_en[1]) addr = l_btn2_addr;
            else if(obj_vga_en[2]) addr = l_btn3_addr;
            else if(obj_vga_en[4]) addr = l_btn5_addr;
            else addr = 0;
        end
        2: begin
            if(obj_vga_en[7]) addr = d_btn3_addr;
            else if(obj_vga_en[0]) addr = l_btn1_addr;
            else if(obj_vga_en[1]) addr = l_btn2_addr;
            else if(obj_vga_en[4]) addr = l_btn5_addr;
            else if(obj_vga_en[3]) addr = l_btn4_addr;
            else addr = 0;
        end
        3:  begin
            if(obj_vga_en[6]) addr = d_btn2_addr;
            else if(obj_vga_en[0]) addr = l_btn1_addr;
            else if(obj_vga_en[4]) addr = l_btn5_addr;
            else if(obj_vga_en[2]) addr = l_btn3_addr;
            else if(obj_vga_en[3]) addr = l_btn4_addr;
            else addr = 0;
        end
        4: begin
            if(obj_vga_en[5]) addr = d_btn1_addr;
            else if(obj_vga_en[4]) addr = l_btn5_addr;
            else if(obj_vga_en[1]) addr = l_btn2_addr;
            else if(obj_vga_en[2]) addr = l_btn3_addr;
            else if(obj_vga_en[3]) addr = l_btn4_addr;
            else addr = 0;
        end
        default: addr = 0;
        endcase
    end 

endmodule