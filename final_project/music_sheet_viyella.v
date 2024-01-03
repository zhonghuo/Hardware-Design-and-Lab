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

    parameter C2 = 781250;      // C2的頻率
    parameter Csharp2 = 735294; // C#2/Db2的頻率
    parameter Dflat2 = 735294;  // D♭2的頻率
    parameter D2 = 694444;      // D2的頻率
    parameter Dsharp2 = 657895; // D#2/Eb2的頻率
    parameter Eflat2 = 657895;  // E♭2的頻率
    parameter E2 = 609756;      // E2的頻率
    parameter F2 = 581395;      // F2的頻率
    parameter Fsharp2 = 543478; // F#2/Gb2的頻率
    parameter Gflat2 = 543477;  // G♭2的頻率
    parameter G2 = 510204;      // G2的頻率
    parameter Gsharp2 = 490196; // G#2/Ab2的頻率
    parameter Aflat2 = 490196;  // A♭2的頻率
    parameter A2 = 454545;      // A2的頻率
    parameter Asharp2 = 431034; // A#2/Bb2的頻率
    parameter Bflat2 = 431034;  // B♭2的頻率
    parameter B2 = 409836;      // B2的頻率
    
    parameter C3 = 390625;      // C3的頻率
    parameter Csharp3 = 367647; // C#3/Db3的頻率
    parameter Dflat3 = 367647;  // D♭3的頻率
    parameter D3 = 347222;      // D3的頻率
    parameter Dsharp3 = 328947; // D#3/Eb3的頻率
    parameter Eflat3 = 328947;  // E♭3的頻率
    parameter E3 = 304878;      // E3的頻率
    parameter F3 = 290323;      // F3的頻率
    parameter Fsharp3 = 271739; // F#3/Gb3的頻率
    parameter Gflat3 = 271738;  // G♭3的頻率
    parameter G3 = 255102;      // G3的頻率
    parameter Gsharp3 = 245098; // G#3/Ab3的頻率
    parameter Aflat3 = 245098;  // A♭3的頻率
    parameter A3 = 227273;      // A3的頻率
    parameter Asharp3 = 215517; // A#3/Bb3的頻率
    parameter Bflat3 = 215517;  // B♭3的頻率
    parameter B3 = 204918;      // B3的頻率

    parameter C4 = 195312;      // C4的頻率
    parameter Csharp4 = 183824; // C#4/Db4的頻率
    parameter Dflat4 = 183824;  // D♭4的頻率
    parameter D4 = 173611;      // D4的頻率
    parameter Dsharp4 = 164474; // D#4/Eb4的頻率
    parameter Eflat4 = 164474;  // E♭4的頻率
    parameter E4 = 152439;      // E4的頻率
    parameter F4 = 145161;      // F4的頻率
    parameter Fsharp4 = 135870; // F#4/Gb4的頻率
    parameter Gflat4 = 135869;  // G♭4的頻率
    parameter G4 = 127551;      // G4的頻率
    parameter Gsharp4 = 122549; // G#4/Ab4的頻率
    parameter Aflat4 = 122549;  // A♭4的頻率
    parameter A4 = 113636;      // A4的頻率（標準調音：440 Hz）
    parameter Asharp4 = 107759; // A#4/Bb4的頻率
    parameter Bflat4 = 107759;  // B♭4的頻率
    parameter B4 = 102459;      // B4的頻率

    parameter C5 = 97656;       // C5的頻率
    parameter Csharp5 = 91954;  // C#5/Db5的頻率
    parameter Dflat5 = 91954;   // D♭5的頻率
    parameter D5 = 86806;       // D5的頻率
    parameter Dsharp5 = 82237;  // D#5/Eb5的頻率
    parameter Eflat5 = 82237;   // E♭5的頻率
    parameter E5 = 76220;       // E5的頻率
    parameter F5 = 72581;       // F5的頻率
    parameter Fsharp5 = 67935;  // F#5/Gb5的頻率
    parameter Gflat5 = 67934;   // G♭5的頻率
    parameter G5 = 63776;       // G5的頻率
    parameter Gsharp5 = 61275;  // G#5/Ab5的頻率
    parameter Aflat5 = 61275;   // A♭5的頻率
    parameter A5 = 56818;       // A5的頻率
    parameter Asharp5 = 53880;  // A#5/Bb5的頻率
    parameter Bflat5 = 53880;   // B♭5的頻率
    parameter B5 = 51229;       // B5的頻率

    parameter C6 = 48828;       // C6的頻率
    parameter Csharp6 = 45977;  // C#6/Db6的頻率
    parameter Dflat6 = 45977;   // D♭6的頻率
    parameter D6 = 43403;       // D6的頻率
    parameter Dsharp6 = 41118;  // D#6/Eb6的頻率
    parameter Eflat6 = 41118;   // E♭6的頻率
    parameter E6 = 38110;       // E6的頻率
    parameter F6 = 36290;       // F6的頻率
    parameter Fsharp6 = 33968;  // F#6/Gb6的頻率
    parameter Gflat6 = 33968;   // G♭6的頻率
    parameter G6 = 31888;       // G6的頻率
    parameter Gsharp6 = 30638;  // G#6/Ab6的頻率
    parameter Aflat6 = 30638;   // A♭6的頻率
    parameter A6 = 28409;       // A6的頻率
    parameter Asharp6 = 26940;  // A#6/Bb6的頻率
    parameter Bflat6 = 26940;   // B♭6的頻率
    parameter B6 = 25614;       // B6的頻率

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
        /*measure 2 */
