module music_viyella (
	input [13:0] ibeatNum,
	output reg [21:0] toneL,
    output reg [21:0] toneR
);
    parameter C1 = 1562500;
    parameter Csharp1 = 1470588;
    parameter Dflat1 = 1470588;
    parameter D1 = 1388889;
    parameter Dsharp1 = 1315789;
    parameter Eflat1 = 1315789;
    parameter E1 = 1219512;
    parameter F1 = 1162791;
    parameter Fsharp1 = 1086957;
    parameter Gflat1 = 1086956;
    parameter G1 = 1020408;
    parameter Gsharp1 = 980392;
    parameter Aflat1 = 980392;
    parameter A1 = 909091;
    parameter Asharp1 = 862069;
    parameter Bflat1 = 862068;
    parameter B1 = 819672;

    parameter C2 = 781250;      // C2???W?v
    parameter Csharp2 = 735294; // C#2/Db2???W?v
    parameter Dflat2 = 735294;  // D?2???W?v
    parameter D2 = 694444;      // D2???W?v
    parameter Dsharp2 = 657895; // D#2/Eb2???W?v
    parameter Eflat2 = 657895;  // E?2???W?v
    parameter E2 = 609756;      // E2???W?v
    parameter F2 = 581395;      // F2???W?v
    parameter Fsharp2 = 543478; // F#2/Gb2???W?v
    parameter Gflat2 = 543477;  // G?2???W?v
    parameter G2 = 510204;      // G2???W?v
    parameter Gsharp2 = 490196; // G#2/Ab2???W?v
    parameter Aflat2 = 490196;  // A?2???W?v
    parameter A2 = 454545;      // A2???W?v
    parameter Asharp2 = 431034; // A#2/Bb2???W?v
    parameter Bflat2 = 431034;  // B?2???W?v
    parameter B2 = 409836;      // B2???W?v
    
    parameter C3 = 390625;      // C3???W?v
    parameter Csharp3 = 367647; // C#3/Db3???W?v
    parameter Dflat3 = 367647;  // D?3???W?v
    parameter D3 = 347222;      // D3???W?v
    parameter Dsharp3 = 328947; // D#3/Eb3???W?v
    parameter Eflat3 = 328947;  // E?3???W?v
    parameter E3 = 304878;      // E3???W?v
    parameter F3 = 290323;      // F3???W?v
    parameter Fsharp3 = 271739; // F#3/Gb3???W?v
    parameter Gflat3 = 271738;  // G?3???W?v
    parameter G3 = 255102;      // G3???W?v
    parameter Gsharp3 = 245098; // G#3/Ab3???W?v
    parameter Aflat3 = 245098;  // A?3???W?v
    parameter A3 = 227273;      // A3???W?v
    parameter Asharp3 = 215517; // A#3/Bb3???W?v
    parameter Bflat3 = 215517;  // B?3???W?v
    parameter B3 = 204918;      // B3???W?v

    parameter C4 = 195312;      // C4???W?v
    parameter Csharp4 = 183824; // C#4/Db4???W?v
    parameter Dflat4 = 183824;  // D?4???W?v
    parameter D4 = 173611;      // D4???W?v
    parameter Dsharp4 = 164474; // D#4/Eb4???W?v
    parameter Eflat4 = 164474;  // E?4???W?v
    parameter E4 = 152439;      // E4???W?v
    parameter F4 = 145161;      // F4???W?v
    parameter Fsharp4 = 135870; // F#4/Gb4???W?v
    parameter Gflat4 = 135869;  // G?4???W?v
    parameter G4 = 127551;      // G4???W?v
    parameter Gsharp4 = 122549; // G#4/Ab4???W?v
    parameter Aflat4 = 122549;  // A?4???W?v
    parameter A4 = 113636;      // A4???W?v?]??????G440 Hz?^
    parameter Asharp4 = 107759; // A#4/Bb4???W?v
    parameter Bflat4 = 107759;  // B?4???W?v
    parameter B4 = 102459;      // B4???W?v

    parameter C5 = 97656;       // C5???W?v
    parameter Csharp5 = 91954;  // C#5/Db5???W?v
    parameter Dflat5 = 91954;   // D?5???W?v
    parameter D5 = 86806;       // D5???W?v
    parameter Dsharp5 = 82237;  // D#5/Eb5???W?v
    parameter Eflat5 = 82237;   // E?5???W?v
    parameter E5 = 76220;       // E5???W?v
    parameter F5 = 72581;       // F5???W?v
    parameter Fsharp5 = 67935;  // F#5/Gb5???W?v
    parameter Gflat5 = 67934;   // G?5???W?v
    parameter G5 = 63776;       // G5???W?v
    parameter Gsharp5 = 61275;  // G#5/Ab5???W?v
    parameter Aflat5 = 61275;   // A?5???W?v
    parameter A5 = 56818;       // A5???W?v
    parameter Asharp5 = 53880;  // A#5/Bb5???W?v
    parameter Bflat5 = 53880;   // B?5???W?v
    parameter B5 = 51229;       // B5???W?v

    parameter C6 = 48828;       // C6???W?v
    parameter Csharp6 = 45977;  // C#6/Db6???W?v
    parameter Dflat6 = 45977;   // D?6???W?v
    parameter D6 = 43403;       // D6???W?v
    parameter Dsharp6 = 41118;  // D#6/Eb6???W?v
    parameter Eflat6 = 41118;   // E?6???W?v
    parameter E6 = 38110;       // E6???W?v
    parameter F6 = 36290;       // F6???W?v
    parameter Fsharp6 = 33968;  // F#6/Gb6???W?v
    parameter Gflat6 = 33968;   // G?6???W?v
    parameter G6 = 31888;       // G6???W?v
    parameter Gsharp6 = 30638;  // G#6/Ab6???W?v
    parameter Aflat6 = 30638;   // A?6???W?v
    parameter A6 = 28409;       // A6???W?v
    parameter Asharp6 = 26940;  // A#6/Bb6???W?v
    parameter Bflat6 = 26940;   // B?6???W?v
    parameter B6 = 25614;       // B6???W?v

    parameter C7 = 23851;
    parameter Csharp7 = 22548;
    parameter Dflat7 = 22548;
    parameter D7 = 21304;
    parameter Dsharp7 = 20202;
    parameter Eflat7 = 20202;
    parameter E7 = 18937;
    parameter F7 = 17878;
    parameter Fsharp7 = 16909;
    parameter Gflat7 = 16909;
    parameter G7 = 15942;
    parameter Gsharp7 = 15088;
    parameter Aflat7 = 15088;
    parameter A7 = 14191;
    parameter Asharp7 = 13414;
    parameter Bflat7 = 13414;
    parameter B7 = 12667;

    always @* begin
        case(ibeatNum) 
