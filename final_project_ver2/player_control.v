module player_control (
	input clk, 
	input rst, 
    input en,
	output reg [13:0] ibeat
);
	parameter LEN = 14656;

	always @(posedge clk, posedge rst) begin
		if (rst) begin
			ibeat <= 0;
        end else if(!en) ibeat <= 0;
		else begin
            if(ibeat == LEN-1) ibeat <= 0;
            else ibeat <= ibeat + 1;
		end
	end
    

endmodule