14'd64 : toneL = C1; 14'd65 : toneL = C1; 14'd66 : toneL = C1; 14'd67 : toneL = 1;
14'd68 : toneL = C2; 14'd69 : toneL = C2; 14'd70 : toneL = C2; 14'd71 : toneL = 1;
14'd72 : toneL = C1; 14'd73 : toneL = C1; 14'd74 : toneL = C1; 14'd75 : toneL = 1;
14'd76 : toneL = C2; 14'd77 : toneL = C2; 14'd78 : toneL = C2; 14'd79 : toneL = 1;
14'd80 : toneL = C1; 14'd81 : toneL = C1; 14'd82 : toneL = C1; 14'd83 : toneL = 1;
14'd84 : toneL = C2; 14'd85 : toneL = C2; 14'd86 : toneL = C2; 14'd87 : toneL = 1;
14'd88 : toneL = C1; 14'd89 : toneL = C1; 14'd90 : toneL = C1; 14'd91 : toneL = 1;
14'd92 : toneL = C2; 14'd93 : toneL = C2; 14'd94 : toneL = C2; 14'd95 : toneL = 1;
14'd96 : toneL = C1; 14'd97 : toneL = C1; 14'd98 : toneL = C1; 14'd99 : toneL = 1;
14'd100 : toneL = C2; 14'd101 : toneL = C2; 14'd102 : toneL = C2; 14'd103 : toneL = 1;
14'd104 : toneL = C1; 14'd105 : toneL = C1; 14'd106 : toneL = C1; 14'd107 : toneL = 1;
14'd108 : toneL = C2; 14'd109 : toneL = C2; 14'd110 : toneL = C2; 14'd111 : toneL = 1;
14'd112 : toneL = C1; 14'd113 : toneL = C1; 14'd114 : toneL = C1; 14'd115 : toneL = 1;
14'd116 : toneL = C2; 14'd117 : toneL = C2; 14'd118 : toneL = C2; 14'd119 : toneL = 1;
14'd120 : toneL = C1; 14'd121 : toneL = C1; 14'd122 : toneL = C1; 14'd123 : toneL = 1;
14'd124 : toneL = C2; 14'd125 : toneL = C2; 14'd126 : toneL = C2; 14'd127 : toneL = 1;
/*measure 3 */
14'd128 : toneL = F1; 14'd129 : toneL = F1; 14'd130 : toneL = F1; 14'd131 : toneL = F1;
14'd132 : toneL = F1; 14'd133 : toneL = F1; 14'd134 : toneL = F1; 14'd135 : toneL = F1;
14'd136 : toneL = F1; 14'd137 : toneL = F1; 14'd138 : toneL = F1; 14'd139 : toneL = F1;
14'd140 : toneL = F1; 14'd141 : toneL = F1; 14'd142 : toneL = F1; 14'd143 : toneL = F1;
14'd144 : toneL = F1; 14'd145 : toneL = F1; 14'd146 : toneL = F1; 14'd147 : toneL = F1;
14'd148 : toneL = F1; 14'd149 : toneL = F1; 14'd150 : toneL = F1; 14'd151 : toneL = F1;
14'd152 : toneL = F1; 14'd153 : toneL = F1; 14'd154 : toneL = F1; 14'd155 : toneL = F1;
14'd156 : toneL = F1; 14'd157 : toneL = F1; 14'd158 : toneL = F1; 14'd159 : toneL = 1;
14'd160 : toneL = Aflat5; 14'd161 : toneL = Aflat5; 14'd162 : toneL = Aflat5; 14'd163 : toneL = Aflat5;
14'd164 : toneL = Aflat5; 14'd165 : toneL = Aflat5; 14'd166 : toneL = Aflat5; 14'd167 : toneL = Aflat5;
14'd168 : toneL = Aflat5; 14'd169 : toneL = Aflat5; 14'd170 : toneL = Aflat5; 14'd171 : toneL = Aflat5;
14'd172 : toneL = Aflat5; 14'd173 : toneL = Aflat5; 14'd174 : toneL = Aflat5; 14'd175 : toneL = Aflat5;
14'd176 : toneL = Aflat5; 14'd177 : toneL = Aflat5; 14'd178 : toneL = Aflat5; 14'd179 : toneL = Aflat5;
14'd180 : toneL = Aflat5; 14'd181 : toneL = Aflat5; 14'd182 : toneL = Aflat5; 14'd183 : toneL = Aflat5;
14'd184 : toneL = Aflat5; 14'd185 : toneL = Aflat5; 14'd186 : toneL = Aflat5; 14'd187 : toneL = Aflat5;
14'd188 : toneL = Aflat5; 14'd189 : toneL = Aflat5; 14'd190 : toneL = Aflat5; 14'd191 : toneL = 1;
/*measure 4 */
14'd192 : toneL = F6; 14'd193 : toneL = F6; 14'd194 : toneL = F6; 14'd195 : toneL = F6;
14'd196 : toneL = F6; 14'd197 : toneL = F6; 14'd198 : toneL = F6; 14'd199 : toneL = F6;
14'd200 : toneL = F6; 14'd201 : toneL = F6; 14'd202 : toneL = F6; 14'd203 : toneL = F6;
14'd204 : toneL = F6; 14'd205 : toneL = F6; 14'd206 : toneL = F6; 14'd207 : toneL = F6;
14'd208 : toneL = F6; 14'd209 : toneL = F6; 14'd210 : toneL = F6; 14'd211 : toneL = F6;
14'd212 : toneL = F6; 14'd213 : toneL = F6; 14'd214 : toneL = F6; 14'd215 : toneL = F6;
14'd216 : toneL = F6; 14'd217 : toneL = F6; 14'd218 : toneL = F6; 14'd219 : toneL = F6;
14'd220 : toneL = F6; 14'd221 : toneL = F6; 14'd222 : toneL = F6; 14'd223 : toneL = F6;
14'd224 : toneL = F6; 14'd225 : toneL = F6; 14'd226 : toneL = F6; 14'd227 : toneL = F6;
14'd228 : toneL = F6; 14'd229 : toneL = F6; 14'd230 : toneL = F6; 14'd231 : toneL = F6;
14'd232 : toneL = F6; 14'd233 : toneL = F6; 14'd234 : toneL = F6; 14'd235 : toneL = F6;
14'd236 : toneL = F6; 14'd237 : toneL = F6; 14'd238 : toneL = F6; 14'd239 : toneL = F6;
14'd240 : toneL = F6; 14'd241 : toneL = F6; 14'd242 : toneL = F6; 14'd243 : toneL = F6;
14'd244 : toneL = F6; 14'd245 : toneL = F6; 14'd246 : toneL = F6; 14'd247 : toneL = F6;
14'd248 : toneL = F6; 14'd249 : toneL = F6; 14'd250 : toneL = F6; 14'd251 : toneL = F6;
14'd252 : toneL = F6; 14'd253 : toneL = F6; 14'd254 : toneL = F6; 14'd255 : toneL = 1;
/*measure 5 */
14'd256 : toneL = Eflat2; 14'd257 : toneL = Eflat2; 14'd258 : toneL = Eflat2; 14'd259 : toneL = Eflat2;
14'd260 : toneL = Eflat2; 14'd261 : toneL = Eflat2; 14'd262 : toneL = Eflat2; 14'd263 : toneL = Eflat2;
14'd264 : toneL = Eflat2; 14'd265 : toneL = Eflat2; 14'd266 : toneL = Eflat2; 14'd267 : toneL = Eflat2;
14'd268 : toneL = Eflat2; 14'd269 : toneL = Eflat2; 14'd270 : toneL = Eflat2; 14'd271 : toneL = Eflat2;
14'd272 : toneL = Eflat2; 14'd273 : toneL = Eflat2; 14'd274 : toneL = Eflat2; 14'd275 : toneL = Eflat2;
14'd276 : toneL = Eflat2; 14'd277 : toneL = Eflat2; 14'd278 : toneL = Eflat2; 14'd279 : toneL = Eflat2;
14'd280 : toneL = Eflat2; 14'd281 : toneL = Eflat2; 14'd282 : toneL = Eflat2; 14'd283 : toneL = Eflat2;
14'd284 : toneL = Eflat2; 14'd285 : toneL = Eflat2; 14'd286 : toneL = Eflat2; 14'd287 : toneL = 1;
14'd288 : toneL = Eflat4; 14'd289 : toneL = Eflat4; 14'd290 : toneL = Eflat4; 14'd291 : toneL = Eflat4;
14'd292 : toneL = Eflat4; 14'd293 : toneL = Eflat4; 14'd294 : toneL = Eflat4; 14'd295 : toneL = Eflat4;
14'd296 : toneL = Eflat4; 14'd297 : toneL = Eflat4; 14'd298 : toneL = Eflat4; 14'd299 : toneL = Eflat4;
14'd300 : toneL = Eflat4; 14'd301 : toneL = Eflat4; 14'd302 : toneL = Eflat4; 14'd303 : toneL = Eflat4;
14'd304 : toneL = Eflat4; 14'd305 : toneL = Eflat4; 14'd306 : toneL = Eflat4; 14'd307 : toneL = Eflat4;
14'd308 : toneL = Eflat4; 14'd309 : toneL = Eflat4; 14'd310 : toneL = Eflat4; 14'd311 : toneL = Eflat4;
14'd312 : toneL = Eflat4; 14'd313 : toneL = Eflat4; 14'd314 : toneL = Eflat4; 14'd315 : toneL = Eflat4;
14'd316 : toneL = Eflat4; 14'd317 : toneL = Eflat4; 14'd318 : toneL = Eflat4; 14'd319 : toneL = 1;
/*measure 6 */
14'd320 : toneL = F6; 14'd321 : toneL = F6; 14'd322 : toneL = F6; 14'd323 : toneL = F6;
14'd324 : toneL = F6; 14'd325 : toneL = F6; 14'd326 : toneL = F6; 14'd327 : toneL = 1;
14'd328 : toneL = Eflat4; 14'd329 : toneL = Eflat4; 14'd330 : toneL = Eflat4; 14'd331 : toneL = Eflat4;
14'd332 : toneL = Eflat4; 14'd333 : toneL = Eflat4; 14'd334 : toneL = Eflat4; 14'd335 : toneL = 1;
14'd336 : toneL = F4; 14'd337 : toneL = F4; 14'd338 : toneL = F4; 14'd339 : toneL = F4;
14'd340 : toneL = F4; 14'd341 : toneL = F4; 14'd342 : toneL = F4; 14'd343 : toneL = 1;
14'd344 : toneL = C4; 14'd345 : toneL = C4; 14'd346 : toneL = C4; 14'd347 : toneL = C4;
14'd348 : toneL = C4; 14'd349 : toneL = C4; 14'd350 : toneL = C4; 14'd351 : toneL = 1;
14'd352 : toneL = F4; 14'd353 : toneL = F4; 14'd354 : toneL = F4; 14'd355 : toneL = F4;
14'd356 : toneL = F4; 14'd357 : toneL = F4; 14'd358 : toneL = F4; 14'd359 : toneL = 1;
14'd360 : toneL = Aflat4; 14'd361 : toneL = Aflat4; 14'd362 : toneL = Aflat4; 14'd363 : toneL = Aflat4;
14'd364 : toneL = Aflat4; 14'd365 : toneL = Aflat4; 14'd366 : toneL = Aflat4; 14'd367 : toneL = 1;
14'd368 : toneL = G4; 14'd369 : toneL = G4; 14'd370 : toneL = G4; 14'd371 : toneL = G4;
14'd372 : toneL = G4; 14'd373 : toneL = G4; 14'd374 : toneL = G4; 14'd375 : toneL = 1;
14'd376 : toneL = Eflat4; 14'd377 : toneL = Eflat4; 14'd378 : toneL = Eflat4; 14'd379 : toneL = Eflat4;
14'd380 : toneL = Eflat4; 14'd381 : toneL = Eflat4; 14'd382 : toneL = Eflat4; 14'd383 : toneL = 1;
/*measure 7 */
14'd384 : toneL = D2; 14'd385 : toneL = D2; 14'd386 : toneL = D2; 14'd387 : toneL = D2;
14'd388 : toneL = D2; 14'd389 : toneL = D2; 14'd390 : toneL = D2; 14'd391 : toneL = D2;
14'd392 : toneL = D2; 14'd393 : toneL = D2; 14'd394 : toneL = D2; 14'd395 : toneL = D2;
14'd396 : toneL = D2; 14'd397 : toneL = D2; 14'd398 : toneL = D2; 14'd399 : toneL = D2;
14'd400 : toneL = D2; 14'd401 : toneL = D2; 14'd402 : toneL = D2; 14'd403 : toneL = D2;
14'd404 : toneL = D2; 14'd405 : toneL = D2; 14'd406 : toneL = D2; 14'd407 : toneL = D2;
14'd408 : toneL = D2; 14'd409 : toneL = D2; 14'd410 : toneL = D2; 14'd411 : toneL = D2;
14'd412 : toneL = D2; 14'd413 : toneL = D2; 14'd414 : toneL = D2; 14'd415 : toneL = 1;
14'd416 : toneL = F4; 14'd417 : toneL = F4; 14'd418 : toneL = F4; 14'd419 : toneL = F4;
14'd420 : toneL = F4; 14'd421 : toneL = F4; 14'd422 : toneL = F4; 14'd423 : toneL = F4;
14'd424 : toneL = F4; 14'd425 : toneL = F4; 14'd426 : toneL = F4; 14'd427 : toneL = F4;
14'd428 : toneL = F4; 14'd429 : toneL = F4; 14'd430 : toneL = F4; 14'd431 : toneL = F4;
14'd432 : toneL = F4; 14'd433 : toneL = F4; 14'd434 : toneL = F4; 14'd435 : toneL = F4;
14'd436 : toneL = F4; 14'd437 : toneL = F4; 14'd438 : toneL = F4; 14'd439 : toneL = F4;
14'd440 : toneL = F4; 14'd441 : toneL = F4; 14'd442 : toneL = F4; 14'd443 : toneL = F4;
14'd444 : toneL = F4; 14'd445 : toneL = F4; 14'd446 : toneL = F4; 14'd447 : toneL = 1;
/*measure 8 */
14'd448 : toneL = F6; 14'd449 : toneL = F6; 14'd450 : toneL = F6; 14'd451 : toneL = F6;
14'd452 : toneL = F6; 14'd453 : toneL = F6; 14'd454 : toneL = F6; 14'd455 : toneL = 1;
14'd456 : toneL = Eflat4; 14'd457 : toneL = Eflat4; 14'd458 : toneL = Eflat4; 14'd459 : toneL = Eflat4;
14'd460 : toneL = Eflat4; 14'd461 : toneL = Eflat4; 14'd462 : toneL = Eflat4; 14'd463 : toneL = 1;
14'd464 : toneL = F4; 14'd465 : toneL = F4; 14'd466 : toneL = F4; 14'd467 : toneL = F4;
14'd468 : toneL = F4; 14'd469 : toneL = F4; 14'd470 : toneL = F4; 14'd471 : toneL = 1;
14'd472 : toneL = C4; 14'd473 : toneL = C4; 14'd474 : toneL = C4; 14'd475 : toneL = C4;
14'd476 : toneL = C4; 14'd477 : toneL = C4; 14'd478 : toneL = C4; 14'd479 : toneL = 1;
14'd480 : toneL = F4; 14'd481 : toneL = F4; 14'd482 : toneL = F4; 14'd483 : toneL = F4;
14'd484 : toneL = F4; 14'd485 : toneL = F4; 14'd486 : toneL = F4; 14'd487 : toneL = 1;
14'd488 : toneL = C4; 14'd489 : toneL = C4; 14'd490 : toneL = C4; 14'd491 : toneL = C4;
14'd492 : toneL = C4; 14'd493 : toneL = C4; 14'd494 : toneL = C4; 14'd495 : toneL = 1;
14'd496 : toneL = Eflat4; 14'd497 : toneL = Eflat4; 14'd498 : toneL = Eflat4; 14'd499 : toneL = Eflat4;
14'd500 : toneL = Eflat4; 14'd501 : toneL = Eflat4; 14'd502 : toneL = Eflat4; 14'd503 : toneL = 1;
14'd504 : toneL = F4; 14'd505 : toneL = F4; 14'd506 : toneL = F4; 14'd507 : toneL = F4;
14'd508 : toneL = F4; 14'd509 : toneL = F4; 14'd510 : toneL = F4; 14'd511 : toneL = 1;
/*measure 9 */
14'd512 : toneL = Dflat2; 14'd513 : toneL = Dflat2; 14'd514 : toneL = Dflat2; 14'd515 : toneL = Dflat2;
14'd516 : toneL = Dflat2; 14'd517 : toneL = Dflat2; 14'd518 : toneL = Dflat2; 14'd519 : toneL = Dflat2;
14'd520 : toneL = Dflat2; 14'd521 : toneL = Dflat2; 14'd522 : toneL = Dflat2; 14'd523 : toneL = Dflat2;
14'd524 : toneL = Dflat2; 14'd525 : toneL = Dflat2; 14'd526 : toneL = Dflat2; 14'd527 : toneL = Dflat2;
14'd528 : toneL = Dflat2; 14'd529 : toneL = Dflat2; 14'd530 : toneL = Dflat2; 14'd531 : toneL = Dflat2;
14'd532 : toneL = Dflat2; 14'd533 : toneL = Dflat2; 14'd534 : toneL = Dflat2; 14'd535 : toneL = Dflat2;
14'd536 : toneL = Dflat2; 14'd537 : toneL = Dflat2; 14'd538 : toneL = Dflat2; 14'd539 : toneL = Dflat2;
14'd540 : toneL = Dflat2; 14'd541 : toneL = Dflat2; 14'd542 : toneL = Dflat2; 14'd543 : toneL = 1;
14'd544 : toneL = F4; 14'd545 : toneL = F4; 14'd546 : toneL = F4; 14'd547 : toneL = F4;
14'd548 : toneL = F4; 14'd549 : toneL = F4; 14'd550 : toneL = F4; 14'd551 : toneL = 1;
14'd552 : toneL = F5; 14'd553 : toneL = F5; 14'd554 : toneL = F5; 14'd555 : toneL = F5;
14'd556 : toneL = F5; 14'd557 : toneL = F5; 14'd558 : toneL = F5; 14'd559 : toneL = 1;
14'd560 : toneL = Aflat5; 14'd561 : toneL = Aflat5; 14'd562 : toneL = Aflat5; 14'd563 : toneL = Aflat5;
14'd564 : toneL = Aflat5; 14'd565 : toneL = Aflat5; 14'd566 : toneL = Aflat5; 14'd567 : toneL = 1;
14'd568 : toneL = Dflat6; 14'd569 : toneL = Dflat6; 14'd570 : toneL = Dflat6; 14'd571 : toneL = Dflat6;
14'd572 : toneL = Dflat6; 14'd573 : toneL = Dflat6; 14'd574 : toneL = Dflat6; 14'd575 : toneL = 1;
/*measure 10 */
14'd608 : toneL = G4; 14'd609 : toneL = G4; 14'd610 : toneL = G4; 14'd611 : toneL = G4;
14'd612 : toneL = G4; 14'd613 : toneL = G4; 14'd614 : toneL = G4; 14'd615 : toneL = G4;
14'd616 : toneL = G4; 14'd617 : toneL = G4; 14'd618 : toneL = G4; 14'd619 : toneL = G4;
14'd620 : toneL = G4; 14'd621 : toneL = G4; 14'd622 : toneL = G4; 14'd623 : toneL = 1;
14'd624 : toneL = E4; 14'd625 : toneL = E4; 14'd626 : toneL = E4; 14'd627 : toneL = E4;
14'd628 : toneL = E4; 14'd629 : toneL = E4; 14'd630 : toneL = E4; 14'd631 : toneL = E4;
14'd632 : toneL = E4; 14'd633 : toneL = E4; 14'd634 : toneL = E4; 14'd635 : toneL = E4;
14'd636 : toneL = E4; 14'd637 : toneL = E4; 14'd638 : toneL = E4; 14'd639 : toneL = 1;
14'd640 : toneL = C4; 14'd641 : toneL = C4; 14'd642 : toneL = C4; 14'd643 : toneL = C4;
14'd644 : toneL = C4; 14'd645 : toneL = C4; 14'd646 : toneL = C4; 14'd647 : toneL = C4;
14'd648 : toneL = C4; 14'd649 : toneL = C4; 14'd650 : toneL = C4; 14'd651 : toneL = C4;
14'd652 : toneL = C4; 14'd653 : toneL = C4; 14'd654 : toneL = C4; 14'd655 : toneL = 1;
14'd656 : toneL = E4; 14'd657 : toneL = E4; 14'd658 : toneL = E4; 14'd659 : toneL = E4;
14'd660 : toneL = E4; 14'd661 : toneL = E4; 14'd662 : toneL = E4; 14'd663 : toneL = E4;
14'd664 : toneL = E4; 14'd665 : toneL = E4; 14'd666 : toneL = E4; 14'd667 : toneL = E4;
14'd668 : toneL = E4; 14'd669 : toneL = E4; 14'd670 : toneL = E4; 14'd671 : toneL = 1;
/*measure 11 */
14'd640 : toneL = F2; 14'd641 : toneL = F2; 14'd642 : toneL = F2; 14'd643 : toneL = F2;
14'd644 : toneL = F2; 14'd645 : toneL = F2; 14'd646 : toneL = F2; 14'd647 : toneL = F2;
14'd648 : toneL = F2; 14'd649 : toneL = F2; 14'd650 : toneL = F2; 14'd651 : toneL = F2;
14'd652 : toneL = F2; 14'd653 : toneL = F2; 14'd654 : toneL = F2; 14'd655 : toneL = F2;
14'd656 : toneL = F2; 14'd657 : toneL = F2; 14'd658 : toneL = F2; 14'd659 : toneL = F2;
14'd660 : toneL = F2; 14'd661 : toneL = F2; 14'd662 : toneL = F2; 14'd663 : toneL = F2;
14'd664 : toneL = F2; 14'd665 : toneL = F2; 14'd666 : toneL = F2; 14'd667 : toneL = F2;
14'd668 : toneL = F2; 14'd669 : toneL = F2; 14'd670 : toneL = F2; 14'd671 : toneL = 1;
14'd672 : toneL = F2; 14'd673 : toneL = F2; 14'd674 : toneL = F2; 14'd675 : toneL = F2;
14'd676 : toneL = F2; 14'd677 : toneL = F2; 14'd678 : toneL = F2; 14'd679 : toneL = F2;
14'd680 : toneL = F2; 14'd681 : toneL = F2; 14'd682 : toneL = F2; 14'd683 : toneL = F2;
14'd684 : toneL = F2; 14'd685 : toneL = F2; 14'd686 : toneL = F2; 14'd687 : toneL = F2;
14'd688 : toneL = F2; 14'd689 : toneL = F2; 14'd690 : toneL = F2; 14'd691 : toneL = F2;
14'd692 : toneL = F2; 14'd693 : toneL = F2; 14'd694 : toneL = F2; 14'd695 : toneL = F2;
14'd696 : toneL = F2; 14'd697 : toneL = F2; 14'd698 : toneL = F2; 14'd699 : toneL = F2;
14'd700 : toneL = F2; 14'd701 : toneL = F2; 14'd702 : toneL = F2; 14'd703 : toneL = 1;
/*measure 12 */
14'd704 : toneL = F2; 14'd705 : toneL = F2; 14'd706 : toneL = F2; 14'd707 : toneL = F2;
14'd708 : toneL = F2; 14'd709 : toneL = F2; 14'd710 : toneL = F2; 14'd711 : toneL = F2;
14'd712 : toneL = F2; 14'd713 : toneL = F2; 14'd714 : toneL = F2; 14'd715 : toneL = F2;
14'd716 : toneL = F2; 14'd717 : toneL = F2; 14'd718 : toneL = F2; 14'd719 : toneL = F2;
14'd720 : toneL = F2; 14'd721 : toneL = F2; 14'd722 : toneL = F2; 14'd723 : toneL = F2;
14'd724 : toneL = F2; 14'd725 : toneL = F2; 14'd726 : toneL = F2; 14'd727 : toneL = F2;
14'd728 : toneL = F2; 14'd729 : toneL = F2; 14'd730 : toneL = F2; 14'd731 : toneL = F2;
14'd732 : toneL = F2; 14'd733 : toneL = F2; 14'd734 : toneL = F2; 14'd735 : toneL = 1;
14'd736 : toneL = F2; 14'd737 : toneL = F2; 14'd738 : toneL = F2; 14'd739 : toneL = F2;
14'd740 : toneL = F2; 14'd741 : toneL = F2; 14'd742 : toneL = F2; 14'd743 : toneL = F2;
14'd744 : toneL = F2; 14'd745 : toneL = F2; 14'd746 : toneL = F2; 14'd747 : toneL = F2;
14'd748 : toneL = F2; 14'd749 : toneL = F2; 14'd750 : toneL = F2; 14'd751 : toneL = F2;
14'd752 : toneL = F2; 14'd753 : toneL = F2; 14'd754 : toneL = F2; 14'd755 : toneL = F2;
14'd756 : toneL = F2; 14'd757 : toneL = F2; 14'd758 : toneL = F2; 14'd759 : toneL = F2;
14'd760 : toneL = F2; 14'd761 : toneL = F2; 14'd762 : toneL = F2; 14'd763 : toneL = F2;
14'd764 : toneL = F2; 14'd765 : toneL = F2; 14'd766 : toneL = F2; 14'd767 : toneL = 1;
/*measure 13 */
14'd768 : toneL = Bflat2; 14'd769 : toneL = Bflat2; 14'd770 : toneL = Bflat2; 14'd771 : toneL = Bflat2;
14'd772 : toneL = Bflat2; 14'd773 : toneL = Bflat2; 14'd774 : toneL = Bflat2; 14'd775 : toneL = Bflat2;
14'd776 : toneL = Bflat2; 14'd777 : toneL = Bflat2; 14'd778 : toneL = Bflat2; 14'd779 : toneL = Bflat2;
14'd780 : toneL = Bflat2; 14'd781 : toneL = Bflat2; 14'd782 : toneL = Bflat2; 14'd783 : toneL = Bflat2;
14'd784 : toneL = Bflat2; 14'd785 : toneL = Bflat2; 14'd786 : toneL = Bflat2; 14'd787 : toneL = Bflat2;
14'd788 : toneL = Bflat2; 14'd789 : toneL = Bflat2; 14'd790 : toneL = Bflat2; 14'd791 : toneL = Bflat2;
14'd792 : toneL = Bflat2; 14'd793 : toneL = Bflat2; 14'd794 : toneL = Bflat2; 14'd795 : toneL = Bflat2;
14'd796 : toneL = Bflat2; 14'd797 : toneL = Bflat2; 14'd798 : toneL = Bflat2; 14'd799 : toneL = 1;
14'd800 : toneL = Bflat2; 14'd801 : toneL = Bflat2; 14'd802 : toneL = Bflat2; 14'd803 : toneL = Bflat2;
14'd804 : toneL = Bflat2; 14'd805 : toneL = Bflat2; 14'd806 : toneL = Bflat2; 14'd807 : toneL = Bflat2;
14'd808 : toneL = Bflat2; 14'd809 : toneL = Bflat2; 14'd810 : toneL = Bflat2; 14'd811 : toneL = Bflat2;
14'd812 : toneL = Bflat2; 14'd813 : toneL = Bflat2; 14'd814 : toneL = Bflat2; 14'd815 : toneL = Bflat2;
14'd816 : toneL = Bflat2; 14'd817 : toneL = Bflat2; 14'd818 : toneL = Bflat2; 14'd819 : toneL = Bflat2;
14'd820 : toneL = Bflat2; 14'd821 : toneL = Bflat2; 14'd822 : toneL = Bflat2; 14'd823 : toneL = Bflat2;
14'd824 : toneL = Bflat2; 14'd825 : toneL = Bflat2; 14'd826 : toneL = Bflat2; 14'd827 : toneL = Bflat2;
14'd828 : toneL = Bflat2; 14'd829 : toneL = Bflat2; 14'd830 : toneL = Bflat2; 14'd831 : toneL = 1;
/*measure 14 */
14'd832 : toneL = B2; 14'd833 : toneL = B2; 14'd834 : toneL = B2; 14'd835 : toneL = B2;
14'd836 : toneL = B2; 14'd837 : toneL = B2; 14'd838 : toneL = B2; 14'd839 : toneL = B2;
14'd840 : toneL = B2; 14'd841 : toneL = B2; 14'd842 : toneL = B2; 14'd843 : toneL = B2;
14'd844 : toneL = B2; 14'd845 : toneL = B2; 14'd846 : toneL = B2; 14'd847 : toneL = B2;
14'd848 : toneL = B2; 14'd849 : toneL = B2; 14'd850 : toneL = B2; 14'd851 : toneL = B2;
14'd852 : toneL = B2; 14'd853 : toneL = B2; 14'd854 : toneL = B2; 14'd855 : toneL = B2;
14'd856 : toneL = B2; 14'd857 : toneL = B2; 14'd858 : toneL = B2; 14'd859 : toneL = B2;
14'd860 : toneL = B2; 14'd861 : toneL = B2; 14'd862 : toneL = B2; 14'd863 : toneL = 1;
14'd864 : toneL = B2; 14'd865 : toneL = B2; 14'd866 : toneL = B2; 14'd867 : toneL = B2;
14'd868 : toneL = B2; 14'd869 : toneL = B2; 14'd870 : toneL = B2; 14'd871 : toneL = B2;
14'd872 : toneL = B2; 14'd873 : toneL = B2; 14'd874 : toneL = B2; 14'd875 : toneL = B2;
14'd876 : toneL = B2; 14'd877 : toneL = B2; 14'd878 : toneL = B2; 14'd879 : toneL = B2;
14'd880 : toneL = B2; 14'd881 : toneL = B2; 14'd882 : toneL = B2; 14'd883 : toneL = B2;
14'd884 : toneL = B2; 14'd885 : toneL = B2; 14'd886 : toneL = B2; 14'd887 : toneL = B2;
14'd888 : toneL = B2; 14'd889 : toneL = B2; 14'd890 : toneL = B2; 14'd891 : toneL = B2;
14'd892 : toneL = B2; 14'd893 : toneL = B2; 14'd894 : toneL = B2; 14'd895 : toneL = 1;
/*measure 15 */
14'd896 : toneL = F2; 14'd897 : toneL = F2; 14'd898 : toneL = F2; 14'd899 : toneL = F2;
14'd900 : toneL = F2; 14'd901 : toneL = F2; 14'd902 : toneL = F2; 14'd903 : toneL = F2;
14'd904 : toneL = F2; 14'd905 : toneL = F2; 14'd906 : toneL = F2; 14'd907 : toneL = F2;
14'd908 : toneL = F2; 14'd909 : toneL = F2; 14'd910 : toneL = F2; 14'd911 : toneL = 1;
14'd912 : toneL = F3; 14'd913 : toneL = F3; 14'd914 : toneL = F3; 14'd915 : toneL = F3;
14'd916 : toneL = F3; 14'd917 : toneL = F3; 14'd918 : toneL = F3; 14'd919 : toneL = 1;
14'd920 : toneL = Aflat3; 14'd921 : toneL = Aflat3; 14'd922 : toneL = Aflat3; 14'd923 : toneL = Aflat3;
14'd924 : toneL = Aflat3; 14'd925 : toneL = Aflat3; 14'd926 : toneL = Aflat3; 14'd927 : toneL = 1;
14'd928 : toneL = E2; 14'd929 : toneL = E2; 14'd930 : toneL = E2; 14'd931 : toneL = E2;
14'd932 : toneL = E2; 14'd933 : toneL = E2; 14'd934 : toneL = E2; 14'd935 : toneL = 1;
14'd936 : toneL = G3; 14'd937 : toneL = G3; 14'd938 : toneL = G3; 14'd939 : toneL = G3;
14'd940 : toneL = G3; 14'd941 : toneL = G3; 14'd942 : toneL = G3; 14'd943 : toneL = 1;
14'd944 : toneL = E2; 14'd945 : toneL = E2; 14'd946 : toneL = E2; 14'd947 : toneL = E2;
14'd948 : toneL = E2; 14'd949 : toneL = E2; 14'd950 : toneL = E2; 14'd951 : toneL = 1;
14'd952 : toneL = G3; 14'd953 : toneL = G3; 14'd954 : toneL = G3; 14'd955 : toneL = G3;
14'd956 : toneL = G3; 14'd957 : toneL = G3; 14'd958 : toneL = G3; 14'd959 : toneL = 1;
/*measure 16 */
14'd960 : toneL = Eflat2; 14'd961 : toneL = Eflat2; 14'd962 : toneL = Eflat2; 14'd963 : toneL = Eflat2;
14'd964 : toneL = Eflat2; 14'd965 : toneL = Eflat2; 14'd966 : toneL = Eflat2; 14'd967 : toneL = 1;
14'd968 : toneL = G3; 14'd969 : toneL = G3; 14'd970 : toneL = G3; 14'd971 : toneL = G3;
14'd972 : toneL = G3; 14'd973 : toneL = G3; 14'd974 : toneL = G3; 14'd975 : toneL = 1;
14'd976 : toneL = Eflat2; 14'd977 : toneL = Eflat2; 14'd978 : toneL = Eflat2; 14'd979 : toneL = Eflat2;
14'd980 : toneL = Eflat2; 14'd981 : toneL = Eflat2; 14'd982 : toneL = Eflat2; 14'd983 : toneL = 1;
14'd984 : toneL = G3; 14'd985 : toneL = G3; 14'd986 : toneL = G3; 14'd987 : toneL = G3;
14'd988 : toneL = G3; 14'd989 : toneL = G3; 14'd990 : toneL = G3; 14'd991 : toneL = 1;
14'd992 : toneL = Dflat2; 14'd993 : toneL = Dflat2; 14'd994 : toneL = Dflat2; 14'd995 : toneL = Dflat2;
14'd996 : toneL = Dflat2; 14'd997 : toneL = Dflat2; 14'd998 : toneL = Dflat2; 14'd999 : toneL = 1;
14'd1000 : toneL = F3; 14'd1001 : toneL = F3; 14'd1002 : toneL = F3; 14'd1003 : toneL = F3;
14'd1004 : toneL = F3; 14'd1005 : toneL = F3; 14'd1006 : toneL = F3; 14'd1007 : toneL = 1;
14'd1008 : toneL = Dflat2; 14'd1009 : toneL = Dflat2; 14'd1010 : toneL = Dflat2; 14'd1011 : toneL = Dflat2;
14'd1012 : toneL = Dflat2; 14'd1013 : toneL = Dflat2; 14'd1014 : toneL = Dflat2; 14'd1015 : toneL = 1;
14'd1016 : toneL = Dflat2; 14'd1017 : toneL = Dflat2; 14'd1018 : toneL = Dflat2; 14'd1019 : toneL = Dflat2;
14'd1020 : toneL = Dflat2; 14'd1021 : toneL = Dflat2; 14'd1022 : toneL = Dflat2; 14'd1023 : toneL = 1;
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
        /*measure 2 */