/*measure 1 */
14'd0 : toneL = 1; 14'd1 : toneL = 1; 14'd2 : toneL = 1; 14'd3 : toneL = 1;
14'd4 : toneL = 1; 14'd5 : toneL = 1; 14'd6 : toneL = 1; 14'd7 : toneL = 1;
14'd8 : toneL = 1; 14'd9 : toneL = 1; 14'd10 : toneL = 1; 14'd11 : toneL = 1;
14'd12 : toneL = 1; 14'd13 : toneL = 1; 14'd14 : toneL = 1; 14'd15 : toneL = 1;
14'd16 : toneL = 1; 14'd17 : toneL = 1; 14'd18 : toneL = 1; 14'd19 : toneL = 1;
14'd20 : toneL = 1; 14'd21 : toneL = 1; 14'd22 : toneL = 1; 14'd23 : toneL = 1;
14'd24 : toneL = 1; 14'd25 : toneL = 1; 14'd26 : toneL = 1; 14'd27 : toneL = 1;
14'd28 : toneL = 1; 14'd29 : toneL = 1; 14'd30 : toneL = 1; 14'd31 : toneL = 1;
14'd32 : toneL = 1; 14'd33 : toneL = 1; 14'd34 : toneL = 1; 14'd35 : toneL = 1;
14'd36 : toneL = 1; 14'd37 : toneL = 1; 14'd38 : toneL = 1; 14'd39 : toneL = 1;
14'd40 : toneL = 1; 14'd41 : toneL = 1; 14'd42 : toneL = 1; 14'd43 : toneL = 1;
14'd44 : toneL = 1; 14'd45 : toneL = 1; 14'd46 : toneL = 1; 14'd47 : toneL = 1;
14'd48 : toneL = 1; 14'd49 : toneL = 1; 14'd50 : toneL = 1; 14'd51 : toneL = 1;
14'd52 : toneL = 1; 14'd53 : toneL = 1; 14'd54 : toneL = 1; 14'd55 : toneL = 1;
14'd56 : toneL = 1; 14'd57 : toneL = 1; 14'd58 : toneL = 1; 14'd59 : toneL = 1;
14'd60 : toneL = 1; 14'd61 : toneL = 1; 14'd62 : toneL = 1; 14'd63 : toneL = 1;
        default: toneL = 1;
        endcase
    end

    always @* begin
        case(ibeatNum) 
/*measure 1 */
14'd0 : toneR = 1; 14'd1 : toneR = 1; 14'd2 : toneR = 1; 14'd3 : toneR = 1;
14'd4 : toneR = 1; 14'd5 : toneR = 1; 14'd6 : toneR = 1; 14'd7 : toneR = 1;
14'd8 : toneR = 1; 14'd9 : toneR = 1; 14'd10 : toneR = 1; 14'd11 : toneR = 1;
14'd12 : toneR = 1; 14'd13 : toneR = 1; 14'd14 : toneR = 1; 14'd15 : toneR = 1;
14'd16 : toneR = 1; 14'd17 : toneR = 1; 14'd18 : toneR = 1; 14'd19 : toneR = 1;
14'd20 : toneR = 1; 14'd21 : toneR = 1; 14'd22 : toneR = 1; 14'd23 : toneR = 1;
14'd24 : toneR = 1; 14'd25 : toneR = 1; 14'd26 : toneR = 1; 14'd27 : toneR = 1;
14'd28 : toneR = 1; 14'd29 : toneR = 1; 14'd30 : toneR = 1; 14'd31 : toneR = 1;
14'd32 : toneR = 1; 14'd33 : toneR = 1; 14'd34 : toneR = 1; 14'd35 : toneR = 1;
14'd36 : toneR = 1; 14'd37 : toneR = 1; 14'd38 : toneR = 1; 14'd39 : toneR = 1;
14'd40 : toneR = 1; 14'd41 : toneR = 1; 14'd42 : toneR = 1; 14'd43 : toneR = 1;
14'd44 : toneR = 1; 14'd45 : toneR = 1; 14'd46 : toneR = 1; 14'd47 : toneR = 1;
14'd48 : toneR = 1; 14'd49 : toneR = 1; 14'd50 : toneR = 1; 14'd51 : toneR = 1;
14'd52 : toneR = 1; 14'd53 : toneR = 1; 14'd54 : toneR = 1; 14'd55 : toneR = 1;
14'd56 : toneR = 1; 14'd57 : toneR = 1; 14'd58 : toneR = 1; 14'd59 : toneR = 1;
14'd60 : toneR = 1; 14'd61 : toneR = 1; 14'd62 : toneR = 1; 14'd63 : toneR = 1;
        default: toneR = 1;
        endcase
    end
endmodule