module light_button(
    input [9:0] pivot_h, pivot_v,
    input [9:0] vga_v, vga_h,
    output wire [16:0] addr, 
    output reg en //to indicate that screen should print the object
);
    //props
    /*wire [9:0] width, height, mem_pivot_h, mem_pivot_v;
    assign width = 21;
    assign height = 26;
    assign mem_pivot_h = 0;
    assign mem_pivot_v = 1;

    wire [9:0] h, v;
    assign v = vga_v>>1;
    assign h = vga_h>>1;
    reg [9:0] disp_h, disp_v;
    always @* begin
        if(v-pivot_v>=0 && v-pivot_v<height && h-pivot_h>=0 && h-pivot_h<width) begin
            en = 1;
            disp_h = h-pivot_h;
            disp_v = v-pivot_v;
        end else begin
            en = 0;
            disp_h = 0;
            disp_v = 0;
        end
    end
    assign addr = disp_h+mem_pivot_h+320*(disp_v+mem_pivot_v);*/
endmodule