14'd64 : toneR = 1; 14'd65 : toneR = 1; 14'd66 : toneR = 1; 14'd67 : toneR = 1;
14'd68 : toneR = 1; 14'd69 : toneR = 1; 14'd70 : toneR = 1; 14'd71 : toneR = 1;
14'd72 : toneR = 1; 14'd73 : toneR = 1; 14'd74 : toneR = 1; 14'd75 : toneR = 1;
14'd76 : toneR = 1; 14'd77 : toneR = 1; 14'd78 : toneR = 1; 14'd79 : toneR = 1;
14'd80 : toneR = 1; 14'd81 : toneR = 1; 14'd82 : toneR = 1; 14'd83 : toneR = 1;
14'd84 : toneR = 1; 14'd85 : toneR = 1; 14'd86 : toneR = 1; 14'd87 : toneR = 1;
14'd88 : toneR = 1; 14'd89 : toneR = 1; 14'd90 : toneR = 1; 14'd91 : toneR = 1;
14'd92 : toneR = 1; 14'd93 : toneR = 1; 14'd94 : toneR = 1; 14'd95 : toneR = 1;
14'd96 : toneR = 1; 14'd97 : toneR = 1; 14'd98 : toneR = 1; 14'd99 : toneR = 1;
14'd100 : toneR = 1; 14'd101 : toneR = 1; 14'd102 : toneR = 1; 14'd103 : toneR = 1;
14'd104 : toneR = 1; 14'd105 : toneR = 1; 14'd106 : toneR = 1; 14'd107 : toneR = 1;
14'd108 : toneR = 1; 14'd109 : toneR = 1; 14'd110 : toneR = 1; 14'd111 : toneR = 1;
14'd112 : toneR = 1; 14'd113 : toneR = 1; 14'd114 : toneR = 1; 14'd115 : toneR = 1;
14'd116 : toneR = 1; 14'd117 : toneR = 1; 14'd118 : toneR = 1; 14'd119 : toneR = 1;
14'd120 : toneR = 1; 14'd121 : toneR = 1; 14'd122 : toneR = 1; 14'd123 : toneR = 1;
14'd124 : toneR = 1; 14'd125 : toneR = 1; 14'd126 : toneR = 1; 14'd127 : toneR = 1;
        /*measure 3 */
