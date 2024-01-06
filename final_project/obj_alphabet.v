module abc(
    //addr is the index of mem
    //en indicate that screen should output this object
    output wire [15:0] addr, 
    output reg en,
    input wire [9:0] vga_h,
    input wire [9:0] vga_v,
    input wire [9:0] mem_pivot_h,
    input wire [9:0] mem_pivot_v,
    input wire [9:0] pivot_h,
    input wire [9:0] pivot_v,
    input wire [9:0] width,
    input wire [9:0] height
);

    wire [9:0] h, v;
    wire [10:0] tmp_h, tmp_v;
    assign tmp_h = vga_h*3;
    assign tmp_v = vga_v*3;
    assign h = tmp_h>>3;
    assign v = tmp_v>>3;

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
    assign addr = disp_h + mem_pivot_h + 240*(disp_v + mem_pivot_v);

endmodule