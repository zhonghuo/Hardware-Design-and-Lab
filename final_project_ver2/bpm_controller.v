module bpm_controller #(
    parameter bpm = 60
)(
    input wire  clk,
    output reg clk_out  
);

    reg [32:0] num;
    reg  [32:0] next_num;
    
    always @(posedge clk) begin
        num <= next_num;
    end

    always @(posedge clk) begin
        if(num == (100000000*30/bpm)-1) clk_out <= ~clk_out;
        else clk_out <= clk_out;
    end

    always @* begin
        if(num == (100000000*30/bpm)-1) next_num = 0;
        else next_num = num+1;
    end
    
endmodule