14'd128 : toneR = 1; 14'd129 : toneR = 1; 14'd130 : toneR = 1; 14'd131 : toneR = 1;
14'd132 : toneR = 1; 14'd133 : toneR = 1; 14'd134 : toneR = 1; 14'd135 : toneR = 1;
14'd136 : toneR = C4; 14'd137 : toneR = C4; 14'd138 : toneR = C4; 14'd139 : toneR = C4;
14'd140 : toneR = C4; 14'd141 : toneR = C4; 14'd142 : toneR = C4; 14'd143 : toneR = 1;
14'd144 : toneR = F4; 14'd145 : toneR = F4; 14'd146 : toneR = F4; 14'd147 : toneR = F4;
14'd148 : toneR = F4; 14'd149 : toneR = F4; 14'd150 : toneR = F4; 14'd151 : toneR = 1;
14'd152 : toneR = G4; 14'd153 : toneR = G4; 14'd154 : toneR = G4; 14'd155 : toneR = G4;
14'd156 : toneR = G4; 14'd157 : toneR = G4; 14'd158 : toneR = G4; 14'd159 : toneR = 1;
14'd160 : toneR = Aflat4; 14'd161 : toneR = Aflat4; 14'd162 : toneR = Aflat4; 14'd163 : toneR = Aflat4;
14'd164 : toneR = Aflat4; 14'd165 : toneR = Aflat4; 14'd166 : toneR = Aflat4; 14'd167 : toneR = Aflat4;
14'd168 : toneR = Aflat4; 14'd169 : toneR = Aflat4; 14'd170 : toneR = Aflat4; 14'd171 : toneR = Aflat4;
14'd172 : toneR = Aflat4; 14'd173 : toneR = Aflat4; 14'd174 : toneR = Aflat4; 14'd175 : toneR = Aflat4;
14'd176 : toneR = Aflat4; 14'd177 : toneR = Aflat4; 14'd178 : toneR = Aflat4; 14'd179 : toneR = Aflat4;
14'd180 : toneR = Aflat4; 14'd181 : toneR = Aflat4; 14'd182 : toneR = Aflat4; 14'd183 : toneR = Aflat4;
14'd184 : toneR = Aflat4; 14'd185 : toneR = Aflat4; 14'd186 : toneR = Aflat4; 14'd187 : toneR = Aflat4;
14'd188 : toneR = Aflat4; 14'd189 : toneR = Aflat4; 14'd190 : toneR = Aflat4; 14'd191 : toneR = 1;
        /*measure 4 */
