module music_viyella (
	input [13:0] ibeatNum,
	output reg [21:0] toneL,
    output reg [21:0] toneR
);
    parameter C3 = 384615;
    parameter D3 = 342465;
    parameter E3 = 304878;
    parameter F3 = 287656;
    parameter G3 = 255102;
    parameter A3 = 227272;
    parameter B3 = 203252;
    parameter A4 = 113636;
    parameter B4 = 101214;
    parameter C4 = 190839;
    parameter D4 = 170068;
    parameter E4 = 151515;
    parameter F4 = 143266;
    parameter G4 = 127551;
    parameter A5 = 56818;
    parameter B5 = 50658;
    parameter C5 = 95602;
    parameter D5 = 85178;
    parameter E5 = 75872;
    parameter F5 = 71633;
    parameter G5 = 63775; 

    always @* begin
        case(ibeatNum) 
        default: toneL = 1;
        endcase
    end

    always @* begin
        case(ibeatNum) 
        default: toneR = 1;
        endcase
    end
endmodule