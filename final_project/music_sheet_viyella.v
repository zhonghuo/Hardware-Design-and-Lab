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
    parameter Dflat2 = 735294;  // D?2的頻率
    parameter D2 = 694444;      // D2的頻率
    parameter Dsharp2 = 657895; // D#2/Eb2的頻率
    parameter Eflat2 = 657895;  // E?2的頻率
    parameter E2 = 609756;      // E2的頻率
    parameter F2 = 581395;      // F2的頻率
    parameter Fsharp2 = 543478; // F#2/Gb2的頻率
    parameter Gflat2 = 543477;  // G?2的頻率
    parameter G2 = 510204;      // G2的頻率
    parameter Gsharp2 = 490196; // G#2/Ab2的頻率
    parameter Aflat2 = 490196;  // A?2的頻率
    parameter A2 = 454545;      // A2的頻率
    parameter Asharp2 = 431034; // A#2/Bb2的頻率
    parameter Bflat2 = 431034;  // B?2的頻率
    parameter B2 = 409836;      // B2的頻率
    
    parameter C3 = 390625;      // C3的頻率
    parameter Csharp3 = 367647; // C#3/Db3的頻率
    parameter Dflat3 = 367647;  // D?3的頻率
    parameter D3 = 347222;      // D3的頻率
    parameter Dsharp3 = 328947; // D#3/Eb3的頻率
    parameter Eflat3 = 328947;  // E?3的頻率
    parameter E3 = 304878;      // E3的頻率
    parameter F3 = 290323;      // F3的頻率
    parameter Fsharp3 = 271739; // F#3/Gb3的頻率
    parameter Gflat3 = 271738;  // G?3的頻率
    parameter G3 = 255102;      // G3的頻率
    parameter Gsharp3 = 245098; // G#3/Ab3的頻率
    parameter Aflat3 = 245098;  // A?3的頻率
    parameter A3 = 227273;      // A3的頻率
    parameter Asharp3 = 215517; // A#3/Bb3的頻率
    parameter Bflat3 = 215517;  // B?3的頻率
    parameter B3 = 204918;      // B3的頻率

    parameter C4 = 195312;      // C4的頻率
    parameter Csharp4 = 183824; // C#4/Db4的頻率
    parameter Dflat4 = 183824;  // D?4的頻率
    parameter D4 = 173611;      // D4的頻率
    parameter Dsharp4 = 164474; // D#4/Eb4的頻率
    parameter Eflat4 = 164474;  // E?4的頻率
    parameter E4 = 152439;      // E4的頻率
    parameter F4 = 145161;      // F4的頻率
    parameter Fsharp4 = 135870; // F#4/Gb4的頻率
    parameter Gflat4 = 135869;  // G?4的頻率
    parameter G4 = 127551;      // G4的頻率
    parameter Gsharp4 = 122549; // G#4/Ab4的頻率
    parameter Aflat4 = 122549;  // A?4的頻率
    parameter A4 = 113636;      // A4的頻率（標準調音：440 Hz）
    parameter Asharp4 = 107759; // A#4/Bb4的頻率
    parameter Bflat4 = 107759;  // B?4的頻率
    parameter B4 = 102459;      // B4的頻率

    parameter C5 = 97656;       // C5的頻率
    parameter Csharp5 = 91954;  // C#5/Db5的頻率
    parameter Dflat5 = 91954;   // D?5的頻率
    parameter D5 = 86806;       // D5的頻率
    parameter Dsharp5 = 82237;  // D#5/Eb5的頻率
    parameter Eflat5 = 82237;   // E?5的頻率
    parameter E5 = 76220;       // E5的頻率
    parameter F5 = 72581;       // F5的頻率
    parameter Fsharp5 = 67935;  // F#5/Gb5的頻率
    parameter Gflat5 = 67934;   // G?5的頻率
    parameter G5 = 63776;       // G5的頻率
    parameter Gsharp5 = 61275;  // G#5/Ab5的頻率
    parameter Aflat5 = 61275;   // A?5的頻率
    parameter A5 = 56818;       // A5的頻率
    parameter Asharp5 = 53880;  // A#5/Bb5的頻率
    parameter Bflat5 = 53880;   // B?5的頻率
    parameter B5 = 51229;       // B5的頻率

    parameter C6 = 48828;       // C6的頻率
    parameter Csharp6 = 45977;  // C#6/Db6的頻率
    parameter Dflat6 = 45977;   // D?6的頻率
    parameter D6 = 43403;       // D6的頻率
    parameter Dsharp6 = 41118;  // D#6/Eb6的頻率
    parameter Eflat6 = 41118;   // E?6的頻率
    parameter E6 = 38110;       // E6的頻率
    parameter F6 = 36290;       // F6的頻率
    parameter Fsharp6 = 33968;  // F#6/Gb6的頻率
    parameter Gflat6 = 33968;   // G?6的頻率
    parameter G6 = 31888;       // G6的頻率
    parameter Gsharp6 = 30638;  // G#6/Ab6的頻率
    parameter Aflat6 = 30638;   // A?6的頻率
    parameter A6 = 28409;       // A6的頻率
    parameter Asharp6 = 26940;  // A#6/Bb6的頻率
    parameter Bflat6 = 26940;   // B?6的頻率
    parameter B6 = 25614;       // B6的頻率

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
14'd576 : toneL = C1; 14'd577 : toneL = C1; 14'd578 : toneL = C1; 14'd579 : toneL = C1;
14'd580 : toneL = C1; 14'd581 : toneL = C1; 14'd582 : toneL = C1; 14'd583 : toneL = C1;
14'd584 : toneL = C1; 14'd585 : toneL = C1; 14'd586 : toneL = C1; 14'd587 : toneL = C1;
14'd588 : toneL = C1; 14'd589 : toneL = C1; 14'd590 : toneL = C1; 14'd591 : toneL = C1;
14'd592 : toneL = C1; 14'd593 : toneL = C1; 14'd594 : toneL = C1; 14'd595 : toneL = C1;
14'd596 : toneL = C1; 14'd597 : toneL = C1; 14'd598 : toneL = C1; 14'd599 : toneL = C1;
14'd600 : toneL = C1; 14'd601 : toneL = C1; 14'd602 : toneL = C1; 14'd603 : toneL = C1;
14'd604 : toneL = C1; 14'd605 : toneL = C1; 14'd606 : toneL = C1; 14'd607 : toneL = 1;
14'd608 : toneL = E1; 14'd609 : toneL = E1; 14'd610 : toneL = E1; 14'd611 : toneL = E1;
14'd612 : toneL = E1; 14'd613 : toneL = E1; 14'd614 : toneL = E1; 14'd615 : toneL = E1;
14'd616 : toneL = E1; 14'd617 : toneL = E1; 14'd618 : toneL = E1; 14'd619 : toneL = E1;
14'd620 : toneL = E1; 14'd621 : toneL = E1; 14'd622 : toneL = E1; 14'd623 : toneL = E1;
14'd624 : toneL = E1; 14'd625 : toneL = E1; 14'd626 : toneL = E1; 14'd627 : toneL = E1;
14'd628 : toneL = E1; 14'd629 : toneL = E1; 14'd630 : toneL = E1; 14'd631 : toneL = E1;
14'd632 : toneL = E1; 14'd633 : toneL = E1; 14'd634 : toneL = E1; 14'd635 : toneL = E1;
14'd636 : toneL = E1; 14'd637 : toneL = E1; 14'd638 : toneL = E1; 14'd639 : toneL = 1;
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
/*measure 17 */
14'd1024 : toneL = C3; 14'd1025 : toneL = C3; 14'd1026 : toneL = C3; 14'd1027 : toneL = C3;
14'd1028 : toneL = C3; 14'd1029 : toneL = C3; 14'd1030 : toneL = C3; 14'd1031 : toneL = C3;
14'd1032 : toneL = C3; 14'd1033 : toneL = C3; 14'd1034 : toneL = C3; 14'd1035 : toneL = C3;
14'd1036 : toneL = C3; 14'd1037 : toneL = C3; 14'd1038 : toneL = C3; 14'd1039 : toneL = 1;
14'd1040 : toneL = 1; 14'd1041 : toneL = 1; 14'd1042 : toneL = 1; 14'd1043 : toneL = 1;
14'd1044 : toneL = 1; 14'd1045 : toneL = 1; 14'd1046 : toneL = 1; 14'd1047 : toneL = 1;
14'd1048 : toneL = 1; 14'd1049 : toneL = 1; 14'd1050 : toneL = 1; 14'd1051 : toneL = 1;
14'd1052 : toneL = 1; 14'd1053 : toneL = 1; 14'd1054 : toneL = 1; 14'd1055 : toneL = 1;
14'd1056 : toneL = A4; 14'd1057 : toneL = A4; 14'd1058 : toneL = A4; 14'd1059 : toneL = 1;
14'd1060 : toneL = Eflat5; 14'd1061 : toneL = Eflat5; 14'd1062 : toneL = Eflat5; 14'd1063 : toneL = 1;
14'd1064 : toneL = C5; 14'd1065 : toneL = C5; 14'd1066 : toneL = C5; 14'd1067 : toneL = 1;
14'd1068 : toneL = Eflat5; 14'd1069 : toneL = Eflat5; 14'd1070 : toneL = Eflat5; 14'd1071 : toneL = 1;
14'd1072 : toneL = Fsharp4; 14'd1073 : toneL = Fsharp4; 14'd1074 : toneL = Fsharp4; 14'd1075 : toneL = 1;
14'd1076 : toneL = C5; 14'd1077 : toneL = C5; 14'd1078 : toneL = C5; 14'd1079 : toneL = 1;
14'd1080 : toneL = A4; 14'd1081 : toneL = A4; 14'd1082 : toneL = A4; 14'd1083 : toneL = 1;
14'd1084 : toneL = C5; 14'd1085 : toneL = C5; 14'd1086 : toneL = C5; 14'd1087 : toneL = 1;
/*measure 18 */
14'd1088 : toneL = Eflat4; 14'd1089 : toneL = Eflat4; 14'd1090 : toneL = Eflat4; 14'd1091 : toneL = 1;
14'd1092 : toneL = A4; 14'd1093 : toneL = A4; 14'd1094 : toneL = A4; 14'd1095 : toneL = 1;
14'd1096 : toneL = Gflat4; 14'd1097 : toneL = Gflat4; 14'd1098 : toneL = Gflat4; 14'd1099 : toneL = 1;
14'd1100 : toneL = A4; 14'd1101 : toneL = A4; 14'd1102 : toneL = A4; 14'd1103 : toneL = 1;
14'd1104 : toneL = C4; 14'd1105 : toneL = C4; 14'd1106 : toneL = C4; 14'd1107 : toneL = 1;
14'd1108 : toneL = Gflat4; 14'd1109 : toneL = Gflat4; 14'd1110 : toneL = Gflat4; 14'd1111 : toneL = 1;
14'd1112 : toneL = Eflat4; 14'd1113 : toneL = Eflat4; 14'd1114 : toneL = Eflat4; 14'd1115 : toneL = 1;
14'd1116 : toneL = Gflat4; 14'd1117 : toneL = Gflat4; 14'd1118 : toneL = Gflat4; 14'd1119 : toneL = 1;
14'd1120 : toneL = A3; 14'd1121 : toneL = A3; 14'd1122 : toneL = A3; 14'd1123 : toneL = 1;
14'd1124 : toneL = Eflat4; 14'd1125 : toneL = Eflat4; 14'd1126 : toneL = Eflat4; 14'd1127 : toneL = 1;
14'd1128 : toneL = C4; 14'd1129 : toneL = C4; 14'd1130 : toneL = C4; 14'd1131 : toneL = 1;
14'd1132 : toneL = Eflat4; 14'd1133 : toneL = Eflat4; 14'd1134 : toneL = Eflat4; 14'd1135 : toneL = 1;
14'd1136 : toneL = Fsharp3; 14'd1137 : toneL = Fsharp3; 14'd1138 : toneL = Fsharp3; 14'd1139 : toneL = Fsharp3;
14'd1140 : toneL = Fsharp3; 14'd1141 : toneL = Fsharp3; 14'd1142 : toneL = Fsharp3; 14'd1143 : toneL = 1;
14'd1144 : toneL = 1; 14'd1145 : toneL = 1; 14'd1146 : toneL = 1; 14'd1147 : toneL = 1;
14'd1148 : toneL = 1; 14'd1149 : toneL = 1; 14'd1150 : toneL = 1; 14'd1151 : toneL = 1;
/*measure 19 */
14'd1152 : toneL = F2; 14'd1153 : toneL = F2; 14'd1154 : toneL = F2; 14'd1155 : toneL = F2;
14'd1156 : toneL = F2; 14'd1157 : toneL = F2; 14'd1158 : toneL = F2; 14'd1159 : toneL = F2;
14'd1160 : toneL = F2; 14'd1161 : toneL = F2; 14'd1162 : toneL = F2; 14'd1163 : toneL = F2;
14'd1164 : toneL = F2; 14'd1165 : toneL = F2; 14'd1166 : toneL = F2; 14'd1167 : toneL = 1;
14'd1168 : toneL = F2; 14'd1169 : toneL = F2; 14'd1170 : toneL = F2; 14'd1171 : toneL = F2;
14'd1172 : toneL = F2; 14'd1173 : toneL = F2; 14'd1174 : toneL = F2; 14'd1175 : toneL = 1;
14'd1176 : toneL = C3; 14'd1177 : toneL = C3; 14'd1178 : toneL = C3; 14'd1179 : toneL = C3;
14'd1180 : toneL = C3; 14'd1181 : toneL = C3; 14'd1182 : toneL = C3; 14'd1183 : toneL = 1;
14'd1184 : toneL = F2; 14'd1185 : toneL = F2; 14'd1186 : toneL = F2; 14'd1187 : toneL = F2;
14'd1188 : toneL = F2; 14'd1189 : toneL = F2; 14'd1190 : toneL = F2; 14'd1191 : toneL = 1;
14'd1192 : toneL = C3; 14'd1193 : toneL = C3; 14'd1194 : toneL = C3; 14'd1195 : toneL = C3;
14'd1196 : toneL = C3; 14'd1197 : toneL = C3; 14'd1198 : toneL = C3; 14'd1199 : toneL = 1;
14'd1200 : toneL = F2; 14'd1201 : toneL = F2; 14'd1202 : toneL = F2; 14'd1203 : toneL = F2;
14'd1204 : toneL = F2; 14'd1205 : toneL = F2; 14'd1206 : toneL = F2; 14'd1207 : toneL = 1;
14'd1208 : toneL = C3; 14'd1209 : toneL = C3; 14'd1210 : toneL = C3; 14'd1211 : toneL = C3;
14'd1212 : toneL = C3; 14'd1213 : toneL = C3; 14'd1214 : toneL = C3; 14'd1215 : toneL = 1;
/*measure 20 */
14'd1216 : toneL = F2; 14'd1217 : toneL = F2; 14'd1218 : toneL = F2; 14'd1219 : toneL = F2;
14'd1220 : toneL = F2; 14'd1221 : toneL = F2; 14'd1222 : toneL = F2; 14'd1223 : toneL = 1;
14'd1224 : toneL = C3; 14'd1225 : toneL = C3; 14'd1226 : toneL = C3; 14'd1227 : toneL = C3;
14'd1228 : toneL = C3; 14'd1229 : toneL = C3; 14'd1230 : toneL = C3; 14'd1231 : toneL = 1;
14'd1232 : toneL = F2; 14'd1233 : toneL = F2; 14'd1234 : toneL = F2; 14'd1235 : toneL = F2;
14'd1236 : toneL = F2; 14'd1237 : toneL = F2; 14'd1238 : toneL = F2; 14'd1239 : toneL = 1;
14'd1240 : toneL = C3; 14'd1241 : toneL = C3; 14'd1242 : toneL = C3; 14'd1243 : toneL = C3;
14'd1244 : toneL = C3; 14'd1245 : toneL = C3; 14'd1246 : toneL = C3; 14'd1247 : toneL = 1;
14'd1248 : toneL = F2; 14'd1249 : toneL = F2; 14'd1250 : toneL = F2; 14'd1251 : toneL = F2;
14'd1252 : toneL = F2; 14'd1253 : toneL = F2; 14'd1254 : toneL = F2; 14'd1255 : toneL = 1;
14'd1256 : toneL = C3; 14'd1257 : toneL = C3; 14'd1258 : toneL = C3; 14'd1259 : toneL = C3;
14'd1260 : toneL = C3; 14'd1261 : toneL = C3; 14'd1262 : toneL = C3; 14'd1263 : toneL = 1;
14'd1264 : toneL = F2; 14'd1265 : toneL = F2; 14'd1266 : toneL = F2; 14'd1267 : toneL = F2;
14'd1268 : toneL = F2; 14'd1269 : toneL = F2; 14'd1270 : toneL = F2; 14'd1271 : toneL = 1;
14'd1272 : toneL = C3; 14'd1273 : toneL = C3; 14'd1274 : toneL = C3; 14'd1275 : toneL = C3;
14'd1276 : toneL = C3; 14'd1277 : toneL = C3; 14'd1278 : toneL = C3; 14'd1279 : toneL = 1;
/*measure 21 */
14'd1280 : toneL = F2; 14'd1281 : toneL = F2; 14'd1282 : toneL = F2; 14'd1283 : toneL = F2;
14'd1284 : toneL = F2; 14'd1285 : toneL = F2; 14'd1286 : toneL = F2; 14'd1287 : toneL = 1;
14'd1288 : toneL = C3; 14'd1289 : toneL = C3; 14'd1290 : toneL = C3; 14'd1291 : toneL = C3;
14'd1292 : toneL = C3; 14'd1293 : toneL = C3; 14'd1294 : toneL = C3; 14'd1295 : toneL = 1;
14'd1296 : toneL = F2; 14'd1297 : toneL = F2; 14'd1298 : toneL = F2; 14'd1299 : toneL = F2;
14'd1300 : toneL = F2; 14'd1301 : toneL = F2; 14'd1302 : toneL = F2; 14'd1303 : toneL = 1;
14'd1304 : toneL = C3; 14'd1305 : toneL = C3; 14'd1306 : toneL = C3; 14'd1307 : toneL = C3;
14'd1308 : toneL = C3; 14'd1309 : toneL = C3; 14'd1310 : toneL = C3; 14'd1311 : toneL = 1;
14'd1312 : toneL = F2; 14'd1313 : toneL = F2; 14'd1314 : toneL = F2; 14'd1315 : toneL = F2;
14'd1316 : toneL = F2; 14'd1317 : toneL = F2; 14'd1318 : toneL = F2; 14'd1319 : toneL = F2;
14'd1320 : toneL = F2; 14'd1321 : toneL = F2; 14'd1322 : toneL = F2; 14'd1323 : toneL = F2;
14'd1324 : toneL = F2; 14'd1325 : toneL = F2; 14'd1326 : toneL = F2; 14'd1327 : toneL = 1;
14'd1328 : toneL = F2; 14'd1329 : toneL = F2; 14'd1330 : toneL = F2; 14'd1331 : toneL = F2;
14'd1332 : toneL = F2; 14'd1333 : toneL = F2; 14'd1334 : toneL = F2; 14'd1335 : toneL = F2;
14'd1336 : toneL = F2; 14'd1337 : toneL = F2; 14'd1338 : toneL = F2; 14'd1339 : toneL = F2;
14'd1340 : toneL = F2; 14'd1341 : toneL = F2; 14'd1342 : toneL = F2; 14'd1343 : toneL = 1;
/*measure 22 */
14'd1344 : toneL = C3; 14'd1345 : toneL = C3; 14'd1346 : toneL = C3; 14'd1347 : toneL = C3;
14'd1348 : toneL = C3; 14'd1349 : toneL = C3; 14'd1350 : toneL = C3; 14'd1351 : toneL = C3;
14'd1352 : toneL = C3; 14'd1353 : toneL = C3; 14'd1354 : toneL = C3; 14'd1355 : toneL = C3;
14'd1356 : toneL = C3; 14'd1357 : toneL = C3; 14'd1358 : toneL = C3; 14'd1359 : toneL = 1;
14'd1360 : toneL = Dflat3; 14'd1361 : toneL = Dflat3; 14'd1362 : toneL = Dflat3; 14'd1363 : toneL = Dflat3;
14'd1364 : toneL = Dflat3; 14'd1365 : toneL = Dflat3; 14'd1366 : toneL = Dflat3; 14'd1367 : toneL = Dflat3;
14'd1368 : toneL = Dflat3; 14'd1369 : toneL = Dflat3; 14'd1370 : toneL = Dflat3; 14'd1371 : toneL = Dflat3;
14'd1372 : toneL = Dflat3; 14'd1373 : toneL = Dflat3; 14'd1374 : toneL = Dflat3; 14'd1375 : toneL = 1;
14'd1376 : toneL = Bflat2; 14'd1377 : toneL = Bflat2; 14'd1378 : toneL = Bflat2; 14'd1379 : toneL = Bflat2;
14'd1380 : toneL = Bflat2; 14'd1381 : toneL = Bflat2; 14'd1382 : toneL = Bflat2; 14'd1383 : toneL = Bflat2;
14'd1384 : toneL = Bflat2; 14'd1385 : toneL = Bflat2; 14'd1386 : toneL = Bflat2; 14'd1387 : toneL = Bflat2;
14'd1388 : toneL = Bflat2; 14'd1389 : toneL = Bflat2; 14'd1390 : toneL = Bflat2; 14'd1391 : toneL = 1;
14'd1392 : toneL = C3; 14'd1393 : toneL = C3; 14'd1394 : toneL = C3; 14'd1395 : toneL = C3;
14'd1396 : toneL = C3; 14'd1397 : toneL = C3; 14'd1398 : toneL = C3; 14'd1399 : toneL = C3;
14'd1400 : toneL = C3; 14'd1401 : toneL = C3; 14'd1402 : toneL = C3; 14'd1403 : toneL = C3;
14'd1404 : toneL = C3; 14'd1405 : toneL = C3; 14'd1406 : toneL = C3; 14'd1407 : toneL = 1;
/*measure 23 */
14'd1408 : toneL = F2; 14'd1409 : toneL = F2; 14'd1410 : toneL = F2; 14'd1411 : toneL = F2;
14'd1412 : toneL = F2; 14'd1413 : toneL = F2; 14'd1414 : toneL = F2; 14'd1415 : toneL = F2;
14'd1416 : toneL = F2; 14'd1417 : toneL = F2; 14'd1418 : toneL = F2; 14'd1419 : toneL = F2;
14'd1420 : toneL = F2; 14'd1421 : toneL = F2; 14'd1422 : toneL = F2; 14'd1423 : toneL = 1;
14'd1424 : toneL = F2; 14'd1425 : toneL = F2; 14'd1426 : toneL = F2; 14'd1427 : toneL = F2;
14'd1428 : toneL = F2; 14'd1429 : toneL = F2; 14'd1430 : toneL = F2; 14'd1431 : toneL = 1;
14'd1432 : toneL = C3; 14'd1433 : toneL = C3; 14'd1434 : toneL = C3; 14'd1435 : toneL = C3;
14'd1436 : toneL = C3; 14'd1437 : toneL = C3; 14'd1438 : toneL = C3; 14'd1439 : toneL = 1;
14'd1440 : toneL = F2; 14'd1441 : toneL = F2; 14'd1442 : toneL = F2; 14'd1443 : toneL = F2;
14'd1444 : toneL = F2; 14'd1445 : toneL = F2; 14'd1446 : toneL = F2; 14'd1447 : toneL = 1;
14'd1448 : toneL = C3; 14'd1449 : toneL = C3; 14'd1450 : toneL = C3; 14'd1451 : toneL = C3;
14'd1452 : toneL = C3; 14'd1453 : toneL = C3; 14'd1454 : toneL = C3; 14'd1455 : toneL = 1;
14'd1456 : toneL = F2; 14'd1457 : toneL = F2; 14'd1458 : toneL = F2; 14'd1459 : toneL = F2;
14'd1460 : toneL = F2; 14'd1461 : toneL = F2; 14'd1462 : toneL = F2; 14'd1463 : toneL = 1;
14'd1464 : toneL = C3; 14'd1465 : toneL = C3; 14'd1466 : toneL = C3; 14'd1467 : toneL = C3;
14'd1468 : toneL = C3; 14'd1469 : toneL = C3; 14'd1470 : toneL = C3; 14'd1471 : toneL = 1;
/*measure 24 */
14'd1472 : toneL = F2; 14'd1473 : toneL = F2; 14'd1474 : toneL = F2; 14'd1475 : toneL = F2;
14'd1476 : toneL = F2; 14'd1477 : toneL = F2; 14'd1478 : toneL = F2; 14'd1479 : toneL = 1;
14'd1480 : toneL = C3; 14'd1481 : toneL = C3; 14'd1482 : toneL = C3; 14'd1483 : toneL = C3;
14'd1484 : toneL = C3; 14'd1485 : toneL = C3; 14'd1486 : toneL = C3; 14'd1487 : toneL = 1;
14'd1488 : toneL = F2; 14'd1489 : toneL = F2; 14'd1490 : toneL = F2; 14'd1491 : toneL = F2;
14'd1492 : toneL = F2; 14'd1493 : toneL = F2; 14'd1494 : toneL = F2; 14'd1495 : toneL = 1;
14'd1496 : toneL = C3; 14'd1497 : toneL = C3; 14'd1498 : toneL = C3; 14'd1499 : toneL = C3;
14'd1500 : toneL = C3; 14'd1501 : toneL = C3; 14'd1502 : toneL = C3; 14'd1503 : toneL = 1;
14'd1504 : toneL = F2; 14'd1505 : toneL = F2; 14'd1506 : toneL = F2; 14'd1507 : toneL = F2;
14'd1508 : toneL = F2; 14'd1509 : toneL = F2; 14'd1510 : toneL = F2; 14'd1511 : toneL = 1;
14'd1512 : toneL = C3; 14'd1513 : toneL = C3; 14'd1514 : toneL = C3; 14'd1515 : toneL = C3;
14'd1516 : toneL = C3; 14'd1517 : toneL = C3; 14'd1518 : toneL = C3; 14'd1519 : toneL = 1;
14'd1520 : toneL = F2; 14'd1521 : toneL = F2; 14'd1522 : toneL = F2; 14'd1523 : toneL = F2;
14'd1524 : toneL = F2; 14'd1525 : toneL = F2; 14'd1526 : toneL = F2; 14'd1527 : toneL = 1;
14'd1528 : toneL = C3; 14'd1529 : toneL = C3; 14'd1530 : toneL = C3; 14'd1531 : toneL = C3;
14'd1532 : toneL = C3; 14'd1533 : toneL = C3; 14'd1534 : toneL = C3; 14'd1535 : toneL = 1;
/*measure 25 */
14'd1536 : toneL = F2; 14'd1537 : toneL = F2; 14'd1538 : toneL = F2; 14'd1539 : toneL = F2;
14'd1540 : toneL = F2; 14'd1541 : toneL = F2; 14'd1542 : toneL = F2; 14'd1543 : toneL = 1;
14'd1544 : toneL = C3; 14'd1545 : toneL = C3; 14'd1546 : toneL = C3; 14'd1547 : toneL = C3;
14'd1548 : toneL = C3; 14'd1549 : toneL = C3; 14'd1550 : toneL = C3; 14'd1551 : toneL = 1;
14'd1552 : toneL = F2; 14'd1553 : toneL = F2; 14'd1554 : toneL = F2; 14'd1555 : toneL = F2;
14'd1556 : toneL = F2; 14'd1557 : toneL = F2; 14'd1558 : toneL = F2; 14'd1559 : toneL = 1;
14'd1560 : toneL = C3; 14'd1561 : toneL = C3; 14'd1562 : toneL = C3; 14'd1563 : toneL = C3;
14'd1564 : toneL = C3; 14'd1565 : toneL = C3; 14'd1566 : toneL = C3; 14'd1567 : toneL = 1;
14'd1568 : toneL = F2; 14'd1569 : toneL = F2; 14'd1570 : toneL = F2; 14'd1571 : toneL = F2;
14'd1572 : toneL = F2; 14'd1573 : toneL = F2; 14'd1574 : toneL = F2; 14'd1575 : toneL = 1;
14'd1576 : toneL = F2; 14'd1577 : toneL = F2; 14'd1578 : toneL = F2; 14'd1579 : toneL = F2;
14'd1580 : toneL = F2; 14'd1581 : toneL = F2; 14'd1582 : toneL = F2; 14'd1583 : toneL = 1;
14'd1584 : toneL = F2; 14'd1585 : toneL = F2; 14'd1586 : toneL = F2; 14'd1587 : toneL = F2;
14'd1588 : toneL = F2; 14'd1589 : toneL = F2; 14'd1590 : toneL = F2; 14'd1591 : toneL = 1;
14'd1592 : toneL = F2; 14'd1593 : toneL = F2; 14'd1594 : toneL = F2; 14'd1595 : toneL = F2;
14'd1596 : toneL = F2; 14'd1597 : toneL = F2; 14'd1598 : toneL = F2; 14'd1599 : toneL = 1;
/*measure 26 */
14'd1600 : toneL = Dflat3; 14'd1601 : toneL = Dflat3; 14'd1602 : toneL = Dflat3; 14'd1603 : toneL = Dflat3;
14'd1604 : toneL = Dflat3; 14'd1605 : toneL = Dflat3; 14'd1606 : toneL = Dflat3; 14'd1607 : toneL = Dflat3;
14'd1608 : toneL = Dflat3; 14'd1609 : toneL = Dflat3; 14'd1610 : toneL = Dflat3; 14'd1611 : toneL = 1;
14'd1612 : toneL = Bflat3; 14'd1613 : toneL = Bflat3; 14'd1614 : toneL = Bflat3; 14'd1615 : toneL = 1;
14'd1616 : toneL = Bflat4; 14'd1617 : toneL = Bflat4; 14'd1618 : toneL = Bflat4; 14'd1619 : toneL = Bflat4;
14'd1620 : toneL = Bflat4; 14'd1621 : toneL = Bflat4; 14'd1622 : toneL = Bflat4; 14'd1623 : toneL = Bflat4;
14'd1624 : toneL = Bflat4; 14'd1625 : toneL = Bflat4; 14'd1626 : toneL = Bflat4; 14'd1627 : toneL = Bflat4;
14'd1628 : toneL = Bflat4; 14'd1629 : toneL = Bflat4; 14'd1630 : toneL = Bflat4; 14'd1631 : toneL = 1;
14'd1632 : toneL = C3; 14'd1633 : toneL = C3; 14'd1634 : toneL = C3; 14'd1635 : toneL = C3;
14'd1636 : toneL = C3; 14'd1637 : toneL = C3; 14'd1638 : toneL = C3; 14'd1639 : toneL = C3;
14'd1640 : toneL = C3; 14'd1641 : toneL = C3; 14'd1642 : toneL = C3; 14'd1643 : toneL = C3;
14'd1644 : toneL = C3; 14'd1645 : toneL = C3; 14'd1646 : toneL = C3; 14'd1647 : toneL = 1;
14'd1648 : toneL = C2; 14'd1649 : toneL = C2; 14'd1650 : toneL = C2; 14'd1651 : toneL = C2;
14'd1652 : toneL = C2; 14'd1653 : toneL = C2; 14'd1654 : toneL = C2; 14'd1655 : toneL = C2;
14'd1656 : toneL = C2; 14'd1657 : toneL = C2; 14'd1658 : toneL = C2; 14'd1659 : toneL = C2;
14'd1660 : toneL = C2; 14'd1661 : toneL = C2; 14'd1662 : toneL = C2; 14'd1663 : toneL = 1;
/*measure 27 */
14'd1664 : toneL = Dflat2; 14'd1665 : toneL = Dflat2; 14'd1666 : toneL = Dflat2; 14'd1667 : toneL = Dflat2;
14'd1668 : toneL = Dflat2; 14'd1669 : toneL = Dflat2; 14'd1670 : toneL = Dflat2; 14'd1671 : toneL = Dflat2;
14'd1672 : toneL = Dflat2; 14'd1673 : toneL = Dflat2; 14'd1674 : toneL = Dflat2; 14'd1675 : toneL = Dflat2;
14'd1676 : toneL = Dflat2; 14'd1677 : toneL = Dflat2; 14'd1678 : toneL = Dflat2; 14'd1679 : toneL = 1;
14'd1680 : toneL = Dflat2; 14'd1681 : toneL = Dflat2; 14'd1682 : toneL = Dflat2; 14'd1683 : toneL = Dflat2;
14'd1684 : toneL = Dflat2; 14'd1685 : toneL = Dflat2; 14'd1686 : toneL = Dflat2; 14'd1687 : toneL = 1;
14'd1688 : toneL = F3; 14'd1689 : toneL = F3; 14'd1690 : toneL = F3; 14'd1691 : toneL = F3;
14'd1692 : toneL = F3; 14'd1693 : toneL = F3; 14'd1694 : toneL = F3; 14'd1695 : toneL = 1;
14'd1696 : toneL = Dflat2; 14'd1697 : toneL = Dflat2; 14'd1698 : toneL = Dflat2; 14'd1699 : toneL = Dflat2;
14'd1700 : toneL = Dflat2; 14'd1701 : toneL = Dflat2; 14'd1702 : toneL = Dflat2; 14'd1703 : toneL = 1;
14'd1704 : toneL = F3; 14'd1705 : toneL = F3; 14'd1706 : toneL = F3; 14'd1707 : toneL = F3;
14'd1708 : toneL = F3; 14'd1709 : toneL = F3; 14'd1710 : toneL = F3; 14'd1711 : toneL = 1;
14'd1712 : toneL = Dflat2; 14'd1713 : toneL = Dflat2; 14'd1714 : toneL = Dflat2; 14'd1715 : toneL = Dflat2;
14'd1716 : toneL = Dflat2; 14'd1717 : toneL = Dflat2; 14'd1718 : toneL = Dflat2; 14'd1719 : toneL = 1;
14'd1720 : toneL = F3; 14'd1721 : toneL = F3; 14'd1722 : toneL = F3; 14'd1723 : toneL = F3;
14'd1724 : toneL = F3; 14'd1725 : toneL = F3; 14'd1726 : toneL = F3; 14'd1727 : toneL = 1;
/*measure 28 */
14'd1728 : toneL = C2; 14'd1729 : toneL = C2; 14'd1730 : toneL = C2; 14'd1731 : toneL = C2;
14'd1732 : toneL = C2; 14'd1733 : toneL = C2; 14'd1734 : toneL = C2; 14'd1735 : toneL = 1;
14'd1736 : toneL = E3; 14'd1737 : toneL = E3; 14'd1738 : toneL = E3; 14'd1739 : toneL = E3;
14'd1740 : toneL = E3; 14'd1741 : toneL = E3; 14'd1742 : toneL = E3; 14'd1743 : toneL = 1;
14'd1744 : toneL = C2; 14'd1745 : toneL = C2; 14'd1746 : toneL = C2; 14'd1747 : toneL = C2;
14'd1748 : toneL = C2; 14'd1749 : toneL = C2; 14'd1750 : toneL = C2; 14'd1751 : toneL = 1;
14'd1752 : toneL = E3; 14'd1753 : toneL = E3; 14'd1754 : toneL = E3; 14'd1755 : toneL = E3;
14'd1756 : toneL = E3; 14'd1757 : toneL = E3; 14'd1758 : toneL = E3; 14'd1759 : toneL = 1;
14'd1760 : toneL = C2; 14'd1761 : toneL = C2; 14'd1762 : toneL = C2; 14'd1763 : toneL = C2;
14'd1764 : toneL = C2; 14'd1765 : toneL = C2; 14'd1766 : toneL = C2; 14'd1767 : toneL = 1;
14'd1768 : toneL = E3; 14'd1769 : toneL = E3; 14'd1770 : toneL = E3; 14'd1771 : toneL = E3;
14'd1772 : toneL = E3; 14'd1773 : toneL = E3; 14'd1774 : toneL = E3; 14'd1775 : toneL = 1;
14'd1776 : toneL = C2; 14'd1777 : toneL = C2; 14'd1778 : toneL = C2; 14'd1779 : toneL = C2;
14'd1780 : toneL = C2; 14'd1781 : toneL = C2; 14'd1782 : toneL = C2; 14'd1783 : toneL = 1;
14'd1784 : toneL = E3; 14'd1785 : toneL = E3; 14'd1786 : toneL = E3; 14'd1787 : toneL = E3;
14'd1788 : toneL = E3; 14'd1789 : toneL = E3; 14'd1790 : toneL = E3; 14'd1791 : toneL = 1;
/*measure 29 */
14'd1792 : toneL = F1; 14'd1793 : toneL = F1; 14'd1794 : toneL = F1; 14'd1795 : toneL = F1;
14'd1796 : toneL = F1; 14'd1797 : toneL = F1; 14'd1798 : toneL = F1; 14'd1799 : toneL = 1;
14'd1800 : toneL = A2; 14'd1801 : toneL = A2; 14'd1802 : toneL = A2; 14'd1803 : toneL = A2;
14'd1804 : toneL = A2; 14'd1805 : toneL = A2; 14'd1806 : toneL = A2; 14'd1807 : toneL = 1;
14'd1808 : toneL = F1; 14'd1809 : toneL = F1; 14'd1810 : toneL = F1; 14'd1811 : toneL = F1;
14'd1812 : toneL = F1; 14'd1813 : toneL = F1; 14'd1814 : toneL = F1; 14'd1815 : toneL = 1;
14'd1816 : toneL = A2; 14'd1817 : toneL = A2; 14'd1818 : toneL = A2; 14'd1819 : toneL = A2;
14'd1820 : toneL = A2; 14'd1821 : toneL = A2; 14'd1822 : toneL = A2; 14'd1823 : toneL = 1;
14'd1824 : toneL = F1; 14'd1825 : toneL = F1; 14'd1826 : toneL = F1; 14'd1827 : toneL = F1;
14'd1828 : toneL = F1; 14'd1829 : toneL = F1; 14'd1830 : toneL = F1; 14'd1831 : toneL = 1;
14'd1832 : toneL = A2; 14'd1833 : toneL = A2; 14'd1834 : toneL = A2; 14'd1835 : toneL = A2;
14'd1836 : toneL = A2; 14'd1837 : toneL = A2; 14'd1838 : toneL = A2; 14'd1839 : toneL = 1;
14'd1840 : toneL = F1; 14'd1841 : toneL = F1; 14'd1842 : toneL = F1; 14'd1843 : toneL = F1;
14'd1844 : toneL = F1; 14'd1845 : toneL = F1; 14'd1846 : toneL = F1; 14'd1847 : toneL = 1;
14'd1848 : toneL = A2; 14'd1849 : toneL = A2; 14'd1850 : toneL = A2; 14'd1851 : toneL = A2;
14'd1852 : toneL = A2; 14'd1853 : toneL = A2; 14'd1854 : toneL = A2; 14'd1855 : toneL = 1;
/*measure 30 */
14'd1856 : toneL = Eflat2; 14'd1857 : toneL = Eflat2; 14'd1858 : toneL = Eflat2; 14'd1859 : toneL = Eflat2;
14'd1860 : toneL = Eflat2; 14'd1861 : toneL = Eflat2; 14'd1862 : toneL = Eflat2; 14'd1863 : toneL = Eflat2;
14'd1864 : toneL = Eflat2; 14'd1865 : toneL = Eflat2; 14'd1866 : toneL = Eflat2; 14'd1867 : toneL = Eflat2;
14'd1868 : toneL = Eflat2; 14'd1869 : toneL = Eflat2; 14'd1870 : toneL = Eflat2; 14'd1871 : toneL = 1;
14'd1872 : toneL = G3; 14'd1873 : toneL = G3; 14'd1874 : toneL = G3; 14'd1875 : toneL = G3;
14'd1876 : toneL = G3; 14'd1877 : toneL = G3; 14'd1878 : toneL = G3; 14'd1879 : toneL = G3;
14'd1880 : toneL = G3; 14'd1881 : toneL = G3; 14'd1882 : toneL = G3; 14'd1883 : toneL = G3;
14'd1884 : toneL = G3; 14'd1885 : toneL = G3; 14'd1886 : toneL = G3; 14'd1887 : toneL = 1;
14'd1888 : toneL = Eflat3; 14'd1889 : toneL = Eflat3; 14'd1890 : toneL = Eflat3; 14'd1891 : toneL = Eflat3;
14'd1892 : toneL = 1; 14'd1893 : toneL = Bflat2; 14'd1894 : toneL = Bflat2; 14'd1895 : toneL = Bflat2;
14'd1896 : toneL = Bflat2; 14'd1897 : toneL = Bflat2; 14'd1898 : toneL = 1; 14'd1899 : toneL = Eflat2;
14'd1900 : toneL = Eflat2; 14'd1901 : toneL = Eflat2; 14'd1902 : toneL = Eflat2; 14'd1903 : toneL = 1;
14'd1904 : toneL = Eflat2; 14'd1905 : toneL = Eflat2; 14'd1906 : toneL = Eflat2; 14'd1907 : toneL = Eflat2;
14'd1908 : toneL = 1; 14'd1909 : toneL = Bflat1; 14'd1910 : toneL = Bflat1; 14'd1911 : toneL = Bflat1;
14'd1912 : toneL = Bflat1; 14'd1913 : toneL = Bflat1; 14'd1914 : toneL = 1; 14'd1915 : toneL = Eflat1;
14'd1916 : toneL = Eflat1; 14'd1917 : toneL = Eflat1; 14'd1918 : toneL = Eflat1; 14'd1919 : toneL = 1;
/*measure 31 */
14'd1920 : toneL = D2; 14'd1921 : toneL = D2; 14'd1922 : toneL = D2; 14'd1923 : toneL = D2;
14'd1924 : toneL = D2; 14'd1925 : toneL = D2; 14'd1926 : toneL = D2; 14'd1927 : toneL = D2;
14'd1928 : toneL = D2; 14'd1929 : toneL = D2; 14'd1930 : toneL = D2; 14'd1931 : toneL = D2;
14'd1932 : toneL = D2; 14'd1933 : toneL = D2; 14'd1934 : toneL = D2; 14'd1935 : toneL = 1;
14'd1936 : toneL = D2; 14'd1937 : toneL = D2; 14'd1938 : toneL = D2; 14'd1939 : toneL = D2;
14'd1940 : toneL = D2; 14'd1941 : toneL = D2; 14'd1942 : toneL = D2; 14'd1943 : toneL = 1;
14'd1944 : toneL = F3; 14'd1945 : toneL = F3; 14'd1946 : toneL = F3; 14'd1947 : toneL = F3;
14'd1948 : toneL = F3; 14'd1949 : toneL = F3; 14'd1950 : toneL = F3; 14'd1951 : toneL = 1;
14'd1952 : toneL = D2; 14'd1953 : toneL = D2; 14'd1954 : toneL = D2; 14'd1955 : toneL = D2;
14'd1956 : toneL = D2; 14'd1957 : toneL = D2; 14'd1958 : toneL = D2; 14'd1959 : toneL = 1;
14'd1960 : toneL = F3; 14'd1961 : toneL = F3; 14'd1962 : toneL = F3; 14'd1963 : toneL = F3;
14'd1964 : toneL = F3; 14'd1965 : toneL = F3; 14'd1966 : toneL = F3; 14'd1967 : toneL = 1;
14'd1968 : toneL = D2; 14'd1969 : toneL = D2; 14'd1970 : toneL = D2; 14'd1971 : toneL = D2;
14'd1972 : toneL = D2; 14'd1973 : toneL = D2; 14'd1974 : toneL = D2; 14'd1975 : toneL = 1;
14'd1976 : toneL = F3; 14'd1977 : toneL = F3; 14'd1978 : toneL = F3; 14'd1979 : toneL = F3;
14'd1980 : toneL = F3; 14'd1981 : toneL = F3; 14'd1982 : toneL = F3; 14'd1983 : toneL = 1;
/*measure 32 */
14'd1984 : toneL = Bflat1; 14'd1985 : toneL = Bflat1; 14'd1986 : toneL = Bflat1; 14'd1987 : toneL = Bflat1;
14'd1988 : toneL = Bflat1; 14'd1989 : toneL = Bflat1; 14'd1990 : toneL = Bflat1; 14'd1991 : toneL = 1;
14'd1992 : toneL = D3; 14'd1993 : toneL = D3; 14'd1994 : toneL = D3; 14'd1995 : toneL = D3;
14'd1996 : toneL = D3; 14'd1997 : toneL = D3; 14'd1998 : toneL = D3; 14'd1999 : toneL = 1;
14'd2000 : toneL = Bflat1; 14'd2001 : toneL = Bflat1; 14'd2002 : toneL = Bflat1; 14'd2003 : toneL = Bflat1;
14'd2004 : toneL = Bflat1; 14'd2005 : toneL = Bflat1; 14'd2006 : toneL = Bflat1; 14'd2007 : toneL = 1;
14'd2008 : toneL = D3; 14'd2009 : toneL = D3; 14'd2010 : toneL = D3; 14'd2011 : toneL = D3;
14'd2012 : toneL = D3; 14'd2013 : toneL = D3; 14'd2014 : toneL = D3; 14'd2015 : toneL = 1;
14'd2016 : toneL = Bflat1; 14'd2017 : toneL = Bflat1; 14'd2018 : toneL = Bflat1; 14'd2019 : toneL = Bflat1;
14'd2020 : toneL = Bflat1; 14'd2021 : toneL = Bflat1; 14'd2022 : toneL = Bflat1; 14'd2023 : toneL = 1;
14'd2024 : toneL = D3; 14'd2025 : toneL = D3; 14'd2026 : toneL = D3; 14'd2027 : toneL = D3;
14'd2028 : toneL = D3; 14'd2029 : toneL = D3; 14'd2030 : toneL = D3; 14'd2031 : toneL = 1;
14'd2032 : toneL = Bflat1; 14'd2033 : toneL = Bflat1; 14'd2034 : toneL = Bflat1; 14'd2035 : toneL = Bflat1;
14'd2036 : toneL = Bflat1; 14'd2037 : toneL = Bflat1; 14'd2038 : toneL = Bflat1; 14'd2039 : toneL = 1;
14'd2040 : toneL = D3; 14'd2041 : toneL = D3; 14'd2042 : toneL = D3; 14'd2043 : toneL = D3;
14'd2044 : toneL = D3; 14'd2045 : toneL = D3; 14'd2046 : toneL = D3; 14'd2047 : toneL = 1;
/*measure 33 */
14'd2048 : toneL = Bflat1; 14'd2049 : toneL = Bflat1; 14'd2050 : toneL = Bflat1; 14'd2051 : toneL = Bflat1;
14'd2052 : toneL = Bflat1; 14'd2053 : toneL = Bflat1; 14'd2054 : toneL = Bflat1; 14'd2055 : toneL = 1;
14'd2056 : toneL = D3; 14'd2057 : toneL = D3; 14'd2058 : toneL = D3; 14'd2059 : toneL = D3;
14'd2060 : toneL = D3; 14'd2061 : toneL = D3; 14'd2062 : toneL = D3; 14'd2063 : toneL = 1;
14'd2064 : toneL = Bflat1; 14'd2065 : toneL = Bflat1; 14'd2066 : toneL = Bflat1; 14'd2067 : toneL = Bflat1;
14'd2068 : toneL = Bflat1; 14'd2069 : toneL = Bflat1; 14'd2070 : toneL = Bflat1; 14'd2071 : toneL = 1;
14'd2072 : toneL = D3; 14'd2073 : toneL = D3; 14'd2074 : toneL = D3; 14'd2075 : toneL = D3;
14'd2076 : toneL = D3; 14'd2077 : toneL = D3; 14'd2078 : toneL = D3; 14'd2079 : toneL = 1;
14'd2080 : toneL = Bflat1; 14'd2081 : toneL = Bflat1; 14'd2082 : toneL = Bflat1; 14'd2083 : toneL = Bflat1;
14'd2084 : toneL = Bflat1; 14'd2085 : toneL = Bflat1; 14'd2086 : toneL = Bflat1; 14'd2087 : toneL = 1;
14'd2088 : toneL = D3; 14'd2089 : toneL = D3; 14'd2090 : toneL = D3; 14'd2091 : toneL = D3;
14'd2092 : toneL = D3; 14'd2093 : toneL = D3; 14'd2094 : toneL = D3; 14'd2095 : toneL = 1;
14'd2096 : toneL = Bflat1; 14'd2097 : toneL = Bflat1; 14'd2098 : toneL = Bflat1; 14'd2099 : toneL = Bflat1;
14'd2100 : toneL = Bflat1; 14'd2101 : toneL = Bflat1; 14'd2102 : toneL = Bflat1; 14'd2103 : toneL = 1;
14'd2104 : toneL = D3; 14'd2105 : toneL = D3; 14'd2106 : toneL = D3; 14'd2107 : toneL = D3;
14'd2108 : toneL = D3; 14'd2109 : toneL = D3; 14'd2110 : toneL = D3; 14'd2111 : toneL = 1;
/*measure 34 */
14'd2112 : toneL = Eflat2; 14'd2113 : toneL = Eflat2; 14'd2114 : toneL = Eflat2; 14'd2115 : toneL = Eflat2;
14'd2116 : toneL = Eflat2; 14'd2117 : toneL = Eflat2; 14'd2118 : toneL = Eflat2; 14'd2119 : toneL = 1;
14'd2120 : toneL = Eflat2; 14'd2121 : toneL = Eflat2; 14'd2122 : toneL = Eflat2; 14'd2123 : toneL = 1;
14'd2124 : toneL = Bflat2; 14'd2125 : toneL = Bflat2; 14'd2126 : toneL = Bflat2; 14'd2127 : toneL = 1;
14'd2128 : toneL = Eflat3; 14'd2129 : toneL = Eflat3; 14'd2130 : toneL = Eflat3; 14'd2131 : toneL = 1;
14'd2132 : toneL = Eflat3; 14'd2133 : toneL = Eflat3; 14'd2134 : toneL = Eflat3; 14'd2135 : toneL = 1;
14'd2136 : toneL = Aflat3; 14'd2137 : toneL = Aflat3; 14'd2138 : toneL = Aflat3; 14'd2139 : toneL = 1;
14'd2140 : toneL = Bflat3; 14'd2141 : toneL = Bflat3; 14'd2142 : toneL = Bflat3; 14'd2143 : toneL = 1;
14'd2144 : toneL = Eflat4; 14'd2145 : toneL = Eflat4; 14'd2146 : toneL = Eflat4; 14'd2147 : toneL = 1;
14'd2148 : toneL = Bflat3; 14'd2149 : toneL = Bflat3; 14'd2150 : toneL = Bflat3; 14'd2151 : toneL = 1;
14'd2152 : toneL = Aflat3; 14'd2153 : toneL = Aflat3; 14'd2154 : toneL = Aflat3; 14'd2155 : toneL = 1;
14'd2156 : toneL = Eflat3; 14'd2157 : toneL = Eflat3; 14'd2158 : toneL = Eflat3; 14'd2159 : toneL = 1;
14'd2160 : toneL = Eflat3; 14'd2161 : toneL = Eflat3; 14'd2162 : toneL = Eflat3; 14'd2163 : toneL = 1;
14'd2164 : toneL = Bflat2; 14'd2165 : toneL = Bflat2; 14'd2166 : toneL = Bflat2; 14'd2167 : toneL = 1;
14'd2168 : toneL = Eflat2; 14'd2169 : toneL = Eflat2; 14'd2170 : toneL = Eflat2; 14'd2171 : toneL = Eflat2;
14'd2172 : toneL = Eflat2; 14'd2173 : toneL = Eflat2; 14'd2174 : toneL = Eflat2; 14'd2175 : toneL = 1;
/*measure 35 */
14'd2176 : toneL = Dflat3; 14'd2177 : toneL = Dflat3; 14'd2178 : toneL = Dflat3; 14'd2179 : toneL = Dflat3;
14'd2180 : toneL = Dflat3; 14'd2181 : toneL = Dflat3; 14'd2182 : toneL = Dflat3; 14'd2183 : toneL = 1;
14'd2184 : toneL = Dflat3; 14'd2185 : toneL = Dflat3; 14'd2186 : toneL = Dflat3; 14'd2187 : toneL = Dflat3;
14'd2188 : toneL = Dflat3; 14'd2189 : toneL = Dflat3; 14'd2190 : toneL = Dflat3; 14'd2191 : toneL = 1;
14'd2192 : toneL = 1; 14'd2193 : toneL = 1; 14'd2194 : toneL = 1; 14'd2195 : toneL = 1;
14'd2196 : toneL = 1; 14'd2197 : toneL = 1; 14'd2198 : toneL = 1; 14'd2199 : toneL = 1;
14'd2200 : toneL = 1; 14'd2201 : toneL = 1; 14'd2202 : toneL = 1; 14'd2203 : toneL = 1;
14'd2204 : toneL = 1; 14'd2205 : toneL = 1; 14'd2206 : toneL = 1; 14'd2207 : toneL = 1;
14'd2208 : toneL = B2; 14'd2209 : toneL = B2; 14'd2210 : toneL = B2; 14'd2211 : toneL = B2;
14'd2212 : toneL = B2; 14'd2213 : toneL = B2; 14'd2214 : toneL = B2; 14'd2215 : toneL = 1;
14'd2216 : toneL = B2; 14'd2217 : toneL = B2; 14'd2218 : toneL = B2; 14'd2219 : toneL = B2;
14'd2220 : toneL = B2; 14'd2221 : toneL = B2; 14'd2222 : toneL = B2; 14'd2223 : toneL = 1;
14'd2224 : toneL = 1; 14'd2225 : toneL = 1; 14'd2226 : toneL = 1; 14'd2227 : toneL = 1;
14'd2228 : toneL = 1; 14'd2229 : toneL = 1; 14'd2230 : toneL = 1; 14'd2231 : toneL = 1;
14'd2232 : toneL = 1; 14'd2233 : toneL = 1; 14'd2234 : toneL = 1; 14'd2235 : toneL = 1;
14'd2236 : toneL = 1; 14'd2237 : toneL = 1; 14'd2238 : toneL = 1; 14'd2239 : toneL = 1;
/*measure 36 */
14'd2240 : toneL = Bflat2; 14'd2241 : toneL = Bflat2; 14'd2242 : toneL = Bflat2; 14'd2243 : toneL = Bflat2;
14'd2244 : toneL = Bflat2; 14'd2245 : toneL = Bflat2; 14'd2246 : toneL = Bflat2; 14'd2247 : toneL = Bflat2;
14'd2248 : toneL = Bflat2; 14'd2249 : toneL = Bflat2; 14'd2250 : toneL = Bflat2; 14'd2251 : toneL = Bflat2;
14'd2252 : toneL = Bflat2; 14'd2253 : toneL = Bflat2; 14'd2254 : toneL = Bflat2; 14'd2255 : toneL = 1;
14'd2256 : toneL = Bflat2; 14'd2257 : toneL = Bflat2; 14'd2258 : toneL = Bflat2; 14'd2259 : toneL = Bflat2;
14'd2260 : toneL = Bflat2; 14'd2261 : toneL = Bflat2; 14'd2262 : toneL = Bflat2; 14'd2263 : toneL = Bflat2;
14'd2264 : toneL = Bflat2; 14'd2265 : toneL = Bflat2; 14'd2266 : toneL = Bflat2; 14'd2267 : toneL = Bflat2;
14'd2268 : toneL = Bflat2; 14'd2269 : toneL = Bflat2; 14'd2270 : toneL = Bflat2; 14'd2271 : toneL = 1;
14'd2272 : toneL = Aflat2; 14'd2273 : toneL = Aflat2; 14'd2274 : toneL = Aflat2; 14'd2275 : toneL = Aflat2;
14'd2276 : toneL = Aflat2; 14'd2277 : toneL = Aflat2; 14'd2278 : toneL = Aflat2; 14'd2279 : toneL = 1;
14'd2280 : toneL = Eflat3; 14'd2281 : toneL = Eflat3; 14'd2282 : toneL = Eflat3; 14'd2283 : toneL = Eflat3;
14'd2284 : toneL = Eflat3; 14'd2285 : toneL = Eflat3; 14'd2286 : toneL = Eflat3; 14'd2287 : toneL = 1;
14'd2288 : toneL = B3; 14'd2289 : toneL = B3; 14'd2290 : toneL = B3; 14'd2291 : toneL = B3;
14'd2292 : toneL = B3; 14'd2293 : toneL = B3; 14'd2294 : toneL = B3; 14'd2295 : toneL = 1;
14'd2296 : toneL = Eflat3; 14'd2297 : toneL = Eflat3; 14'd2298 : toneL = Eflat3; 14'd2299 : toneL = Eflat3;
14'd2300 : toneL = Eflat3; 14'd2301 : toneL = Eflat3; 14'd2302 : toneL = Eflat3; 14'd2303 : toneL = 1;
/*measure 37 */
14'd2304 : toneL = Dflat3; 14'd2305 : toneL = Dflat3; 14'd2306 : toneL = Dflat3; 14'd2307 : toneL = Dflat3;
14'd2308 : toneL = Dflat3; 14'd2309 : toneL = Dflat3; 14'd2310 : toneL = Dflat3; 14'd2311 : toneL = 1;
14'd2312 : toneL = Dflat3; 14'd2313 : toneL = Dflat3; 14'd2314 : toneL = Dflat3; 14'd2315 : toneL = Dflat3;
14'd2316 : toneL = Dflat3; 14'd2317 : toneL = Dflat3; 14'd2318 : toneL = Dflat3; 14'd2319 : toneL = 1;
14'd2320 : toneL = 1; 14'd2321 : toneL = 1; 14'd2322 : toneL = 1; 14'd2323 : toneL = 1;
14'd2324 : toneL = 1; 14'd2325 : toneL = 1; 14'd2326 : toneL = 1; 14'd2327 : toneL = 1;
14'd2328 : toneL = 1; 14'd2329 : toneL = 1; 14'd2330 : toneL = 1; 14'd2331 : toneL = 1;
14'd2332 : toneL = 1; 14'd2333 : toneL = 1; 14'd2334 : toneL = 1; 14'd2335 : toneL = 1;
14'd2336 : toneL = B2; 14'd2337 : toneL = B2; 14'd2338 : toneL = B2; 14'd2339 : toneL = B2;
14'd2340 : toneL = B2; 14'd2341 : toneL = B2; 14'd2342 : toneL = B2; 14'd2343 : toneL = 1;
14'd2344 : toneL = B2; 14'd2345 : toneL = B2; 14'd2346 : toneL = B2; 14'd2347 : toneL = B2;
14'd2348 : toneL = B2; 14'd2349 : toneL = B2; 14'd2350 : toneL = B2; 14'd2351 : toneL = 1;
14'd2352 : toneL = 1; 14'd2353 : toneL = 1; 14'd2354 : toneL = 1; 14'd2355 : toneL = 1;
14'd2356 : toneL = 1; 14'd2357 : toneL = 1; 14'd2358 : toneL = 1; 14'd2359 : toneL = 1;
14'd2360 : toneL = 1; 14'd2361 : toneL = 1; 14'd2362 : toneL = 1; 14'd2363 : toneL = 1;
14'd2364 : toneL = 1; 14'd2365 : toneL = 1; 14'd2366 : toneL = 1; 14'd2367 : toneL = 1;
/*measure 38 */
14'd2368 : toneL = Bflat2; 14'd2369 : toneL = Bflat2; 14'd2370 : toneL = Bflat2; 14'd2371 : toneL = Bflat2;
14'd2372 : toneL = Bflat2; 14'd2373 : toneL = Bflat2; 14'd2374 : toneL = Bflat2; 14'd2375 : toneL = Bflat2;
14'd2376 : toneL = Bflat2; 14'd2377 : toneL = Bflat2; 14'd2378 : toneL = Bflat2; 14'd2379 : toneL = Bflat2;
14'd2380 : toneL = Bflat2; 14'd2381 : toneL = Bflat2; 14'd2382 : toneL = Bflat2; 14'd2383 : toneL = 1;
14'd2384 : toneL = Bflat2; 14'd2385 : toneL = Bflat2; 14'd2386 : toneL = Bflat2; 14'd2387 : toneL = Bflat2;
14'd2388 : toneL = Bflat2; 14'd2389 : toneL = Bflat2; 14'd2390 : toneL = Bflat2; 14'd2391 : toneL = Bflat2;
14'd2392 : toneL = Bflat2; 14'd2393 : toneL = Bflat2; 14'd2394 : toneL = Bflat2; 14'd2395 : toneL = Bflat2;
14'd2396 : toneL = Bflat2; 14'd2397 : toneL = Bflat2; 14'd2398 : toneL = Bflat2; 14'd2399 : toneL = 1;
14'd2400 : toneL = Eflat3; 14'd2401 : toneL = Eflat3; 14'd2402 : toneL = Eflat3; 14'd2403 : toneL = Eflat3;
14'd2404 : toneL = Eflat3; 14'd2405 : toneL = Eflat3; 14'd2406 : toneL = Eflat3; 14'd2407 : toneL = 1;
14'd2408 : toneL = Eflat3; 14'd2409 : toneL = Eflat3; 14'd2410 : toneL = Eflat3; 14'd2411 : toneL = Eflat3;
14'd2412 : toneL = Eflat3; 14'd2413 : toneL = Eflat3; 14'd2414 : toneL = Eflat3; 14'd2415 : toneL = 1;
14'd2416 : toneL = Eflat4; 14'd2417 : toneL = Eflat4; 14'd2418 : toneL = Eflat4; 14'd2419 : toneL = Eflat4;
14'd2420 : toneL = Eflat4; 14'd2421 : toneL = Eflat4; 14'd2422 : toneL = Eflat4; 14'd2423 : toneL = Eflat4;
14'd2424 : toneL = Eflat4; 14'd2425 : toneL = Eflat4; 14'd2426 : toneL = Eflat4; 14'd2427 : toneL = Eflat4;
14'd2428 : toneL = Eflat4; 14'd2429 : toneL = Eflat4; 14'd2430 : toneL = Eflat4; 14'd2431 : toneL = 1;
/*measure 39 */
14'd2432 : toneL = Dflat3; 14'd2433 : toneL = Dflat3; 14'd2434 : toneL = Dflat3; 14'd2435 : toneL = Dflat3;
14'd2436 : toneL = Dflat3; 14'd2437 : toneL = Dflat3; 14'd2438 : toneL = Dflat3; 14'd2439 : toneL = 1;
14'd2440 : toneL = Dflat3; 14'd2441 : toneL = Dflat3; 14'd2442 : toneL = Dflat3; 14'd2443 : toneL = Dflat3;
14'd2444 : toneL = Dflat3; 14'd2445 : toneL = Dflat3; 14'd2446 : toneL = Dflat3; 14'd2447 : toneL = 1;
14'd2448 : toneL = 1; 14'd2449 : toneL = 1; 14'd2450 : toneL = 1; 14'd2451 : toneL = 1;
14'd2452 : toneL = 1; 14'd2453 : toneL = 1; 14'd2454 : toneL = 1; 14'd2455 : toneL = 1;
14'd2456 : toneL = 1; 14'd2457 : toneL = 1; 14'd2458 : toneL = 1; 14'd2459 : toneL = 1;
14'd2460 : toneL = 1; 14'd2461 : toneL = 1; 14'd2462 : toneL = 1; 14'd2463 : toneL = 1;
14'd2464 : toneL = B2; 14'd2465 : toneL = B2; 14'd2466 : toneL = B2; 14'd2467 : toneL = B2;
14'd2468 : toneL = B2; 14'd2469 : toneL = B2; 14'd2470 : toneL = B2; 14'd2471 : toneL = 1;
14'd2472 : toneL = B2; 14'd2473 : toneL = B2; 14'd2474 : toneL = B2; 14'd2475 : toneL = B2;
14'd2476 : toneL = B2; 14'd2477 : toneL = B2; 14'd2478 : toneL = B2; 14'd2479 : toneL = 1;
14'd2480 : toneL = 1; 14'd2481 : toneL = 1; 14'd2482 : toneL = 1; 14'd2483 : toneL = 1;
14'd2484 : toneL = 1; 14'd2485 : toneL = 1; 14'd2486 : toneL = 1; 14'd2487 : toneL = 1;
14'd2488 : toneL = 1; 14'd2489 : toneL = 1; 14'd2490 : toneL = 1; 14'd2491 : toneL = 1;
14'd2492 : toneL = 1; 14'd2493 : toneL = 1; 14'd2494 : toneL = 1; 14'd2495 : toneL = 1;
/*measure 40 */
14'd2496 : toneL = Bflat2; 14'd2497 : toneL = Bflat2; 14'd2498 : toneL = Bflat2; 14'd2499 : toneL = Bflat2;
14'd2500 : toneL = Bflat2; 14'd2501 : toneL = Bflat2; 14'd2502 : toneL = Bflat2; 14'd2503 : toneL = Bflat2;
14'd2504 : toneL = Bflat2; 14'd2505 : toneL = Bflat2; 14'd2506 : toneL = Bflat2; 14'd2507 : toneL = Bflat2;
14'd2508 : toneL = Bflat2; 14'd2509 : toneL = Bflat2; 14'd2510 : toneL = Bflat2; 14'd2511 : toneL = 1;
14'd2512 : toneL = Bflat2; 14'd2513 : toneL = Bflat2; 14'd2514 : toneL = Bflat2; 14'd2515 : toneL = Bflat2;
14'd2516 : toneL = Bflat2; 14'd2517 : toneL = Bflat2; 14'd2518 : toneL = Bflat2; 14'd2519 : toneL = Bflat2;
14'd2520 : toneL = Bflat2; 14'd2521 : toneL = Bflat2; 14'd2522 : toneL = Bflat2; 14'd2523 : toneL = Bflat2;
14'd2524 : toneL = Bflat2; 14'd2525 : toneL = Bflat2; 14'd2526 : toneL = Bflat2; 14'd2527 : toneL = 1;
14'd2528 : toneL = Aflat2; 14'd2529 : toneL = Aflat2; 14'd2530 : toneL = Aflat2; 14'd2531 : toneL = Aflat2;
14'd2532 : toneL = Aflat2; 14'd2533 : toneL = Aflat2; 14'd2534 : toneL = Aflat2; 14'd2535 : toneL = 1;
14'd2536 : toneL = Eflat3; 14'd2537 : toneL = Eflat3; 14'd2538 : toneL = Eflat3; 14'd2539 : toneL = Eflat3;
14'd2540 : toneL = Eflat3; 14'd2541 : toneL = Eflat3; 14'd2542 : toneL = Eflat3; 14'd2543 : toneL = 1;
14'd2544 : toneL = B2; 14'd2545 : toneL = B2; 14'd2546 : toneL = B2; 14'd2547 : toneL = B2;
14'd2548 : toneL = B2; 14'd2549 : toneL = B2; 14'd2550 : toneL = B2; 14'd2551 : toneL = B2;
14'd2552 : toneL = B2; 14'd2553 : toneL = B2; 14'd2554 : toneL = B2; 14'd2555 : toneL = B2;
14'd2556 : toneL = B2; 14'd2557 : toneL = B2; 14'd2558 : toneL = B2; 14'd2559 : toneL = 1;
/*measure 41 */
14'd2560 : toneL = Dflat3; 14'd2561 : toneL = Dflat3; 14'd2562 : toneL = Dflat3; 14'd2563 : toneL = Dflat3;
14'd2564 : toneL = Dflat3; 14'd2565 : toneL = Dflat3; 14'd2566 : toneL = Dflat3; 14'd2567 : toneL = 1;
14'd2568 : toneL = Dflat3; 14'd2569 : toneL = Dflat3; 14'd2570 : toneL = Dflat3; 14'd2571 : toneL = Dflat3;
14'd2572 : toneL = Dflat3; 14'd2573 : toneL = Dflat3; 14'd2574 : toneL = Dflat3; 14'd2575 : toneL = 1;
14'd2576 : toneL = 1; 14'd2577 : toneL = 1; 14'd2578 : toneL = 1; 14'd2579 : toneL = 1;
14'd2580 : toneL = 1; 14'd2581 : toneL = 1; 14'd2582 : toneL = 1; 14'd2583 : toneL = 1;
14'd2584 : toneL = 1; 14'd2585 : toneL = 1; 14'd2586 : toneL = 1; 14'd2587 : toneL = 1;
14'd2588 : toneL = 1; 14'd2589 : toneL = 1; 14'd2590 : toneL = 1; 14'd2591 : toneL = 1;
14'd2592 : toneL = B2; 14'd2593 : toneL = B2; 14'd2594 : toneL = B2; 14'd2595 : toneL = B2;
14'd2596 : toneL = B2; 14'd2597 : toneL = B2; 14'd2598 : toneL = B2; 14'd2599 : toneL = 1;
14'd2600 : toneL = B2; 14'd2601 : toneL = B2; 14'd2602 : toneL = B2; 14'd2603 : toneL = B2;
14'd2604 : toneL = B2; 14'd2605 : toneL = B2; 14'd2606 : toneL = B2; 14'd2607 : toneL = 1;
14'd2608 : toneL = 1; 14'd2609 : toneL = 1; 14'd2610 : toneL = 1; 14'd2611 : toneL = 1;
14'd2612 : toneL = 1; 14'd2613 : toneL = 1; 14'd2614 : toneL = 1; 14'd2615 : toneL = 1;
14'd2616 : toneL = 1; 14'd2617 : toneL = 1; 14'd2618 : toneL = 1; 14'd2619 : toneL = 1;
14'd2620 : toneL = 1; 14'd2621 : toneL = 1; 14'd2622 : toneL = 1; 14'd2623 : toneL = 1;
/*measure 42 */
14'd2624 : toneL = Bflat2; 14'd2625 : toneL = Bflat2; 14'd2626 : toneL = Bflat2; 14'd2627 : toneL = Bflat2;
14'd2628 : toneL = Bflat2; 14'd2629 : toneL = Bflat2; 14'd2630 : toneL = Bflat2; 14'd2631 : toneL = Bflat2;
14'd2632 : toneL = Bflat2; 14'd2633 : toneL = Bflat2; 14'd2634 : toneL = Bflat2; 14'd2635 : toneL = Bflat2;
14'd2636 : toneL = Bflat2; 14'd2637 : toneL = Bflat2; 14'd2638 : toneL = Bflat2; 14'd2639 : toneL = 1;
14'd2640 : toneL = Bflat2; 14'd2641 : toneL = Bflat2; 14'd2642 : toneL = Bflat2; 14'd2643 : toneL = Bflat2;
14'd2644 : toneL = Bflat2; 14'd2645 : toneL = Bflat2; 14'd2646 : toneL = Bflat2; 14'd2647 : toneL = Bflat2;
14'd2648 : toneL = Bflat2; 14'd2649 : toneL = Bflat2; 14'd2650 : toneL = Bflat2; 14'd2651 : toneL = Bflat2;
14'd2652 : toneL = Bflat2; 14'd2653 : toneL = Bflat2; 14'd2654 : toneL = Bflat2; 14'd2655 : toneL = 1;
14'd2656 : toneL = Bflat2; 14'd2657 : toneL = Bflat2; 14'd2658 : toneL = Bflat2; 14'd2659 : toneL = Bflat2;
14'd2660 : toneL = Bflat2; 14'd2661 : toneL = Bflat2; 14'd2662 : toneL = Bflat2; 14'd2663 : toneL = Bflat2;
14'd2664 : toneL = Bflat2; 14'd2665 : toneL = Bflat2; 14'd2666 : toneL = Bflat2; 14'd2667 : toneL = Bflat2;
14'd2668 : toneL = Bflat2; 14'd2669 : toneL = Bflat2; 14'd2670 : toneL = Bflat2; 14'd2671 : toneL = 1;
14'd2672 : toneL = Bflat2; 14'd2673 : toneL = Bflat2; 14'd2674 : toneL = Bflat2; 14'd2675 : toneL = Bflat2;
14'd2676 : toneL = Bflat2; 14'd2677 : toneL = Bflat2; 14'd2678 : toneL = Bflat2; 14'd2679 : toneL = Bflat2;
14'd2680 : toneL = Bflat2; 14'd2681 : toneL = Bflat2; 14'd2682 : toneL = Bflat2; 14'd2683 : toneL = Bflat2;
14'd2684 : toneL = Bflat2; 14'd2685 : toneL = Bflat2; 14'd2686 : toneL = Bflat2; 14'd2687 : toneL = 1;
/*measure 43 */
14'd2688 : toneL = Eflat2; 14'd2689 : toneL = Eflat2; 14'd2690 : toneL = Eflat2; 14'd2691 : toneL = Eflat2;
14'd2692 : toneL = Eflat2; 14'd2693 : toneL = Eflat2; 14'd2694 : toneL = Eflat2; 14'd2695 : toneL = Eflat2;
14'd2696 : toneL = Eflat2; 14'd2697 : toneL = Eflat2; 14'd2698 : toneL = Eflat2; 14'd2699 : toneL = Eflat2;
14'd2700 : toneL = Eflat2; 14'd2701 : toneL = Eflat2; 14'd2702 : toneL = Eflat2; 14'd2703 : toneL = 1;
14'd2704 : toneL = Eflat2; 14'd2705 : toneL = Eflat2; 14'd2706 : toneL = Eflat2; 14'd2707 : toneL = Eflat2;
14'd2708 : toneL = Eflat2; 14'd2709 : toneL = Eflat2; 14'd2710 : toneL = Eflat2; 14'd2711 : toneL = 1;
14'd2712 : toneL = G3; 14'd2713 : toneL = G3; 14'd2714 : toneL = G3; 14'd2715 : toneL = G3;
14'd2716 : toneL = G3; 14'd2717 : toneL = G3; 14'd2718 : toneL = G3; 14'd2719 : toneL = 1;
14'd2720 : toneL = Eflat2; 14'd2721 : toneL = Eflat2; 14'd2722 : toneL = Eflat2; 14'd2723 : toneL = Eflat2;
14'd2724 : toneL = Eflat2; 14'd2725 : toneL = Eflat2; 14'd2726 : toneL = Eflat2; 14'd2727 : toneL = 1;
14'd2728 : toneL = G3; 14'd2729 : toneL = G3; 14'd2730 : toneL = G3; 14'd2731 : toneL = G3;
14'd2732 : toneL = G3; 14'd2733 : toneL = G3; 14'd2734 : toneL = G3; 14'd2735 : toneL = 1;
14'd2736 : toneL = Eflat2; 14'd2737 : toneL = Eflat2; 14'd2738 : toneL = Eflat2; 14'd2739 : toneL = Eflat2;
14'd2740 : toneL = Eflat2; 14'd2741 : toneL = Eflat2; 14'd2742 : toneL = Eflat2; 14'd2743 : toneL = 1;
14'd2744 : toneL = G3; 14'd2745 : toneL = G3; 14'd2746 : toneL = G3; 14'd2747 : toneL = G3;
14'd2748 : toneL = G3; 14'd2749 : toneL = G3; 14'd2750 : toneL = G3; 14'd2751 : toneL = 1;
/*measure 44 */
14'd2752 : toneL = Eflat2; 14'd2753 : toneL = Eflat2; 14'd2754 : toneL = Eflat2; 14'd2755 : toneL = Eflat2;
14'd2756 : toneL = Eflat2; 14'd2757 : toneL = Eflat2; 14'd2758 : toneL = Eflat2; 14'd2759 : toneL = 1;
14'd2760 : toneL = Aflat3; 14'd2761 : toneL = Aflat3; 14'd2762 : toneL = Aflat3; 14'd2763 : toneL = Aflat3;
14'd2764 : toneL = Aflat3; 14'd2765 : toneL = Aflat3; 14'd2766 : toneL = Aflat3; 14'd2767 : toneL = 1;
14'd2768 : toneL = Eflat2; 14'd2769 : toneL = Eflat2; 14'd2770 : toneL = Eflat2; 14'd2771 : toneL = Eflat2;
14'd2772 : toneL = Eflat2; 14'd2773 : toneL = Eflat2; 14'd2774 : toneL = Eflat2; 14'd2775 : toneL = 1;
14'd2776 : toneL = Aflat3; 14'd2777 : toneL = Aflat3; 14'd2778 : toneL = Aflat3; 14'd2779 : toneL = Aflat3;
14'd2780 : toneL = Aflat3; 14'd2781 : toneL = Aflat3; 14'd2782 : toneL = Aflat3; 14'd2783 : toneL = 1;
14'd2784 : toneL = Eflat2; 14'd2785 : toneL = Eflat2; 14'd2786 : toneL = Eflat2; 14'd2787 : toneL = Eflat2;
14'd2788 : toneL = Eflat2; 14'd2789 : toneL = Eflat2; 14'd2790 : toneL = Eflat2; 14'd2791 : toneL = 1;
14'd2792 : toneL = Aflat3; 14'd2793 : toneL = Aflat3; 14'd2794 : toneL = Aflat3; 14'd2795 : toneL = Aflat3;
14'd2796 : toneL = Aflat3; 14'd2797 : toneL = Aflat3; 14'd2798 : toneL = Aflat3; 14'd2799 : toneL = 1;
14'd2800 : toneL = Eflat2; 14'd2801 : toneL = Eflat2; 14'd2802 : toneL = Eflat2; 14'd2803 : toneL = Eflat2;
14'd2804 : toneL = Eflat2; 14'd2805 : toneL = Eflat2; 14'd2806 : toneL = Eflat2; 14'd2807 : toneL = 1;
14'd2808 : toneL = Aflat3; 14'd2809 : toneL = Aflat3; 14'd2810 : toneL = Aflat3; 14'd2811 : toneL = Aflat3;
14'd2812 : toneL = Aflat3; 14'd2813 : toneL = Aflat3; 14'd2814 : toneL = Aflat3; 14'd2815 : toneL = 1;
/*measure 45 */
14'd2816 : toneL = Eflat1; 14'd2817 : toneL = Eflat1; 14'd2818 : toneL = Eflat1; 14'd2819 : toneL = Eflat1;
14'd2820 : toneL = Eflat1; 14'd2821 : toneL = Eflat1; 14'd2822 : toneL = Eflat1; 14'd2823 : toneL = 1;
14'd2824 : toneL = G2; 14'd2825 : toneL = G2; 14'd2826 : toneL = G2; 14'd2827 : toneL = G2;
14'd2828 : toneL = G2; 14'd2829 : toneL = G2; 14'd2830 : toneL = G2; 14'd2831 : toneL = 1;
14'd2832 : toneL = Eflat1; 14'd2833 : toneL = Eflat1; 14'd2834 : toneL = Eflat1; 14'd2835 : toneL = Eflat1;
14'd2836 : toneL = Eflat1; 14'd2837 : toneL = Eflat1; 14'd2838 : toneL = Eflat1; 14'd2839 : toneL = 1;
14'd2840 : toneL = G2; 14'd2841 : toneL = G2; 14'd2842 : toneL = G2; 14'd2843 : toneL = G2;
14'd2844 : toneL = G2; 14'd2845 : toneL = G2; 14'd2846 : toneL = G2; 14'd2847 : toneL = 1;
14'd2848 : toneL = Eflat1; 14'd2849 : toneL = Eflat1; 14'd2850 : toneL = Eflat1; 14'd2851 : toneL = Eflat1;
14'd2852 : toneL = Eflat1; 14'd2853 : toneL = Eflat1; 14'd2854 : toneL = Eflat1; 14'd2855 : toneL = 1;
14'd2856 : toneL = G2; 14'd2857 : toneL = G2; 14'd2858 : toneL = G2; 14'd2859 : toneL = G2;
14'd2860 : toneL = G2; 14'd2861 : toneL = G2; 14'd2862 : toneL = G2; 14'd2863 : toneL = 1;
14'd2864 : toneL = Eflat1; 14'd2865 : toneL = Eflat1; 14'd2866 : toneL = Eflat1; 14'd2867 : toneL = Eflat1;
14'd2868 : toneL = Eflat1; 14'd2869 : toneL = Eflat1; 14'd2870 : toneL = Eflat1; 14'd2871 : toneL = 1;
14'd2872 : toneL = G2; 14'd2873 : toneL = G2; 14'd2874 : toneL = G2; 14'd2875 : toneL = G2;
14'd2876 : toneL = G2; 14'd2877 : toneL = G2; 14'd2878 : toneL = G2; 14'd2879 : toneL = 1;
/*measure 46 */
14'd2880 : toneL = Eflat1; 14'd2881 : toneL = Eflat1; 14'd2882 : toneL = Eflat1; 14'd2883 : toneL = Eflat1;
14'd2884 : toneL = Eflat1; 14'd2885 : toneL = Eflat1; 14'd2886 : toneL = Eflat1; 14'd2887 : toneL = 1;
14'd2888 : toneL = Aflat2; 14'd2889 : toneL = Aflat2; 14'd2890 : toneL = Aflat2; 14'd2891 : toneL = Aflat2;
14'd2892 : toneL = Aflat2; 14'd2893 : toneL = Aflat2; 14'd2894 : toneL = Aflat2; 14'd2895 : toneL = 1;
14'd2896 : toneL = Eflat1; 14'd2897 : toneL = Eflat1; 14'd2898 : toneL = Eflat1; 14'd2899 : toneL = Eflat1;
14'd2900 : toneL = Eflat1; 14'd2901 : toneL = Eflat1; 14'd2902 : toneL = Eflat1; 14'd2903 : toneL = 1;
14'd2904 : toneL = Aflat2; 14'd2905 : toneL = Aflat2; 14'd2906 : toneL = Aflat2; 14'd2907 : toneL = Aflat2;
14'd2908 : toneL = Aflat2; 14'd2909 : toneL = Aflat2; 14'd2910 : toneL = Aflat2; 14'd2911 : toneL = 1;
14'd2912 : toneL = Eflat2; 14'd2913 : toneL = Eflat2; 14'd2914 : toneL = Eflat2; 14'd2915 : toneL = Eflat2;
14'd2916 : toneL = Eflat2; 14'd2917 : toneL = Eflat2; 14'd2918 : toneL = Eflat2; 14'd2919 : toneL = Eflat2;
14'd2920 : toneL = Eflat2; 14'd2921 : toneL = Eflat2; 14'd2922 : toneL = Eflat2; 14'd2923 : toneL = Eflat2;
14'd2924 : toneL = Eflat2; 14'd2925 : toneL = Eflat2; 14'd2926 : toneL = Eflat2; 14'd2927 : toneL = Eflat2;
14'd2928 : toneL = Eflat2; 14'd2929 : toneL = Eflat2; 14'd2930 : toneL = Eflat2; 14'd2931 : toneL = Eflat2;
14'd2932 : toneL = Eflat2; 14'd2933 : toneL = Eflat2; 14'd2934 : toneL = Eflat2; 14'd2935 : toneL = Eflat2;
14'd2936 : toneL = Eflat2; 14'd2937 : toneL = Eflat2; 14'd2938 : toneL = Eflat2; 14'd2939 : toneL = Eflat2;
14'd2940 : toneL = Eflat2; 14'd2941 : toneL = Eflat2; 14'd2942 : toneL = Eflat2; 14'd2943 : toneL = 1;
/*measure 47 */
14'd2944 : toneL = G4; 14'd2945 : toneL = B4; 14'd2946 : toneL = Csharp5; 14'd2947 : toneL = E5;
14'd2948 : toneL = E5; 14'd2949 : toneL = E5; 14'd2950 : toneL = E5; 14'd2951 : toneL = E5;
14'd2952 : toneL = E5; 14'd2953 : toneL = E5; 14'd2954 : toneL = E5; 14'd2955 : toneL = E5;
14'd2956 : toneL = E5; 14'd2957 : toneL = E5; 14'd2958 : toneL = E5; 14'd2959 : toneL = E5;
14'd2960 : toneL = E5; 14'd2961 : toneL = E5; 14'd2962 : toneL = E5; 14'd2963 : toneL = E5;
14'd2964 : toneL = E5; 14'd2965 : toneL = E5; 14'd2966 : toneL = E5; 14'd2967 : toneL = E5;
14'd2968 : toneL = E5; 14'd2969 : toneL = E5; 14'd2970 : toneL = E5; 14'd2971 : toneL = E5;
14'd2972 : toneL = E5; 14'd2973 : toneL = E5; 14'd2974 : toneL = E5; 14'd2975 : toneL = E5;
14'd2976 : toneL = E5; 14'd2977 : toneL = E5; 14'd2978 : toneL = E5; 14'd2979 : toneL = E5;
14'd2980 : toneL = E5; 14'd2981 : toneL = E5; 14'd2982 : toneL = E5; 14'd2983 : toneL = E5;
14'd2984 : toneL = E5; 14'd2985 : toneL = E5; 14'd2986 : toneL = E5; 14'd2987 : toneL = E5;
14'd2988 : toneL = E5; 14'd2989 : toneL = E5; 14'd2990 : toneL = E5; 14'd2991 : toneL = E5;
14'd2992 : toneL = E5; 14'd2993 : toneL = E5; 14'd2994 : toneL = E5; 14'd2995 : toneL = E5;
14'd2996 : toneL = E5; 14'd2997 : toneL = E5; 14'd2998 : toneL = E5; 14'd2999 : toneL = E5;
14'd3000 : toneL = E5; 14'd3001 : toneL = E5; 14'd3002 : toneL = E5; 14'd3003 : toneL = E5;
14'd3004 : toneL = E5; 14'd3005 : toneL = E5; 14'd3006 : toneL = E5; 14'd3007 : toneL = 1;
/*measure 48 */
14'd3008 : toneL = G4; 14'd3009 : toneL = Bflat4; 14'd3010 : toneL = Dflat5; 14'd3011 : toneL = Dflat5;
14'd3012 : toneL = Dflat5; 14'd3013 : toneL = Dflat5; 14'd3014 : toneL = Dflat5; 14'd3015 : toneL = Dflat5;
14'd3016 : toneL = Dflat5; 14'd3017 : toneL = Dflat5; 14'd3018 : toneL = Dflat5; 14'd3019 : toneL = Dflat5;
14'd3020 : toneL = Dflat5; 14'd3021 : toneL = Dflat5; 14'd3022 : toneL = Dflat5; 14'd3023 : toneL = Dflat5;
14'd3024 : toneL = Dflat5; 14'd3025 : toneL = Dflat5; 14'd3026 : toneL = Dflat5; 14'd3027 : toneL = Dflat5;
14'd3028 : toneL = Dflat5; 14'd3029 : toneL = Dflat5; 14'd3030 : toneL = Dflat5; 14'd3031 : toneL = Dflat5;
14'd3032 : toneL = Dflat5; 14'd3033 : toneL = Dflat5; 14'd3034 : toneL = Dflat5; 14'd3035 : toneL = Dflat5;
14'd3036 : toneL = Dflat5; 14'd3037 : toneL = Dflat5; 14'd3038 : toneL = Dflat5; 14'd3039 : toneL = Dflat5;
14'd3040 : toneL = Dflat5; 14'd3041 : toneL = Dflat5; 14'd3042 : toneL = Dflat5; 14'd3043 : toneL = Dflat5;
14'd3044 : toneL = Dflat5; 14'd3045 : toneL = Dflat5; 14'd3046 : toneL = Dflat5; 14'd3047 : toneL = Dflat5;
14'd3048 : toneL = Dflat5; 14'd3049 : toneL = Dflat5; 14'd3050 : toneL = Dflat5; 14'd3051 : toneL = Dflat5;
14'd3052 : toneL = Dflat5; 14'd3053 : toneL = Dflat5; 14'd3054 : toneL = Dflat5; 14'd3055 : toneL = Dflat5;
14'd3056 : toneL = Dflat5; 14'd3057 : toneL = Dflat5; 14'd3058 : toneL = Dflat5; 14'd3059 : toneL = Dflat5;
14'd3060 : toneL = Dflat5; 14'd3061 : toneL = Dflat5; 14'd3062 : toneL = Dflat5; 14'd3063 : toneL = Dflat5;
14'd3064 : toneL = Dflat5; 14'd3065 : toneL = Dflat5; 14'd3066 : toneL = Dflat5; 14'd3067 : toneL = Dflat5;
14'd3068 : toneL = Dflat5; 14'd3069 : toneL = Dflat5; 14'd3070 : toneL = Dflat5; 14'd3071 : toneL = 1;
/*measure 49 */
14'd3072 : toneL = Fsharp4; 14'd3073 : toneL = A4; 14'd3074 : toneL = D5; 14'd3075 : toneL = D5;
14'd3076 : toneL = D5; 14'd3077 : toneL = D5; 14'd3078 : toneL = D5; 14'd3079 : toneL = D5;
14'd3080 : toneL = D5; 14'd3081 : toneL = D5; 14'd3082 : toneL = D5; 14'd3083 : toneL = D5;
14'd3084 : toneL = D5; 14'd3085 : toneL = D5; 14'd3086 : toneL = D5; 14'd3087 : toneL = D5;
14'd3088 : toneL = D5; 14'd3089 : toneL = D5; 14'd3090 : toneL = D5; 14'd3091 : toneL = D5;
14'd3092 : toneL = D5; 14'd3093 : toneL = D5; 14'd3094 : toneL = D5; 14'd3095 : toneL = D5;
14'd3096 : toneL = D5; 14'd3097 : toneL = D5; 14'd3098 : toneL = D5; 14'd3099 : toneL = D5;
14'd3100 : toneL = D5; 14'd3101 : toneL = D5; 14'd3102 : toneL = D5; 14'd3103 : toneL = D5;
14'd3104 : toneL = D5; 14'd3105 : toneL = D5; 14'd3106 : toneL = D5; 14'd3107 : toneL = D5;
14'd3108 : toneL = D5; 14'd3109 : toneL = D5; 14'd3110 : toneL = D5; 14'd3111 : toneL = D5;
14'd3112 : toneL = D5; 14'd3113 : toneL = D5; 14'd3114 : toneL = D5; 14'd3115 : toneL = D5;
14'd3116 : toneL = D5; 14'd3117 : toneL = D5; 14'd3118 : toneL = D5; 14'd3119 : toneL = D5;
14'd3120 : toneL = D5; 14'd3121 : toneL = D5; 14'd3122 : toneL = D5; 14'd3123 : toneL = D5;
14'd3124 : toneL = D5; 14'd3125 : toneL = D5; 14'd3126 : toneL = D5; 14'd3127 : toneL = D5;
14'd3128 : toneL = D5; 14'd3129 : toneL = D5; 14'd3130 : toneL = D5; 14'd3131 : toneL = D5;
14'd3132 : toneL = D5; 14'd3133 : toneL = D5; 14'd3134 : toneL = D5; 14'd3135 : toneL = 1;
/*measure 50 */
14'd3136 : toneL = F4; 14'd3137 : toneL = Gsharp4; 14'd3138 : toneL = B4; 14'd3139 : toneL = B4;
14'd3140 : toneL = B4; 14'd3141 : toneL = B4; 14'd3142 : toneL = B4; 14'd3143 : toneL = B4;
14'd3144 : toneL = B4; 14'd3145 : toneL = B4; 14'd3146 : toneL = B4; 14'd3147 : toneL = B4;
14'd3148 : toneL = B4; 14'd3149 : toneL = B4; 14'd3150 : toneL = B4; 14'd3151 : toneL = B4;
14'd3152 : toneL = B4; 14'd3153 : toneL = B4; 14'd3154 : toneL = B4; 14'd3155 : toneL = B4;
14'd3156 : toneL = B4; 14'd3157 : toneL = B4; 14'd3158 : toneL = B4; 14'd3159 : toneL = B4;
14'd3160 : toneL = B4; 14'd3161 : toneL = B4; 14'd3162 : toneL = B4; 14'd3163 : toneL = B4;
14'd3164 : toneL = B4; 14'd3165 : toneL = B4; 14'd3166 : toneL = B4; 14'd3167 : toneL = B4;
14'd3168 : toneL = B4; 14'd3169 : toneL = B4; 14'd3170 : toneL = B4; 14'd3171 : toneL = B4;
14'd3172 : toneL = B4; 14'd3173 : toneL = B4; 14'd3174 : toneL = B4; 14'd3175 : toneL = B4;
14'd3176 : toneL = B4; 14'd3177 : toneL = B4; 14'd3178 : toneL = B4; 14'd3179 : toneL = B4;
14'd3180 : toneL = B4; 14'd3181 : toneL = B4; 14'd3182 : toneL = B4; 14'd3183 : toneL = B4;
14'd3184 : toneL = B4; 14'd3185 : toneL = B4; 14'd3186 : toneL = B4; 14'd3187 : toneL = B4;
14'd3188 : toneL = B4; 14'd3189 : toneL = B4; 14'd3190 : toneL = B4; 14'd3191 : toneL = B4;
14'd3192 : toneL = B4; 14'd3193 : toneL = B4; 14'd3194 : toneL = B4; 14'd3195 : toneL = B4;
14'd3196 : toneL = B4; 14'd3197 : toneL = B4; 14'd3198 : toneL = B4; 14'd3199 : toneL = 1;
/*measure 51 */
14'd3200 : toneL = E4; 14'd3201 : toneL = G4; 14'd3202 : toneL = G4; 14'd3203 : toneL = G4;
14'd3204 : toneL = G4; 14'd3205 : toneL = G4; 14'd3206 : toneL = G4; 14'd3207 : toneL = G4;
14'd3208 : toneL = G4; 14'd3209 : toneL = G4; 14'd3210 : toneL = G4; 14'd3211 : toneL = G4;
14'd3212 : toneL = G4; 14'd3213 : toneL = G4; 14'd3214 : toneL = G4; 14'd3215 : toneL = G4;
14'd3216 : toneL = G4; 14'd3217 : toneL = G4; 14'd3218 : toneL = G4; 14'd3219 : toneL = G4;
14'd3220 : toneL = G4; 14'd3221 : toneL = G4; 14'd3222 : toneL = G4; 14'd3223 : toneL = G4;
14'd3224 : toneL = G4; 14'd3225 : toneL = G4; 14'd3226 : toneL = G4; 14'd3227 : toneL = G4;
14'd3228 : toneL = G4; 14'd3229 : toneL = G4; 14'd3230 : toneL = G4; 14'd3231 : toneL = G4;
14'd3232 : toneL = G4; 14'd3233 : toneL = G4; 14'd3234 : toneL = G4; 14'd3235 : toneL = G4;
14'd3236 : toneL = G4; 14'd3237 : toneL = G4; 14'd3238 : toneL = G4; 14'd3239 : toneL = G4;
14'd3240 : toneL = G4; 14'd3241 : toneL = G4; 14'd3242 : toneL = G4; 14'd3243 : toneL = G4;
14'd3244 : toneL = G4; 14'd3245 : toneL = G4; 14'd3246 : toneL = G4; 14'd3247 : toneL = G4;
14'd3248 : toneL = G4; 14'd3249 : toneL = G4; 14'd3250 : toneL = G4; 14'd3251 : toneL = G4;
14'd3252 : toneL = G4; 14'd3253 : toneL = G4; 14'd3254 : toneL = G4; 14'd3255 : toneL = G4;
14'd3256 : toneL = G4; 14'd3257 : toneL = G4; 14'd3258 : toneL = G4; 14'd3259 : toneL = G4;
14'd3260 : toneL = G4; 14'd3261 : toneL = G4; 14'd3262 : toneL = G4; 14'd3263 : toneL = 1;
/*measure 52 */
14'd3264 : toneL = Dsharp4; 14'd3265 : toneL = Fsharp4; 14'd3266 : toneL = B4; 14'd3267 : toneL = B4;
14'd3268 : toneL = B4; 14'd3269 : toneL = B4; 14'd3270 : toneL = B4; 14'd3271 : toneL = B4;
14'd3272 : toneL = B4; 14'd3273 : toneL = B4; 14'd3274 : toneL = B4; 14'd3275 : toneL = B4;
14'd3276 : toneL = B4; 14'd3277 : toneL = B4; 14'd3278 : toneL = B4; 14'd3279 : toneL = B4;
14'd3280 : toneL = B4; 14'd3281 : toneL = B4; 14'd3282 : toneL = B4; 14'd3283 : toneL = B4;
14'd3284 : toneL = B4; 14'd3285 : toneL = B4; 14'd3286 : toneL = B4; 14'd3287 : toneL = B4;
14'd3288 : toneL = B4; 14'd3289 : toneL = B4; 14'd3290 : toneL = B4; 14'd3291 : toneL = B4;
14'd3292 : toneL = B4; 14'd3293 : toneL = B4; 14'd3294 : toneL = B4; 14'd3295 : toneL = B4;
14'd3296 : toneL = B4; 14'd3297 : toneL = B4; 14'd3298 : toneL = B4; 14'd3299 : toneL = B4;
14'd3300 : toneL = B4; 14'd3301 : toneL = B4; 14'd3302 : toneL = B4; 14'd3303 : toneL = B4;
14'd3304 : toneL = B4; 14'd3305 : toneL = B4; 14'd3306 : toneL = B4; 14'd3307 : toneL = B4;
14'd3308 : toneL = B4; 14'd3309 : toneL = B4; 14'd3310 : toneL = B4; 14'd3311 : toneL = B4;
14'd3312 : toneL = B4; 14'd3313 : toneL = B4; 14'd3314 : toneL = B4; 14'd3315 : toneL = B4;
14'd3316 : toneL = B4; 14'd3317 : toneL = B4; 14'd3318 : toneL = B4; 14'd3319 : toneL = B4;
14'd3320 : toneL = B4; 14'd3321 : toneL = B4; 14'd3322 : toneL = B4; 14'd3323 : toneL = B4;
14'd3324 : toneL = B4; 14'd3325 : toneL = B4; 14'd3326 : toneL = B4; 14'd3327 : toneL = 1;
/*measure 53 */
14'd3328 : toneL = Eflat4; 14'd3329 : toneL = G4; 14'd3330 : toneL = G4; 14'd3331 : toneL = G4;
14'd3332 : toneL = G4; 14'd3333 : toneL = G4; 14'd3334 : toneL = G4; 14'd3335 : toneL = G4;
14'd3336 : toneL = G4; 14'd3337 : toneL = G4; 14'd3338 : toneL = G4; 14'd3339 : toneL = G4;
14'd3340 : toneL = G4; 14'd3341 : toneL = G4; 14'd3342 : toneL = G4; 14'd3343 : toneL = G4;
14'd3344 : toneL = G4; 14'd3345 : toneL = G4; 14'd3346 : toneL = G4; 14'd3347 : toneL = G4;
14'd3348 : toneL = G4; 14'd3349 : toneL = G4; 14'd3350 : toneL = G4; 14'd3351 : toneL = G4;
14'd3352 : toneL = G4; 14'd3353 : toneL = G4; 14'd3354 : toneL = G4; 14'd3355 : toneL = G4;
14'd3356 : toneL = G4; 14'd3357 : toneL = G4; 14'd3358 : toneL = G4; 14'd3359 : toneL = G4;
14'd3360 : toneL = G4; 14'd3361 : toneL = G4; 14'd3362 : toneL = G4; 14'd3363 : toneL = G4;
14'd3364 : toneL = G4; 14'd3365 : toneL = G4; 14'd3366 : toneL = G4; 14'd3367 : toneL = G4;
14'd3368 : toneL = G4; 14'd3369 : toneL = G4; 14'd3370 : toneL = G4; 14'd3371 : toneL = G4;
14'd3372 : toneL = G4; 14'd3373 : toneL = G4; 14'd3374 : toneL = G4; 14'd3375 : toneL = G4;
14'd3376 : toneL = G4; 14'd3377 : toneL = G4; 14'd3378 : toneL = G4; 14'd3379 : toneL = G4;
14'd3380 : toneL = G4; 14'd3381 : toneL = G4; 14'd3382 : toneL = G4; 14'd3383 : toneL = G4;
14'd3384 : toneL = G4; 14'd3385 : toneL = G4; 14'd3386 : toneL = G4; 14'd3387 : toneL = G4;
14'd3388 : toneL = G4; 14'd3389 : toneL = G4; 14'd3390 : toneL = G4; 14'd3391 : toneL = 1;
/*measure 54 */
14'd3392 : toneL = Aflat4; 14'd3393 : toneL = B4; 14'd3394 : toneL = Eflat5; 14'd3395 : toneL = Eflat5;
14'd3396 : toneL = Eflat5; 14'd3397 : toneL = Eflat5; 14'd3398 : toneL = Eflat5; 14'd3399 : toneL = Eflat5;
14'd3400 : toneL = Eflat5; 14'd3401 : toneL = Eflat5; 14'd3402 : toneL = Eflat5; 14'd3403 : toneL = Eflat5;
14'd3404 : toneL = Eflat5; 14'd3405 : toneL = Eflat5; 14'd3406 : toneL = Eflat5; 14'd3407 : toneL = Eflat5;
14'd3408 : toneL = Eflat5; 14'd3409 : toneL = Eflat5; 14'd3410 : toneL = Eflat5; 14'd3411 : toneL = Eflat5;
14'd3412 : toneL = Eflat5; 14'd3413 : toneL = Eflat5; 14'd3414 : toneL = Eflat5; 14'd3415 : toneL = Eflat5;
14'd3416 : toneL = Eflat5; 14'd3417 : toneL = Eflat5; 14'd3418 : toneL = Eflat5; 14'd3419 : toneL = Eflat5;
14'd3420 : toneL = Eflat5; 14'd3421 : toneL = Eflat5; 14'd3422 : toneL = Eflat5; 14'd3423 : toneL = 1;
14'd3424 : toneL = Gsharp2; 14'd3425 : toneL = Gsharp2; 14'd3426 : toneL = Gsharp2; 14'd3427 : toneL = Gsharp2;
14'd3428 : toneL = Gsharp2; 14'd3429 : toneL = Gsharp2; 14'd3430 : toneL = Gsharp2; 14'd3431 : toneL = Gsharp2;
14'd3432 : toneL = Gsharp2; 14'd3433 : toneL = Gsharp2; 14'd3434 : toneL = Gsharp2; 14'd3435 : toneL = Gsharp2;
14'd3436 : toneL = Gsharp2; 14'd3437 : toneL = Gsharp2; 14'd3438 : toneL = Gsharp2; 14'd3439 : toneL = 1;
14'd3440 : toneL = Gsharp3; 14'd3441 : toneL = Gsharp3; 14'd3442 : toneL = Gsharp3; 14'd3443 : toneL = Gsharp3;
14'd3444 : toneL = Gsharp3; 14'd3445 : toneL = Gsharp3; 14'd3446 : toneL = Gsharp3; 14'd3447 : toneL = 1;
14'd3448 : toneL = A3; 14'd3449 : toneL = A3; 14'd3450 : toneL = A3; 14'd3451 : toneL = A3;
14'd3452 : toneL = A3; 14'd3453 : toneL = A3; 14'd3454 : toneL = A3; 14'd3455 : toneL = 1;
/*measure 55 */
14'd3456 : toneL = B3; 14'd3457 : toneL = B3; 14'd3458 : toneL = B3; 14'd3459 : toneL = B3;
14'd3460 : toneL = B3; 14'd3461 : toneL = B3; 14'd3462 : toneL = B3; 14'd3463 : toneL = B3;
14'd3464 : toneL = B3; 14'd3465 : toneL = B3; 14'd3466 : toneL = B3; 14'd3467 : toneL = B3;
14'd3468 : toneL = B3; 14'd3469 : toneL = B3; 14'd3470 : toneL = B3; 14'd3471 : toneL = B3;
14'd3472 : toneL = B3; 14'd3473 : toneL = B3; 14'd3474 : toneL = B3; 14'd3475 : toneL = B3;
14'd3476 : toneL = B3; 14'd3477 : toneL = B3; 14'd3478 : toneL = B3; 14'd3479 : toneL = 1;
14'd3480 : toneL = Bflat3; 14'd3481 : toneL = Bflat3; 14'd3482 : toneL = Bflat3; 14'd3483 : toneL = 1;
14'd3484 : toneL = B3; 14'd3485 : toneL = B3; 14'd3486 : toneL = B3; 14'd3487 : toneL = 1;
14'd3488 : toneL = Dflat4; 14'd3489 : toneL = Dflat4; 14'd3490 : toneL = Dflat4; 14'd3491 : toneL = Dflat4;
14'd3492 : toneL = Dflat4; 14'd3493 : toneL = Dflat4; 14'd3494 : toneL = Dflat4; 14'd3495 : toneL = 1;
14'd3496 : toneL = B3; 14'd3497 : toneL = B3; 14'd3498 : toneL = B3; 14'd3499 : toneL = B3;
14'd3500 : toneL = B3; 14'd3501 : toneL = B3; 14'd3502 : toneL = B3; 14'd3503 : toneL = 1;
14'd3504 : toneL = Aflat3; 14'd3505 : toneL = Aflat3; 14'd3506 : toneL = Aflat3; 14'd3507 : toneL = Aflat3;
14'd3508 : toneL = Aflat3; 14'd3509 : toneL = Aflat3; 14'd3510 : toneL = Aflat3; 14'd3511 : toneL = 1;
14'd3512 : toneL = E3; 14'd3513 : toneL = E3; 14'd3514 : toneL = E3; 14'd3515 : toneL = E3;
14'd3516 : toneL = E3; 14'd3517 : toneL = E3; 14'd3518 : toneL = E3; 14'd3519 : toneL = 1;
/*measure 56 */
14'd3520 : toneL = Eflat3; 14'd3521 : toneL = Eflat3; 14'd3522 : toneL = Eflat3; 14'd3523 : toneL = Eflat3;
14'd3524 : toneL = Eflat3; 14'd3525 : toneL = Eflat3; 14'd3526 : toneL = Eflat3; 14'd3527 : toneL = 1;
14'd3528 : toneL = G3; 14'd3529 : toneL = G3; 14'd3530 : toneL = G3; 14'd3531 : toneL = 1;
14'd3532 : toneL = E3; 14'd3533 : toneL = E3; 14'd3534 : toneL = E3; 14'd3535 : toneL = 1;
14'd3536 : toneL = Eflat3; 14'd3537 : toneL = Eflat3; 14'd3538 : toneL = Eflat3; 14'd3539 : toneL = Eflat3;
14'd3540 : toneL = Eflat3; 14'd3541 : toneL = Eflat3; 14'd3542 : toneL = Eflat3; 14'd3543 : toneL = Eflat3;
14'd3544 : toneL = Eflat3; 14'd3545 : toneL = Eflat3; 14'd3546 : toneL = Eflat3; 14'd3547 : toneL = Eflat3;
14'd3548 : toneL = Eflat3; 14'd3549 : toneL = Eflat3; 14'd3550 : toneL = Eflat3; 14'd3551 : toneL = Eflat3;
14'd3552 : toneL = Eflat3; 14'd3553 : toneL = Eflat3; 14'd3554 : toneL = Eflat3; 14'd3555 : toneL = Eflat3;
14'd3556 : toneL = Eflat3; 14'd3557 : toneL = Eflat3; 14'd3558 : toneL = Eflat3; 14'd3559 : toneL = Eflat3;
14'd3560 : toneL = Eflat3; 14'd3561 : toneL = Eflat3; 14'd3562 : toneL = Eflat3; 14'd3563 : toneL = Eflat3;
14'd3564 : toneL = Eflat3; 14'd3565 : toneL = Eflat3; 14'd3566 : toneL = Eflat3; 14'd3567 : toneL = 1;
14'd3568 : toneL = G3; 14'd3569 : toneL = G3; 14'd3570 : toneL = G3; 14'd3571 : toneL = G3;
14'd3572 : toneL = G3; 14'd3573 : toneL = G3; 14'd3574 : toneL = G3; 14'd3575 : toneL = 1;
14'd3576 : toneL = Aflat3; 14'd3577 : toneL = Aflat3; 14'd3578 : toneL = Aflat3; 14'd3579 : toneL = Aflat3;
14'd3580 : toneL = Aflat3; 14'd3581 : toneL = Aflat3; 14'd3582 : toneL = Aflat3; 14'd3583 : toneL = 1;
/*measure 57 */
14'd3584 : toneL = A3; 14'd3585 : toneL = A3; 14'd3586 : toneL = A3; 14'd3587 : toneL = A3;
14'd3588 : toneL = A3; 14'd3589 : toneL = A3; 14'd3590 : toneL = A3; 14'd3591 : toneL = A3;
14'd3592 : toneL = A3; 14'd3593 : toneL = A3; 14'd3594 : toneL = A3; 14'd3595 : toneL = A3;
14'd3596 : toneL = A3; 14'd3597 : toneL = A3; 14'd3598 : toneL = A3; 14'd3599 : toneL = A3;
14'd3600 : toneL = A3; 14'd3601 : toneL = A3; 14'd3602 : toneL = A3; 14'd3603 : toneL = A3;
14'd3604 : toneL = A3; 14'd3605 : toneL = A3; 14'd3606 : toneL = A3; 14'd3607 : toneL = 1;
14'd3608 : toneL = Aflat3; 14'd3609 : toneL = Aflat3; 14'd3610 : toneL = Aflat3; 14'd3611 : toneL = 1;
14'd3612 : toneL = A3; 14'd3613 : toneL = A3; 14'd3614 : toneL = A3; 14'd3615 : toneL = 1;
14'd3616 : toneL = B3; 14'd3617 : toneL = B3; 14'd3618 : toneL = B3; 14'd3619 : toneL = B3;
14'd3620 : toneL = B3; 14'd3621 : toneL = B3; 14'd3622 : toneL = B3; 14'd3623 : toneL = 1;
14'd3624 : toneL = A3; 14'd3625 : toneL = A3; 14'd3626 : toneL = A3; 14'd3627 : toneL = A3;
14'd3628 : toneL = A3; 14'd3629 : toneL = A3; 14'd3630 : toneL = A3; 14'd3631 : toneL = 1;
14'd3632 : toneL = Gflat3; 14'd3633 : toneL = Gflat3; 14'd3634 : toneL = Gflat3; 14'd3635 : toneL = Gflat3;
14'd3636 : toneL = Gflat3; 14'd3637 : toneL = Gflat3; 14'd3638 : toneL = Gflat3; 14'd3639 : toneL = 1;
14'd3640 : toneL = D3; 14'd3641 : toneL = D3; 14'd3642 : toneL = D3; 14'd3643 : toneL = D3;
14'd3644 : toneL = D3; 14'd3645 : toneL = D3; 14'd3646 : toneL = D3; 14'd3647 : toneL = 1;
/*measure 58 */
14'd3648 : toneL = Csharp3; 14'd3649 : toneL = Csharp3; 14'd3650 : toneL = Csharp3; 14'd3651 : toneL = Csharp3;
14'd3652 : toneL = Csharp3; 14'd3653 : toneL = Csharp3; 14'd3654 : toneL = Csharp3; 14'd3655 : toneL = 1;
14'd3656 : toneL = F3; 14'd3657 : toneL = F3; 14'd3658 : toneL = F3; 14'd3659 : toneL = 1;
14'd3660 : toneL = D3; 14'd3661 : toneL = D3; 14'd3662 : toneL = D3; 14'd3663 : toneL = 1;
14'd3664 : toneL = Csharp3; 14'd3665 : toneL = Csharp3; 14'd3666 : toneL = Csharp3; 14'd3667 : toneL = Csharp3;
14'd3668 : toneL = Csharp3; 14'd3669 : toneL = Csharp3; 14'd3670 : toneL = Csharp3; 14'd3671 : toneL = Csharp3;
14'd3672 : toneL = Csharp3; 14'd3673 : toneL = Csharp3; 14'd3674 : toneL = Csharp3; 14'd3675 : toneL = Csharp3;
14'd3676 : toneL = Csharp3; 14'd3677 : toneL = Csharp3; 14'd3678 : toneL = Csharp3; 14'd3679 : toneL = Csharp3;
14'd3680 : toneL = Csharp3; 14'd3681 : toneL = Csharp3; 14'd3682 : toneL = Csharp3; 14'd3683 : toneL = Csharp3;
14'd3684 : toneL = Csharp3; 14'd3685 : toneL = Csharp3; 14'd3686 : toneL = Csharp3; 14'd3687 : toneL = Csharp3;
14'd3688 : toneL = Csharp3; 14'd3689 : toneL = Csharp3; 14'd3690 : toneL = Csharp3; 14'd3691 : toneL = Csharp3;
14'd3692 : toneL = Csharp3; 14'd3693 : toneL = Csharp3; 14'd3694 : toneL = Csharp3; 14'd3695 : toneL = 1;
14'd3696 : toneL = Dflat2; 14'd3697 : toneL = Dflat2; 14'd3698 : toneL = Dflat2; 14'd3699 : toneL = Dflat2;
14'd3700 : toneL = Dflat2; 14'd3701 : toneL = Dflat2; 14'd3702 : toneL = Dflat2; 14'd3703 : toneL = 1;
14'd3704 : toneL = B2; 14'd3705 : toneL = B2; 14'd3706 : toneL = B2; 14'd3707 : toneL = B2;
14'd3708 : toneL = B2; 14'd3709 : toneL = B2; 14'd3710 : toneL = B2; 14'd3711 : toneL = 1;
/*measure 59 */
14'd3712 : toneL = C3; 14'd3713 : toneL = C3; 14'd3714 : toneL = C3; 14'd3715 : toneL = C3;
14'd3716 : toneL = C3; 14'd3717 : toneL = C3; 14'd3718 : toneL = C3; 14'd3719 : toneL = C3;
14'd3720 : toneL = C3; 14'd3721 : toneL = C3; 14'd3722 : toneL = C3; 14'd3723 : toneL = C3;
14'd3724 : toneL = C3; 14'd3725 : toneL = C3; 14'd3726 : toneL = C3; 14'd3727 : toneL = C3;
14'd3728 : toneL = C3; 14'd3729 : toneL = C3; 14'd3730 : toneL = C3; 14'd3731 : toneL = C3;
14'd3732 : toneL = C3; 14'd3733 : toneL = C3; 14'd3734 : toneL = C3; 14'd3735 : toneL = 1;
14'd3736 : toneL = C3; 14'd3737 : toneL = C3; 14'd3738 : toneL = C3; 14'd3739 : toneL = C3;
14'd3740 : toneL = C3; 14'd3741 : toneL = C3; 14'd3742 : toneL = C3; 14'd3743 : toneL = 1;
14'd3744 : toneL = Dsharp3; 14'd3745 : toneL = Dsharp3; 14'd3746 : toneL = Dsharp3; 14'd3747 : toneL = Dsharp3;
14'd3748 : toneL = Dsharp3; 14'd3749 : toneL = Dsharp3; 14'd3750 : toneL = Dsharp3; 14'd3751 : toneL = 1;
14'd3752 : toneL = E3; 14'd3753 : toneL = E3; 14'd3754 : toneL = E3; 14'd3755 : toneL = E3;
14'd3756 : toneL = E3; 14'd3757 : toneL = E3; 14'd3758 : toneL = E3; 14'd3759 : toneL = 1;
14'd3760 : toneL = Fsharp3; 14'd3761 : toneL = Fsharp3; 14'd3762 : toneL = Fsharp3; 14'd3763 : toneL = Fsharp3;
14'd3764 : toneL = Fsharp3; 14'd3765 : toneL = Fsharp3; 14'd3766 : toneL = Fsharp3; 14'd3767 : toneL = 1;
14'd3768 : toneL = A3; 14'd3769 : toneL = A3; 14'd3770 : toneL = A3; 14'd3771 : toneL = A3;
14'd3772 : toneL = A3; 14'd3773 : toneL = A3; 14'd3774 : toneL = A3; 14'd3775 : toneL = 1;
/*measure 60 */
14'd3776 : toneL = C4; 14'd3777 : toneL = C4; 14'd3778 : toneL = C4; 14'd3779 : toneL = C4;
14'd3780 : toneL = C4; 14'd3781 : toneL = C4; 14'd3782 : toneL = C4; 14'd3783 : toneL = 1;
14'd3784 : toneL = D4; 14'd3785 : toneL = D4; 14'd3786 : toneL = D4; 14'd3787 : toneL = 1;
14'd3788 : toneL = C4; 14'd3789 : toneL = C4; 14'd3790 : toneL = C4; 14'd3791 : toneL = 1;
14'd3792 : toneL = B3; 14'd3793 : toneL = B3; 14'd3794 : toneL = B3; 14'd3795 : toneL = B3;
14'd3796 : toneL = B3; 14'd3797 : toneL = B3; 14'd3798 : toneL = B3; 14'd3799 : toneL = B3;
14'd3800 : toneL = B3; 14'd3801 : toneL = B3; 14'd3802 : toneL = B3; 14'd3803 : toneL = B3;
14'd3804 : toneL = B3; 14'd3805 : toneL = B3; 14'd3806 : toneL = B3; 14'd3807 : toneL = 1;
14'd3808 : toneL = B2; 14'd3809 : toneL = B2; 14'd3810 : toneL = B2; 14'd3811 : toneL = 1;
14'd3812 : toneL = Fsharp3; 14'd3813 : toneL = Fsharp3; 14'd3814 : toneL = Fsharp3; 14'd3815 : toneL = 1;
14'd3816 : toneL = B3; 14'd3817 : toneL = B3; 14'd3818 : toneL = B3; 14'd3819 : toneL = 1;
14'd3820 : toneL = 1; 14'd3821 : toneL = 1; 14'd3822 : toneL = 1; 14'd3823 : toneL = 1;
14'd3824 : toneL = C5; 14'd3825 : toneL = C5; 14'd3826 : toneL = C5; 14'd3827 : toneL = C5;
14'd3828 : toneL = 1; 14'd3829 : toneL = Csharp5; 14'd3830 : toneL = Csharp5; 14'd3831 : toneL = Csharp5;
14'd3832 : toneL = Csharp5; 14'd3833 : toneL = Csharp5; 14'd3834 : toneL = 1; 14'd3835 : toneL = D5;
14'd3836 : toneL = D5; 14'd3837 : toneL = D5; 14'd3838 : toneL = D5; 14'd3839 : toneL = 1;
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
14'd288 : toneR = Aflat4; 14'd289 : toneR = Aflat4; 14'd290 : toneR = Aflat4; 14'd291 : toneR = Aflat4;
14'd292 : toneR = Aflat4; 14'd293 : toneR = Aflat4; 14'd294 : toneR = Aflat4; 14'd295 : toneR = Aflat4;
14'd296 : toneR = Aflat4; 14'd297 : toneR = Aflat4; 14'd298 : toneR = Aflat4; 14'd299 : toneR = Aflat4;
14'd300 : toneR = Aflat4; 14'd301 : toneR = Aflat4; 14'd302 : toneR = Aflat4; 14'd303 : toneR = 1;
14'd304 : toneR = F4; 14'd305 : toneR = F4; 14'd306 : toneR = F4; 14'd307 : toneR = F4;
14'd308 : toneR = F4; 14'd309 : toneR = F4; 14'd310 : toneR = F4; 14'd311 : toneR = F4;
14'd312 : toneR = F4; 14'd313 : toneR = F4; 14'd314 : toneR = F4; 14'd315 : toneR = F4;
14'd316 : toneR = F4; 14'd317 : toneR = F4; 14'd318 : toneR = F4; 14'd319 : toneR = 1;
/*measure 6 */
14'd320 : toneR = F4; 14'd321 : toneR = F4; 14'd322 : toneR = F4; 14'd323 : toneR = F4;
14'd324 : toneR = F4; 14'd325 : toneR = F4; 14'd326 : toneR = F4; 14'd327 : toneR = 1;
14'd328 : toneR = G4; 14'd329 : toneR = G4; 14'd330 : toneR = G4; 14'd331 : toneR = G4;
14'd332 : toneR = G4; 14'd333 : toneR = G4; 14'd334 : toneR = G4; 14'd335 : toneR = 1;
14'd336 : toneR = Aflat4; 14'd337 : toneR = Aflat4; 14'd338 : toneR = Aflat4; 14'd339 : toneR = Aflat4;
14'd340 : toneR = Aflat4; 14'd341 : toneR = Aflat4; 14'd342 : toneR = Aflat4; 14'd343 : toneR = Aflat4;
14'd344 : toneR = Aflat4; 14'd345 : toneR = Aflat4; 14'd346 : toneR = Aflat4; 14'd347 : toneR = Aflat4;
14'd348 : toneR = Aflat4; 14'd349 : toneR = Aflat4; 14'd350 : toneR = Aflat4; 14'd351 : toneR = 1;
14'd352 : toneR = C5; 14'd353 : toneR = C5; 14'd354 : toneR = C5; 14'd355 : toneR = C5;
14'd356 : toneR = C5; 14'd357 : toneR = C5; 14'd358 : toneR = C5; 14'd359 : toneR = 1;
14'd360 : toneR = Dflat5; 14'd361 : toneR = Dflat5; 14'd362 : toneR = Dflat5; 14'd363 : toneR = Dflat5;
14'd364 : toneR = Dflat5; 14'd365 : toneR = Dflat5; 14'd366 : toneR = Dflat5; 14'd367 : toneR = 1;
14'd368 : toneR = C5; 14'd369 : toneR = C5; 14'd370 : toneR = C5; 14'd371 : toneR = C5;
14'd372 : toneR = C5; 14'd373 : toneR = C5; 14'd374 : toneR = C5; 14'd375 : toneR = 1;
14'd376 : toneR = G4; 14'd377 : toneR = G4; 14'd378 : toneR = G4; 14'd379 : toneR = G4;
14'd380 : toneR = G4; 14'd381 : toneR = G4; 14'd382 : toneR = G4; 14'd383 : toneR = 1;
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
/*measure 17 */
14'd1024 : toneR = Eflat6; 14'd1025 : toneR = Eflat6; 14'd1026 : toneR = Eflat6; 14'd1027 : toneR = 1;
14'd1028 : toneR = A6; 14'd1029 : toneR = A6; 14'd1030 : toneR = A6; 14'd1031 : toneR = 1;
14'd1032 : toneR = Gflat6; 14'd1033 : toneR = Gflat6; 14'd1034 : toneR = Gflat6; 14'd1035 : toneR = 1;
14'd1036 : toneR = A6; 14'd1037 : toneR = A6; 14'd1038 : toneR = A6; 14'd1039 : toneR = 1;
14'd1040 : toneR = C6; 14'd1041 : toneR = C6; 14'd1042 : toneR = C6; 14'd1043 : toneR = 1;
14'd1044 : toneR = Gflat6; 14'd1045 : toneR = Gflat6; 14'd1046 : toneR = Gflat6; 14'd1047 : toneR = 1;
14'd1048 : toneR = Eflat6; 14'd1049 : toneR = Eflat6; 14'd1050 : toneR = Eflat6; 14'd1051 : toneR = 1;
14'd1052 : toneR = Gflat6; 14'd1053 : toneR = Gflat6; 14'd1054 : toneR = Gflat6; 14'd1055 : toneR = 1;
14'd1056 : toneR = A5; 14'd1057 : toneR = A5; 14'd1058 : toneR = A5; 14'd1059 : toneR = 1;
14'd1060 : toneR = Eflat6; 14'd1061 : toneR = Eflat6; 14'd1062 : toneR = Eflat6; 14'd1063 : toneR = 1;
14'd1064 : toneR = C6; 14'd1065 : toneR = C6; 14'd1066 : toneR = C6; 14'd1067 : toneR = 1;
14'd1068 : toneR = Eflat6; 14'd1069 : toneR = Eflat6; 14'd1070 : toneR = Eflat6; 14'd1071 : toneR = 1;
14'd1072 : toneR = Gflat5; 14'd1073 : toneR = Gflat5; 14'd1074 : toneR = Gflat5; 14'd1075 : toneR = 1;
14'd1076 : toneR = C5; 14'd1077 : toneR = C5; 14'd1078 : toneR = C5; 14'd1079 : toneR = 1;
14'd1080 : toneR = A5; 14'd1081 : toneR = A5; 14'd1082 : toneR = A5; 14'd1083 : toneR = 1;
14'd1084 : toneR = C5; 14'd1085 : toneR = C5; 14'd1086 : toneR = C5; 14'd1087 : toneR = 1;
/*measure 18 */
14'd1088 : toneR = Eflat5; 14'd1089 : toneR = Eflat5; 14'd1090 : toneR = Eflat5; 14'd1091 : toneR = 1;
14'd1092 : toneR = A5; 14'd1093 : toneR = A5; 14'd1094 : toneR = A5; 14'd1095 : toneR = 1;
14'd1096 : toneR = Gflat5; 14'd1097 : toneR = Gflat5; 14'd1098 : toneR = Gflat5; 14'd1099 : toneR = 1;
14'd1100 : toneR = A5; 14'd1101 : toneR = A5; 14'd1102 : toneR = A5; 14'd1103 : toneR = 1;
14'd1104 : toneR = C4; 14'd1105 : toneR = C4; 14'd1106 : toneR = C4; 14'd1107 : toneR = 1;
14'd1108 : toneR = Gflat4; 14'd1109 : toneR = Gflat4; 14'd1110 : toneR = Gflat4; 14'd1111 : toneR = 1;
14'd1112 : toneR = Eflat4; 14'd1113 : toneR = Eflat4; 14'd1114 : toneR = Eflat4; 14'd1115 : toneR = 1;
14'd1116 : toneR = Gflat4; 14'd1117 : toneR = Gflat4; 14'd1118 : toneR = Gflat4; 14'd1119 : toneR = 1;
14'd1120 : toneR = A4; 14'd1121 : toneR = A4; 14'd1122 : toneR = A4; 14'd1123 : toneR = 1;
14'd1124 : toneR = Eflat5; 14'd1125 : toneR = Eflat5; 14'd1126 : toneR = Eflat5; 14'd1127 : toneR = 1;
14'd1128 : toneR = C5; 14'd1129 : toneR = C5; 14'd1130 : toneR = C5; 14'd1131 : toneR = 1;
14'd1132 : toneR = Eflat5; 14'd1133 : toneR = Eflat5; 14'd1134 : toneR = Eflat5; 14'd1135 : toneR = 1;
14'd1136 : toneR = Gflat4; 14'd1137 : toneR = Gflat4; 14'd1138 : toneR = Gflat4; 14'd1139 : toneR = 1;
14'd1140 : toneR = C5; 14'd1141 : toneR = C5; 14'd1142 : toneR = C5; 14'd1143 : toneR = 1;
14'd1144 : toneR = A4; 14'd1145 : toneR = A4; 14'd1146 : toneR = A4; 14'd1147 : toneR = 1;
14'd1148 : toneR = C5; 14'd1149 : toneR = C5; 14'd1150 : toneR = C5; 14'd1151 : toneR = 1;
/*measure 19 */
14'd1152 : toneR = F5; 14'd1153 : toneR = F5; 14'd1154 : toneR = F5; 14'd1155 : toneR = F5;
14'd1156 : toneR = F5; 14'd1157 : toneR = F5; 14'd1158 : toneR = F5; 14'd1159 : toneR = F5;
14'd1160 : toneR = F5; 14'd1161 : toneR = F5; 14'd1162 : toneR = F5; 14'd1163 : toneR = F5;
14'd1164 : toneR = F5; 14'd1165 : toneR = F5; 14'd1166 : toneR = F5; 14'd1167 : toneR = 1;
14'd1168 : toneR = Aflat5; 14'd1169 : toneR = Aflat5; 14'd1170 : toneR = Aflat5; 14'd1171 : toneR = Aflat5;
14'd1172 : toneR = Aflat5; 14'd1173 : toneR = Aflat5; 14'd1174 : toneR = Aflat5; 14'd1175 : toneR = 1;
14'd1176 : toneR = Gflat5; 14'd1177 : toneR = Gflat5; 14'd1178 : toneR = Gflat5; 14'd1179 : toneR = Gflat5;
14'd1180 : toneR = Gflat5; 14'd1181 : toneR = Gflat5; 14'd1182 : toneR = Gflat5; 14'd1183 : toneR = Gflat5;
14'd1184 : toneR = Gflat5; 14'd1185 : toneR = Gflat5; 14'd1186 : toneR = Gflat5; 14'd1187 : toneR = Gflat5;
14'd1188 : toneR = Gflat5; 14'd1189 : toneR = Gflat5; 14'd1190 : toneR = Gflat5; 14'd1191 : toneR = 1;
14'd1192 : toneR = Bflat5; 14'd1193 : toneR = Bflat5; 14'd1194 : toneR = Bflat5; 14'd1195 : toneR = Bflat5;
14'd1196 : toneR = Bflat5; 14'd1197 : toneR = Bflat5; 14'd1198 : toneR = Bflat5; 14'd1199 : toneR = 1;
14'd1200 : toneR = Aflat5; 14'd1201 : toneR = Aflat5; 14'd1202 : toneR = Aflat5; 14'd1203 : toneR = Aflat5;
14'd1204 : toneR = Aflat5; 14'd1205 : toneR = Aflat5; 14'd1206 : toneR = Aflat5; 14'd1207 : toneR = Aflat5;
14'd1208 : toneR = Aflat5; 14'd1209 : toneR = Aflat5; 14'd1210 : toneR = Aflat5; 14'd1211 : toneR = Aflat5;
14'd1212 : toneR = Aflat5; 14'd1213 : toneR = Aflat5; 14'd1214 : toneR = Aflat5; 14'd1215 : toneR = 1;
/*measure 20 */
14'd1216 : toneR = C6; 14'd1217 : toneR = C6; 14'd1218 : toneR = C6; 14'd1219 : toneR = C6;
14'd1220 : toneR = C6; 14'd1221 : toneR = C6; 14'd1222 : toneR = C6; 14'd1223 : toneR = 1;
14'd1224 : toneR = Dflat6; 14'd1225 : toneR = Dflat6; 14'd1226 : toneR = Dflat6; 14'd1227 : toneR = Dflat6;
14'd1228 : toneR = Dflat6; 14'd1229 : toneR = Dflat6; 14'd1230 : toneR = Dflat6; 14'd1231 : toneR = Dflat6;
14'd1232 : toneR = Dflat6; 14'd1233 : toneR = Dflat6; 14'd1234 : toneR = Dflat6; 14'd1235 : toneR = Dflat6;
14'd1236 : toneR = Dflat6; 14'd1237 : toneR = Dflat6; 14'd1238 : toneR = Dflat6; 14'd1239 : toneR = 1;
14'd1240 : toneR = Bflat5; 14'd1241 : toneR = Bflat5; 14'd1242 : toneR = Bflat5; 14'd1243 : toneR = Bflat5;
14'd1244 : toneR = Bflat5; 14'd1245 : toneR = Bflat5; 14'd1246 : toneR = Bflat5; 14'd1247 : toneR = 1;
14'd1248 : toneR = C6; 14'd1249 : toneR = C6; 14'd1250 : toneR = C6; 14'd1251 : toneR = C6;
14'd1252 : toneR = C6; 14'd1253 : toneR = C6; 14'd1254 : toneR = C6; 14'd1255 : toneR = C6;
14'd1256 : toneR = C6; 14'd1257 : toneR = C6; 14'd1258 : toneR = C6; 14'd1259 : toneR = C6;
14'd1260 : toneR = C6; 14'd1261 : toneR = C6; 14'd1262 : toneR = C6; 14'd1263 : toneR = 1;
14'd1264 : toneR = G5; 14'd1265 : toneR = G5; 14'd1266 : toneR = G5; 14'd1267 : toneR = G5;
14'd1268 : toneR = G5; 14'd1269 : toneR = G5; 14'd1270 : toneR = G5; 14'd1271 : toneR = G5;
14'd1272 : toneR = G5; 14'd1273 : toneR = G5; 14'd1274 : toneR = G5; 14'd1275 : toneR = G5;
14'd1276 : toneR = G5; 14'd1277 : toneR = G5; 14'd1278 : toneR = G5; 14'd1279 : toneR = 1;
/*measure 21 */
14'd1280 : toneR = F5; 14'd1281 : toneR = F5; 14'd1282 : toneR = F5; 14'd1283 : toneR = F5;
14'd1284 : toneR = F5; 14'd1285 : toneR = F5; 14'd1286 : toneR = F5; 14'd1287 : toneR = F5;
14'd1288 : toneR = F5; 14'd1289 : toneR = F5; 14'd1290 : toneR = F5; 14'd1291 : toneR = F5;
14'd1292 : toneR = F5; 14'd1293 : toneR = F5; 14'd1294 : toneR = F5; 14'd1295 : toneR = 1;
14'd1296 : toneR = Aflat5; 14'd1297 : toneR = Aflat5; 14'd1298 : toneR = Aflat5; 14'd1299 : toneR = Aflat5;
14'd1300 : toneR = Aflat5; 14'd1301 : toneR = Aflat5; 14'd1302 : toneR = Aflat5; 14'd1303 : toneR = 1;
14'd1304 : toneR = G5; 14'd1305 : toneR = G5; 14'd1306 : toneR = G5; 14'd1307 : toneR = G5;
14'd1308 : toneR = G5; 14'd1309 : toneR = G5; 14'd1310 : toneR = G5; 14'd1311 : toneR = G5;
14'd1312 : toneR = G5; 14'd1313 : toneR = G5; 14'd1314 : toneR = G5; 14'd1315 : toneR = G5;
14'd1316 : toneR = G5; 14'd1317 : toneR = G5; 14'd1318 : toneR = G5; 14'd1319 : toneR = 1;
14'd1320 : toneR = Bflat5; 14'd1321 : toneR = Bflat5; 14'd1322 : toneR = Bflat5; 14'd1323 : toneR = Bflat5;
14'd1324 : toneR = Bflat5; 14'd1325 : toneR = Bflat5; 14'd1326 : toneR = Bflat5; 14'd1327 : toneR = 1;
14'd1328 : toneR = Aflat5; 14'd1329 : toneR = Aflat5; 14'd1330 : toneR = Aflat5; 14'd1331 : toneR = Aflat5;
14'd1332 : toneR = Aflat5; 14'd1333 : toneR = Aflat5; 14'd1334 : toneR = Aflat5; 14'd1335 : toneR = Aflat5;
14'd1336 : toneR = Aflat5; 14'd1337 : toneR = Aflat5; 14'd1338 : toneR = Aflat5; 14'd1339 : toneR = Aflat5;
14'd1340 : toneR = Aflat5; 14'd1341 : toneR = Aflat5; 14'd1342 : toneR = Aflat5; 14'd1343 : toneR = 1;
/*measure 22 */
14'd1344 : toneR = G6; 14'd1345 : toneR = G6; 14'd1346 : toneR = G6; 14'd1347 : toneR = 1;
14'd1348 : toneR = Aflat6; 14'd1349 : toneR = Aflat6; 14'd1350 : toneR = Aflat6; 14'd1351 : toneR = 1;
14'd1352 : toneR = G6; 14'd1353 : toneR = G6; 14'd1354 : toneR = G6; 14'd1355 : toneR = 1;
14'd1356 : toneR = C6; 14'd1357 : toneR = C6; 14'd1358 : toneR = C6; 14'd1359 : toneR = 1;
14'd1360 : toneR = G6; 14'd1361 : toneR = G6; 14'd1362 : toneR = G6; 14'd1363 : toneR = 1;
14'd1364 : toneR = Aflat6; 14'd1365 : toneR = Aflat6; 14'd1366 : toneR = Aflat6; 14'd1367 : toneR = 1;
14'd1368 : toneR = C7; 14'd1369 : toneR = C7; 14'd1370 : toneR = C7; 14'd1371 : toneR = 1;
14'd1372 : toneR = G6; 14'd1373 : toneR = G6; 14'd1374 : toneR = G6; 14'd1375 : toneR = 1;
14'd1376 : toneR = F6; 14'd1377 : toneR = F6; 14'd1378 : toneR = F6; 14'd1379 : toneR = 1;
14'd1380 : toneR = G6; 14'd1381 : toneR = G6; 14'd1382 : toneR = G6; 14'd1383 : toneR = 1;
14'd1384 : toneR = F6; 14'd1385 : toneR = F6; 14'd1386 : toneR = F6; 14'd1387 : toneR = 1;
14'd1388 : toneR = Dflat6; 14'd1389 : toneR = Dflat6; 14'd1390 : toneR = Dflat6; 14'd1391 : toneR = 1;
14'd1392 : toneR = C6; 14'd1393 : toneR = C6; 14'd1394 : toneR = C6; 14'd1395 : toneR = 1;
14'd1396 : toneR = Dflat6; 14'd1397 : toneR = Dflat6; 14'd1398 : toneR = Dflat6; 14'd1399 : toneR = 1;
14'd1400 : toneR = C6; 14'd1401 : toneR = C6; 14'd1402 : toneR = C6; 14'd1403 : toneR = C6;
14'd1404 : toneR = C6; 14'd1405 : toneR = C6; 14'd1406 : toneR = C6; 14'd1407 : toneR = 1;
/*measure 23 */
14'd1408 : toneR = F5; 14'd1409 : toneR = F5; 14'd1410 : toneR = F5; 14'd1411 : toneR = F5;
14'd1412 : toneR = F5; 14'd1413 : toneR = F5; 14'd1414 : toneR = F5; 14'd1415 : toneR = F5;
14'd1416 : toneR = F5; 14'd1417 : toneR = F5; 14'd1418 : toneR = F5; 14'd1419 : toneR = F5;
14'd1420 : toneR = F5; 14'd1421 : toneR = F5; 14'd1422 : toneR = F5; 14'd1423 : toneR = 1;
14'd1424 : toneR = Aflat5; 14'd1425 : toneR = Aflat5; 14'd1426 : toneR = Aflat5; 14'd1427 : toneR = Aflat5;
14'd1428 : toneR = Aflat5; 14'd1429 : toneR = Aflat5; 14'd1430 : toneR = Aflat5; 14'd1431 : toneR = 1;
14'd1432 : toneR = Gflat5; 14'd1433 : toneR = Gflat5; 14'd1434 : toneR = Gflat5; 14'd1435 : toneR = Gflat5;
14'd1436 : toneR = Gflat5; 14'd1437 : toneR = Gflat5; 14'd1438 : toneR = Gflat5; 14'd1439 : toneR = Gflat5;
14'd1440 : toneR = Gflat5; 14'd1441 : toneR = Gflat5; 14'd1442 : toneR = Gflat5; 14'd1443 : toneR = Gflat5;
14'd1444 : toneR = Gflat5; 14'd1445 : toneR = Gflat5; 14'd1446 : toneR = Gflat5; 14'd1447 : toneR = 1;
14'd1448 : toneR = Bflat5; 14'd1449 : toneR = Bflat5; 14'd1450 : toneR = Bflat5; 14'd1451 : toneR = Bflat5;
14'd1452 : toneR = Bflat5; 14'd1453 : toneR = Bflat5; 14'd1454 : toneR = Bflat5; 14'd1455 : toneR = 1;
14'd1456 : toneR = Aflat5; 14'd1457 : toneR = Aflat5; 14'd1458 : toneR = Aflat5; 14'd1459 : toneR = Aflat5;
14'd1460 : toneR = Aflat5; 14'd1461 : toneR = Aflat5; 14'd1462 : toneR = Aflat5; 14'd1463 : toneR = Aflat5;
14'd1464 : toneR = Aflat5; 14'd1465 : toneR = Aflat5; 14'd1466 : toneR = Aflat5; 14'd1467 : toneR = Aflat5;
14'd1468 : toneR = Aflat5; 14'd1469 : toneR = Aflat5; 14'd1470 : toneR = Aflat5; 14'd1471 : toneR = 1;
/*measure 24 */
14'd1472 : toneR = C6; 14'd1473 : toneR = C6; 14'd1474 : toneR = C6; 14'd1475 : toneR = C6;
14'd1476 : toneR = C6; 14'd1477 : toneR = C6; 14'd1478 : toneR = C6; 14'd1479 : toneR = 1;
14'd1480 : toneR = Dflat6; 14'd1481 : toneR = Dflat6; 14'd1482 : toneR = Dflat6; 14'd1483 : toneR = Dflat6;
14'd1484 : toneR = Dflat6; 14'd1485 : toneR = Dflat6; 14'd1486 : toneR = Dflat6; 14'd1487 : toneR = Dflat6;
14'd1488 : toneR = Dflat6; 14'd1489 : toneR = Dflat6; 14'd1490 : toneR = Dflat6; 14'd1491 : toneR = Dflat6;
14'd1492 : toneR = Dflat6; 14'd1493 : toneR = Dflat6; 14'd1494 : toneR = Dflat6; 14'd1495 : toneR = 1;
14'd1496 : toneR = Bflat5; 14'd1497 : toneR = Bflat5; 14'd1498 : toneR = Bflat5; 14'd1499 : toneR = Bflat5;
14'd1500 : toneR = Bflat5; 14'd1501 : toneR = Bflat5; 14'd1502 : toneR = Bflat5; 14'd1503 : toneR = 1;
14'd1504 : toneR = C6; 14'd1505 : toneR = C6; 14'd1506 : toneR = C6; 14'd1507 : toneR = C6;
14'd1508 : toneR = C6; 14'd1509 : toneR = C6; 14'd1510 : toneR = C6; 14'd1511 : toneR = C6;
14'd1512 : toneR = C6; 14'd1513 : toneR = C6; 14'd1514 : toneR = C6; 14'd1515 : toneR = C6;
14'd1516 : toneR = C6; 14'd1517 : toneR = C6; 14'd1518 : toneR = C6; 14'd1519 : toneR = 1;
14'd1520 : toneR = G5; 14'd1521 : toneR = G5; 14'd1522 : toneR = G5; 14'd1523 : toneR = G5;
14'd1524 : toneR = G5; 14'd1525 : toneR = G5; 14'd1526 : toneR = G5; 14'd1527 : toneR = G5;
14'd1528 : toneR = G5; 14'd1529 : toneR = G5; 14'd1530 : toneR = G5; 14'd1531 : toneR = G5;
14'd1532 : toneR = G5; 14'd1533 : toneR = G5; 14'd1534 : toneR = G5; 14'd1535 : toneR = 1;
/*measure 25 */
14'd1536 : toneR = F5; 14'd1537 : toneR = F5; 14'd1538 : toneR = F5; 14'd1539 : toneR = F5;
14'd1540 : toneR = F5; 14'd1541 : toneR = F5; 14'd1542 : toneR = F5; 14'd1543 : toneR = F5;
14'd1544 : toneR = F5; 14'd1545 : toneR = F5; 14'd1546 : toneR = F5; 14'd1547 : toneR = F5;
14'd1548 : toneR = F5; 14'd1549 : toneR = F5; 14'd1550 : toneR = F5; 14'd1551 : toneR = 1;
14'd1552 : toneR = Aflat5; 14'd1553 : toneR = Aflat5; 14'd1554 : toneR = Aflat5; 14'd1555 : toneR = Aflat5;
14'd1556 : toneR = Aflat5; 14'd1557 : toneR = Aflat5; 14'd1558 : toneR = Aflat5; 14'd1559 : toneR = 1;
14'd1560 : toneR = G5; 14'd1561 : toneR = G5; 14'd1562 : toneR = G5; 14'd1563 : toneR = G5;
14'd1564 : toneR = G5; 14'd1565 : toneR = G5; 14'd1566 : toneR = G5; 14'd1567 : toneR = G5;
14'd1568 : toneR = G5; 14'd1569 : toneR = G5; 14'd1570 : toneR = G5; 14'd1571 : toneR = G5;
14'd1572 : toneR = G5; 14'd1573 : toneR = G5; 14'd1574 : toneR = G5; 14'd1575 : toneR = 1;
14'd1576 : toneR = Bflat5; 14'd1577 : toneR = Bflat5; 14'd1578 : toneR = Bflat5; 14'd1579 : toneR = Bflat5;
14'd1580 : toneR = Bflat5; 14'd1581 : toneR = Bflat5; 14'd1582 : toneR = Bflat5; 14'd1583 : toneR = 1;
14'd1584 : toneR = Aflat5; 14'd1585 : toneR = Aflat5; 14'd1586 : toneR = Aflat5; 14'd1587 : toneR = Aflat5;
14'd1588 : toneR = Aflat5; 14'd1589 : toneR = Aflat5; 14'd1590 : toneR = Aflat5; 14'd1591 : toneR = Aflat5;
14'd1592 : toneR = Aflat5; 14'd1593 : toneR = Aflat5; 14'd1594 : toneR = Aflat5; 14'd1595 : toneR = Aflat5;
14'd1596 : toneR = Aflat5; 14'd1597 : toneR = Aflat5; 14'd1598 : toneR = Aflat5; 14'd1599 : toneR = 1;
/*measure 26 */
14'd1600 : toneR = Dflat5; 14'd1601 : toneR = Dflat5; 14'd1602 : toneR = Dflat5; 14'd1603 : toneR = Dflat5;
14'd1604 : toneR = Dflat5; 14'd1605 : toneR = Dflat5; 14'd1606 : toneR = Dflat5; 14'd1607 : toneR = Dflat5;
14'd1608 : toneR = Dflat5; 14'd1609 : toneR = Dflat5; 14'd1610 : toneR = Dflat5; 14'd1611 : toneR = Dflat5;
14'd1612 : toneR = Dflat5; 14'd1613 : toneR = Dflat5; 14'd1614 : toneR = Dflat5; 14'd1615 : toneR = Dflat5;
14'd1616 : toneR = Dflat5; 14'd1617 : toneR = Dflat5; 14'd1618 : toneR = Dflat5; 14'd1619 : toneR = Dflat5;
14'd1620 : toneR = 1; 14'd1621 : toneR = Dflat6; 14'd1622 : toneR = Dflat6; 14'd1623 : toneR = Dflat6;
14'd1624 : toneR = Dflat6; 14'd1625 : toneR = Dflat6; 14'd1626 : toneR = 1; 14'd1627 : toneR = Aflat6;
14'd1628 : toneR = Aflat6; 14'd1629 : toneR = Aflat6; 14'd1630 : toneR = Aflat6; 14'd1631 : toneR = 1;
14'd1632 : toneR = G6; 14'd1633 : toneR = G6; 14'd1634 : toneR = G6; 14'd1635 : toneR = G6;
14'd1636 : toneR = G6; 14'd1637 : toneR = G6; 14'd1638 : toneR = G6; 14'd1639 : toneR = G6;
14'd1640 : toneR = G6; 14'd1641 : toneR = G6; 14'd1642 : toneR = G6; 14'd1643 : toneR = G6;
14'd1644 : toneR = G6; 14'd1645 : toneR = G6; 14'd1646 : toneR = G6; 14'd1647 : toneR = 1;
14'd1648 : toneR = E6; 14'd1649 : toneR = E6; 14'd1650 : toneR = E6; 14'd1651 : toneR = E6;
14'd1652 : toneR = E6; 14'd1653 : toneR = E6; 14'd1654 : toneR = E6; 14'd1655 : toneR = E6;
14'd1656 : toneR = E6; 14'd1657 : toneR = E6; 14'd1658 : toneR = E6; 14'd1659 : toneR = E6;
14'd1660 : toneR = E6; 14'd1661 : toneR = E6; 14'd1662 : toneR = E6; 14'd1663 : toneR = 1;
/*measure 27 */
14'd1664 : toneR = Dflat6; 14'd1665 : toneR = Dflat6; 14'd1666 : toneR = Dflat6; 14'd1667 : toneR = Dflat6;
14'd1668 : toneR = Dflat6; 14'd1669 : toneR = Dflat6; 14'd1670 : toneR = Dflat6; 14'd1671 : toneR = Dflat6;
14'd1672 : toneR = Dflat6; 14'd1673 : toneR = Dflat6; 14'd1674 : toneR = Dflat6; 14'd1675 : toneR = Dflat6;
14'd1676 : toneR = Dflat6; 14'd1677 : toneR = Dflat6; 14'd1678 : toneR = Dflat6; 14'd1679 : toneR = Dflat6;
14'd1680 : toneR = Dflat6; 14'd1681 : toneR = Dflat6; 14'd1682 : toneR = Dflat6; 14'd1683 : toneR = Dflat6;
14'd1684 : toneR = Dflat6; 14'd1685 : toneR = Dflat6; 14'd1686 : toneR = Dflat6; 14'd1687 : toneR = 1;
14'd1688 : toneR = C6; 14'd1689 : toneR = C6; 14'd1690 : toneR = C6; 14'd1691 : toneR = 1;
14'd1692 : toneR = Dflat6; 14'd1693 : toneR = Dflat6; 14'd1694 : toneR = Dflat6; 14'd1695 : toneR = 1;
14'd1696 : toneR = C6; 14'd1697 : toneR = C6; 14'd1698 : toneR = C6; 14'd1699 : toneR = C6;
14'd1700 : toneR = C6; 14'd1701 : toneR = C6; 14'd1702 : toneR = C6; 14'd1703 : toneR = C6;
14'd1704 : toneR = C6; 14'd1705 : toneR = C6; 14'd1706 : toneR = C6; 14'd1707 : toneR = 1;
14'd1708 : toneR = Bflat5; 14'd1709 : toneR = Bflat5; 14'd1710 : toneR = Bflat5; 14'd1711 : toneR = Bflat5;
14'd1712 : toneR = Bflat5; 14'd1713 : toneR = Bflat5; 14'd1714 : toneR = Bflat5; 14'd1715 : toneR = Bflat5;
14'd1716 : toneR = Bflat5; 14'd1717 : toneR = Bflat5; 14'd1718 : toneR = Bflat5; 14'd1719 : toneR = 1;
14'd1720 : toneR = Aflat5; 14'd1721 : toneR = Aflat5; 14'd1722 : toneR = Aflat5; 14'd1723 : toneR = Aflat5;
14'd1724 : toneR = Aflat5; 14'd1725 : toneR = Aflat5; 14'd1726 : toneR = Aflat5; 14'd1727 : toneR = 1;
/*measure 28 */
14'd1728 : toneR = G5; 14'd1729 : toneR = G5; 14'd1730 : toneR = G5; 14'd1731 : toneR = G5;
14'd1732 : toneR = G5; 14'd1733 : toneR = G5; 14'd1734 : toneR = G5; 14'd1735 : toneR = G5;
14'd1736 : toneR = G5; 14'd1737 : toneR = G5; 14'd1738 : toneR = G5; 14'd1739 : toneR = 1;
14'd1740 : toneR = Aflat5; 14'd1741 : toneR = Aflat5; 14'd1742 : toneR = Aflat5; 14'd1743 : toneR = Aflat5;
14'd1744 : toneR = Aflat5; 14'd1745 : toneR = Aflat5; 14'd1746 : toneR = Aflat5; 14'd1747 : toneR = Aflat5;
14'd1748 : toneR = Aflat5; 14'd1749 : toneR = Aflat5; 14'd1750 : toneR = Aflat5; 14'd1751 : toneR = 1;
14'd1752 : toneR = G5; 14'd1753 : toneR = G5; 14'd1754 : toneR = G5; 14'd1755 : toneR = G5;
14'd1756 : toneR = G5; 14'd1757 : toneR = G5; 14'd1758 : toneR = G5; 14'd1759 : toneR = 1;
14'd1760 : toneR = Eflat5; 14'd1761 : toneR = Eflat5; 14'd1762 : toneR = Eflat5; 14'd1763 : toneR = Eflat5;
14'd1764 : toneR = Eflat5; 14'd1765 : toneR = Eflat5; 14'd1766 : toneR = Eflat5; 14'd1767 : toneR = Eflat5;
14'd1768 : toneR = Eflat5; 14'd1769 : toneR = Eflat5; 14'd1770 : toneR = Eflat5; 14'd1771 : toneR = Eflat5;
14'd1772 : toneR = Eflat5; 14'd1773 : toneR = Eflat5; 14'd1774 : toneR = Eflat5; 14'd1775 : toneR = Eflat5;
14'd1776 : toneR = Eflat5; 14'd1777 : toneR = Eflat5; 14'd1778 : toneR = Eflat5; 14'd1779 : toneR = Eflat5;
14'd1780 : toneR = Eflat5; 14'd1781 : toneR = Eflat5; 14'd1782 : toneR = Eflat5; 14'd1783 : toneR = 1;
14'd1784 : toneR = C5; 14'd1785 : toneR = C5; 14'd1786 : toneR = C5; 14'd1787 : toneR = 1;
14'd1788 : toneR = Eflat5; 14'd1789 : toneR = Eflat5; 14'd1790 : toneR = Eflat5; 14'd1791 : toneR = 1;
/*measure 29 */
14'd1792 : toneR = F5; 14'd1793 : toneR = F5; 14'd1794 : toneR = F5; 14'd1795 : toneR = F5;
14'd1796 : toneR = F5; 14'd1797 : toneR = F5; 14'd1798 : toneR = F5; 14'd1799 : toneR = F5;
14'd1800 : toneR = F5; 14'd1801 : toneR = F5; 14'd1802 : toneR = F5; 14'd1803 : toneR = F5;
14'd1804 : toneR = F5; 14'd1805 : toneR = F5; 14'd1806 : toneR = F5; 14'd1807 : toneR = F5;
14'd1808 : toneR = F5; 14'd1809 : toneR = F5; 14'd1810 : toneR = F5; 14'd1811 : toneR = F5;
14'd1812 : toneR = F5; 14'd1813 : toneR = F5; 14'd1814 : toneR = F5; 14'd1815 : toneR = 1;
14'd1816 : toneR = F5; 14'd1817 : toneR = F5; 14'd1818 : toneR = F5; 14'd1819 : toneR = F5;
14'd1820 : toneR = F5; 14'd1821 : toneR = F5; 14'd1822 : toneR = F5; 14'd1823 : toneR = 1;
14'd1824 : toneR = G5; 14'd1825 : toneR = G5; 14'd1826 : toneR = G5; 14'd1827 : toneR = G5;
14'd1828 : toneR = G5; 14'd1829 : toneR = G5; 14'd1830 : toneR = G5; 14'd1831 : toneR = G5;
14'd1832 : toneR = G5; 14'd1833 : toneR = G5; 14'd1834 : toneR = G5; 14'd1835 : toneR = G5;
14'd1836 : toneR = G5; 14'd1837 : toneR = G5; 14'd1838 : toneR = G5; 14'd1839 : toneR = G5;
14'd1840 : toneR = G5; 14'd1841 : toneR = G5; 14'd1842 : toneR = G5; 14'd1843 : toneR = G5;
14'd1844 : toneR = G5; 14'd1845 : toneR = G5; 14'd1846 : toneR = G5; 14'd1847 : toneR = 1;
14'd1848 : toneR = G5; 14'd1849 : toneR = G5; 14'd1850 : toneR = G5; 14'd1851 : toneR = G5;
14'd1852 : toneR = G5; 14'd1853 : toneR = G5; 14'd1854 : toneR = G5; 14'd1855 : toneR = 1;
/*measure 30 */
14'd1856 : toneR = Eflat5; 14'd1857 : toneR = Eflat5; 14'd1858 : toneR = Eflat5; 14'd1859 : toneR = Eflat5;
14'd1860 : toneR = 1; 14'd1861 : toneR = Eflat4; 14'd1862 : toneR = Eflat4; 14'd1863 : toneR = Eflat4;
14'd1864 : toneR = Eflat4; 14'd1865 : toneR = Eflat4; 14'd1866 : toneR = 1; 14'd1867 : toneR = Aflat4;
14'd1868 : toneR = Aflat4; 14'd1869 : toneR = Aflat4; 14'd1870 : toneR = Aflat4; 14'd1871 : toneR = 1;
14'd1872 : toneR = Bflat4; 14'd1873 : toneR = Bflat4; 14'd1874 : toneR = Bflat4; 14'd1875 : toneR = Bflat4;
14'd1876 : toneR = 1; 14'd1877 : toneR = Bflat4; 14'd1878 : toneR = Bflat4; 14'd1879 : toneR = Bflat4;
14'd1880 : toneR = Bflat4; 14'd1881 : toneR = Bflat4; 14'd1882 : toneR = 1; 14'd1883 : toneR = Eflat5;
14'd1884 : toneR = Eflat5; 14'd1885 : toneR = Eflat5; 14'd1886 : toneR = Eflat5; 14'd1887 : toneR = 1;
14'd1888 : toneR = Aflat5; 14'd1889 : toneR = Aflat5; 14'd1890 : toneR = Aflat5; 14'd1891 : toneR = Aflat5;
14'd1892 : toneR = 1; 14'd1893 : toneR = Eflat5; 14'd1894 : toneR = Eflat5; 14'd1895 : toneR = Eflat5;
14'd1896 : toneR = Eflat5; 14'd1897 : toneR = Eflat5; 14'd1898 : toneR = 1; 14'd1899 : toneR = Aflat5;
14'd1900 : toneR = Aflat5; 14'd1901 : toneR = Aflat5; 14'd1902 : toneR = Aflat5; 14'd1903 : toneR = 1;
14'd1904 : toneR = Bflat5; 14'd1905 : toneR = Bflat5; 14'd1906 : toneR = Bflat5; 14'd1907 : toneR = Bflat5;
14'd1908 : toneR = 1; 14'd1909 : toneR = Eflat5; 14'd1910 : toneR = Eflat5; 14'd1911 : toneR = Eflat5;
14'd1912 : toneR = Eflat5; 14'd1913 : toneR = Eflat5; 14'd1914 : toneR = 1; 14'd1915 : toneR = Bflat5;
14'd1916 : toneR = Bflat5; 14'd1917 : toneR = Bflat5; 14'd1918 : toneR = Bflat5; 14'd1919 : toneR = 1;
/*measure 31 */
14'd1920 : toneR = C6; 14'd1921 : toneR = C6; 14'd1922 : toneR = C6; 14'd1923 : toneR = C6;
14'd1924 : toneR = C6; 14'd1925 : toneR = C6; 14'd1926 : toneR = C6; 14'd1927 : toneR = C6;
14'd1928 : toneR = C6; 14'd1929 : toneR = C6; 14'd1930 : toneR = C6; 14'd1931 : toneR = C6;
14'd1932 : toneR = C6; 14'd1933 : toneR = C6; 14'd1934 : toneR = C6; 14'd1935 : toneR = 1;
14'd1936 : toneR = F4; 14'd1937 : toneR = F4; 14'd1938 : toneR = F4; 14'd1939 : toneR = 1;
14'd1940 : toneR = D4; 14'd1941 : toneR = D4; 14'd1942 : toneR = D4; 14'd1943 : toneR = 1;
14'd1944 : toneR = F4; 14'd1945 : toneR = F4; 14'd1946 : toneR = F4; 14'd1947 : toneR = 1;
14'd1948 : toneR = Aflat4; 14'd1949 : toneR = Aflat4; 14'd1950 : toneR = Aflat4; 14'd1951 : toneR = 1;
14'd1952 : toneR = Bflat4; 14'd1953 : toneR = Bflat4; 14'd1954 : toneR = Bflat4; 14'd1955 : toneR = 1;
14'd1956 : toneR = F4; 14'd1957 : toneR = F4; 14'd1958 : toneR = F4; 14'd1959 : toneR = 1;
14'd1960 : toneR = Bflat4; 14'd1961 : toneR = Bflat4; 14'd1962 : toneR = Bflat4; 14'd1963 : toneR = 1;
14'd1964 : toneR = D5; 14'd1965 : toneR = D5; 14'd1966 : toneR = D5; 14'd1967 : toneR = 1;
14'd1968 : toneR = F5; 14'd1969 : toneR = F5; 14'd1970 : toneR = F5; 14'd1971 : toneR = 1;
14'd1972 : toneR = D5; 14'd1973 : toneR = D5; 14'd1974 : toneR = D5; 14'd1975 : toneR = 1;
14'd1976 : toneR = F5; 14'd1977 : toneR = F5; 14'd1978 : toneR = F5; 14'd1979 : toneR = 1;
14'd1980 : toneR = Aflat5; 14'd1981 : toneR = Aflat5; 14'd1982 : toneR = Aflat5; 14'd1983 : toneR = 1;
/*measure 32 */
14'd1984 : toneR = D6; 14'd1985 : toneR = D6; 14'd1986 : toneR = D6; 14'd1987 : toneR = D6;
14'd1988 : toneR = D6; 14'd1989 : toneR = D6; 14'd1990 : toneR = D6; 14'd1991 : toneR = D6;
14'd1992 : toneR = D6; 14'd1993 : toneR = D6; 14'd1994 : toneR = D6; 14'd1995 : toneR = D6;
14'd1996 : toneR = D6; 14'd1997 : toneR = D6; 14'd1998 : toneR = D6; 14'd1999 : toneR = 1;
14'd2000 : toneR = 1; 14'd2001 : toneR = 1; 14'd2002 : toneR = 1; 14'd2003 : toneR = 1;
14'd2004 : toneR = D4; 14'd2005 : toneR = D4; 14'd2006 : toneR = D4; 14'd2007 : toneR = 1;
14'd2008 : toneR = F4; 14'd2009 : toneR = F4; 14'd2010 : toneR = F4; 14'd2011 : toneR = 1;
14'd2012 : toneR = Aflat4; 14'd2013 : toneR = Aflat4; 14'd2014 : toneR = Aflat4; 14'd2015 : toneR = 1;
14'd2016 : toneR = Bflat4; 14'd2017 : toneR = Bflat4; 14'd2018 : toneR = Bflat4; 14'd2019 : toneR = 1;
14'd2020 : toneR = F4; 14'd2021 : toneR = F4; 14'd2022 : toneR = F4; 14'd2023 : toneR = 1;
14'd2024 : toneR = Bflat4; 14'd2025 : toneR = Bflat4; 14'd2026 : toneR = Bflat4; 14'd2027 : toneR = 1;
14'd2028 : toneR = D5; 14'd2029 : toneR = D5; 14'd2030 : toneR = D5; 14'd2031 : toneR = 1;
14'd2032 : toneR = F5; 14'd2033 : toneR = F5; 14'd2034 : toneR = F5; 14'd2035 : toneR = 1;
14'd2036 : toneR = D5; 14'd2037 : toneR = D5; 14'd2038 : toneR = D5; 14'd2039 : toneR = 1;
14'd2040 : toneR = F5; 14'd2041 : toneR = F5; 14'd2042 : toneR = F5; 14'd2043 : toneR = 1;
14'd2044 : toneR = Bflat5; 14'd2045 : toneR = Bflat5; 14'd2046 : toneR = Bflat5; 14'd2047 : toneR = 1;
/*measure 33 */
14'd2048 : toneR = Aflat5; 14'd2049 : toneR = Aflat5; 14'd2050 : toneR = Aflat5; 14'd2051 : toneR = 1;
14'd2052 : toneR = F5; 14'd2053 : toneR = F5; 14'd2054 : toneR = F5; 14'd2055 : toneR = 1;
14'd2056 : toneR = D5; 14'd2057 : toneR = D5; 14'd2058 : toneR = D5; 14'd2059 : toneR = 1;
14'd2060 : toneR = Bflat4; 14'd2061 : toneR = Bflat4; 14'd2062 : toneR = Bflat4; 14'd2063 : toneR = 1;
14'd2064 : toneR = D5; 14'd2065 : toneR = D5; 14'd2066 : toneR = D5; 14'd2067 : toneR = 1;
14'd2068 : toneR = F5; 14'd2069 : toneR = F5; 14'd2070 : toneR = F5; 14'd2071 : toneR = 1;
14'd2072 : toneR = Aflat5; 14'd2073 : toneR = Aflat5; 14'd2074 : toneR = Aflat5; 14'd2075 : toneR = 1;
14'd2076 : toneR = Bflat5; 14'd2077 : toneR = Bflat5; 14'd2078 : toneR = Bflat5; 14'd2079 : toneR = 1;
14'd2080 : toneR = F6; 14'd2081 : toneR = F6; 14'd2082 : toneR = F6; 14'd2083 : toneR = 1;
14'd2084 : toneR = Bflat5; 14'd2085 : toneR = Bflat5; 14'd2086 : toneR = Bflat5; 14'd2087 : toneR = 1;
14'd2088 : toneR = D6; 14'd2089 : toneR = D6; 14'd2090 : toneR = D6; 14'd2091 : toneR = 1;
14'd2092 : toneR = F6; 14'd2093 : toneR = F6; 14'd2094 : toneR = F6; 14'd2095 : toneR = 1;
14'd2096 : toneR = Bflat6; 14'd2097 : toneR = Bflat6; 14'd2098 : toneR = Bflat6; 14'd2099 : toneR = 1;
14'd2100 : toneR = Bflat5; 14'd2101 : toneR = Bflat5; 14'd2102 : toneR = Bflat5; 14'd2103 : toneR = 1;
14'd2104 : toneR = Aflat6; 14'd2105 : toneR = Aflat6; 14'd2106 : toneR = Aflat6; 14'd2107 : toneR = 1;
14'd2108 : toneR = Aflat5; 14'd2109 : toneR = Aflat5; 14'd2110 : toneR = Aflat5; 14'd2111 : toneR = 1;
/*measure 34 */
14'd2112 : toneR = Aflat6; 14'd2113 : toneR = Aflat6; 14'd2114 : toneR = Aflat6; 14'd2115 : toneR = Aflat6;
14'd2116 : toneR = Aflat6; 14'd2117 : toneR = Aflat6; 14'd2118 : toneR = Aflat6; 14'd2119 : toneR = Aflat6;
14'd2120 : toneR = Aflat6; 14'd2121 : toneR = Aflat6; 14'd2122 : toneR = Aflat6; 14'd2123 : toneR = Aflat6;
14'd2124 : toneR = Aflat6; 14'd2125 : toneR = Aflat6; 14'd2126 : toneR = Aflat6; 14'd2127 : toneR = 1;
14'd2128 : toneR = 1; 14'd2129 : toneR = 1; 14'd2130 : toneR = 1; 14'd2131 : toneR = 1;
14'd2132 : toneR = 1; 14'd2133 : toneR = 1; 14'd2134 : toneR = 1; 14'd2135 : toneR = 1;
14'd2136 : toneR = G6; 14'd2137 : toneR = G6; 14'd2138 : toneR = G6; 14'd2139 : toneR = 1;
14'd2140 : toneR = F6; 14'd2141 : toneR = F6; 14'd2142 : toneR = F6; 14'd2143 : toneR = 1;
14'd2144 : toneR = G6; 14'd2145 : toneR = G6; 14'd2146 : toneR = G6; 14'd2147 : toneR = G6;
14'd2148 : toneR = G6; 14'd2149 : toneR = G6; 14'd2150 : toneR = G6; 14'd2151 : toneR = G6;
14'd2152 : toneR = G6; 14'd2153 : toneR = G6; 14'd2154 : toneR = G6; 14'd2155 : toneR = G6;
14'd2156 : toneR = G6; 14'd2157 : toneR = G6; 14'd2158 : toneR = G6; 14'd2159 : toneR = 1;
14'd2160 : toneR = G5; 14'd2161 : toneR = G5; 14'd2162 : toneR = G5; 14'd2163 : toneR = 1;
14'd2164 : toneR = Aflat5; 14'd2165 : toneR = Aflat5; 14'd2166 : toneR = Aflat5; 14'd2167 : toneR = 1;
14'd2168 : toneR = Bflat5; 14'd2169 : toneR = Bflat5; 14'd2170 : toneR = Bflat5; 14'd2171 : toneR = 1;
14'd2172 : toneR = Eflat6; 14'd2173 : toneR = Eflat6; 14'd2174 : toneR = Eflat6; 14'd2175 : toneR = 1;
/*measure 35 */
14'd2176 : toneR = Gflat6; 14'd2177 : toneR = Gflat6; 14'd2178 : toneR = Gflat6; 14'd2179 : toneR = Gflat6;
14'd2180 : toneR = Gflat6; 14'd2181 : toneR = Gflat6; 14'd2182 : toneR = Gflat6; 14'd2183 : toneR = 1;
14'd2184 : toneR = E6; 14'd2185 : toneR = E6; 14'd2186 : toneR = E6; 14'd2187 : toneR = 1;
14'd2188 : toneR = Eflat6; 14'd2189 : toneR = Eflat6; 14'd2190 : toneR = Eflat6; 14'd2191 : toneR = 1;
14'd2192 : toneR = E6; 14'd2193 : toneR = E6; 14'd2194 : toneR = E6; 14'd2195 : toneR = E6;
14'd2196 : toneR = E6; 14'd2197 : toneR = E6; 14'd2198 : toneR = E6; 14'd2199 : toneR = 1;
14'd2200 : toneR = Dflat6; 14'd2201 : toneR = Dflat6; 14'd2202 : toneR = Dflat6; 14'd2203 : toneR = Dflat6;
14'd2204 : toneR = Dflat6; 14'd2205 : toneR = Dflat6; 14'd2206 : toneR = Dflat6; 14'd2207 : toneR = 1;
14'd2208 : toneR = E6; 14'd2209 : toneR = E6; 14'd2210 : toneR = E6; 14'd2211 : toneR = E6;
14'd2212 : toneR = E6; 14'd2213 : toneR = E6; 14'd2214 : toneR = E6; 14'd2215 : toneR = 1;
14'd2216 : toneR = Eflat6; 14'd2217 : toneR = Eflat6; 14'd2218 : toneR = Eflat6; 14'd2219 : toneR = 1;
14'd2220 : toneR = D6; 14'd2221 : toneR = D6; 14'd2222 : toneR = D6; 14'd2223 : toneR = 1;
14'd2224 : toneR = Eflat6; 14'd2225 : toneR = Eflat6; 14'd2226 : toneR = Eflat6; 14'd2227 : toneR = Eflat6;
14'd2228 : toneR = Eflat6; 14'd2229 : toneR = Eflat6; 14'd2230 : toneR = Eflat6; 14'd2231 : toneR = 1;
14'd2232 : toneR = B5; 14'd2233 : toneR = B5; 14'd2234 : toneR = B5; 14'd2235 : toneR = B5;
14'd2236 : toneR = B5; 14'd2237 : toneR = B5; 14'd2238 : toneR = B5; 14'd2239 : toneR = 1;
/*measure 36 */
14'd2240 : toneR = Bflat5; 14'd2241 : toneR = Bflat5; 14'd2242 : toneR = Bflat5; 14'd2243 : toneR = Bflat5;
14'd2244 : toneR = Bflat5; 14'd2245 : toneR = Bflat5; 14'd2246 : toneR = Bflat5; 14'd2247 : toneR = 1;
14'd2248 : toneR = B5; 14'd2249 : toneR = B5; 14'd2250 : toneR = B5; 14'd2251 : toneR = B5;
14'd2252 : toneR = B5; 14'd2253 : toneR = B5; 14'd2254 : toneR = B5; 14'd2255 : toneR = 1;
14'd2256 : toneR = Bflat5; 14'd2257 : toneR = Bflat5; 14'd2258 : toneR = Bflat5; 14'd2259 : toneR = Bflat5;
14'd2260 : toneR = Bflat5; 14'd2261 : toneR = Bflat5; 14'd2262 : toneR = Bflat5; 14'd2263 : toneR = 1;
14'd2264 : toneR = G5; 14'd2265 : toneR = G5; 14'd2266 : toneR = G5; 14'd2267 : toneR = G5;
14'd2268 : toneR = G5; 14'd2269 : toneR = G5; 14'd2270 : toneR = G5; 14'd2271 : toneR = 1;
14'd2272 : toneR = Aflat5; 14'd2273 : toneR = Aflat5; 14'd2274 : toneR = Aflat5; 14'd2275 : toneR = Aflat5;
14'd2276 : toneR = Aflat5; 14'd2277 : toneR = Aflat5; 14'd2278 : toneR = Aflat5; 14'd2279 : toneR = Aflat5;
14'd2280 : toneR = Aflat5; 14'd2281 : toneR = Aflat5; 14'd2282 : toneR = Aflat5; 14'd2283 : toneR = Aflat5;
14'd2284 : toneR = Aflat5; 14'd2285 : toneR = Aflat5; 14'd2286 : toneR = Aflat5; 14'd2287 : toneR = 1;
14'd2288 : toneR = Eflat4; 14'd2289 : toneR = Eflat4; 14'd2290 : toneR = Eflat4; 14'd2291 : toneR = Eflat4;
14'd2292 : toneR = Eflat4; 14'd2293 : toneR = Eflat4; 14'd2294 : toneR = Eflat4; 14'd2295 : toneR = Eflat4;
14'd2296 : toneR = Eflat4; 14'd2297 : toneR = Eflat4; 14'd2298 : toneR = Eflat4; 14'd2299 : toneR = Eflat4;
14'd2300 : toneR = Eflat4; 14'd2301 : toneR = Eflat4; 14'd2302 : toneR = Eflat4; 14'd2303 : toneR = 1;
/*measure 37 */
14'd2304 : toneR = Gflat5; 14'd2305 : toneR = Gflat5; 14'd2306 : toneR = Gflat5; 14'd2307 : toneR = Gflat5;
14'd2308 : toneR = Gflat5; 14'd2309 : toneR = Gflat5; 14'd2310 : toneR = Gflat5; 14'd2311 : toneR = 1;
14'd2312 : toneR = E5; 14'd2313 : toneR = E5; 14'd2314 : toneR = E5; 14'd2315 : toneR = 1;
14'd2316 : toneR = Eflat5; 14'd2317 : toneR = Eflat5; 14'd2318 : toneR = Eflat5; 14'd2319 : toneR = 1;
14'd2320 : toneR = E5; 14'd2321 : toneR = E5; 14'd2322 : toneR = E5; 14'd2323 : toneR = E5;
14'd2324 : toneR = E5; 14'd2325 : toneR = E5; 14'd2326 : toneR = E5; 14'd2327 : toneR = 1;
14'd2328 : toneR = Dflat5; 14'd2329 : toneR = Dflat5; 14'd2330 : toneR = Dflat5; 14'd2331 : toneR = Dflat5;
14'd2332 : toneR = Dflat5; 14'd2333 : toneR = Dflat5; 14'd2334 : toneR = Dflat5; 14'd2335 : toneR = 1;
14'd2336 : toneR = E5; 14'd2337 : toneR = E5; 14'd2338 : toneR = E5; 14'd2339 : toneR = E5;
14'd2340 : toneR = E5; 14'd2341 : toneR = E5; 14'd2342 : toneR = E5; 14'd2343 : toneR = 1;
14'd2344 : toneR = Eflat5; 14'd2345 : toneR = Eflat5; 14'd2346 : toneR = Eflat5; 14'd2347 : toneR = 1;
14'd2348 : toneR = D5; 14'd2349 : toneR = D5; 14'd2350 : toneR = D5; 14'd2351 : toneR = 1;
14'd2352 : toneR = Eflat5; 14'd2353 : toneR = Eflat5; 14'd2354 : toneR = Eflat5; 14'd2355 : toneR = Eflat5;
14'd2356 : toneR = Eflat5; 14'd2357 : toneR = Eflat5; 14'd2358 : toneR = Eflat5; 14'd2359 : toneR = 1;
14'd2360 : toneR = B4; 14'd2361 : toneR = B4; 14'd2362 : toneR = B4; 14'd2363 : toneR = B4;
14'd2364 : toneR = B4; 14'd2365 : toneR = B4; 14'd2366 : toneR = B4; 14'd2367 : toneR = 1;
/*measure 38 */
14'd2368 : toneR = Bflat4; 14'd2369 : toneR = Bflat4; 14'd2370 : toneR = Bflat4; 14'd2371 : toneR = Bflat4;
14'd2372 : toneR = Bflat4; 14'd2373 : toneR = Bflat4; 14'd2374 : toneR = Bflat4; 14'd2375 : toneR = 1;
14'd2376 : toneR = B4; 14'd2377 : toneR = B4; 14'd2378 : toneR = B4; 14'd2379 : toneR = B4;
14'd2380 : toneR = B4; 14'd2381 : toneR = B4; 14'd2382 : toneR = B4; 14'd2383 : toneR = 1;
14'd2384 : toneR = D5; 14'd2385 : toneR = D5; 14'd2386 : toneR = D5; 14'd2387 : toneR = D5;
14'd2388 : toneR = D5; 14'd2389 : toneR = D5; 14'd2390 : toneR = D5; 14'd2391 : toneR = 1;
14'd2392 : toneR = Aflat5; 14'd2393 : toneR = Aflat5; 14'd2394 : toneR = Aflat5; 14'd2395 : toneR = Aflat5;
14'd2396 : toneR = Aflat5; 14'd2397 : toneR = Aflat5; 14'd2398 : toneR = Aflat5; 14'd2399 : toneR = 1;
14'd2400 : toneR = D5; 14'd2401 : toneR = D5; 14'd2402 : toneR = D5; 14'd2403 : toneR = D5;
14'd2404 : toneR = D5; 14'd2405 : toneR = D5; 14'd2406 : toneR = D5; 14'd2407 : toneR = D5;
14'd2408 : toneR = D5; 14'd2409 : toneR = D5; 14'd2410 : toneR = D5; 14'd2411 : toneR = D5;
14'd2412 : toneR = D5; 14'd2413 : toneR = D5; 14'd2414 : toneR = D5; 14'd2415 : toneR = 1;
14'd2416 : toneR = G5; 14'd2417 : toneR = G5; 14'd2418 : toneR = G5; 14'd2419 : toneR = 1;
14'd2420 : toneR = Bflat5; 14'd2421 : toneR = Bflat5; 14'd2422 : toneR = Bflat5; 14'd2423 : toneR = 1;
14'd2424 : toneR = Dflat6; 14'd2425 : toneR = Dflat6; 14'd2426 : toneR = Dflat6; 14'd2427 : toneR = 1;
14'd2428 : toneR = Eflat6; 14'd2429 : toneR = Eflat6; 14'd2430 : toneR = Eflat6; 14'd2431 : toneR = 1;
/*measure 39 */
14'd2432 : toneR = Aflat6; 14'd2433 : toneR = Aflat6; 14'd2434 : toneR = Aflat6; 14'd2435 : toneR = Aflat6;
14'd2436 : toneR = Aflat6; 14'd2437 : toneR = Aflat6; 14'd2438 : toneR = Aflat6; 14'd2439 : toneR = 1;
14'd2440 : toneR = E6; 14'd2441 : toneR = E6; 14'd2442 : toneR = E6; 14'd2443 : toneR = 1;
14'd2444 : toneR = Eflat6; 14'd2445 : toneR = Eflat6; 14'd2446 : toneR = Eflat6; 14'd2447 : toneR = 1;
14'd2448 : toneR = E6; 14'd2449 : toneR = E6; 14'd2450 : toneR = E6; 14'd2451 : toneR = E6;
14'd2452 : toneR = E6; 14'd2453 : toneR = E6; 14'd2454 : toneR = E6; 14'd2455 : toneR = 1;
14'd2456 : toneR = Dflat6; 14'd2457 : toneR = Dflat6; 14'd2458 : toneR = Dflat6; 14'd2459 : toneR = Dflat6;
14'd2460 : toneR = Dflat6; 14'd2461 : toneR = Dflat6; 14'd2462 : toneR = Dflat6; 14'd2463 : toneR = 1;
14'd2464 : toneR = E6; 14'd2465 : toneR = E6; 14'd2466 : toneR = E6; 14'd2467 : toneR = E6;
14'd2468 : toneR = E6; 14'd2469 : toneR = E6; 14'd2470 : toneR = E6; 14'd2471 : toneR = 1;
14'd2472 : toneR = Eflat6; 14'd2473 : toneR = Eflat6; 14'd2474 : toneR = Eflat6; 14'd2475 : toneR = 1;
14'd2476 : toneR = D6; 14'd2477 : toneR = D6; 14'd2478 : toneR = D6; 14'd2479 : toneR = 1;
14'd2480 : toneR = Eflat6; 14'd2481 : toneR = Eflat6; 14'd2482 : toneR = Eflat6; 14'd2483 : toneR = Eflat6;
14'd2484 : toneR = Eflat6; 14'd2485 : toneR = Eflat6; 14'd2486 : toneR = Eflat6; 14'd2487 : toneR = 1;
14'd2488 : toneR = B5; 14'd2489 : toneR = B5; 14'd2490 : toneR = B5; 14'd2491 : toneR = B5;
14'd2492 : toneR = B5; 14'd2493 : toneR = B5; 14'd2494 : toneR = B5; 14'd2495 : toneR = 1;
/*measure 40 */
14'd2496 : toneR = Bflat5; 14'd2497 : toneR = Bflat5; 14'd2498 : toneR = Bflat5; 14'd2499 : toneR = Bflat5;
14'd2500 : toneR = Bflat5; 14'd2501 : toneR = Bflat5; 14'd2502 : toneR = Bflat5; 14'd2503 : toneR = 1;
14'd2504 : toneR = B5; 14'd2505 : toneR = B5; 14'd2506 : toneR = B5; 14'd2507 : toneR = B5;
14'd2508 : toneR = B5; 14'd2509 : toneR = B5; 14'd2510 : toneR = B5; 14'd2511 : toneR = 1;
14'd2512 : toneR = Dflat6; 14'd2513 : toneR = Dflat6; 14'd2514 : toneR = Dflat6; 14'd2515 : toneR = Dflat6;
14'd2516 : toneR = Dflat6; 14'd2517 : toneR = Dflat6; 14'd2518 : toneR = Dflat6; 14'd2519 : toneR = 1;
14'd2520 : toneR = E6; 14'd2521 : toneR = E6; 14'd2522 : toneR = E6; 14'd2523 : toneR = E6;
14'd2524 : toneR = E6; 14'd2525 : toneR = E6; 14'd2526 : toneR = E6; 14'd2527 : toneR = 1;
14'd2528 : toneR = Eflat6; 14'd2529 : toneR = Eflat6; 14'd2530 : toneR = Eflat6; 14'd2531 : toneR = Eflat6;
14'd2532 : toneR = Eflat6; 14'd2533 : toneR = Eflat6; 14'd2534 : toneR = Eflat6; 14'd2535 : toneR = Eflat6;
14'd2536 : toneR = Eflat6; 14'd2537 : toneR = Eflat6; 14'd2538 : toneR = Eflat6; 14'd2539 : toneR = Eflat6;
14'd2540 : toneR = Eflat6; 14'd2541 : toneR = Eflat6; 14'd2542 : toneR = Eflat6; 14'd2543 : toneR = 1;
14'd2544 : toneR = Eflat4; 14'd2545 : toneR = Eflat4; 14'd2546 : toneR = Eflat4; 14'd2547 : toneR = 1;
14'd2548 : toneR = Aflat4; 14'd2549 : toneR = Aflat4; 14'd2550 : toneR = Aflat4; 14'd2551 : toneR = 1;
14'd2552 : toneR = Bflat4; 14'd2553 : toneR = Bflat4; 14'd2554 : toneR = Bflat4; 14'd2555 : toneR = 1;
14'd2556 : toneR = B4; 14'd2557 : toneR = B4; 14'd2558 : toneR = B4; 14'd2559 : toneR = 1;
/*measure 41 */
14'd2560 : toneR = Gflat5; 14'd2561 : toneR = Gflat5; 14'd2562 : toneR = Gflat5; 14'd2563 : toneR = Gflat5;
14'd2564 : toneR = Gflat5; 14'd2565 : toneR = Gflat5; 14'd2566 : toneR = Gflat5; 14'd2567 : toneR = 1;
14'd2568 : toneR = E5; 14'd2569 : toneR = E5; 14'd2570 : toneR = E5; 14'd2571 : toneR = 1;
14'd2572 : toneR = Eflat5; 14'd2573 : toneR = Eflat5; 14'd2574 : toneR = Eflat5; 14'd2575 : toneR = 1;
14'd2576 : toneR = E5; 14'd2577 : toneR = E5; 14'd2578 : toneR = E5; 14'd2579 : toneR = E5;
14'd2580 : toneR = E5; 14'd2581 : toneR = E5; 14'd2582 : toneR = E5; 14'd2583 : toneR = 1;
14'd2584 : toneR = Dflat5; 14'd2585 : toneR = Dflat5; 14'd2586 : toneR = Dflat5; 14'd2587 : toneR = Dflat5;
14'd2588 : toneR = Dflat5; 14'd2589 : toneR = Dflat5; 14'd2590 : toneR = Dflat5; 14'd2591 : toneR = 1;
14'd2592 : toneR = E5; 14'd2593 : toneR = E5; 14'd2594 : toneR = E5; 14'd2595 : toneR = E5;
14'd2596 : toneR = E5; 14'd2597 : toneR = E5; 14'd2598 : toneR = E5; 14'd2599 : toneR = 1;
14'd2600 : toneR = Eflat5; 14'd2601 : toneR = Eflat5; 14'd2602 : toneR = Eflat5; 14'd2603 : toneR = 1;
14'd2604 : toneR = D5; 14'd2605 : toneR = D5; 14'd2606 : toneR = D5; 14'd2607 : toneR = 1;
14'd2608 : toneR = Eflat5; 14'd2609 : toneR = Eflat5; 14'd2610 : toneR = Eflat5; 14'd2611 : toneR = Eflat5;
14'd2612 : toneR = Eflat5; 14'd2613 : toneR = Eflat5; 14'd2614 : toneR = Eflat5; 14'd2615 : toneR = 1;
14'd2616 : toneR = B4; 14'd2617 : toneR = B4; 14'd2618 : toneR = B4; 14'd2619 : toneR = B4;
14'd2620 : toneR = B4; 14'd2621 : toneR = B4; 14'd2622 : toneR = B4; 14'd2623 : toneR = 1;
/*measure 42 */
14'd2624 : toneR = Bflat4; 14'd2625 : toneR = Bflat4; 14'd2626 : toneR = Bflat4; 14'd2627 : toneR = Bflat4;
14'd2628 : toneR = Bflat4; 14'd2629 : toneR = Bflat4; 14'd2630 : toneR = Bflat4; 14'd2631 : toneR = 1;
14'd2632 : toneR = Bflat4; 14'd2633 : toneR = Bflat4; 14'd2634 : toneR = Bflat4; 14'd2635 : toneR = 1;
14'd2636 : toneR = B4; 14'd2637 : toneR = B4; 14'd2638 : toneR = B4; 14'd2639 : toneR = 1;
14'd2640 : toneR = Bflat4; 14'd2641 : toneR = Bflat4; 14'd2642 : toneR = Bflat4; 14'd2643 : toneR = Bflat4;
14'd2644 : toneR = Bflat4; 14'd2645 : toneR = Bflat4; 14'd2646 : toneR = Bflat4; 14'd2647 : toneR = 1;
14'd2648 : toneR = D5; 14'd2649 : toneR = D5; 14'd2650 : toneR = D5; 14'd2651 : toneR = D5;
14'd2652 : toneR = D5; 14'd2653 : toneR = D5; 14'd2654 : toneR = D5; 14'd2655 : toneR = 1;
14'd2656 : toneR = Aflat5; 14'd2657 : toneR = Aflat5; 14'd2658 : toneR = Aflat5; 14'd2659 : toneR = Aflat5;
14'd2660 : toneR = Aflat5; 14'd2661 : toneR = Aflat5; 14'd2662 : toneR = Aflat5; 14'd2663 : toneR = 1;
14'd2664 : toneR = G5; 14'd2665 : toneR = G5; 14'd2666 : toneR = G5; 14'd2667 : toneR = 1;
14'd2668 : toneR = Aflat5; 14'd2669 : toneR = Aflat5; 14'd2670 : toneR = Aflat5; 14'd2671 : toneR = 1;
14'd2672 : toneR = G5; 14'd2673 : toneR = G5; 14'd2674 : toneR = G5; 14'd2675 : toneR = G5;
14'd2676 : toneR = G5; 14'd2677 : toneR = G5; 14'd2678 : toneR = G5; 14'd2679 : toneR = 1;
14'd2680 : toneR = B5; 14'd2681 : toneR = B5; 14'd2682 : toneR = B5; 14'd2683 : toneR = B5;
14'd2684 : toneR = B5; 14'd2685 : toneR = B5; 14'd2686 : toneR = B5; 14'd2687 : toneR = 1;
/*measure 43 */
14'd2688 : toneR = Bflat5; 14'd2689 : toneR = Bflat5; 14'd2690 : toneR = Bflat5; 14'd2691 : toneR = Bflat5;
14'd2692 : toneR = Bflat5; 14'd2693 : toneR = Bflat5; 14'd2694 : toneR = Bflat5; 14'd2695 : toneR = 1;
14'd2696 : toneR = Eflat4; 14'd2697 : toneR = Eflat4; 14'd2698 : toneR = Eflat4; 14'd2699 : toneR = 1;
14'd2700 : toneR = G4; 14'd2701 : toneR = G4; 14'd2702 : toneR = G4; 14'd2703 : toneR = 1;
14'd2704 : toneR = Bflat4; 14'd2705 : toneR = Bflat4; 14'd2706 : toneR = Bflat4; 14'd2707 : toneR = 1;
14'd2708 : toneR = Eflat5; 14'd2709 : toneR = Eflat5; 14'd2710 : toneR = Eflat5; 14'd2711 : toneR = 1;
14'd2712 : toneR = F5; 14'd2713 : toneR = F5; 14'd2714 : toneR = F5; 14'd2715 : toneR = 1;
14'd2716 : toneR = Bflat5; 14'd2717 : toneR = Bflat5; 14'd2718 : toneR = Bflat5; 14'd2719 : toneR = 1;
14'd2720 : toneR = Eflat6; 14'd2721 : toneR = Eflat6; 14'd2722 : toneR = Eflat6; 14'd2723 : toneR = 1;
14'd2724 : toneR = Bflat5; 14'd2725 : toneR = Bflat5; 14'd2726 : toneR = Bflat5; 14'd2727 : toneR = 1;
14'd2728 : toneR = Aflat5; 14'd2729 : toneR = Aflat5; 14'd2730 : toneR = Aflat5; 14'd2731 : toneR = 1;
14'd2732 : toneR = Eflat5; 14'd2733 : toneR = Eflat5; 14'd2734 : toneR = Eflat5; 14'd2735 : toneR = 1;
14'd2736 : toneR = Bflat4; 14'd2737 : toneR = Bflat4; 14'd2738 : toneR = Bflat4; 14'd2739 : toneR = 1;
14'd2740 : toneR = Aflat4; 14'd2741 : toneR = Aflat4; 14'd2742 : toneR = Aflat4; 14'd2743 : toneR = 1;
14'd2744 : toneR = Eflat4; 14'd2745 : toneR = Eflat4; 14'd2746 : toneR = Eflat4; 14'd2747 : toneR = Eflat4;
14'd2748 : toneR = Eflat4; 14'd2749 : toneR = Eflat4; 14'd2750 : toneR = Eflat4; 14'd2751 : toneR = 1;
/*measure 44 */
14'd2752 : toneR = B4; 14'd2753 : toneR = B4; 14'd2754 : toneR = B4; 14'd2755 : toneR = B4;
14'd2756 : toneR = B4; 14'd2757 : toneR = B4; 14'd2758 : toneR = B4; 14'd2759 : toneR = 1;
14'd2760 : toneR = Eflat4; 14'd2761 : toneR = Eflat4; 14'd2762 : toneR = Eflat4; 14'd2763 : toneR = 1;
14'd2764 : toneR = Aflat4; 14'd2765 : toneR = Aflat4; 14'd2766 : toneR = Aflat4; 14'd2767 : toneR = 1;
14'd2768 : toneR = B4; 14'd2769 : toneR = B4; 14'd2770 : toneR = B4; 14'd2771 : toneR = 1;
14'd2772 : toneR = Eflat5; 14'd2773 : toneR = Eflat5; 14'd2774 : toneR = Eflat5; 14'd2775 : toneR = 1;
14'd2776 : toneR = Aflat5; 14'd2777 : toneR = Aflat5; 14'd2778 : toneR = Aflat5; 14'd2779 : toneR = 1;
14'd2780 : toneR = B5; 14'd2781 : toneR = B5; 14'd2782 : toneR = B5; 14'd2783 : toneR = 1;
14'd2784 : toneR = Eflat6; 14'd2785 : toneR = Eflat6; 14'd2786 : toneR = Eflat6; 14'd2787 : toneR = 1;
14'd2788 : toneR = Bflat5; 14'd2789 : toneR = Bflat5; 14'd2790 : toneR = Bflat5; 14'd2791 : toneR = 1;
14'd2792 : toneR = F5; 14'd2793 : toneR = F5; 14'd2794 : toneR = F5; 14'd2795 : toneR = 1;
14'd2796 : toneR = Eflat5; 14'd2797 : toneR = Eflat5; 14'd2798 : toneR = Eflat5; 14'd2799 : toneR = 1;
14'd2800 : toneR = Bflat4; 14'd2801 : toneR = Bflat4; 14'd2802 : toneR = Bflat4; 14'd2803 : toneR = 1;
14'd2804 : toneR = F4; 14'd2805 : toneR = F4; 14'd2806 : toneR = F4; 14'd2807 : toneR = 1;
14'd2808 : toneR = Eflat4; 14'd2809 : toneR = Eflat4; 14'd2810 : toneR = Eflat4; 14'd2811 : toneR = Eflat4;
14'd2812 : toneR = Eflat4; 14'd2813 : toneR = Eflat4; 14'd2814 : toneR = Eflat4; 14'd2815 : toneR = 1;
/*measure 45 */
14'd2816 : toneR = Bflat4; 14'd2817 : toneR = Bflat4; 14'd2818 : toneR = Bflat4; 14'd2819 : toneR = Bflat4;
14'd2820 : toneR = Bflat4; 14'd2821 : toneR = Bflat4; 14'd2822 : toneR = Bflat4; 14'd2823 : toneR = 1;
14'd2824 : toneR = Eflat4; 14'd2825 : toneR = Eflat4; 14'd2826 : toneR = Eflat4; 14'd2827 : toneR = 1;
14'd2828 : toneR = F4; 14'd2829 : toneR = F4; 14'd2830 : toneR = F4; 14'd2831 : toneR = 1;
14'd2832 : toneR = Bflat4; 14'd2833 : toneR = Bflat4; 14'd2834 : toneR = Bflat4; 14'd2835 : toneR = 1;
14'd2836 : toneR = Eflat5; 14'd2837 : toneR = Eflat5; 14'd2838 : toneR = Eflat5; 14'd2839 : toneR = 1;
14'd2840 : toneR = G5; 14'd2841 : toneR = G5; 14'd2842 : toneR = G5; 14'd2843 : toneR = 1;
14'd2844 : toneR = Bflat5; 14'd2845 : toneR = Bflat5; 14'd2846 : toneR = Bflat5; 14'd2847 : toneR = 1;
14'd2848 : toneR = Eflat6; 14'd2849 : toneR = Eflat6; 14'd2850 : toneR = Eflat6; 14'd2851 : toneR = 1;
14'd2852 : toneR = Bflat5; 14'd2853 : toneR = Bflat5; 14'd2854 : toneR = Bflat5; 14'd2855 : toneR = 1;
14'd2856 : toneR = Aflat5; 14'd2857 : toneR = Aflat5; 14'd2858 : toneR = Aflat5; 14'd2859 : toneR = 1;
14'd2860 : toneR = Eflat5; 14'd2861 : toneR = Eflat5; 14'd2862 : toneR = Eflat5; 14'd2863 : toneR = 1;
14'd2864 : toneR = Bflat4; 14'd2865 : toneR = Bflat4; 14'd2866 : toneR = Bflat4; 14'd2867 : toneR = 1;
14'd2868 : toneR = Aflat4; 14'd2869 : toneR = Aflat4; 14'd2870 : toneR = Aflat4; 14'd2871 : toneR = 1;
14'd2872 : toneR = Eflat4; 14'd2873 : toneR = Eflat4; 14'd2874 : toneR = Eflat4; 14'd2875 : toneR = Eflat4;
14'd2876 : toneR = Eflat4; 14'd2877 : toneR = Eflat4; 14'd2878 : toneR = Eflat4; 14'd2879 : toneR = 1;
/*measure 46 */
14'd2880 : toneR = B4; 14'd2881 : toneR = B4; 14'd2882 : toneR = B4; 14'd2883 : toneR = B4;
14'd2884 : toneR = B4; 14'd2885 : toneR = B4; 14'd2886 : toneR = B4; 14'd2887 : toneR = 1;
14'd2888 : toneR = Eflat4; 14'd2889 : toneR = Eflat4; 14'd2890 : toneR = Eflat4; 14'd2891 : toneR = 1;
14'd2892 : toneR = Aflat4; 14'd2893 : toneR = Aflat4; 14'd2894 : toneR = Aflat4; 14'd2895 : toneR = 1;
14'd2896 : toneR = B4; 14'd2897 : toneR = B4; 14'd2898 : toneR = B4; 14'd2899 : toneR = 1;
14'd2900 : toneR = Eflat5; 14'd2901 : toneR = Eflat5; 14'd2902 : toneR = Eflat5; 14'd2903 : toneR = 1;
14'd2904 : toneR = Aflat5; 14'd2905 : toneR = Aflat5; 14'd2906 : toneR = Aflat5; 14'd2907 : toneR = 1;
14'd2908 : toneR = B5; 14'd2909 : toneR = B5; 14'd2910 : toneR = B5; 14'd2911 : toneR = 1;
14'd2912 : toneR = Dflat6; 14'd2913 : toneR = Dflat6; 14'd2914 : toneR = Dflat6; 14'd2915 : toneR = 1;
14'd2916 : toneR = Bflat5; 14'd2917 : toneR = Bflat5; 14'd2918 : toneR = Bflat5; 14'd2919 : toneR = 1;
14'd2920 : toneR = G5; 14'd2921 : toneR = G5; 14'd2922 : toneR = G5; 14'd2923 : toneR = 1;
14'd2924 : toneR = Eflat5; 14'd2925 : toneR = Eflat5; 14'd2926 : toneR = Eflat5; 14'd2927 : toneR = 1;
14'd2928 : toneR = Dflat5; 14'd2929 : toneR = Dflat5; 14'd2930 : toneR = Dflat5; 14'd2931 : toneR = 1;
14'd2932 : toneR = Bflat4; 14'd2933 : toneR = Bflat4; 14'd2934 : toneR = Bflat4; 14'd2935 : toneR = 1;
14'd2936 : toneR = G4; 14'd2937 : toneR = G4; 14'd2938 : toneR = G4; 14'd2939 : toneR = G4;
14'd2940 : toneR = G4; 14'd2941 : toneR = G4; 14'd2942 : toneR = G4; 14'd2943 : toneR = 1;
/*measure 47 */
14'd2944 : toneR = Bflat5; 14'd2945 : toneR = Bflat5; 14'd2946 : toneR = Bflat5; 14'd2947 : toneR = Bflat5;
14'd2948 : toneR = Bflat5; 14'd2949 : toneR = Bflat5; 14'd2950 : toneR = Bflat5; 14'd2951 : toneR = Bflat5;
14'd2952 : toneR = Bflat5; 14'd2953 : toneR = Bflat5; 14'd2954 : toneR = Bflat5; 14'd2955 : toneR = Bflat5;
14'd2956 : toneR = Bflat5; 14'd2957 : toneR = Bflat5; 14'd2958 : toneR = Bflat5; 14'd2959 : toneR = Bflat5;
14'd2960 : toneR = Bflat5; 14'd2961 : toneR = Bflat5; 14'd2962 : toneR = Bflat5; 14'd2963 : toneR = Bflat5;
14'd2964 : toneR = Bflat5; 14'd2965 : toneR = Bflat5; 14'd2966 : toneR = Bflat5; 14'd2967 : toneR = 1;
14'd2968 : toneR = Bflat5; 14'd2969 : toneR = Bflat5; 14'd2970 : toneR = Bflat5; 14'd2971 : toneR = 1;
14'd2972 : toneR = B5; 14'd2973 : toneR = B5; 14'd2974 : toneR = B5; 14'd2975 : toneR = 1;
14'd2976 : toneR = Dflat6; 14'd2977 : toneR = Dflat6; 14'd2978 : toneR = Dflat6; 14'd2979 : toneR = Dflat6;
14'd2980 : toneR = Dflat6; 14'd2981 : toneR = Dflat6; 14'd2982 : toneR = Dflat6; 14'd2983 : toneR = 1;
14'd2984 : toneR = B5; 14'd2985 : toneR = B5; 14'd2986 : toneR = B5; 14'd2987 : toneR = B5;
14'd2988 : toneR = B5; 14'd2989 : toneR = B5; 14'd2990 : toneR = B5; 14'd2991 : toneR = 1;
14'd2992 : toneR = Aflat5; 14'd2993 : toneR = Aflat5; 14'd2994 : toneR = Aflat5; 14'd2995 : toneR = Aflat5;
14'd2996 : toneR = Aflat5; 14'd2997 : toneR = Aflat5; 14'd2998 : toneR = Aflat5; 14'd2999 : toneR = 1;
14'd3000 : toneR = E5; 14'd3001 : toneR = E5; 14'd3002 : toneR = E5; 14'd3003 : toneR = E5;
14'd3004 : toneR = E5; 14'd3005 : toneR = E5; 14'd3006 : toneR = E5; 14'd3007 : toneR = 1;
/*measure 48 */
14'd3008 : toneR = E5; 14'd3009 : toneR = E5; 14'd3010 : toneR = E5; 14'd3011 : toneR = E5;
14'd3012 : toneR = E5; 14'd3013 : toneR = E5; 14'd3014 : toneR = E5; 14'd3015 : toneR = 1;
14'd3016 : toneR = Gflat5; 14'd3017 : toneR = Gflat5; 14'd3018 : toneR = Gflat5; 14'd3019 : toneR = 1;
14'd3020 : toneR = E5; 14'd3021 : toneR = E5; 14'd3022 : toneR = E5; 14'd3023 : toneR = 1;
14'd3024 : toneR = Eflat5; 14'd3025 : toneR = Eflat5; 14'd3026 : toneR = Eflat5; 14'd3027 : toneR = Eflat5;
14'd3028 : toneR = Eflat5; 14'd3029 : toneR = Eflat5; 14'd3030 : toneR = Eflat5; 14'd3031 : toneR = Eflat5;
14'd3032 : toneR = Eflat5; 14'd3033 : toneR = Eflat5; 14'd3034 : toneR = Eflat5; 14'd3035 : toneR = Eflat5;
14'd3036 : toneR = Eflat5; 14'd3037 : toneR = Eflat5; 14'd3038 : toneR = Eflat5; 14'd3039 : toneR = Eflat5;
14'd3040 : toneR = Eflat5; 14'd3041 : toneR = Eflat5; 14'd3042 : toneR = Eflat5; 14'd3043 : toneR = Eflat5;
14'd3044 : toneR = Eflat5; 14'd3045 : toneR = Eflat5; 14'd3046 : toneR = Eflat5; 14'd3047 : toneR = Eflat5;
14'd3048 : toneR = Eflat5; 14'd3049 : toneR = Eflat5; 14'd3050 : toneR = Eflat5; 14'd3051 : toneR = Eflat5;
14'd3052 : toneR = Eflat5; 14'd3053 : toneR = Eflat5; 14'd3054 : toneR = Eflat5; 14'd3055 : toneR = 1;
14'd3056 : toneR = G5; 14'd3057 : toneR = G5; 14'd3058 : toneR = G5; 14'd3059 : toneR = G5;
14'd3060 : toneR = G5; 14'd3061 : toneR = G5; 14'd3062 : toneR = G5; 14'd3063 : toneR = 1;
14'd3064 : toneR = Aflat5; 14'd3065 : toneR = Aflat5; 14'd3066 : toneR = Aflat5; 14'd3067 : toneR = Aflat5;
14'd3068 : toneR = Aflat5; 14'd3069 : toneR = Aflat5; 14'd3070 : toneR = Aflat5; 14'd3071 : toneR = 1;
/*measure 49 */
14'd3072 : toneR = A5; 14'd3073 : toneR = A5; 14'd3074 : toneR = A5; 14'd3075 : toneR = A5;
14'd3076 : toneR = A5; 14'd3077 : toneR = A5; 14'd3078 : toneR = A5; 14'd3079 : toneR = A5;
14'd3080 : toneR = A5; 14'd3081 : toneR = A5; 14'd3082 : toneR = A5; 14'd3083 : toneR = A5;
14'd3084 : toneR = A5; 14'd3085 : toneR = A5; 14'd3086 : toneR = A5; 14'd3087 : toneR = A5;
14'd3088 : toneR = A5; 14'd3089 : toneR = A5; 14'd3090 : toneR = A5; 14'd3091 : toneR = A5;
14'd3092 : toneR = A5; 14'd3093 : toneR = A5; 14'd3094 : toneR = A5; 14'd3095 : toneR = 1;
14'd3096 : toneR = Gsharp5; 14'd3097 : toneR = Gsharp5; 14'd3098 : toneR = Gsharp5; 14'd3099 : toneR = 1;
14'd3100 : toneR = A5; 14'd3101 : toneR = A5; 14'd3102 : toneR = A5; 14'd3103 : toneR = 1;
14'd3104 : toneR = B5; 14'd3105 : toneR = B5; 14'd3106 : toneR = B5; 14'd3107 : toneR = B5;
14'd3108 : toneR = B5; 14'd3109 : toneR = B5; 14'd3110 : toneR = B5; 14'd3111 : toneR = 1;
14'd3112 : toneR = A5; 14'd3113 : toneR = A5; 14'd3114 : toneR = A5; 14'd3115 : toneR = A5;
14'd3116 : toneR = A5; 14'd3117 : toneR = A5; 14'd3118 : toneR = A5; 14'd3119 : toneR = 1;
14'd3120 : toneR = Fsharp5; 14'd3121 : toneR = Fsharp5; 14'd3122 : toneR = Fsharp5; 14'd3123 : toneR = Fsharp5;
14'd3124 : toneR = Fsharp5; 14'd3125 : toneR = Fsharp5; 14'd3126 : toneR = Fsharp5; 14'd3127 : toneR = 1;
14'd3128 : toneR = D5; 14'd3129 : toneR = D5; 14'd3130 : toneR = D5; 14'd3131 : toneR = D5;
14'd3132 : toneR = D5; 14'd3133 : toneR = D5; 14'd3134 : toneR = D5; 14'd3135 : toneR = 1;
/*measure 50 */
14'd3136 : toneR = D5; 14'd3137 : toneR = D5; 14'd3138 : toneR = D5; 14'd3139 : toneR = D5;
14'd3140 : toneR = D5; 14'd3141 : toneR = D5; 14'd3142 : toneR = D5; 14'd3143 : toneR = 1;
14'd3144 : toneR = E5; 14'd3145 : toneR = E5; 14'd3146 : toneR = E5; 14'd3147 : toneR = 1;
14'd3148 : toneR = D5; 14'd3149 : toneR = D5; 14'd3150 : toneR = D5; 14'd3151 : toneR = 1;
14'd3152 : toneR = Csharp5; 14'd3153 : toneR = Csharp5; 14'd3154 : toneR = Csharp5; 14'd3155 : toneR = Csharp5;
14'd3156 : toneR = Csharp5; 14'd3157 : toneR = Csharp5; 14'd3158 : toneR = Csharp5; 14'd3159 : toneR = Csharp5;
14'd3160 : toneR = Csharp5; 14'd3161 : toneR = Csharp5; 14'd3162 : toneR = Csharp5; 14'd3163 : toneR = Csharp5;
14'd3164 : toneR = Csharp5; 14'd3165 : toneR = Csharp5; 14'd3166 : toneR = Csharp5; 14'd3167 : toneR = Csharp5;
14'd3168 : toneR = Csharp5; 14'd3169 : toneR = Csharp5; 14'd3170 : toneR = Csharp5; 14'd3171 : toneR = Csharp5;
14'd3172 : toneR = Csharp5; 14'd3173 : toneR = Csharp5; 14'd3174 : toneR = Csharp5; 14'd3175 : toneR = Csharp5;
14'd3176 : toneR = Csharp5; 14'd3177 : toneR = Csharp5; 14'd3178 : toneR = Csharp5; 14'd3179 : toneR = Csharp5;
14'd3180 : toneR = Csharp5; 14'd3181 : toneR = Csharp5; 14'd3182 : toneR = Csharp5; 14'd3183 : toneR = 1;
14'd3184 : toneR = Asharp4; 14'd3185 : toneR = Asharp4; 14'd3186 : toneR = Asharp4; 14'd3187 : toneR = Asharp4;
14'd3188 : toneR = Asharp4; 14'd3189 : toneR = Asharp4; 14'd3190 : toneR = Asharp4; 14'd3191 : toneR = 1;
14'd3192 : toneR = B4; 14'd3193 : toneR = B4; 14'd3194 : toneR = B4; 14'd3195 : toneR = B4;
14'd3196 : toneR = B4; 14'd3197 : toneR = B4; 14'd3198 : toneR = B4; 14'd3199 : toneR = 1;
/*measure 51 */
14'd3200 : toneR = C5; 14'd3201 : toneR = C5; 14'd3202 : toneR = C5; 14'd3203 : toneR = C5;
14'd3204 : toneR = C5; 14'd3205 : toneR = C5; 14'd3206 : toneR = C5; 14'd3207 : toneR = C5;
14'd3208 : toneR = C5; 14'd3209 : toneR = C5; 14'd3210 : toneR = C5; 14'd3211 : toneR = C5;
14'd3212 : toneR = C5; 14'd3213 : toneR = C5; 14'd3214 : toneR = C5; 14'd3215 : toneR = C5;
14'd3216 : toneR = C5; 14'd3217 : toneR = C5; 14'd3218 : toneR = C5; 14'd3219 : toneR = C5;
14'd3220 : toneR = C5; 14'd3221 : toneR = C5; 14'd3222 : toneR = C5; 14'd3223 : toneR = 1;
14'd3224 : toneR = C5; 14'd3225 : toneR = C5; 14'd3226 : toneR = C5; 14'd3227 : toneR = C5;
14'd3228 : toneR = C5; 14'd3229 : toneR = C5; 14'd3230 : toneR = C5; 14'd3231 : toneR = 1;
14'd3232 : toneR = Dsharp5; 14'd3233 : toneR = Dsharp5; 14'd3234 : toneR = Dsharp5; 14'd3235 : toneR = Dsharp5;
14'd3236 : toneR = Dsharp5; 14'd3237 : toneR = Dsharp5; 14'd3238 : toneR = Dsharp5; 14'd3239 : toneR = 1;
14'd3240 : toneR = E5; 14'd3241 : toneR = E5; 14'd3242 : toneR = E5; 14'd3243 : toneR = E5;
14'd3244 : toneR = E5; 14'd3245 : toneR = E5; 14'd3246 : toneR = E5; 14'd3247 : toneR = 1;
14'd3248 : toneR = Fsharp5; 14'd3249 : toneR = Fsharp5; 14'd3250 : toneR = Fsharp5; 14'd3251 : toneR = Fsharp5;
14'd3252 : toneR = Fsharp5; 14'd3253 : toneR = Fsharp5; 14'd3254 : toneR = Fsharp5; 14'd3255 : toneR = 1;
14'd3256 : toneR = A5; 14'd3257 : toneR = A5; 14'd3258 : toneR = A5; 14'd3259 : toneR = A5;
14'd3260 : toneR = A5; 14'd3261 : toneR = A5; 14'd3262 : toneR = A5; 14'd3263 : toneR = 1;
/*measure 52 */
14'd3264 : toneR = C6; 14'd3265 : toneR = C6; 14'd3266 : toneR = C6; 14'd3267 : toneR = C6;
14'd3268 : toneR = C6; 14'd3269 : toneR = C6; 14'd3270 : toneR = C6; 14'd3271 : toneR = 1;
14'd3272 : toneR = D6; 14'd3273 : toneR = D6; 14'd3274 : toneR = D6; 14'd3275 : toneR = 1;
14'd3276 : toneR = C6; 14'd3277 : toneR = C6; 14'd3278 : toneR = C6; 14'd3279 : toneR = 1;
14'd3280 : toneR = B5; 14'd3281 : toneR = B5; 14'd3282 : toneR = B5; 14'd3283 : toneR = B5;
14'd3284 : toneR = B5; 14'd3285 : toneR = B5; 14'd3286 : toneR = B5; 14'd3287 : toneR = B5;
14'd3288 : toneR = B5; 14'd3289 : toneR = B5; 14'd3290 : toneR = B5; 14'd3291 : toneR = B5;
14'd3292 : toneR = B5; 14'd3293 : toneR = B5; 14'd3294 : toneR = B5; 14'd3295 : toneR = B5;
14'd3296 : toneR = B5; 14'd3297 : toneR = B5; 14'd3298 : toneR = B5; 14'd3299 : toneR = B5;
14'd3300 : toneR = B5; 14'd3301 : toneR = B5; 14'd3302 : toneR = B5; 14'd3303 : toneR = B5;
14'd3304 : toneR = B5; 14'd3305 : toneR = B5; 14'd3306 : toneR = B5; 14'd3307 : toneR = B5;
14'd3308 : toneR = B5; 14'd3309 : toneR = B5; 14'd3310 : toneR = B5; 14'd3311 : toneR = 1;
14'd3312 : toneR = C5; 14'd3313 : toneR = C5; 14'd3314 : toneR = C5; 14'd3315 : toneR = C5;
14'd3316 : toneR = C5; 14'd3317 : toneR = C5; 14'd3318 : toneR = C5; 14'd3319 : toneR = 1;
14'd3320 : toneR = B4; 14'd3321 : toneR = B4; 14'd3322 : toneR = B4; 14'd3323 : toneR = B4;
14'd3324 : toneR = B4; 14'd3325 : toneR = B4; 14'd3326 : toneR = B4; 14'd3327 : toneR = 1;
/*measure 53 */
14'd3328 : toneR = Asharp4; 14'd3329 : toneR = Asharp4; 14'd3330 : toneR = Asharp4; 14'd3331 : toneR = Asharp4;
14'd3332 : toneR = Asharp4; 14'd3333 : toneR = Asharp4; 14'd3334 : toneR = Asharp4; 14'd3335 : toneR = Asharp4;
14'd3336 : toneR = Asharp4; 14'd3337 : toneR = Asharp4; 14'd3338 : toneR = Asharp4; 14'd3339 : toneR = Asharp4;
14'd3340 : toneR = Asharp4; 14'd3341 : toneR = Asharp4; 14'd3342 : toneR = Asharp4; 14'd3343 : toneR = Asharp4;
14'd3344 : toneR = Asharp4; 14'd3345 : toneR = Asharp4; 14'd3346 : toneR = Asharp4; 14'd3347 : toneR = Asharp4;
14'd3348 : toneR = Asharp4; 14'd3349 : toneR = Asharp4; 14'd3350 : toneR = Asharp4; 14'd3351 : toneR = 1;
14'd3352 : toneR = Bflat4; 14'd3353 : toneR = Bflat4; 14'd3354 : toneR = Bflat4; 14'd3355 : toneR = Bflat4;
14'd3356 : toneR = Bflat4; 14'd3357 : toneR = Bflat4; 14'd3358 : toneR = Bflat4; 14'd3359 : toneR = 1;
14'd3360 : toneR = Bflat5; 14'd3361 : toneR = Bflat5; 14'd3362 : toneR = Bflat5; 14'd3363 : toneR = Bflat5;
14'd3364 : toneR = Bflat5; 14'd3365 : toneR = Bflat5; 14'd3366 : toneR = Bflat5; 14'd3367 : toneR = 1;
14'd3368 : toneR = Gflat5; 14'd3369 : toneR = Gflat5; 14'd3370 : toneR = Gflat5; 14'd3371 : toneR = Gflat5;
14'd3372 : toneR = Gflat5; 14'd3373 : toneR = Gflat5; 14'd3374 : toneR = Gflat5; 14'd3375 : toneR = 1;
14'd3376 : toneR = F5; 14'd3377 : toneR = F5; 14'd3378 : toneR = F5; 14'd3379 : toneR = F5;
14'd3380 : toneR = F5; 14'd3381 : toneR = F5; 14'd3382 : toneR = F5; 14'd3383 : toneR = 1;
14'd3384 : toneR = Gflat5; 14'd3385 : toneR = Gflat5; 14'd3386 : toneR = Gflat5; 14'd3387 : toneR = Gflat5;
14'd3388 : toneR = Gflat5; 14'd3389 : toneR = Gflat5; 14'd3390 : toneR = Gflat5; 14'd3391 : toneR = 1;
/*measure 54 */
14'd3392 : toneR = Dflat6; 14'd3393 : toneR = Dflat6; 14'd3394 : toneR = Dflat6; 14'd3395 : toneR = Dflat6;
14'd3396 : toneR = Dflat6; 14'd3397 : toneR = Dflat6; 14'd3398 : toneR = Dflat6; 14'd3399 : toneR = 1;
14'd3400 : toneR = Eflat6; 14'd3401 : toneR = Eflat6; 14'd3402 : toneR = Eflat6; 14'd3403 : toneR = 1;
14'd3404 : toneR = Dflat6; 14'd3405 : toneR = Dflat6; 14'd3406 : toneR = Dflat6; 14'd3407 : toneR = 1;
14'd3408 : toneR = B5; 14'd3409 : toneR = B5; 14'd3410 : toneR = B5; 14'd3411 : toneR = B5;
14'd3412 : toneR = B5; 14'd3413 : toneR = B5; 14'd3414 : toneR = B5; 14'd3415 : toneR = B5;
14'd3416 : toneR = B5; 14'd3417 : toneR = B5; 14'd3418 : toneR = B5; 14'd3419 : toneR = B5;
14'd3420 : toneR = B5; 14'd3421 : toneR = B5; 14'd3422 : toneR = B5; 14'd3423 : toneR = B5;
14'd3424 : toneR = B5; 14'd3425 : toneR = B5; 14'd3426 : toneR = B5; 14'd3427 : toneR = B5;
14'd3428 : toneR = B5; 14'd3429 : toneR = B5; 14'd3430 : toneR = B5; 14'd3431 : toneR = B5;
14'd3432 : toneR = B5; 14'd3433 : toneR = B5; 14'd3434 : toneR = B5; 14'd3435 : toneR = B5;
14'd3436 : toneR = B5; 14'd3437 : toneR = B5; 14'd3438 : toneR = B5; 14'd3439 : toneR = 1;
14'd3440 : toneR = 1; 14'd3441 : toneR = 1; 14'd3442 : toneR = 1; 14'd3443 : toneR = 1;
14'd3444 : toneR = 1; 14'd3445 : toneR = 1; 14'd3446 : toneR = 1; 14'd3447 : toneR = 1;
14'd3448 : toneR = 1; 14'd3449 : toneR = 1; 14'd3450 : toneR = 1; 14'd3451 : toneR = 1;
14'd3452 : toneR = 1; 14'd3453 : toneR = 1; 14'd3454 : toneR = 1; 14'd3455 : toneR = 1;
/*measure 55 */
14'd3456 : toneR = Aflat4; 14'd3457 : toneR = Aflat4; 14'd3458 : toneR = Aflat4; 14'd3459 : toneR = 1;
14'd3460 : toneR = B4; 14'd3461 : toneR = B4; 14'd3462 : toneR = B4; 14'd3463 : toneR = 1;
14'd3464 : toneR = E5; 14'd3465 : toneR = E5; 14'd3466 : toneR = E5; 14'd3467 : toneR = 1;
14'd3468 : toneR = Aflat5; 14'd3469 : toneR = Aflat5; 14'd3470 : toneR = Aflat5; 14'd3471 : toneR = 1;
14'd3472 : toneR = E5; 14'd3473 : toneR = E5; 14'd3474 : toneR = E5; 14'd3475 : toneR = 1;
14'd3476 : toneR = Aflat5; 14'd3477 : toneR = Aflat5; 14'd3478 : toneR = Aflat5; 14'd3479 : toneR = 1;
14'd3480 : toneR = B5; 14'd3481 : toneR = B5; 14'd3482 : toneR = B5; 14'd3483 : toneR = 1;
14'd3484 : toneR = E6; 14'd3485 : toneR = E6; 14'd3486 : toneR = E6; 14'd3487 : toneR = 1;
14'd3488 : toneR = E6; 14'd3489 : toneR = E6; 14'd3490 : toneR = E6; 14'd3491 : toneR = 1;
14'd3492 : toneR = B6; 14'd3493 : toneR = B6; 14'd3494 : toneR = B6; 14'd3495 : toneR = 1;
14'd3496 : toneR = Gflat6; 14'd3497 : toneR = Gflat6; 14'd3498 : toneR = Gflat6; 14'd3499 : toneR = 1;
14'd3500 : toneR = E6; 14'd3501 : toneR = E6; 14'd3502 : toneR = E6; 14'd3503 : toneR = 1;
14'd3504 : toneR = B5; 14'd3505 : toneR = B5; 14'd3506 : toneR = B5; 14'd3507 : toneR = 1;
14'd3508 : toneR = Aflat5; 14'd3509 : toneR = Aflat5; 14'd3510 : toneR = Aflat5; 14'd3511 : toneR = 1;
14'd3512 : toneR = E5; 14'd3513 : toneR = E5; 14'd3514 : toneR = E5; 14'd3515 : toneR = 1;
14'd3516 : toneR = B4; 14'd3517 : toneR = B4; 14'd3518 : toneR = B4; 14'd3519 : toneR = 1;
/*measure 56 */
14'd3520 : toneR = 1; 14'd3521 : toneR = 1; 14'd3522 : toneR = 1; 14'd3523 : toneR = 1;
14'd3524 : toneR = Bflat4; 14'd3525 : toneR = Bflat4; 14'd3526 : toneR = Bflat4; 14'd3527 : toneR = 1;
14'd3528 : toneR = Eflat5; 14'd3529 : toneR = Eflat5; 14'd3530 : toneR = Eflat5; 14'd3531 : toneR = 1;
14'd3532 : toneR = G5; 14'd3533 : toneR = G5; 14'd3534 : toneR = G5; 14'd3535 : toneR = 1;
14'd3536 : toneR = Eflat5; 14'd3537 : toneR = Eflat5; 14'd3538 : toneR = Eflat5; 14'd3539 : toneR = 1;
14'd3540 : toneR = G5; 14'd3541 : toneR = G5; 14'd3542 : toneR = G5; 14'd3543 : toneR = 1;
14'd3544 : toneR = Bflat5; 14'd3545 : toneR = Bflat5; 14'd3546 : toneR = Bflat5; 14'd3547 : toneR = 1;
14'd3548 : toneR = Eflat6; 14'd3549 : toneR = Eflat6; 14'd3550 : toneR = Eflat6; 14'd3551 : toneR = 1;
14'd3552 : toneR = Eflat7; 14'd3553 : toneR = Eflat7; 14'd3554 : toneR = Eflat7; 14'd3555 : toneR = 1;
14'd3556 : toneR = Bflat6; 14'd3557 : toneR = Bflat6; 14'd3558 : toneR = Bflat6; 14'd3559 : toneR = 1;
14'd3560 : toneR = G6; 14'd3561 : toneR = G6; 14'd3562 : toneR = G6; 14'd3563 : toneR = 1;
14'd3564 : toneR = Eflat6; 14'd3565 : toneR = Eflat6; 14'd3566 : toneR = Eflat6; 14'd3567 : toneR = 1;
14'd3568 : toneR = Bflat5; 14'd3569 : toneR = Bflat5; 14'd3570 : toneR = Bflat5; 14'd3571 : toneR = 1;
14'd3572 : toneR = G5; 14'd3573 : toneR = G5; 14'd3574 : toneR = G5; 14'd3575 : toneR = 1;
14'd3576 : toneR = Eflat5; 14'd3577 : toneR = Eflat5; 14'd3578 : toneR = Eflat5; 14'd3579 : toneR = Eflat5;
14'd3580 : toneR = Eflat5; 14'd3581 : toneR = Eflat5; 14'd3582 : toneR = Eflat5; 14'd3583 : toneR = 1;
/*measure 57 */
14'd3584 : toneR = D7; 14'd3585 : toneR = D7; 14'd3586 : toneR = D7; 14'd3587 : toneR = 1;
14'd3588 : toneR = A6; 14'd3589 : toneR = A6; 14'd3590 : toneR = A6; 14'd3591 : toneR = 1;
14'd3592 : toneR = Fsharp6; 14'd3593 : toneR = Fsharp6; 14'd3594 : toneR = Fsharp6; 14'd3595 : toneR = 1;
14'd3596 : toneR = D6; 14'd3597 : toneR = D6; 14'd3598 : toneR = D6; 14'd3599 : toneR = 1;
14'd3600 : toneR = A5; 14'd3601 : toneR = A5; 14'd3602 : toneR = A5; 14'd3603 : toneR = 1;
14'd3604 : toneR = Fsharp5; 14'd3605 : toneR = Fsharp5; 14'd3606 : toneR = Fsharp5; 14'd3607 : toneR = 1;
14'd3608 : toneR = D5; 14'd3609 : toneR = D5; 14'd3610 : toneR = D5; 14'd3611 : toneR = 1;
14'd3612 : toneR = A4; 14'd3613 : toneR = A4; 14'd3614 : toneR = A4; 14'd3615 : toneR = 1;
14'd3616 : toneR = Fsharp4; 14'd3617 : toneR = Fsharp4; 14'd3618 : toneR = Fsharp4; 14'd3619 : toneR = 1;
14'd3620 : toneR = D4; 14'd3621 : toneR = D4; 14'd3622 : toneR = D4; 14'd3623 : toneR = 1;
14'd3624 : toneR = Fsharp4; 14'd3625 : toneR = Fsharp4; 14'd3626 : toneR = Fsharp4; 14'd3627 : toneR = 1;
14'd3628 : toneR = A4; 14'd3629 : toneR = A4; 14'd3630 : toneR = A4; 14'd3631 : toneR = 1;
14'd3632 : toneR = D5; 14'd3633 : toneR = D5; 14'd3634 : toneR = D5; 14'd3635 : toneR = 1;
14'd3636 : toneR = Fsharp5; 14'd3637 : toneR = Fsharp5; 14'd3638 : toneR = Fsharp5; 14'd3639 : toneR = 1;
14'd3640 : toneR = A5; 14'd3641 : toneR = A5; 14'd3642 : toneR = A5; 14'd3643 : toneR = 1;
14'd3644 : toneR = D6; 14'd3645 : toneR = D6; 14'd3646 : toneR = D6; 14'd3647 : toneR = 1;
/*measure 58 */
14'd3648 : toneR = Csharp7; 14'd3649 : toneR = Csharp7; 14'd3650 : toneR = Csharp7; 14'd3651 : toneR = 1;
14'd3652 : toneR = Gsharp6; 14'd3653 : toneR = Gsharp6; 14'd3654 : toneR = Gsharp6; 14'd3655 : toneR = 1;
14'd3656 : toneR = F6; 14'd3657 : toneR = F6; 14'd3658 : toneR = F6; 14'd3659 : toneR = 1;
14'd3660 : toneR = Csharp6; 14'd3661 : toneR = Csharp6; 14'd3662 : toneR = Csharp6; 14'd3663 : toneR = 1;
14'd3664 : toneR = Gsharp5; 14'd3665 : toneR = Gsharp5; 14'd3666 : toneR = Gsharp5; 14'd3667 : toneR = 1;
14'd3668 : toneR = F5; 14'd3669 : toneR = F5; 14'd3670 : toneR = F5; 14'd3671 : toneR = 1;
14'd3672 : toneR = Csharp5; 14'd3673 : toneR = Csharp5; 14'd3674 : toneR = Csharp5; 14'd3675 : toneR = 1;
14'd3676 : toneR = Gsharp4; 14'd3677 : toneR = Gsharp4; 14'd3678 : toneR = Gsharp4; 14'd3679 : toneR = 1;
14'd3680 : toneR = F4; 14'd3681 : toneR = F4; 14'd3682 : toneR = F4; 14'd3683 : toneR = 1;
14'd3684 : toneR = Csharp4; 14'd3685 : toneR = Csharp4; 14'd3686 : toneR = Csharp4; 14'd3687 : toneR = 1;
14'd3688 : toneR = F4; 14'd3689 : toneR = F4; 14'd3690 : toneR = F4; 14'd3691 : toneR = 1;
14'd3692 : toneR = Gsharp4; 14'd3693 : toneR = Gsharp4; 14'd3694 : toneR = Gsharp4; 14'd3695 : toneR = 1;
14'd3696 : toneR = Csharp5; 14'd3697 : toneR = Csharp5; 14'd3698 : toneR = Csharp5; 14'd3699 : toneR = 1;
14'd3700 : toneR = F5; 14'd3701 : toneR = F5; 14'd3702 : toneR = F5; 14'd3703 : toneR = 1;
14'd3704 : toneR = Gsharp5; 14'd3705 : toneR = Gsharp5; 14'd3706 : toneR = Gsharp5; 14'd3707 : toneR = 1;
14'd3708 : toneR = Csharp6; 14'd3709 : toneR = Csharp6; 14'd3710 : toneR = Csharp6; 14'd3711 : toneR = 1;
/*measure 59 */
14'd3712 : toneR = E4; 14'd3713 : toneR = E4; 14'd3714 : toneR = E4; 14'd3715 : toneR = 1;
14'd3716 : toneR = G4; 14'd3717 : toneR = G4; 14'd3718 : toneR = G4; 14'd3719 : toneR = 1;
14'd3720 : toneR = C5; 14'd3721 : toneR = C5; 14'd3722 : toneR = C5; 14'd3723 : toneR = 1;
14'd3724 : toneR = E5; 14'd3725 : toneR = E5; 14'd3726 : toneR = E5; 14'd3727 : toneR = 1;
14'd3728 : toneR = C5; 14'd3729 : toneR = C5; 14'd3730 : toneR = C5; 14'd3731 : toneR = 1;
14'd3732 : toneR = E5; 14'd3733 : toneR = E5; 14'd3734 : toneR = E5; 14'd3735 : toneR = 1;
14'd3736 : toneR = G5; 14'd3737 : toneR = G5; 14'd3738 : toneR = G5; 14'd3739 : toneR = 1;
14'd3740 : toneR = C6; 14'd3741 : toneR = C6; 14'd3742 : toneR = C6; 14'd3743 : toneR = 1;
14'd3744 : toneR = C7; 14'd3745 : toneR = C7; 14'd3746 : toneR = C7; 14'd3747 : toneR = 1;
14'd3748 : toneR = G6; 14'd3749 : toneR = G6; 14'd3750 : toneR = G6; 14'd3751 : toneR = 1;
14'd3752 : toneR = E6; 14'd3753 : toneR = E6; 14'd3754 : toneR = E6; 14'd3755 : toneR = 1;
14'd3756 : toneR = C6; 14'd3757 : toneR = C6; 14'd3758 : toneR = C6; 14'd3759 : toneR = 1;
14'd3760 : toneR = G5; 14'd3761 : toneR = G5; 14'd3762 : toneR = G5; 14'd3763 : toneR = 1;
14'd3764 : toneR = E5; 14'd3765 : toneR = E5; 14'd3766 : toneR = E5; 14'd3767 : toneR = 1;
14'd3768 : toneR = C5; 14'd3769 : toneR = C5; 14'd3770 : toneR = C5; 14'd3771 : toneR = C5;
14'd3772 : toneR = C5; 14'd3773 : toneR = C5; 14'd3774 : toneR = C5; 14'd3775 : toneR = 1;
/*measure 60 */
14'd3776 : toneR = Fsharp6; 14'd3777 : toneR = Fsharp6; 14'd3778 : toneR = Fsharp6; 14'd3779 : toneR = 1;
14'd3780 : toneR = Dsharp6; 14'd3781 : toneR = Dsharp6; 14'd3782 : toneR = Dsharp6; 14'd3783 : toneR = 1;
14'd3784 : toneR = B5; 14'd3785 : toneR = B5; 14'd3786 : toneR = B5; 14'd3787 : toneR = 1;
14'd3788 : toneR = Fsharp5; 14'd3789 : toneR = Fsharp5; 14'd3790 : toneR = Fsharp5; 14'd3791 : toneR = 1;
14'd3792 : toneR = Dsharp5; 14'd3793 : toneR = Dsharp5; 14'd3794 : toneR = Dsharp5; 14'd3795 : toneR = 1;
14'd3796 : toneR = B4; 14'd3797 : toneR = B4; 14'd3798 : toneR = B4; 14'd3799 : toneR = 1;
14'd3800 : toneR = Fsharp4; 14'd3801 : toneR = Fsharp4; 14'd3802 : toneR = Fsharp4; 14'd3803 : toneR = 1;
14'd3804 : toneR = Dsharp4; 14'd3805 : toneR = Dsharp4; 14'd3806 : toneR = Dsharp4; 14'd3807 : toneR = 1;
14'd3808 : toneR = 1; 14'd3809 : toneR = 1; 14'd3810 : toneR = 1; 14'd3811 : toneR = 1;
14'd3812 : toneR = 1; 14'd3813 : toneR = 1; 14'd3814 : toneR = 1; 14'd3815 : toneR = 1;
14'd3816 : toneR = 1; 14'd3817 : toneR = 1; 14'd3818 : toneR = 1; 14'd3819 : toneR = 1;
14'd3820 : toneR = 1; 14'd3821 : toneR = 1; 14'd3822 : toneR = 1; 14'd3823 : toneR = 1;
14'd3824 : toneR = C6; 14'd3825 : toneR = C6; 14'd3826 : toneR = C6; 14'd3827 : toneR = C6;
14'd3828 : toneR = 1; 14'd3829 : toneR = Csharp6; 14'd3830 : toneR = Csharp6; 14'd3831 : toneR = Csharp6;
14'd3832 : toneR = Csharp6; 14'd3833 : toneR = Csharp6; 14'd3834 : toneR = 1; 14'd3835 : toneR = D6;
14'd3836 : toneR = D6; 14'd3837 : toneR = D6; 14'd3838 : toneR = D6; 14'd3839 : toneR = 1;

        default: toneR = 1;
        endcase
    end
endmodule