14'd192 : toneR = F4; 14'd193 : toneR = F4; 14'd194 : toneR = F4; 14'd195 : toneR = F4;
14'd196 : toneR = F4; 14'd197 : toneR = F4; 14'd198 : toneR = F4; 14'd199 : toneR = 1;
14'd200 : toneR = G4; 14'd201 : toneR = G4; 14'd202 : toneR = G4; 14'd203 : toneR = G4;
14'd204 : toneR = G4; 14'd205 : toneR = G4; 14'd206 : toneR = G4; 14'd207 : toneR = 1;
14'd208 : toneR = Aflat4; 14'd209 : toneR = Aflat4; 14'd210 : toneR = Aflat4; 14'd211 : toneR = Aflat4;
14'd212 : toneR = Aflat4; 14'd213 : toneR = Aflat4; 14'd214 : toneR = Aflat4; 14'd215 : toneR = Aflat4;
14'd216 : toneR = Aflat4; 14'd217 : toneR = Aflat4; 14'd218 : toneR = Aflat4; 14'd219 : toneR = Aflat4;
14'd220 : toneR = Aflat4; 14'd221 : toneR = Aflat4; 14'd222 : toneR = Aflat4; 14'd223 : toneR = 1;
14'd224 : toneR = Bflat4; 14'd225 : toneR = Bflat4; 14'd226 : toneR = Bflat4; 14'd227 : toneR = Bflat4;
14'd228 : toneR = Bflat4; 14'd229 : toneR = Bflat4; 14'd230 : toneR = Bflat4; 14'd231 : toneR = 1;
14'd232 : toneR = Aflat4; 14'd233 : toneR = Aflat4; 14'd234 : toneR = Aflat4; 14'd235 : toneR = Aflat4;
14'd236 : toneR = Aflat4; 14'd237 : toneR = Aflat4; 14'd238 : toneR = Aflat4; 14'd239 : toneR = 1;
14'd240 : toneR = G4; 14'd241 : toneR = G4; 14'd242 : toneR = G4; 14'd243 : toneR = G4;
14'd244 : toneR = G4; 14'd245 : toneR = G4; 14'd246 : toneR = G4; 14'd247 : toneR = 1;
14'd248 : toneR = Aflat4; 14'd249 : toneR = Aflat4; 14'd250 : toneR = Aflat4; 14'd251 : toneR = Aflat4;
14'd252 : toneR = Aflat4; 14'd253 : toneR = Aflat4; 14'd254 : toneR = Aflat4; 14'd255 : toneR = 1;
/*measure 5 */
14'd256 : toneR = 1; 14'd257 : toneR = 1; 14'd258 : toneR = 1; 14'd259 : toneR = 1;
14'd260 : toneR = 1; 14'd261 : toneR = 1; 14'd262 : toneR = 1; 14'd263 : toneR = 1;
14'd264 : toneR = C4; 14'd265 : toneR = C4; 14'd266 : toneR = C4; 14'd267 : toneR = C4;
14'd268 : toneR = C4; 14'd269 : toneR = C4; 14'd270 : toneR = C4; 14'd271 : toneR = 1;
14'd272 : toneR = F4; 14'd273 : toneR = F4; 14'd274 : toneR = F4; 14'd275 : toneR = F4;
14'd276 : toneR = F4; 14'd277 : toneR = F4; 14'd278 : toneR = F4; 14'd279 : toneR = 1;
14'd280 : toneR = G4; 14'd281 : toneR = G4; 14'd282 : toneR = G4; 14'd283 : toneR = G4;
14'd284 : toneR = G4; 14'd285 : toneR = G4; 14'd286 : toneR = G4; 14'd287 : toneR = 1;
14'd296 : toneR = Aflat4; 14'd297 : toneR = Aflat4; 14'd298 : toneR = Aflat4; 14'd299 : toneR = Aflat4;
14'd300 : toneR = Aflat4; 14'd301 : toneR = Aflat4; 14'd302 : toneR = Aflat4; 14'd303 : toneR = Aflat4;
14'd304 : toneR = Aflat4; 14'd305 : toneR = Aflat4; 14'd306 : toneR = Aflat4; 14'd307 : toneR = Aflat4;
14'd308 : toneR = Aflat4; 14'd309 : toneR = Aflat4; 14'd310 : toneR = Aflat4; 14'd311 : toneR = Aflat4;
14'd312 : toneR = Aflat4; 14'd313 : toneR = Aflat4; 14'd314 : toneR = Aflat4; 14'd315 : toneR = Aflat4;
14'd316 : toneR = Aflat4; 14'd317 : toneR = Aflat4; 14'd318 : toneR = Aflat4; 14'd319 : toneR = Aflat4;
14'd320 : toneR = Aflat4; 14'd321 : toneR = Aflat4; 14'd322 : toneR = Aflat4; 14'd323 : toneR = Aflat4;
14'd324 : toneR = Aflat4; 14'd325 : toneR = Aflat4; 14'd326 : toneR = Aflat4; 14'd327 : toneR = 1;
/*measure 6 */
14'd320 : toneR = F4; 14'd321 : toneR = F4; 14'd322 : toneR = F4; 14'd323 : toneR = F4;
14'd324 : toneR = F4; 14'd325 : toneR = F4; 14'd326 : toneR = F4; 14'd327 : toneR = 1;
14'd328 : toneR = G5; 14'd329 : toneR = G5; 14'd330 : toneR = G5; 14'd331 : toneR = G5;
14'd332 : toneR = G5; 14'd333 : toneR = G5; 14'd334 : toneR = G5; 14'd335 : toneR = 1;
14'd344 : toneR = Aflat4; 14'd345 : toneR = Aflat4; 14'd346 : toneR = Aflat4; 14'd347 : toneR = Aflat4;
14'd348 : toneR = Aflat4; 14'd349 : toneR = Aflat4; 14'd350 : toneR = Aflat4; 14'd351 : toneR = Aflat4;
14'd352 : toneR = Aflat4; 14'd353 : toneR = Aflat4; 14'd354 : toneR = Aflat4; 14'd355 : toneR = Aflat4;
14'd356 : toneR = Aflat4; 14'd357 : toneR = Aflat4; 14'd358 : toneR = Aflat4; 14'd359 : toneR = 1;
14'd376 : toneR = C5; 14'd377 : toneR = C5; 14'd378 : toneR = C5; 14'd379 : toneR = C5;
14'd380 : toneR = C5; 14'd381 : toneR = C5; 14'd382 : toneR = C5; 14'd383 : toneR = 1;
14'd384 : toneR = Dflat5; 14'd385 : toneR = Dflat5; 14'd386 : toneR = Dflat5; 14'd387 : toneR = Dflat5;
14'd388 : toneR = Dflat5; 14'd389 : toneR = Dflat5; 14'd390 : toneR = Dflat5; 14'd391 : toneR = 1;
14'd392 : toneR = C5; 14'd393 : toneR = C5; 14'd394 : toneR = C5; 14'd395 : toneR = C5;
14'd396 : toneR = C5; 14'd397 : toneR = C5; 14'd398 : toneR = C5; 14'd399 : toneR = 1;
14'd400 : toneR = G4; 14'd401 : toneR = G4; 14'd402 : toneR = G4; 14'd403 : toneR = G4;
14'd404 : toneR = G4; 14'd405 : toneR = G4; 14'd406 : toneR = G4; 14'd407 : toneR = 1;
/*measure 7 */
14'd384 : toneR = Aflat4; 14'd385 : toneR = Aflat4; 14'd386 : toneR = Aflat4; 14'd387 : toneR = Aflat4;
14'd388 : toneR = Aflat4; 14'd389 : toneR = Aflat4; 14'd390 : toneR = Aflat4; 14'd391 : toneR = 1;
14'd392 : toneR = C4; 14'd393 : toneR = C4; 14'd394 : toneR = C4; 14'd395 : toneR = C4;
14'd396 : toneR = C4; 14'd397 : toneR = C4; 14'd398 : toneR = C4; 14'd399 : toneR = 1;
14'd400 : toneR = F4; 14'd401 : toneR = F4; 14'd402 : toneR = F4; 14'd403 : toneR = F4;
14'd404 : toneR = F4; 14'd405 : toneR = F4; 14'd406 : toneR = F4; 14'd407 : toneR = 1;
14'd408 : toneR = G4; 14'd409 : toneR = G4; 14'd410 : toneR = G4; 14'd411 : toneR = G4;
14'd412 : toneR = G4; 14'd413 : toneR = G4; 14'd414 : toneR = G4; 14'd415 : toneR = 1;
14'd416 : toneR = Aflat4; 14'd417 : toneR = Aflat4; 14'd418 : toneR = Aflat4; 14'd419 : toneR = Aflat4;
14'd420 : toneR = Aflat4; 14'd421 : toneR = Aflat4; 14'd422 : toneR = Aflat4; 14'd423 : toneR = Aflat4;
14'd424 : toneR = Aflat4; 14'd425 : toneR = Aflat4; 14'd426 : toneR = Aflat4; 14'd427 : toneR = Aflat4;
14'd428 : toneR = Aflat4; 14'd429 : toneR = Aflat4; 14'd430 : toneR = Aflat4; 14'd431 : toneR = Aflat4;
14'd432 : toneR = Aflat4; 14'd433 : toneR = Aflat4; 14'd434 : toneR = Aflat4; 14'd435 : toneR = Aflat4;
14'd436 : toneR = Aflat4; 14'd437 : toneR = Aflat4; 14'd438 : toneR = Aflat4; 14'd439 : toneR = Aflat4;
14'd440 : toneR = Aflat4; 14'd441 : toneR = Aflat4; 14'd442 : toneR = Aflat4; 14'd443 : toneR = Aflat4;
14'd444 : toneR = Aflat4; 14'd445 : toneR = Aflat4; 14'd446 : toneR = Aflat4; 14'd447 : toneR = 1;
/*measure 8 */
14'd448 : toneR = F4; 14'd449 : toneR = F4; 14'd450 : toneR = F4; 14'd451 : toneR = F4;
14'd452 : toneR = F4; 14'd453 : toneR = F4; 14'd454 : toneR = F4; 14'd455 : toneR = 1;
14'd456 : toneR = G4; 14'd457 : toneR = G4; 14'd458 : toneR = G4; 14'd459 : toneR = G4;
14'd460 : toneR = G4; 14'd461 : toneR = G4; 14'd462 : toneR = G4; 14'd463 : toneR = 1;
14'd464 : toneR = Aflat4; 14'd465 : toneR = Aflat4; 14'd466 : toneR = Aflat4; 14'd467 : toneR = Aflat4;
14'd468 : toneR = Aflat4; 14'd469 : toneR = Aflat4; 14'd470 : toneR = Aflat4; 14'd471 : toneR = Aflat4;
14'd472 : toneR = Aflat4; 14'd473 : toneR = Aflat4; 14'd474 : toneR = Aflat4; 14'd475 : toneR = Aflat4;
14'd476 : toneR = Aflat4; 14'd477 : toneR = Aflat4; 14'd478 : toneR = Aflat4; 14'd479 : toneR = 1;
14'd480 : toneR = Bflat4; 14'd481 : toneR = Bflat4; 14'd482 : toneR = Bflat4; 14'd483 : toneR = Bflat4;
14'd484 : toneR = Bflat4; 14'd485 : toneR = Bflat4; 14'd486 : toneR = Bflat4; 14'd487 : toneR = 1;
14'd488 : toneR = Aflat4; 14'd489 : toneR = Aflat4; 14'd490 : toneR = Aflat4; 14'd491 : toneR = Aflat4;
14'd492 : toneR = Aflat4; 14'd493 : toneR = Aflat4; 14'd494 : toneR = Aflat4; 14'd495 : toneR = 1;
14'd496 : toneR = G4; 14'd497 : toneR = G4; 14'd498 : toneR = G4; 14'd499 : toneR = G4;
14'd500 : toneR = G4; 14'd501 : toneR = G4; 14'd502 : toneR = G4; 14'd503 : toneR = 1;
14'd504 : toneR = Aflat4; 14'd505 : toneR = Aflat4; 14'd506 : toneR = Aflat4; 14'd507 : toneR = Aflat4;
14'd508 : toneR = Aflat4; 14'd509 : toneR = Aflat4; 14'd510 : toneR = Aflat4; 14'd511 : toneR = 1;
/*measure 9 */
14'd512 : toneR = Dflat4; 14'd513 : toneR = Dflat4; 14'd514 : toneR = Dflat4; 14'd515 : toneR = Dflat4;
14'd516 : toneR = Dflat4; 14'd517 : toneR = Dflat4; 14'd518 : toneR = Dflat4; 14'd519 : toneR = 1;
14'd520 : toneR = Aflat3; 14'd521 : toneR = Aflat3; 14'd522 : toneR = Aflat3; 14'd523 : toneR = Aflat3;
14'd524 : toneR = Aflat3; 14'd525 : toneR = Aflat3; 14'd526 : toneR = Aflat3; 14'd527 : toneR = 1;
14'd528 : toneR = F4; 14'd529 : toneR = F4; 14'd530 : toneR = F4; 14'd531 : toneR = F4;
14'd532 : toneR = F4; 14'd533 : toneR = F4; 14'd534 : toneR = F4; 14'd535 : toneR = 1;
14'd536 : toneR = G4; 14'd537 : toneR = G4; 14'd538 : toneR = G4; 14'd539 : toneR = G4;
14'd540 : toneR = G4; 14'd541 : toneR = G4; 14'd542 : toneR = G4; 14'd543 : toneR = 1;
14'd544 : toneR = Aflat4; 14'd545 : toneR = Aflat4; 14'd546 : toneR = Aflat4; 14'd547 : toneR = Aflat4;
14'd548 : toneR = Aflat4; 14'd549 : toneR = Aflat4; 14'd550 : toneR = Aflat4; 14'd551 : toneR = 1;
14'd552 : toneR = G4; 14'd553 : toneR = G4; 14'd554 : toneR = G4; 14'd555 : toneR = G4;
14'd556 : toneR = G4; 14'd557 : toneR = G4; 14'd558 : toneR = G4; 14'd559 : toneR = 1;
14'd560 : toneR = Bflat4; 14'd561 : toneR = Bflat4; 14'd562 : toneR = Bflat4; 14'd563 : toneR = Bflat4;
14'd564 : toneR = Bflat4; 14'd565 : toneR = Bflat4; 14'd566 : toneR = Bflat4; 14'd567 : toneR = 1;
14'd568 : toneR = Dflat5; 14'd569 : toneR = Dflat5; 14'd570 : toneR = Dflat5; 14'd571 : toneR = Dflat5;
14'd572 : toneR = Dflat5; 14'd573 : toneR = Dflat5; 14'd574 : toneR = Dflat5; 14'd575 : toneR = 1;
/*measure 10 */
14'd576 : toneR = C5; 14'd577 : toneR = C5; 14'd578 : toneR = C5; 14'd579 : toneR = C5;
14'd580 : toneR = C5; 14'd581 : toneR = C5; 14'd582 : toneR = C5; 14'd583 : toneR = C5;
14'd584 : toneR = C5; 14'd585 : toneR = C5; 14'd586 : toneR = C5; 14'd587 : toneR = C5;
14'd588 : toneR = C5; 14'd589 : toneR = C5; 14'd590 : toneR = C5; 14'd591 : toneR = 1;
14'd592 : toneR = Bflat4; 14'd593 : toneR = Bflat4; 14'd594 : toneR = Bflat4; 14'd595 : toneR = Bflat4;
14'd596 : toneR = Bflat4; 14'd597 : toneR = Bflat4; 14'd598 : toneR = Bflat4; 14'd599 : toneR = Bflat4;
14'd600 : toneR = Bflat4; 14'd601 : toneR = Bflat4; 14'd602 : toneR = Bflat4; 14'd603 : toneR = Bflat4;
14'd604 : toneR = Bflat4; 14'd605 : toneR = Bflat4; 14'd606 : toneR = Bflat4; 14'd607 : toneR = 1;
14'd608 : toneR = Aflat4; 14'd609 : toneR = Aflat4; 14'd610 : toneR = Aflat4; 14'd611 : toneR = Aflat4;
14'd612 : toneR = Aflat4; 14'd613 : toneR = Aflat4; 14'd614 : toneR = Aflat4; 14'd615 : toneR = Aflat4;
14'd616 : toneR = Aflat4; 14'd617 : toneR = Aflat4; 14'd618 : toneR = Aflat4; 14'd619 : toneR = Aflat4;
14'd620 : toneR = Aflat4; 14'd621 : toneR = Aflat4; 14'd622 : toneR = Aflat4; 14'd623 : toneR = 1;
14'd624 : toneR = G4; 14'd625 : toneR = G4; 14'd626 : toneR = G4; 14'd627 : toneR = G4;
14'd628 : toneR = G4; 14'd629 : toneR = G4; 14'd630 : toneR = G4; 14'd631 : toneR = G4;
14'd632 : toneR = G4; 14'd633 : toneR = G4; 14'd634 : toneR = G4; 14'd635 : toneR = G4;
14'd636 : toneR = G4; 14'd637 : toneR = G4; 14'd638 : toneR = G4; 14'd639 : toneR = 1;
/*measure 11 */
14'd640 : toneR = Aflat4; 14'd641 : toneR = Aflat4; 14'd642 : toneR = Aflat4; 14'd643 : toneR = Aflat4;
14'd644 : toneR = Aflat4; 14'd645 : toneR = Aflat4; 14'd646 : toneR = Aflat4; 14'd647 : toneR = Aflat4;
14'd648 : toneR = Aflat4; 14'd649 : toneR = Aflat4; 14'd650 : toneR = Aflat4; 14'd651 : toneR = Aflat4;
14'd652 : toneR = Aflat4; 14'd653 : toneR = Aflat4; 14'd654 : toneR = Aflat4; 14'd655 : toneR = Aflat4;
14'd656 : toneR = Aflat4; 14'd657 : toneR = Aflat4; 14'd658 : toneR = Aflat4; 14'd659 : toneR = Aflat4;
14'd660 : toneR = Aflat4; 14'd661 : toneR = Aflat4; 14'd662 : toneR = Aflat4; 14'd663 : toneR = Aflat4;
14'd664 : toneR = Aflat4; 14'd665 : toneR = Aflat4; 14'd666 : toneR = Aflat4; 14'd667 : toneR = Aflat4;
14'd668 : toneR = Aflat4; 14'd669 : toneR = Aflat4; 14'd670 : toneR = Aflat4; 14'd671 : toneR = 1;
14'd672 : toneR = Aflat4; 14'd673 : toneR = Aflat4; 14'd674 : toneR = Aflat4; 14'd675 : toneR = Aflat4;
14'd676 : toneR = Aflat4; 14'd677 : toneR = Aflat4; 14'd678 : toneR = Aflat4; 14'd679 : toneR = Aflat4;
14'd680 : toneR = Aflat4; 14'd681 : toneR = Aflat4; 14'd682 : toneR = Aflat4; 14'd683 : toneR = Aflat4;
14'd684 : toneR = Aflat4; 14'd685 : toneR = Aflat4; 14'd686 : toneR = Aflat4; 14'd687 : toneR = Aflat4;
14'd688 : toneR = Aflat4; 14'd689 : toneR = Aflat4; 14'd690 : toneR = Aflat4; 14'd691 : toneR = Aflat4;
14'd692 : toneR = Aflat4; 14'd693 : toneR = Aflat4; 14'd694 : toneR = Aflat4; 14'd695 : toneR = Aflat4;
14'd696 : toneR = Aflat4; 14'd697 : toneR = Aflat4; 14'd698 : toneR = Aflat4; 14'd699 : toneR = Aflat4;
14'd700 : toneR = Aflat4; 14'd701 : toneR = Aflat4; 14'd702 : toneR = Aflat4; 14'd703 : toneR = 1;
/*measure 12 */
14'd704 : toneR = A4; 14'd705 : toneR = A4; 14'd706 : toneR = A4; 14'd707 : toneR = A4;
14'd708 : toneR = A4; 14'd709 : toneR = A4; 14'd710 : toneR = A4; 14'd711 : toneR = A4;
14'd712 : toneR = A4; 14'd713 : toneR = A4; 14'd714 : toneR = A4; 14'd715 : toneR = A4;
14'd716 : toneR = A4; 14'd717 : toneR = A4; 14'd718 : toneR = A4; 14'd719 : toneR = A4;
14'd720 : toneR = A4; 14'd721 : toneR = A4; 14'd722 : toneR = A4; 14'd723 : toneR = A4;
14'd724 : toneR = A4; 14'd725 : toneR = A4; 14'd726 : toneR = A4; 14'd727 : toneR = A4;
14'd728 : toneR = A4; 14'd729 : toneR = A4; 14'd730 : toneR = A4; 14'd731 : toneR = A4;
14'd732 : toneR = A4; 14'd733 : toneR = A4; 14'd734 : toneR = A4; 14'd735 : toneR = 1;
14'd736 : toneR = A4; 14'd737 : toneR = A4; 14'd738 : toneR = A4; 14'd739 : toneR = A4;
14'd740 : toneR = A4; 14'd741 : toneR = A4; 14'd742 : toneR = A4; 14'd743 : toneR = A4;
14'd744 : toneR = A4; 14'd745 : toneR = A4; 14'd746 : toneR = A4; 14'd747 : toneR = A4;
14'd748 : toneR = A4; 14'd749 : toneR = A4; 14'd750 : toneR = A4; 14'd751 : toneR = A4;
14'd752 : toneR = A4; 14'd753 : toneR = A4; 14'd754 : toneR = A4; 14'd755 : toneR = A4;
14'd756 : toneR = A4; 14'd757 : toneR = A4; 14'd758 : toneR = A4; 14'd759 : toneR = A4;
14'd760 : toneR = A4; 14'd761 : toneR = A4; 14'd762 : toneR = A4; 14'd763 : toneR = A4;
14'd764 : toneR = A4; 14'd765 : toneR = A4; 14'd766 : toneR = A4; 14'd767 : toneR = 1;
/*measure 13 */
14'd768 : toneR = Bflat4; 14'd769 : toneR = Bflat4; 14'd770 : toneR = Bflat4; 14'd771 : toneR = Bflat4;
14'd772 : toneR = Bflat4; 14'd773 : toneR = Bflat4; 14'd774 : toneR = Bflat4; 14'd775 : toneR = Bflat4;
14'd776 : toneR = Bflat4; 14'd777 : toneR = Bflat4; 14'd778 : toneR = Bflat4; 14'd779 : toneR = Bflat4;
14'd780 : toneR = Bflat4; 14'd781 : toneR = Bflat4; 14'd782 : toneR = Bflat4; 14'd783 : toneR = Bflat4;
14'd784 : toneR = Bflat4; 14'd785 : toneR = Bflat4; 14'd786 : toneR = Bflat4; 14'd787 : toneR = Bflat4;
14'd788 : toneR = Bflat4; 14'd789 : toneR = Bflat4; 14'd790 : toneR = Bflat4; 14'd791 : toneR = Bflat4;
14'd792 : toneR = Bflat4; 14'd793 : toneR = Bflat4; 14'd794 : toneR = Bflat4; 14'd795 : toneR = Bflat4;
14'd796 : toneR = Bflat4; 14'd797 : toneR = Bflat4; 14'd798 : toneR = Bflat4; 14'd799 : toneR = 1;
14'd800 : toneR = Bflat4; 14'd801 : toneR = Bflat4; 14'd802 : toneR = Bflat4; 14'd803 : toneR = Bflat4;
14'd804 : toneR = Bflat4; 14'd805 : toneR = Bflat4; 14'd806 : toneR = Bflat4; 14'd807 : toneR = Bflat4;
14'd808 : toneR = Bflat4; 14'd809 : toneR = Bflat4; 14'd810 : toneR = Bflat4; 14'd811 : toneR = Bflat4;
14'd812 : toneR = Bflat4; 14'd813 : toneR = Bflat4; 14'd814 : toneR = Bflat4; 14'd815 : toneR = Bflat4;
14'd816 : toneR = Bflat4; 14'd817 : toneR = Bflat4; 14'd818 : toneR = Bflat4; 14'd819 : toneR = Bflat4;
14'd820 : toneR = Bflat4; 14'd821 : toneR = Bflat4; 14'd822 : toneR = Bflat4; 14'd823 : toneR = Bflat4;
14'd824 : toneR = Bflat4; 14'd825 : toneR = Bflat4; 14'd826 : toneR = Bflat4; 14'd827 : toneR = Bflat4;
14'd828 : toneR = Bflat4; 14'd829 : toneR = Bflat4; 14'd830 : toneR = Bflat4; 14'd831 : toneR = 1;
/*measure 14 */
14'd832 : toneR = B4; 14'd833 : toneR = B4; 14'd834 : toneR = B4; 14'd835 : toneR = B4;
14'd836 : toneR = B4; 14'd837 : toneR = B4; 14'd838 : toneR = B4; 14'd839 : toneR = B4;
14'd840 : toneR = B4; 14'd841 : toneR = B4; 14'd842 : toneR = B4; 14'd843 : toneR = B4;
14'd844 : toneR = B4; 14'd845 : toneR = B4; 14'd846 : toneR = B4; 14'd847 : toneR = B4;
14'd848 : toneR = B4; 14'd849 : toneR = B4; 14'd850 : toneR = B4; 14'd851 : toneR = B4;
14'd852 : toneR = B4; 14'd853 : toneR = B4; 14'd854 : toneR = B4; 14'd855 : toneR = B4;
14'd856 : toneR = B4; 14'd857 : toneR = B4; 14'd858 : toneR = B4; 14'd859 : toneR = B4;
14'd860 : toneR = B4; 14'd861 : toneR = B4; 14'd862 : toneR = B4; 14'd863 : toneR = 1;
14'd864 : toneR = B4; 14'd865 : toneR = B4; 14'd866 : toneR = B4; 14'd867 : toneR = B4;
14'd868 : toneR = B4; 14'd869 : toneR = B4; 14'd870 : toneR = B4; 14'd871 : toneR = B4;
14'd872 : toneR = B4; 14'd873 : toneR = B4; 14'd874 : toneR = B4; 14'd875 : toneR = B4;
14'd876 : toneR = B4; 14'd877 : toneR = B4; 14'd878 : toneR = B4; 14'd879 : toneR = B4;
14'd880 : toneR = B4; 14'd881 : toneR = B4; 14'd882 : toneR = B4; 14'd883 : toneR = B4;
14'd884 : toneR = B4; 14'd885 : toneR = B4; 14'd886 : toneR = B4; 14'd887 : toneR = B4;
14'd888 : toneR = B4; 14'd889 : toneR = B4; 14'd890 : toneR = B4; 14'd891 : toneR = B4;
14'd892 : toneR = B4; 14'd893 : toneR = B4; 14'd894 : toneR = B4; 14'd895 : toneR = 1;
/*measure 15 */
14'd896 : toneR = C5; 14'd897 : toneR = C5; 14'd898 : toneR = C5; 14'd899 : toneR = C5;
14'd900 : toneR = C5; 14'd901 : toneR = C5; 14'd902 : toneR = C5; 14'd903 : toneR = C5;
14'd904 : toneR = C5; 14'd905 : toneR = C5; 14'd906 : toneR = C5; 14'd907 : toneR = C5;
14'd908 : toneR = C5; 14'd909 : toneR = C5; 14'd910 : toneR = C5; 14'd911 : toneR = C5;
14'd912 : toneR = C5; 14'd913 : toneR = C5; 14'd914 : toneR = C5; 14'd915 : toneR = C5;
14'd916 : toneR = C5; 14'd917 : toneR = C5; 14'd918 : toneR = C5; 14'd919 : toneR = C5;
14'd920 : toneR = C5; 14'd921 : toneR = C5; 14'd922 : toneR = C5; 14'd923 : toneR = C5;
14'd924 : toneR = C5; 14'd925 : toneR = C5; 14'd926 : toneR = C5; 14'd927 : toneR = 1;
14'd928 : toneR = C5; 14'd929 : toneR = C5; 14'd930 : toneR = C5; 14'd931 : toneR = C5;
14'd932 : toneR = C5; 14'd933 : toneR = C5; 14'd934 : toneR = C5; 14'd935 : toneR = C5;
14'd936 : toneR = C5; 14'd937 : toneR = C5; 14'd938 : toneR = C5; 14'd939 : toneR = C5;
14'd940 : toneR = C5; 14'd941 : toneR = C5; 14'd942 : toneR = C5; 14'd943 : toneR = C5;
14'd944 : toneR = C5; 14'd945 : toneR = C5; 14'd946 : toneR = C5; 14'd947 : toneR = C5;
14'd948 : toneR = C5; 14'd949 : toneR = C5; 14'd950 : toneR = C5; 14'd951 : toneR = C5;
14'd952 : toneR = C5; 14'd953 : toneR = C5; 14'd954 : toneR = C5; 14'd955 : toneR = C5;
14'd956 : toneR = C5; 14'd957 : toneR = C5; 14'd958 : toneR = C5; 14'd959 : toneR = 1;
/*measure 16 */
14'd960 : toneR = C5; 14'd961 : toneR = C5; 14'd962 : toneR = C5; 14'd963 : toneR = C5;
14'd964 : toneR = C5; 14'd965 : toneR = C5; 14'd966 : toneR = C5; 14'd967 : toneR = C5;
14'd968 : toneR = C5; 14'd969 : toneR = C5; 14'd970 : toneR = C5; 14'd971 : toneR = C5;
14'd972 : toneR = C5; 14'd973 : toneR = C5; 14'd974 : toneR = C5; 14'd975 : toneR = C5;
14'd976 : toneR = C5; 14'd977 : toneR = C5; 14'd978 : toneR = C5; 14'd979 : toneR = C5;
14'd980 : toneR = C5; 14'd981 : toneR = C5; 14'd982 : toneR = C5; 14'd983 : toneR = C5;
14'd984 : toneR = C5; 14'd985 : toneR = C5; 14'd986 : toneR = C5; 14'd987 : toneR = C5;
14'd988 : toneR = C5; 14'd989 : toneR = C5; 14'd990 : toneR = C5; 14'd991 : toneR = 1;
14'd992 : toneR = Dflat5; 14'd993 : toneR = Dflat5; 14'd994 : toneR = Dflat5; 14'd995 : toneR = Dflat5;
14'd996 : toneR = Dflat5; 14'd997 : toneR = Dflat5; 14'd998 : toneR = Dflat5; 14'd999 : toneR = Dflat5;
14'd1000 : toneR = Dflat5; 14'd1001 : toneR = Dflat5; 14'd1002 : toneR = Dflat5; 14'd1003 : toneR = Dflat5;
14'd1004 : toneR = Dflat5; 14'd1005 : toneR = Dflat5; 14'd1006 : toneR = Dflat5; 14'd1007 : toneR = Dflat5;
14'd1008 : toneR = Dflat5; 14'd1009 : toneR = Dflat5; 14'd1010 : toneR = Dflat5; 14'd1011 : toneR = Dflat5;
14'd1012 : toneR = Dflat5; 14'd1013 : toneR = Dflat5; 14'd1014 : toneR = Dflat5; 14'd1015 : toneR = Dflat5;
14'd1016 : toneR = Dflat5; 14'd1017 : toneR = Dflat5; 14'd1018 : toneR = Dflat5; 14'd1019 : toneR = Dflat5;
14'd1020 : toneR = Dflat5; 14'd1021 : toneR = Dflat5; 14'd1022 : toneR = Dflat5; 14'd1023 : toneR = 1;

        default: toneR = 1;
        endcase
    end
endmodule