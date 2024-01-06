module music_unwelcome_school (
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
14'd0 : toneR = A4; 14'd1 : toneR = A4; 14'd2 : toneR = A4; 14'd3 : toneR = A4;
14'd4 : toneR = A4; 14'd5 : toneR = A4; 14'd6 : toneR = A4; 14'd7 : toneR = A4;
14'd8 : toneR = A4; 14'd9 : toneR = A4; 14'd10 : toneR = A4; 14'd11 : toneR = A4;
14'd12 : toneR = A4; 14'd13 : toneR = A4; 14'd14 : toneR = A4; 14'd15 : toneR = 1;
14'd16 : toneR = C5; 14'd17 : toneR = C5; 14'd18 : toneR = C5; 14'd19 : toneR = C5;
14'd20 : toneR = C5; 14'd21 : toneR = C5; 14'd22 : toneR = C5; 14'd23 : toneR = C5;
14'd24 : toneR = C5; 14'd25 : toneR = C5; 14'd26 : toneR = C5; 14'd27 : toneR = C5;
14'd28 : toneR = C5; 14'd29 : toneR = C5; 14'd30 : toneR = C5; 14'd31 : toneR = 1;
14'd32 : toneR = Eflat5; 14'd33 : toneR = Eflat5; 14'd34 : toneR = Eflat5; 14'd35 : toneR = Eflat5;
14'd36 : toneR = Eflat5; 14'd37 : toneR = Eflat5; 14'd38 : toneR = Eflat5; 14'd39 : toneR = Eflat5;
14'd40 : toneR = Eflat5; 14'd41 : toneR = Eflat5; 14'd42 : toneR = Eflat5; 14'd43 : toneR = 1;
14'd44 : toneR = E5; 14'd45 : toneR = E5; 14'd46 : toneR = E5; 14'd47 : toneR = 1;
14'd48 : toneR = 1; 14'd49 : toneR = 1; 14'd50 : toneR = 1; 14'd51 : toneR = 1;
14'd52 : toneR = 1; 14'd53 : toneR = 1; 14'd54 : toneR = 1; 14'd55 : toneR = 1;
14'd56 : toneR = Gsharp4; 14'd57 : toneR = Gsharp4; 14'd58 : toneR = Gsharp4; 14'd59 : toneR = Gsharp4;
14'd60 : toneR = Gsharp4; 14'd61 : toneR = Gsharp4; 14'd62 : toneR = Gsharp4; 14'd63 : toneR = 1;
    /*measure 2 */
14'd64 : toneR = A4; 14'd65 : toneR = A4; 14'd66 : toneR = A4; 14'd67 : toneR = A4;
14'd68 : toneR = A4; 14'd69 : toneR = A4; 14'd70 : toneR = A4; 14'd71 : toneR = 1;
14'd72 : toneR = C5; 14'd73 : toneR = C5; 14'd74 : toneR = C5; 14'd75 : toneR = C5;
14'd76 : toneR = C5; 14'd77 : toneR = C5; 14'd78 : toneR = C5; 14'd79 : toneR = 1;
14'd80 : toneR = D5; 14'd81 : toneR = D5; 14'd82 : toneR = D5; 14'd83 : toneR = D5;
14'd84 : toneR = D5; 14'd85 : toneR = D5; 14'd86 : toneR = D5; 14'd87 : toneR = 1;
14'd88 : toneR = C5; 14'd89 : toneR = C5; 14'd90 : toneR = C5; 14'd91 : toneR = C5;
14'd92 : toneR = C5; 14'd93 : toneR = C5; 14'd94 : toneR = C5; 14'd95 : toneR = 1;
14'd96 : toneR = Eflat5; 14'd97 : toneR = Eflat5; 14'd98 : toneR = Eflat5; 14'd99 : toneR = Eflat5;
14'd100 : toneR = Eflat5; 14'd101 : toneR = Eflat5; 14'd102 : toneR = Eflat5; 14'd103 : toneR = 1;
14'd104 : toneR = Eflat5; 14'd105 : toneR = Eflat5; 14'd106 : toneR = Eflat5; 14'd107 : toneR = 1;
14'd108 : toneR = E5; 14'd109 : toneR = E5; 14'd110 : toneR = E5; 14'd111 : toneR = E5;
14'd112 : toneR = E5; 14'd113 : toneR = E5; 14'd114 : toneR = E5; 14'd115 : toneR = E5;
14'd116 : toneR = E5; 14'd117 : toneR = E5; 14'd118 : toneR = E5; 14'd119 : toneR = 1;
14'd120 : toneR = 1; 14'd121 : toneR = 1; 14'd122 : toneR = 1; 14'd123 : toneR = 1;
14'd124 : toneR = 1; 14'd125 : toneR = 1; 14'd126 : toneR = 1; 14'd127 : toneR = 1;
/*measure 3 */
14'd128 : toneR = G5; 14'd129 : toneR = G5; 14'd130 : toneR = G5; 14'd131 : toneR = G5;
14'd132 : toneR = G5; 14'd133 : toneR = G5; 14'd134 : toneR = G5; 14'd135 : toneR = 1;
14'd136 : toneR = Fsharp5; 14'd137 : toneR = Fsharp5; 14'd138 : toneR = Fsharp5; 14'd139 : toneR = Fsharp5;
14'd140 : toneR = Fsharp5; 14'd141 : toneR = Fsharp5; 14'd142 : toneR = Fsharp5; 14'd143 : toneR = 1;
14'd144 : toneR = F5; 14'd145 : toneR = F5; 14'd146 : toneR = F5; 14'd147 : toneR = F5;
14'd148 : toneR = F5; 14'd149 : toneR = F5; 14'd150 : toneR = F5; 14'd151 : toneR = 1;
14'd152 : toneR = Dsharp5; 14'd153 : toneR = Dsharp5; 14'd154 : toneR = Dsharp5; 14'd155 : toneR = Dsharp5;
14'd156 : toneR = Dsharp5; 14'd157 : toneR = Dsharp5; 14'd158 : toneR = Dsharp5; 14'd159 : toneR = 1;
14'd160 : toneR = D5; 14'd161 : toneR = D5; 14'd162 : toneR = D5; 14'd163 : toneR = D5;
14'd164 : toneR = D5; 14'd165 : toneR = D5; 14'd166 : toneR = D5; 14'd167 : toneR = 1;
14'd168 : toneR = C5; 14'd169 : toneR = C5; 14'd170 : toneR = C5; 14'd171 : toneR = C5;
14'd172 : toneR = C5; 14'd173 : toneR = C5; 14'd174 : toneR = C5; 14'd175 : toneR = 1;
14'd176 : toneR = B4; 14'd177 : toneR = B4; 14'd178 : toneR = B4; 14'd179 : toneR = B4;
14'd180 : toneR = B4; 14'd181 : toneR = B4; 14'd182 : toneR = B4; 14'd183 : toneR = 1;
14'd184 : toneR = Asharp4; 14'd185 : toneR = Asharp4; 14'd186 : toneR = Asharp4; 14'd187 : toneR = Asharp4;
14'd188 : toneR = Asharp4; 14'd189 : toneR = Asharp4; 14'd190 : toneR = Asharp4; 14'd191 : toneR = 1;
/*measure 4 */
14'd192 : toneR = B4; 14'd193 : toneR = B4; 14'd194 : toneR = B4; 14'd195 : toneR = B4;
14'd196 : toneR = B4; 14'd197 : toneR = B4; 14'd198 : toneR = B4; 14'd199 : toneR = 1;
14'd200 : toneR = C5; 14'd201 : toneR = C5; 14'd202 : toneR = C5; 14'd203 : toneR = C5;
14'd204 : toneR = C5; 14'd205 : toneR = C5; 14'd206 : toneR = C5; 14'd207 : toneR = 1;
14'd208 : toneR = D5; 14'd209 : toneR = D5; 14'd210 : toneR = D5; 14'd211 : toneR = D5;
14'd212 : toneR = D5; 14'd213 : toneR = D5; 14'd214 : toneR = D5; 14'd215 : toneR = 1;
14'd216 : toneR = Dsharp5; 14'd217 : toneR = Dsharp5; 14'd218 : toneR = Dsharp5; 14'd219 : toneR = Dsharp5;
14'd220 : toneR = Dsharp5; 14'd221 : toneR = Dsharp5; 14'd222 : toneR = Dsharp5; 14'd223 : toneR = 1;
14'd224 : toneR = E5; 14'd225 : toneR = E5; 14'd226 : toneR = E5; 14'd227 : toneR = E5;
14'd228 : toneR = E5; 14'd229 : toneR = E5; 14'd230 : toneR = E5; 14'd231 : toneR = E5;
14'd232 : toneR = E5; 14'd233 : toneR = E5; 14'd234 : toneR = E5; 14'd235 : toneR = E5;
14'd236 : toneR = E5; 14'd237 : toneR = E5; 14'd238 : toneR = E5; 14'd239 : toneR = 1;
14'd240 : toneR = E4; 14'd241 : toneR = E4; 14'd242 : toneR = E4; 14'd243 : toneR = E4;
14'd244 : toneR = E4; 14'd245 : toneR = E4; 14'd246 : toneR = E4; 14'd247 : toneR = E4;
14'd248 : toneR = E4; 14'd249 : toneR = E4; 14'd250 : toneR = E4; 14'd251 : toneR = E4;
14'd252 : toneR = E4; 14'd253 : toneR = E4; 14'd254 : toneR = E4; 14'd255 : toneR = 1;
/*measure 5 */
14'd256 : toneR = A4; 14'd257 : toneR = A4; 14'd258 : toneR = A4; 14'd259 : toneR = A4;
14'd260 : toneR = A4; 14'd261 : toneR = A4; 14'd262 : toneR = A4; 14'd263 : toneR = A4;
14'd264 : toneR = A4; 14'd265 : toneR = A4; 14'd266 : toneR = A4; 14'd267 : toneR = A4;
14'd268 : toneR = A4; 14'd269 : toneR = A4; 14'd270 : toneR = A4; 14'd271 : toneR = 1;
14'd272 : toneR = C5; 14'd273 : toneR = C5; 14'd274 : toneR = C5; 14'd275 : toneR = C5;
14'd276 : toneR = C5; 14'd277 : toneR = C5; 14'd278 : toneR = C5; 14'd279 : toneR = C5;
14'd280 : toneR = C5; 14'd281 : toneR = C5; 14'd282 : toneR = C5; 14'd283 : toneR = C5;
14'd284 : toneR = C5; 14'd285 : toneR = C5; 14'd286 : toneR = C5; 14'd287 : toneR = 1;
14'd288 : toneR = Eflat5; 14'd289 : toneR = Eflat5; 14'd290 : toneR = Eflat5; 14'd291 : toneR = Eflat5;
14'd292 : toneR = Eflat5; 14'd293 : toneR = Eflat5; 14'd294 : toneR = Eflat5; 14'd295 : toneR = Eflat5;
14'd296 : toneR = Eflat5; 14'd297 : toneR = Eflat5; 14'd298 : toneR = Eflat5; 14'd299 : toneR = 1;
14'd300 : toneR = E5; 14'd301 : toneR = E5; 14'd302 : toneR = E5; 14'd303 : toneR = 1;
14'd304 : toneR = 1; 14'd305 : toneR = 1; 14'd306 : toneR = 1; 14'd307 : toneR = 1;
14'd308 : toneR = 1; 14'd309 : toneR = 1; 14'd310 : toneR = 1; 14'd311 : toneR = 1;
14'd312 : toneR = Gsharp4; 14'd313 : toneR = Gsharp4; 14'd314 : toneR = Gsharp4; 14'd315 : toneR = Gsharp4;
14'd316 : toneR = Gsharp4; 14'd317 : toneR = Gsharp4; 14'd318 : toneR = Gsharp4; 14'd319 : toneR = 1;
/*measure 6 */
14'd320 : toneR = A4; 14'd321 : toneR = A4; 14'd322 : toneR = A4; 14'd323 : toneR = A4;
14'd324 : toneR = A4; 14'd325 : toneR = A4; 14'd326 : toneR = A4; 14'd327 : toneR = 1;
14'd328 : toneR = C5; 14'd329 : toneR = C5; 14'd330 : toneR = C5; 14'd331 : toneR = C5;
14'd332 : toneR = C5; 14'd333 : toneR = C5; 14'd334 : toneR = C5; 14'd335 : toneR = 1;
14'd336 : toneR = D5; 14'd337 : toneR = D5; 14'd338 : toneR = D5; 14'd339 : toneR = D5;
14'd340 : toneR = D5; 14'd341 : toneR = D5; 14'd342 : toneR = D5; 14'd343 : toneR = 1;
14'd344 : toneR = C5; 14'd345 : toneR = C5; 14'd346 : toneR = C5; 14'd347 : toneR = C5;
14'd348 : toneR = C5; 14'd349 : toneR = C5; 14'd350 : toneR = C5; 14'd351 : toneR = 1;
14'd352 : toneR = Eflat5; 14'd353 : toneR = Eflat5; 14'd354 : toneR = Eflat5; 14'd355 : toneR = Eflat5;
14'd356 : toneR = Eflat5; 14'd357 : toneR = Eflat5; 14'd358 : toneR = Eflat5; 14'd359 : toneR = 1;
14'd360 : toneR = Eflat5; 14'd361 : toneR = Eflat5; 14'd362 : toneR = Eflat5; 14'd363 : toneR = 1;
14'd364 : toneR = E5; 14'd365 : toneR = E5; 14'd366 : toneR = E5; 14'd367 : toneR = E5;
14'd368 : toneR = E5; 14'd369 : toneR = E5; 14'd370 : toneR = E5; 14'd371 : toneR = E5;
14'd372 : toneR = E5; 14'd373 : toneR = E5; 14'd374 : toneR = E5; 14'd375 : toneR = 1;
14'd376 : toneR = 1; 14'd377 : toneR = 1; 14'd378 : toneR = 1; 14'd379 : toneR = 1;
14'd380 : toneR = 1; 14'd381 : toneR = 1; 14'd382 : toneR = 1; 14'd383 : toneR = 1;
/*measure 7 */
14'd384 : toneR = G5; 14'd385 : toneR = G5; 14'd386 : toneR = G5; 14'd387 : toneR = G5;
14'd388 : toneR = G5; 14'd389 : toneR = G5; 14'd390 : toneR = G5; 14'd391 : toneR = 1;
14'd392 : toneR = Fsharp5; 14'd393 : toneR = Fsharp5; 14'd394 : toneR = Fsharp5; 14'd395 : toneR = Fsharp5;
14'd396 : toneR = Fsharp5; 14'd397 : toneR = Fsharp5; 14'd398 : toneR = Fsharp5; 14'd399 : toneR = 1;
14'd400 : toneR = F5; 14'd401 : toneR = F5; 14'd402 : toneR = F5; 14'd403 : toneR = F5;
14'd404 : toneR = F5; 14'd405 : toneR = F5; 14'd406 : toneR = F5; 14'd407 : toneR = 1;
14'd408 : toneR = Dsharp5; 14'd409 : toneR = Dsharp5; 14'd410 : toneR = Dsharp5; 14'd411 : toneR = Dsharp5;
14'd412 : toneR = Dsharp5; 14'd413 : toneR = Dsharp5; 14'd414 : toneR = Dsharp5; 14'd415 : toneR = 1;
14'd416 : toneR = E5; 14'd417 : toneR = E5; 14'd418 : toneR = E5; 14'd419 : toneR = E5;
14'd420 : toneR = E5; 14'd421 : toneR = E5; 14'd422 : toneR = E5; 14'd423 : toneR = 1;
14'd424 : toneR = F5; 14'd425 : toneR = F5; 14'd426 : toneR = F5; 14'd427 : toneR = F5;
14'd428 : toneR = F5; 14'd429 : toneR = F5; 14'd430 : toneR = F5; 14'd431 : toneR = 1;
14'd432 : toneR = Fsharp5; 14'd433 : toneR = Fsharp5; 14'd434 : toneR = Fsharp5; 14'd435 : toneR = Fsharp5;
14'd436 : toneR = Fsharp5; 14'd437 : toneR = Fsharp5; 14'd438 : toneR = Fsharp5; 14'd439 : toneR = 1;
14'd440 : toneR = G5; 14'd441 : toneR = G5; 14'd442 : toneR = G5; 14'd443 : toneR = G5;
14'd444 : toneR = G5; 14'd445 : toneR = G5; 14'd446 : toneR = G5; 14'd447 : toneR = 1;
/*measure 8 */
14'd448 : toneR = Gsharp5; 14'd449 : toneR = Gsharp5; 14'd450 : toneR = Gsharp5; 14'd451 : toneR = Gsharp5;
14'd452 : toneR = Gsharp5; 14'd453 : toneR = Gsharp5; 14'd454 : toneR = Gsharp5; 14'd455 : toneR = 1;
14'd456 : toneR = Gsharp5; 14'd457 : toneR = Gsharp5; 14'd458 : toneR = Gsharp5; 14'd459 : toneR = Gsharp5;
14'd460 : toneR = Gsharp5; 14'd461 : toneR = Gsharp5; 14'd462 : toneR = Gsharp5; 14'd463 : toneR = 1;
14'd464 : toneR = A5; 14'd465 : toneR = A5; 14'd466 : toneR = A5; 14'd467 : toneR = A5;
14'd468 : toneR = A5; 14'd469 : toneR = A5; 14'd470 : toneR = A5; 14'd471 : toneR = 1;
14'd472 : toneR = A5; 14'd473 : toneR = A5; 14'd474 : toneR = A5; 14'd475 : toneR = A5;
14'd476 : toneR = A5; 14'd477 : toneR = A5; 14'd478 : toneR = A5; 14'd479 : toneR = 1;
14'd480 : toneR = B5; 14'd481 : toneR = B5; 14'd482 : toneR = B5; 14'd483 : toneR = B5;
14'd484 : toneR = B5; 14'd485 : toneR = B5; 14'd486 : toneR = B5; 14'd487 : toneR = 1;
14'd488 : toneR = 1; 14'd489 : toneR = 1; 14'd490 : toneR = 1; 14'd491 : toneR = 1;
14'd492 : toneR = 1; 14'd493 : toneR = 1; 14'd494 : toneR = 1; 14'd495 : toneR = 1;
14'd496 : toneR = 1; 14'd497 : toneR = 1; 14'd498 : toneR = 1; 14'd499 : toneR = 1;
14'd500 : toneR = 1; 14'd501 : toneR = 1; 14'd502 : toneR = 1; 14'd503 : toneR = 1;
14'd504 : toneR = 1; 14'd505 : toneR = 1; 14'd506 : toneR = 1; 14'd507 : toneR = 1;
14'd508 : toneR = 1; 14'd509 : toneR = 1; 14'd510 : toneR = 1; 14'd511 : toneR = 1;
/*measure 9 */
14'd512 : toneR = A5; 14'd513 : toneR = A5; 14'd514 : toneR = A5; 14'd515 : toneR = A5;
14'd516 : toneR = A5; 14'd517 : toneR = A5; 14'd518 : toneR = A5; 14'd519 : toneR = A5;
14'd520 : toneR = A5; 14'd521 : toneR = A5; 14'd522 : toneR = A5; 14'd523 : toneR = A5;
14'd524 : toneR = A5; 14'd525 : toneR = A5; 14'd526 : toneR = A5; 14'd527 : toneR = 1;
14'd528 : toneR = C6; 14'd529 : toneR = C6; 14'd530 : toneR = C6; 14'd531 : toneR = C6;
14'd532 : toneR = C6; 14'd533 : toneR = C6; 14'd534 : toneR = C6; 14'd535 : toneR = C6;
14'd536 : toneR = C6; 14'd537 : toneR = C6; 14'd538 : toneR = C6; 14'd539 : toneR = C6;
14'd540 : toneR = C6; 14'd541 : toneR = C6; 14'd542 : toneR = C6; 14'd543 : toneR = 1;
14'd544 : toneR = Dsharp6; 14'd545 : toneR = Dsharp6; 14'd546 : toneR = Dsharp6; 14'd547 : toneR = Dsharp6;
14'd548 : toneR = Dsharp6; 14'd549 : toneR = Dsharp6; 14'd550 : toneR = Dsharp6; 14'd551 : toneR = Dsharp6;
14'd552 : toneR = Dsharp6; 14'd553 : toneR = Dsharp6; 14'd554 : toneR = Dsharp6; 14'd555 : toneR = 1;
14'd556 : toneR = E6; 14'd557 : toneR = E6; 14'd558 : toneR = E6; 14'd559 : toneR = 1;
14'd560 : toneR = 1; 14'd561 : toneR = 1; 14'd562 : toneR = 1; 14'd563 : toneR = 1;
14'd564 : toneR = 1; 14'd565 : toneR = 1; 14'd566 : toneR = 1; 14'd567 : toneR = 1;
14'd568 : toneR = Gsharp5; 14'd569 : toneR = Gsharp5; 14'd570 : toneR = Gsharp5; 14'd571 : toneR = Gsharp5;
14'd572 : toneR = Gsharp5; 14'd573 : toneR = Gsharp5; 14'd574 : toneR = Gsharp5; 14'd575 : toneR = 1;
/*measure 10 */
14'd576 : toneR = A5; 14'd577 : toneR = A5; 14'd578 : toneR = A5; 14'd579 : toneR = A5;
14'd580 : toneR = A5; 14'd581 : toneR = A5; 14'd582 : toneR = A5; 14'd583 : toneR = 1;
14'd584 : toneR = C6; 14'd585 : toneR = C6; 14'd586 : toneR = C6; 14'd587 : toneR = C6;
14'd588 : toneR = C6; 14'd589 : toneR = C6; 14'd590 : toneR = C6; 14'd591 : toneR = 1;
14'd592 : toneR = D6; 14'd593 : toneR = D6; 14'd594 : toneR = D6; 14'd595 : toneR = D6;
14'd596 : toneR = D6; 14'd597 : toneR = D6; 14'd598 : toneR = D6; 14'd599 : toneR = 1;
14'd600 : toneR = C6; 14'd601 : toneR = C6; 14'd602 : toneR = C6; 14'd603 : toneR = C6;
14'd604 : toneR = C6; 14'd605 : toneR = C6; 14'd606 : toneR = C6; 14'd607 : toneR = 1;
14'd608 : toneR = Dsharp6; 14'd609 : toneR = Dsharp6; 14'd610 : toneR = Dsharp6; 14'd611 : toneR = Dsharp6;
14'd612 : toneR = Dsharp6; 14'd613 : toneR = Dsharp6; 14'd614 : toneR = Dsharp6; 14'd615 : toneR = 1;
14'd616 : toneR = Dsharp6; 14'd617 : toneR = Dsharp6; 14'd618 : toneR = Dsharp6; 14'd619 : toneR = 1;
14'd620 : toneR = E6; 14'd621 : toneR = E6; 14'd622 : toneR = E6; 14'd623 : toneR = E6;
14'd624 : toneR = E6; 14'd625 : toneR = E6; 14'd626 : toneR = E6; 14'd627 : toneR = E6;
14'd628 : toneR = E6; 14'd629 : toneR = E6; 14'd630 : toneR = E6; 14'd631 : toneR = 1;
14'd632 : toneR = 1; 14'd633 : toneR = 1; 14'd634 : toneR = 1; 14'd635 : toneR = 1;
14'd636 : toneR = 1; 14'd637 : toneR = 1; 14'd638 : toneR = 1; 14'd639 : toneR = 1;
/*measure 11 */
14'd640 : toneR = G6; 14'd641 : toneR = G6; 14'd642 : toneR = G6; 14'd643 : toneR = G6;
14'd644 : toneR = G6; 14'd645 : toneR = G6; 14'd646 : toneR = G6; 14'd647 : toneR = 1;
14'd648 : toneR = Fsharp6; 14'd649 : toneR = Fsharp6; 14'd650 : toneR = Fsharp6; 14'd651 : toneR = Fsharp6;
14'd652 : toneR = Fsharp6; 14'd653 : toneR = Fsharp6; 14'd654 : toneR = Fsharp6; 14'd655 : toneR = 1;
14'd656 : toneR = F6; 14'd657 : toneR = F6; 14'd658 : toneR = F6; 14'd659 : toneR = F6;
14'd660 : toneR = F6; 14'd661 : toneR = F6; 14'd662 : toneR = F6; 14'd663 : toneR = 1;
14'd664 : toneR = Dsharp6; 14'd665 : toneR = Dsharp6; 14'd666 : toneR = Dsharp6; 14'd667 : toneR = Dsharp6;
14'd668 : toneR = Dsharp6; 14'd669 : toneR = Dsharp6; 14'd670 : toneR = Dsharp6; 14'd671 : toneR = 1;
14'd672 : toneR = D6; 14'd673 : toneR = D6; 14'd674 : toneR = D6; 14'd675 : toneR = D6;
14'd676 : toneR = D6; 14'd677 : toneR = D6; 14'd678 : toneR = D6; 14'd679 : toneR = 1;
14'd680 : toneR = C6; 14'd681 : toneR = C6; 14'd682 : toneR = C6; 14'd683 : toneR = C6;
14'd684 : toneR = C6; 14'd685 : toneR = C6; 14'd686 : toneR = C6; 14'd687 : toneR = 1;
14'd688 : toneR = B5; 14'd689 : toneR = B5; 14'd690 : toneR = B5; 14'd691 : toneR = B5;
14'd692 : toneR = B5; 14'd693 : toneR = B5; 14'd694 : toneR = B5; 14'd695 : toneR = 1;
14'd696 : toneR = Asharp5; 14'd697 : toneR = Asharp5; 14'd698 : toneR = Asharp5; 14'd699 : toneR = Asharp5;
14'd700 : toneR = Asharp5; 14'd701 : toneR = Asharp5; 14'd702 : toneR = Asharp5; 14'd703 : toneR = 1;
/*measure 12 */
14'd704 : toneR = B5; 14'd705 : toneR = B5; 14'd706 : toneR = B5; 14'd707 : toneR = B5;
14'd708 : toneR = B5; 14'd709 : toneR = B5; 14'd710 : toneR = B5; 14'd711 : toneR = 1;
14'd712 : toneR = C6; 14'd713 : toneR = C6; 14'd714 : toneR = C6; 14'd715 : toneR = C6;
14'd716 : toneR = C6; 14'd717 : toneR = C6; 14'd718 : toneR = C6; 14'd719 : toneR = 1;
14'd720 : toneR = D6; 14'd721 : toneR = D6; 14'd722 : toneR = D6; 14'd723 : toneR = D6;
14'd724 : toneR = D6; 14'd725 : toneR = D6; 14'd726 : toneR = D6; 14'd727 : toneR = 1;
14'd728 : toneR = Dsharp6; 14'd729 : toneR = Dsharp6; 14'd730 : toneR = Dsharp6; 14'd731 : toneR = Dsharp6;
14'd732 : toneR = Dsharp6; 14'd733 : toneR = Dsharp6; 14'd734 : toneR = Dsharp6; 14'd735 : toneR = 1;
14'd736 : toneR = E6; 14'd737 : toneR = E6; 14'd738 : toneR = E6; 14'd739 : toneR = E6;
14'd740 : toneR = E6; 14'd741 : toneR = E6; 14'd742 : toneR = E6; 14'd743 : toneR = E6;
14'd744 : toneR = E6; 14'd745 : toneR = E6; 14'd746 : toneR = E6; 14'd747 : toneR = E6;
14'd748 : toneR = E6; 14'd749 : toneR = E6; 14'd750 : toneR = E6; 14'd751 : toneR = 1;
14'd752 : toneR = E5; 14'd753 : toneR = E5; 14'd754 : toneR = E5; 14'd755 : toneR = E5;
14'd756 : toneR = E5; 14'd757 : toneR = E5; 14'd758 : toneR = E5; 14'd759 : toneR = E5;
14'd760 : toneR = E5; 14'd761 : toneR = E5; 14'd762 : toneR = E5; 14'd763 : toneR = E5;
14'd764 : toneR = E5; 14'd765 : toneR = E5; 14'd766 : toneR = E5; 14'd767 : toneR = 1;
/*measure 13 */
14'd768 : toneR = A5; 14'd769 : toneR = A5; 14'd770 : toneR = A5; 14'd771 : toneR = A5;
14'd772 : toneR = A5; 14'd773 : toneR = A5; 14'd774 : toneR = A5; 14'd775 : toneR = A5;
14'd776 : toneR = A5; 14'd777 : toneR = A5; 14'd778 : toneR = A5; 14'd779 : toneR = A5;
14'd780 : toneR = A5; 14'd781 : toneR = A5; 14'd782 : toneR = A5; 14'd783 : toneR = 1;
14'd784 : toneR = C6; 14'd785 : toneR = C6; 14'd786 : toneR = C6; 14'd787 : toneR = C6;
14'd788 : toneR = C6; 14'd789 : toneR = C6; 14'd790 : toneR = C6; 14'd791 : toneR = C6;
14'd792 : toneR = C6; 14'd793 : toneR = C6; 14'd794 : toneR = C6; 14'd795 : toneR = C6;
14'd796 : toneR = C6; 14'd797 : toneR = C6; 14'd798 : toneR = C6; 14'd799 : toneR = 1;
14'd800 : toneR = Dsharp6; 14'd801 : toneR = Dsharp6; 14'd802 : toneR = Dsharp6; 14'd803 : toneR = Dsharp6;
14'd804 : toneR = Dsharp6; 14'd805 : toneR = Dsharp6; 14'd806 : toneR = Dsharp6; 14'd807 : toneR = Dsharp6;
14'd808 : toneR = Dsharp6; 14'd809 : toneR = Dsharp6; 14'd810 : toneR = Dsharp6; 14'd811 : toneR = 1;
14'd812 : toneR = E6; 14'd813 : toneR = E6; 14'd814 : toneR = E6; 14'd815 : toneR = 1;
14'd816 : toneR = 1; 14'd817 : toneR = 1; 14'd818 : toneR = 1; 14'd819 : toneR = 1;
14'd820 : toneR = 1; 14'd821 : toneR = 1; 14'd822 : toneR = 1; 14'd823 : toneR = 1;
14'd824 : toneR = Gsharp5; 14'd825 : toneR = Gsharp5; 14'd826 : toneR = Gsharp5; 14'd827 : toneR = Gsharp5;
14'd828 : toneR = Gsharp5; 14'd829 : toneR = Gsharp5; 14'd830 : toneR = Gsharp5; 14'd831 : toneR = 1;
/*measure 14 */
14'd832 : toneR = A5; 14'd833 : toneR = A5; 14'd834 : toneR = A5; 14'd835 : toneR = A5;
14'd836 : toneR = A5; 14'd837 : toneR = A5; 14'd838 : toneR = A5; 14'd839 : toneR = 1;
14'd840 : toneR = C6; 14'd841 : toneR = C6; 14'd842 : toneR = C6; 14'd843 : toneR = C6;
14'd844 : toneR = C6; 14'd845 : toneR = C6; 14'd846 : toneR = C6; 14'd847 : toneR = 1;
14'd848 : toneR = D6; 14'd849 : toneR = D6; 14'd850 : toneR = D6; 14'd851 : toneR = D6;
14'd852 : toneR = D6; 14'd853 : toneR = D6; 14'd854 : toneR = D6; 14'd855 : toneR = 1;
14'd856 : toneR = C6; 14'd857 : toneR = C6; 14'd858 : toneR = C6; 14'd859 : toneR = C6;
14'd860 : toneR = C6; 14'd861 : toneR = C6; 14'd862 : toneR = C6; 14'd863 : toneR = 1;
14'd864 : toneR = Dsharp6; 14'd865 : toneR = Dsharp6; 14'd866 : toneR = Dsharp6; 14'd867 : toneR = Dsharp6;
14'd868 : toneR = Dsharp6; 14'd869 : toneR = Dsharp6; 14'd870 : toneR = Dsharp6; 14'd871 : toneR = 1;
14'd872 : toneR = Dsharp6; 14'd873 : toneR = Dsharp6; 14'd874 : toneR = Dsharp6; 14'd875 : toneR = 1;
14'd876 : toneR = E6; 14'd877 : toneR = E6; 14'd878 : toneR = E6; 14'd879 : toneR = E6;
14'd880 : toneR = E6; 14'd881 : toneR = E6; 14'd882 : toneR = E6; 14'd883 : toneR = E6;
14'd884 : toneR = E6; 14'd885 : toneR = E6; 14'd886 : toneR = E6; 14'd887 : toneR = 1;
14'd888 : toneR = 1; 14'd889 : toneR = 1; 14'd890 : toneR = 1; 14'd891 : toneR = 1;
14'd892 : toneR = 1; 14'd893 : toneR = 1; 14'd894 : toneR = 1; 14'd895 : toneR = 1;
/*measure 15 */
14'd896 : toneR = G6; 14'd897 : toneR = G6; 14'd898 : toneR = G6; 14'd899 : toneR = G6;
14'd900 : toneR = G6; 14'd901 : toneR = G6; 14'd902 : toneR = G6; 14'd903 : toneR = 1;
14'd904 : toneR = Fsharp6; 14'd905 : toneR = Fsharp6; 14'd906 : toneR = Fsharp6; 14'd907 : toneR = Fsharp6;
14'd908 : toneR = Fsharp6; 14'd909 : toneR = Fsharp6; 14'd910 : toneR = Fsharp6; 14'd911 : toneR = 1;
14'd912 : toneR = F6; 14'd913 : toneR = F6; 14'd914 : toneR = F6; 14'd915 : toneR = F6;
14'd916 : toneR = F6; 14'd917 : toneR = F6; 14'd918 : toneR = F6; 14'd919 : toneR = 1;
14'd920 : toneR = Dsharp6; 14'd921 : toneR = Dsharp6; 14'd922 : toneR = Dsharp6; 14'd923 : toneR = Dsharp6;
14'd924 : toneR = Dsharp6; 14'd925 : toneR = Dsharp6; 14'd926 : toneR = Dsharp6; 14'd927 : toneR = 1;
14'd928 : toneR = E6; 14'd929 : toneR = E6; 14'd930 : toneR = E6; 14'd931 : toneR = E6;
14'd932 : toneR = E6; 14'd933 : toneR = E6; 14'd934 : toneR = E6; 14'd935 : toneR = 1;
14'd936 : toneR = F6; 14'd937 : toneR = F6; 14'd938 : toneR = F6; 14'd939 : toneR = F6;
14'd940 : toneR = F6; 14'd941 : toneR = F6; 14'd942 : toneR = F6; 14'd943 : toneR = 1;
14'd944 : toneR = Fsharp6; 14'd945 : toneR = Fsharp6; 14'd946 : toneR = Fsharp6; 14'd947 : toneR = Fsharp6;
14'd948 : toneR = Fsharp6; 14'd949 : toneR = Fsharp6; 14'd950 : toneR = Fsharp6; 14'd951 : toneR = 1;
14'd952 : toneR = G6; 14'd953 : toneR = G6; 14'd954 : toneR = G6; 14'd955 : toneR = G6;
14'd956 : toneR = G6; 14'd957 : toneR = G6; 14'd958 : toneR = G6; 14'd959 : toneR = 1;
/*measure 16 */
14'd960 : toneR = Gsharp6; 14'd961 : toneR = Gsharp6; 14'd962 : toneR = Gsharp6; 14'd963 : toneR = Gsharp6;
14'd964 : toneR = Gsharp6; 14'd965 : toneR = Gsharp6; 14'd966 : toneR = Gsharp6; 14'd967 : toneR = 1;
14'd968 : toneR = Gsharp6; 14'd969 : toneR = Gsharp6; 14'd970 : toneR = Gsharp6; 14'd971 : toneR = Gsharp6;
14'd972 : toneR = Gsharp6; 14'd973 : toneR = Gsharp6; 14'd974 : toneR = Gsharp6; 14'd975 : toneR = 1;
14'd976 : toneR = A6; 14'd977 : toneR = A6; 14'd978 : toneR = A6; 14'd979 : toneR = A6;
14'd980 : toneR = A6; 14'd981 : toneR = A6; 14'd982 : toneR = A6; 14'd983 : toneR = 1;
14'd984 : toneR = A6; 14'd985 : toneR = A6; 14'd986 : toneR = A6; 14'd987 : toneR = A6;
14'd988 : toneR = A6; 14'd989 : toneR = A6; 14'd990 : toneR = A6; 14'd991 : toneR = 1;
14'd992 : toneR = B6; 14'd993 : toneR = B6; 14'd994 : toneR = B6; 14'd995 : toneR = B6;
14'd996 : toneR = B6; 14'd997 : toneR = B6; 14'd998 : toneR = B6; 14'd999 : toneR = B6;
14'd1000 : toneR = B6; 14'd1001 : toneR = B6; 14'd1002 : toneR = B6; 14'd1003 : toneR = B6;
14'd1004 : toneR = B6; 14'd1005 : toneR = B6; 14'd1006 : toneR = B6; 14'd1007 : toneR = 1;
14'd1008 : toneR = 1; 14'd1009 : toneR = 1; 14'd1010 : toneR = 1; 14'd1011 : toneR = 1;
14'd1012 : toneR = 1; 14'd1013 : toneR = 1; 14'd1014 : toneR = 1; 14'd1015 : toneR = 1;
14'd1016 : toneR = 1; 14'd1017 : toneR = 1; 14'd1018 : toneR = 1; 14'd1019 : toneR = 1;
14'd1020 : toneR = 1; 14'd1021 : toneR = 1; 14'd1022 : toneR = 1; 14'd1023 : toneR = 1;
/*measure 17 */
14'd1024 : toneR = A5; 14'd1025 : toneR = A5; 14'd1026 : toneR = A5; 14'd1027 : toneR = A5;
14'd1028 : toneR = A5; 14'd1029 : toneR = A5; 14'd1030 : toneR = A5; 14'd1031 : toneR = A5;
14'd1032 : toneR = A5; 14'd1033 : toneR = A5; 14'd1034 : toneR = A5; 14'd1035 : toneR = A5;
14'd1036 : toneR = A5; 14'd1037 : toneR = A5; 14'd1038 : toneR = A5; 14'd1039 : toneR = 1;
14'd1040 : toneR = C6; 14'd1041 : toneR = C6; 14'd1042 : toneR = C6; 14'd1043 : toneR = C6;
14'd1044 : toneR = C6; 14'd1045 : toneR = C6; 14'd1046 : toneR = C6; 14'd1047 : toneR = C6;
14'd1048 : toneR = C6; 14'd1049 : toneR = C6; 14'd1050 : toneR = C6; 14'd1051 : toneR = C6;
14'd1052 : toneR = C6; 14'd1053 : toneR = C6; 14'd1054 : toneR = C6; 14'd1055 : toneR = 1;
14'd1056 : toneR = Dsharp6; 14'd1057 : toneR = Dsharp6; 14'd1058 : toneR = Dsharp6; 14'd1059 : toneR = Dsharp6;
14'd1060 : toneR = Dsharp6; 14'd1061 : toneR = Dsharp6; 14'd1062 : toneR = Dsharp6; 14'd1063 : toneR = Dsharp6;
14'd1064 : toneR = Dsharp6; 14'd1065 : toneR = Dsharp6; 14'd1066 : toneR = Dsharp6; 14'd1067 : toneR = 1;
14'd1068 : toneR = E6; 14'd1069 : toneR = E6; 14'd1070 : toneR = E6; 14'd1071 : toneR = 1;
14'd1072 : toneR = 1; 14'd1073 : toneR = 1; 14'd1074 : toneR = 1; 14'd1075 : toneR = 1;
14'd1076 : toneR = 1; 14'd1077 : toneR = 1; 14'd1078 : toneR = 1; 14'd1079 : toneR = 1;
14'd1080 : toneR = Gsharp5; 14'd1081 : toneR = Gsharp5; 14'd1082 : toneR = Gsharp5; 14'd1083 : toneR = Gsharp5;
14'd1084 : toneR = Gsharp5; 14'd1085 : toneR = Gsharp5; 14'd1086 : toneR = Gsharp5; 14'd1087 : toneR = 1;
/*measure 18 */
14'd1088 : toneR = A5; 14'd1089 : toneR = A5; 14'd1090 : toneR = A5; 14'd1091 : toneR = A5;
14'd1092 : toneR = A5; 14'd1093 : toneR = A5; 14'd1094 : toneR = A5; 14'd1095 : toneR = 1;
14'd1096 : toneR = C6; 14'd1097 : toneR = C6; 14'd1098 : toneR = C6; 14'd1099 : toneR = C6;
14'd1100 : toneR = C6; 14'd1101 : toneR = C6; 14'd1102 : toneR = C6; 14'd1103 : toneR = 1;
14'd1104 : toneR = D6; 14'd1105 : toneR = D6; 14'd1106 : toneR = D6; 14'd1107 : toneR = D6;
14'd1108 : toneR = D6; 14'd1109 : toneR = D6; 14'd1110 : toneR = D6; 14'd1111 : toneR = 1;
14'd1112 : toneR = C6; 14'd1113 : toneR = C6; 14'd1114 : toneR = C6; 14'd1115 : toneR = C6;
14'd1116 : toneR = C6; 14'd1117 : toneR = C6; 14'd1118 : toneR = C6; 14'd1119 : toneR = 1;
14'd1120 : toneR = Dsharp6; 14'd1121 : toneR = Dsharp6; 14'd1122 : toneR = Dsharp6; 14'd1123 : toneR = Dsharp6;
14'd1124 : toneR = Dsharp6; 14'd1125 : toneR = Dsharp6; 14'd1126 : toneR = Dsharp6; 14'd1127 : toneR = 1;
14'd1128 : toneR = Dsharp6; 14'd1129 : toneR = Dsharp6; 14'd1130 : toneR = Dsharp6; 14'd1131 : toneR = 1;
14'd1132 : toneR = E6; 14'd1133 : toneR = E6; 14'd1134 : toneR = E6; 14'd1135 : toneR = E6;
14'd1136 : toneR = E6; 14'd1137 : toneR = E6; 14'd1138 : toneR = E6; 14'd1139 : toneR = E6;
14'd1140 : toneR = E6; 14'd1141 : toneR = E6; 14'd1142 : toneR = E6; 14'd1143 : toneR = 1;
14'd1144 : toneR = 1; 14'd1145 : toneR = 1; 14'd1146 : toneR = 1; 14'd1147 : toneR = 1;
14'd1148 : toneR = 1; 14'd1149 : toneR = 1; 14'd1150 : toneR = 1; 14'd1151 : toneR = 1;
/*measure 19 */
14'd1152 : toneR = G6; 14'd1153 : toneR = G6; 14'd1154 : toneR = G6; 14'd1155 : toneR = G6;
14'd1156 : toneR = G6; 14'd1157 : toneR = G6; 14'd1158 : toneR = G6; 14'd1159 : toneR = 1;
14'd1160 : toneR = Fsharp6; 14'd1161 : toneR = Fsharp6; 14'd1162 : toneR = Fsharp6; 14'd1163 : toneR = Fsharp6;
14'd1164 : toneR = Fsharp6; 14'd1165 : toneR = Fsharp6; 14'd1166 : toneR = Fsharp6; 14'd1167 : toneR = 1;
14'd1168 : toneR = F6; 14'd1169 : toneR = F6; 14'd1170 : toneR = F6; 14'd1171 : toneR = F6;
14'd1172 : toneR = F6; 14'd1173 : toneR = F6; 14'd1174 : toneR = F6; 14'd1175 : toneR = 1;
14'd1176 : toneR = Dsharp6; 14'd1177 : toneR = Dsharp6; 14'd1178 : toneR = Dsharp6; 14'd1179 : toneR = Dsharp6;
14'd1180 : toneR = Dsharp6; 14'd1181 : toneR = Dsharp6; 14'd1182 : toneR = Dsharp6; 14'd1183 : toneR = 1;
14'd1184 : toneR = D6; 14'd1185 : toneR = D6; 14'd1186 : toneR = D6; 14'd1187 : toneR = D6;
14'd1188 : toneR = D6; 14'd1189 : toneR = D6; 14'd1190 : toneR = D6; 14'd1191 : toneR = 1;
14'd1192 : toneR = C6; 14'd1193 : toneR = C6; 14'd1194 : toneR = C6; 14'd1195 : toneR = C6;
14'd1196 : toneR = C6; 14'd1197 : toneR = C6; 14'd1198 : toneR = C6; 14'd1199 : toneR = 1;
14'd1200 : toneR = B5; 14'd1201 : toneR = B5; 14'd1202 : toneR = B5; 14'd1203 : toneR = B5;
14'd1204 : toneR = B5; 14'd1205 : toneR = B5; 14'd1206 : toneR = B5; 14'd1207 : toneR = 1;
14'd1208 : toneR = Asharp5; 14'd1209 : toneR = Asharp5; 14'd1210 : toneR = Asharp5; 14'd1211 : toneR = Asharp5;
14'd1212 : toneR = Asharp5; 14'd1213 : toneR = Asharp5; 14'd1214 : toneR = Asharp5; 14'd1215 : toneR = 1;
/*measure 20 */
14'd1216 : toneR = B5; 14'd1217 : toneR = B5; 14'd1218 : toneR = B5; 14'd1219 : toneR = B5;
14'd1220 : toneR = B5; 14'd1221 : toneR = B5; 14'd1222 : toneR = B5; 14'd1223 : toneR = 1;
14'd1224 : toneR = C6; 14'd1225 : toneR = C6; 14'd1226 : toneR = C6; 14'd1227 : toneR = C6;
14'd1228 : toneR = C6; 14'd1229 : toneR = C6; 14'd1230 : toneR = C6; 14'd1231 : toneR = 1;
14'd1232 : toneR = D6; 14'd1233 : toneR = D6; 14'd1234 : toneR = D6; 14'd1235 : toneR = D6;
14'd1236 : toneR = D6; 14'd1237 : toneR = D6; 14'd1238 : toneR = D6; 14'd1239 : toneR = 1;
14'd1240 : toneR = Dsharp6; 14'd1241 : toneR = Dsharp6; 14'd1242 : toneR = Dsharp6; 14'd1243 : toneR = Dsharp6;
14'd1244 : toneR = Dsharp6; 14'd1245 : toneR = Dsharp6; 14'd1246 : toneR = Dsharp6; 14'd1247 : toneR = 1;
14'd1248 : toneR = E6; 14'd1249 : toneR = E6; 14'd1250 : toneR = E6; 14'd1251 : toneR = E6;
14'd1252 : toneR = E6; 14'd1253 : toneR = E6; 14'd1254 : toneR = E6; 14'd1255 : toneR = E6;
14'd1256 : toneR = E6; 14'd1257 : toneR = E6; 14'd1258 : toneR = E6; 14'd1259 : toneR = E6;
14'd1260 : toneR = E6; 14'd1261 : toneR = E6; 14'd1262 : toneR = E6; 14'd1263 : toneR = 1;
14'd1264 : toneR = E5; 14'd1265 : toneR = E5; 14'd1266 : toneR = E5; 14'd1267 : toneR = E5;
14'd1268 : toneR = E5; 14'd1269 : toneR = E5; 14'd1270 : toneR = E5; 14'd1271 : toneR = E5;
14'd1272 : toneR = E5; 14'd1273 : toneR = E5; 14'd1274 : toneR = E5; 14'd1275 : toneR = E5;
14'd1276 : toneR = E5; 14'd1277 : toneR = E5; 14'd1278 : toneR = E5; 14'd1279 : toneR = 1;
/*measure 21 */
14'd1280 : toneR = A5; 14'd1281 : toneR = A5; 14'd1282 : toneR = A5; 14'd1283 : toneR = A5;
14'd1284 : toneR = A5; 14'd1285 : toneR = A5; 14'd1286 : toneR = A5; 14'd1287 : toneR = A5;
14'd1288 : toneR = A5; 14'd1289 : toneR = A5; 14'd1290 : toneR = A5; 14'd1291 : toneR = A5;
14'd1292 : toneR = A5; 14'd1293 : toneR = A5; 14'd1294 : toneR = A5; 14'd1295 : toneR = 1;
14'd1296 : toneR = C6; 14'd1297 : toneR = C6; 14'd1298 : toneR = C6; 14'd1299 : toneR = C6;
14'd1300 : toneR = C6; 14'd1301 : toneR = C6; 14'd1302 : toneR = C6; 14'd1303 : toneR = C6;
14'd1304 : toneR = C6; 14'd1305 : toneR = C6; 14'd1306 : toneR = C6; 14'd1307 : toneR = C6;
14'd1308 : toneR = C6; 14'd1309 : toneR = C6; 14'd1310 : toneR = C6; 14'd1311 : toneR = 1;
14'd1312 : toneR = Dsharp6; 14'd1313 : toneR = Dsharp6; 14'd1314 : toneR = Dsharp6; 14'd1315 : toneR = Dsharp6;
14'd1316 : toneR = Dsharp6; 14'd1317 : toneR = Dsharp6; 14'd1318 : toneR = Dsharp6; 14'd1319 : toneR = Dsharp6;
14'd1320 : toneR = Dsharp6; 14'd1321 : toneR = Dsharp6; 14'd1322 : toneR = Dsharp6; 14'd1323 : toneR = 1;
14'd1324 : toneR = E6; 14'd1325 : toneR = E6; 14'd1326 : toneR = E6; 14'd1327 : toneR = 1;
14'd1328 : toneR = 1; 14'd1329 : toneR = 1; 14'd1330 : toneR = 1; 14'd1331 : toneR = 1;
14'd1332 : toneR = 1; 14'd1333 : toneR = 1; 14'd1334 : toneR = 1; 14'd1335 : toneR = 1;
14'd1336 : toneR = Gsharp5; 14'd1337 : toneR = Gsharp5; 14'd1338 : toneR = Gsharp5; 14'd1339 : toneR = Gsharp5;
14'd1340 : toneR = Gsharp5; 14'd1341 : toneR = Gsharp5; 14'd1342 : toneR = Gsharp5; 14'd1343 : toneR = 1;
/*measure 22 */
14'd1344 : toneR = A5; 14'd1345 : toneR = A5; 14'd1346 : toneR = A5; 14'd1347 : toneR = A5;
14'd1348 : toneR = A5; 14'd1349 : toneR = A5; 14'd1350 : toneR = A5; 14'd1351 : toneR = 1;
14'd1352 : toneR = C6; 14'd1353 : toneR = C6; 14'd1354 : toneR = C6; 14'd1355 : toneR = C6;
14'd1356 : toneR = C6; 14'd1357 : toneR = C6; 14'd1358 : toneR = C6; 14'd1359 : toneR = 1;
14'd1360 : toneR = D6; 14'd1361 : toneR = D6; 14'd1362 : toneR = D6; 14'd1363 : toneR = D6;
14'd1364 : toneR = D6; 14'd1365 : toneR = D6; 14'd1366 : toneR = D6; 14'd1367 : toneR = 1;
14'd1368 : toneR = C6; 14'd1369 : toneR = C6; 14'd1370 : toneR = C6; 14'd1371 : toneR = C6;
14'd1372 : toneR = C6; 14'd1373 : toneR = C6; 14'd1374 : toneR = C6; 14'd1375 : toneR = 1;
14'd1376 : toneR = Dsharp6; 14'd1377 : toneR = Dsharp6; 14'd1378 : toneR = Dsharp6; 14'd1379 : toneR = Dsharp6;
14'd1380 : toneR = Dsharp6; 14'd1381 : toneR = Dsharp6; 14'd1382 : toneR = Dsharp6; 14'd1383 : toneR = 1;
14'd1384 : toneR = Dsharp6; 14'd1385 : toneR = Dsharp6; 14'd1386 : toneR = Dsharp6; 14'd1387 : toneR = 1;
14'd1388 : toneR = E6; 14'd1389 : toneR = E6; 14'd1390 : toneR = E6; 14'd1391 : toneR = E6;
14'd1392 : toneR = E6; 14'd1393 : toneR = E6; 14'd1394 : toneR = E6; 14'd1395 : toneR = E6;
14'd1396 : toneR = E6; 14'd1397 : toneR = E6; 14'd1398 : toneR = E6; 14'd1399 : toneR = 1;
14'd1400 : toneR = 1; 14'd1401 : toneR = 1; 14'd1402 : toneR = 1; 14'd1403 : toneR = 1;
14'd1404 : toneR = 1; 14'd1405 : toneR = 1; 14'd1406 : toneR = 1; 14'd1407 : toneR = 1;
/*measure 23 */
14'd1408 : toneR = G6; 14'd1409 : toneR = G6; 14'd1410 : toneR = G6; 14'd1411 : toneR = G6;
14'd1412 : toneR = G6; 14'd1413 : toneR = G6; 14'd1414 : toneR = G6; 14'd1415 : toneR = 1;
14'd1416 : toneR = Fsharp6; 14'd1417 : toneR = Fsharp6; 14'd1418 : toneR = Fsharp6; 14'd1419 : toneR = Fsharp6;
14'd1420 : toneR = Fsharp6; 14'd1421 : toneR = Fsharp6; 14'd1422 : toneR = Fsharp6; 14'd1423 : toneR = 1;
14'd1424 : toneR = F6; 14'd1425 : toneR = F6; 14'd1426 : toneR = F6; 14'd1427 : toneR = F6;
14'd1428 : toneR = F6; 14'd1429 : toneR = F6; 14'd1430 : toneR = F6; 14'd1431 : toneR = 1;
14'd1432 : toneR = Dsharp6; 14'd1433 : toneR = Dsharp6; 14'd1434 : toneR = Dsharp6; 14'd1435 : toneR = Dsharp6;
14'd1436 : toneR = Dsharp6; 14'd1437 : toneR = Dsharp6; 14'd1438 : toneR = Dsharp6; 14'd1439 : toneR = 1;
14'd1440 : toneR = E6; 14'd1441 : toneR = E6; 14'd1442 : toneR = E6; 14'd1443 : toneR = E6;
14'd1444 : toneR = E6; 14'd1445 : toneR = E6; 14'd1446 : toneR = E6; 14'd1447 : toneR = 1;
14'd1448 : toneR = F6; 14'd1449 : toneR = F6; 14'd1450 : toneR = F6; 14'd1451 : toneR = F6;
14'd1452 : toneR = F6; 14'd1453 : toneR = F6; 14'd1454 : toneR = F6; 14'd1455 : toneR = 1;
14'd1456 : toneR = Fsharp6; 14'd1457 : toneR = Fsharp6; 14'd1458 : toneR = Fsharp6; 14'd1459 : toneR = Fsharp6;
14'd1460 : toneR = Fsharp6; 14'd1461 : toneR = Fsharp6; 14'd1462 : toneR = Fsharp6; 14'd1463 : toneR = 1;
14'd1464 : toneR = G6; 14'd1465 : toneR = G6; 14'd1466 : toneR = G6; 14'd1467 : toneR = G6;
14'd1468 : toneR = G6; 14'd1469 : toneR = G6; 14'd1470 : toneR = G6; 14'd1471 : toneR = 1;
/*measure 24 */
14'd1472 : toneR = Gsharp6; 14'd1473 : toneR = Gsharp6; 14'd1474 : toneR = Gsharp6; 14'd1475 : toneR = Gsharp6;
14'd1476 : toneR = Gsharp6; 14'd1477 : toneR = Gsharp6; 14'd1478 : toneR = Gsharp6; 14'd1479 : toneR = 1;
14'd1480 : toneR = Gsharp6; 14'd1481 : toneR = Gsharp6; 14'd1482 : toneR = Gsharp6; 14'd1483 : toneR = Gsharp6;
14'd1484 : toneR = Gsharp6; 14'd1485 : toneR = Gsharp6; 14'd1486 : toneR = Gsharp6; 14'd1487 : toneR = 1;
14'd1488 : toneR = A6; 14'd1489 : toneR = A6; 14'd1490 : toneR = A6; 14'd1491 : toneR = A6;
14'd1492 : toneR = A6; 14'd1493 : toneR = A6; 14'd1494 : toneR = A6; 14'd1495 : toneR = 1;
14'd1496 : toneR = A6; 14'd1497 : toneR = A6; 14'd1498 : toneR = A6; 14'd1499 : toneR = A6;
14'd1500 : toneR = A6; 14'd1501 : toneR = A6; 14'd1502 : toneR = A6; 14'd1503 : toneR = 1;
14'd1504 : toneR = B6; 14'd1505 : toneR = B6; 14'd1506 : toneR = B6; 14'd1507 : toneR = B6;
14'd1508 : toneR = B6; 14'd1509 : toneR = B6; 14'd1510 : toneR = B6; 14'd1511 : toneR = B6;
14'd1512 : toneR = B6; 14'd1513 : toneR = B6; 14'd1514 : toneR = B6; 14'd1515 : toneR = B6;
14'd1516 : toneR = B6; 14'd1517 : toneR = B6; 14'd1518 : toneR = B6; 14'd1519 : toneR = 1;
14'd1520 : toneR = 1; 14'd1521 : toneR = 1; 14'd1522 : toneR = 1; 14'd1523 : toneR = 1;
14'd1524 : toneR = 1; 14'd1525 : toneR = 1; 14'd1526 : toneR = 1; 14'd1527 : toneR = 1;
14'd1528 : toneR = 1; 14'd1529 : toneR = 1; 14'd1530 : toneR = 1; 14'd1531 : toneR = 1;
14'd1532 : toneR = 1; 14'd1533 : toneR = 1; 14'd1534 : toneR = 1; 14'd1535 : toneR = 1;
/*measure 25 */
14'd1536 : toneR = E5; 14'd1537 : toneR = E5; 14'd1538 : toneR = E5; 14'd1539 : toneR = E5;
14'd1540 : toneR = E5; 14'd1541 : toneR = E5; 14'd1542 : toneR = E5; 14'd1543 : toneR = 1;
14'd1544 : toneR = Eflat5; 14'd1545 : toneR = Eflat5; 14'd1546 : toneR = Eflat5; 14'd1547 : toneR = Eflat5;
14'd1548 : toneR = Eflat5; 14'd1549 : toneR = Eflat5; 14'd1550 : toneR = Eflat5; 14'd1551 : toneR = 1;
14'd1552 : toneR = E5; 14'd1553 : toneR = E5; 14'd1554 : toneR = E5; 14'd1555 : toneR = E5;
14'd1556 : toneR = E5; 14'd1557 : toneR = E5; 14'd1558 : toneR = E5; 14'd1559 : toneR = 1;
14'd1560 : toneR = F5; 14'd1561 : toneR = F5; 14'd1562 : toneR = F5; 14'd1563 : toneR = F5;
14'd1564 : toneR = F5; 14'd1565 : toneR = F5; 14'd1566 : toneR = F5; 14'd1567 : toneR = 1;
14'd1568 : toneR = E5; 14'd1569 : toneR = E5; 14'd1570 : toneR = E5; 14'd1571 : toneR = E5;
14'd1572 : toneR = E5; 14'd1573 : toneR = E5; 14'd1574 : toneR = E5; 14'd1575 : toneR = 1;
14'd1576 : toneR = D5; 14'd1577 : toneR = D5; 14'd1578 : toneR = D5; 14'd1579 : toneR = D5;
14'd1580 : toneR = D5; 14'd1581 : toneR = D5; 14'd1582 : toneR = D5; 14'd1583 : toneR = 1;
14'd1584 : toneR = C5; 14'd1585 : toneR = C5; 14'd1586 : toneR = C5; 14'd1587 : toneR = C5;
14'd1588 : toneR = C5; 14'd1589 : toneR = C5; 14'd1590 : toneR = C5; 14'd1591 : toneR = 1;
14'd1592 : toneR = D5; 14'd1593 : toneR = D5; 14'd1594 : toneR = D5; 14'd1595 : toneR = D5;
14'd1596 : toneR = D5; 14'd1597 : toneR = D5; 14'd1598 : toneR = D5; 14'd1599 : toneR = 1;
/*measure 26 */
14'd1600 : toneR = E5; 14'd1601 : toneR = E5; 14'd1602 : toneR = E5; 14'd1603 : toneR = E5;
14'd1604 : toneR = E5; 14'd1605 : toneR = E5; 14'd1606 : toneR = E5; 14'd1607 : toneR = 1;
14'd1608 : toneR = Eflat5; 14'd1609 : toneR = Eflat5; 14'd1610 : toneR = Eflat5; 14'd1611 : toneR = Eflat5;
14'd1612 : toneR = Eflat5; 14'd1613 : toneR = Eflat5; 14'd1614 : toneR = Eflat5; 14'd1615 : toneR = 1;
14'd1616 : toneR = E5; 14'd1617 : toneR = E5; 14'd1618 : toneR = E5; 14'd1619 : toneR = E5;
14'd1620 : toneR = E5; 14'd1621 : toneR = E5; 14'd1622 : toneR = E5; 14'd1623 : toneR = 1;
14'd1624 : toneR = F5; 14'd1625 : toneR = F5; 14'd1626 : toneR = F5; 14'd1627 : toneR = F5;
14'd1628 : toneR = F5; 14'd1629 : toneR = F5; 14'd1630 : toneR = F5; 14'd1631 : toneR = 1;
14'd1632 : toneR = E5; 14'd1633 : toneR = E5; 14'd1634 : toneR = E5; 14'd1635 : toneR = E5;
14'd1636 : toneR = E5; 14'd1637 : toneR = E5; 14'd1638 : toneR = E5; 14'd1639 : toneR = 1;
14'd1640 : toneR = D5; 14'd1641 : toneR = D5; 14'd1642 : toneR = D5; 14'd1643 : toneR = D5;
14'd1644 : toneR = D5; 14'd1645 : toneR = D5; 14'd1646 : toneR = D5; 14'd1647 : toneR = 1;
14'd1648 : toneR = C5; 14'd1649 : toneR = C5; 14'd1650 : toneR = C5; 14'd1651 : toneR = C5;
14'd1652 : toneR = C5; 14'd1653 : toneR = C5; 14'd1654 : toneR = C5; 14'd1655 : toneR = 1;
14'd1656 : toneR = B4; 14'd1657 : toneR = B4; 14'd1658 : toneR = B4; 14'd1659 : toneR = B4;
14'd1660 : toneR = B4; 14'd1661 : toneR = B4; 14'd1662 : toneR = B4; 14'd1663 : toneR = 1;
/*measure 27 */
14'd1664 : toneR = A4; 14'd1665 : toneR = A4; 14'd1666 : toneR = A4; 14'd1667 : toneR = A4;
14'd1668 : toneR = A4; 14'd1669 : toneR = A4; 14'd1670 : toneR = A4; 14'd1671 : toneR = A4;
14'd1672 : toneR = A4; 14'd1673 : toneR = A4; 14'd1674 : toneR = A4; 14'd1675 : toneR = A4;
14'd1676 : toneR = A4; 14'd1677 : toneR = A4; 14'd1678 : toneR = A4; 14'd1679 : toneR = 1;
14'd1680 : toneR = A6; 14'd1681 : toneR = A6; 14'd1682 : toneR = A6; 14'd1683 : toneR = A6;
14'd1684 : toneR = A6; 14'd1685 : toneR = A6; 14'd1686 : toneR = A6; 14'd1687 : toneR = 1;
14'd1688 : toneR = A5; 14'd1689 : toneR = A5; 14'd1690 : toneR = A5; 14'd1691 : toneR = A5;
14'd1692 : toneR = A5; 14'd1693 : toneR = A5; 14'd1694 : toneR = A5; 14'd1695 : toneR = 1;
14'd1696 : toneR = Gsharp6; 14'd1697 : toneR = Gsharp6; 14'd1698 : toneR = Gsharp6; 14'd1699 : toneR = Gsharp6;
14'd1700 : toneR = Gsharp6; 14'd1701 : toneR = Gsharp6; 14'd1702 : toneR = Gsharp6; 14'd1703 : toneR = 1;
14'd1704 : toneR = Gsharp5; 14'd1705 : toneR = Gsharp5; 14'd1706 : toneR = Gsharp5; 14'd1707 : toneR = Gsharp5;
14'd1708 : toneR = Gsharp5; 14'd1709 : toneR = Gsharp5; 14'd1710 : toneR = Gsharp5; 14'd1711 : toneR = 1;
14'd1712 : toneR = G6; 14'd1713 : toneR = G6; 14'd1714 : toneR = G6; 14'd1715 : toneR = G6;
14'd1716 : toneR = G6; 14'd1717 : toneR = G6; 14'd1718 : toneR = G6; 14'd1719 : toneR = 1;
14'd1720 : toneR = G5; 14'd1721 : toneR = G5; 14'd1722 : toneR = G5; 14'd1723 : toneR = G5;
14'd1724 : toneR = G5; 14'd1725 : toneR = G5; 14'd1726 : toneR = G5; 14'd1727 : toneR = 1;
/*measure 28 */
14'd1728 : toneR = Fsharp6; 14'd1729 : toneR = Fsharp6; 14'd1730 : toneR = Fsharp6; 14'd1731 : toneR = Fsharp6;
14'd1732 : toneR = Fsharp6; 14'd1733 : toneR = Fsharp6; 14'd1734 : toneR = Fsharp6; 14'd1735 : toneR = 1;
14'd1736 : toneR = Fsharp5; 14'd1737 : toneR = Fsharp5; 14'd1738 : toneR = Fsharp5; 14'd1739 : toneR = Fsharp5;
14'd1740 : toneR = Fsharp5; 14'd1741 : toneR = Fsharp5; 14'd1742 : toneR = Fsharp5; 14'd1743 : toneR = 1;
14'd1744 : toneR = F6; 14'd1745 : toneR = F6; 14'd1746 : toneR = F6; 14'd1747 : toneR = F6;
14'd1748 : toneR = F6; 14'd1749 : toneR = F6; 14'd1750 : toneR = F6; 14'd1751 : toneR = 1;
14'd1752 : toneR = F5; 14'd1753 : toneR = F5; 14'd1754 : toneR = F5; 14'd1755 : toneR = F5;
14'd1756 : toneR = F5; 14'd1757 : toneR = F5; 14'd1758 : toneR = F5; 14'd1759 : toneR = 1;
14'd1760 : toneR = Dsharp6; 14'd1761 : toneR = Dsharp6; 14'd1762 : toneR = Dsharp6; 14'd1763 : toneR = Dsharp6;
14'd1764 : toneR = Dsharp6; 14'd1765 : toneR = Dsharp6; 14'd1766 : toneR = Dsharp6; 14'd1767 : toneR = 1;
14'd1768 : toneR = Dsharp5; 14'd1769 : toneR = Dsharp5; 14'd1770 : toneR = Dsharp5; 14'd1771 : toneR = Dsharp5;
14'd1772 : toneR = Dsharp5; 14'd1773 : toneR = Dsharp5; 14'd1774 : toneR = Dsharp5; 14'd1775 : toneR = 1;
14'd1776 : toneR = E6; 14'd1777 : toneR = E6; 14'd1778 : toneR = E6; 14'd1779 : toneR = E6;
14'd1780 : toneR = E6; 14'd1781 : toneR = E6; 14'd1782 : toneR = E6; 14'd1783 : toneR = 1;
14'd1784 : toneR = E5; 14'd1785 : toneR = E5; 14'd1786 : toneR = E5; 14'd1787 : toneR = E5;
14'd1788 : toneR = E5; 14'd1789 : toneR = E5; 14'd1790 : toneR = E5; 14'd1791 : toneR = 1;
/*measure 29 */
14'd1792 : toneR = E5; 14'd1793 : toneR = E5; 14'd1794 : toneR = E5; 14'd1795 : toneR = E5;
14'd1796 : toneR = E5; 14'd1797 : toneR = E5; 14'd1798 : toneR = E5; 14'd1799 : toneR = 1;
14'd1800 : toneR = Eflat5; 14'd1801 : toneR = Eflat5; 14'd1802 : toneR = Eflat5; 14'd1803 : toneR = Eflat5;
14'd1804 : toneR = Eflat5; 14'd1805 : toneR = Eflat5; 14'd1806 : toneR = Eflat5; 14'd1807 : toneR = 1;
14'd1808 : toneR = E5; 14'd1809 : toneR = E5; 14'd1810 : toneR = E5; 14'd1811 : toneR = E5;
14'd1812 : toneR = E5; 14'd1813 : toneR = E5; 14'd1814 : toneR = E5; 14'd1815 : toneR = 1;
14'd1816 : toneR = F5; 14'd1817 : toneR = F5; 14'd1818 : toneR = F5; 14'd1819 : toneR = F5;
14'd1820 : toneR = F5; 14'd1821 : toneR = F5; 14'd1822 : toneR = F5; 14'd1823 : toneR = 1;
14'd1824 : toneR = E5; 14'd1825 : toneR = E5; 14'd1826 : toneR = E5; 14'd1827 : toneR = E5;
14'd1828 : toneR = E5; 14'd1829 : toneR = E5; 14'd1830 : toneR = E5; 14'd1831 : toneR = 1;
14'd1832 : toneR = D5; 14'd1833 : toneR = D5; 14'd1834 : toneR = D5; 14'd1835 : toneR = D5;
14'd1836 : toneR = D5; 14'd1837 : toneR = D5; 14'd1838 : toneR = D5; 14'd1839 : toneR = 1;
14'd1840 : toneR = C5; 14'd1841 : toneR = C5; 14'd1842 : toneR = C5; 14'd1843 : toneR = C5;
14'd1844 : toneR = C5; 14'd1845 : toneR = C5; 14'd1846 : toneR = C5; 14'd1847 : toneR = 1;
14'd1848 : toneR = D5; 14'd1849 : toneR = D5; 14'd1850 : toneR = D5; 14'd1851 : toneR = D5;
14'd1852 : toneR = D5; 14'd1853 : toneR = D5; 14'd1854 : toneR = D5; 14'd1855 : toneR = 1;
/*measure 30 */
14'd1856 : toneR = E5; 14'd1857 : toneR = E5; 14'd1858 : toneR = E5; 14'd1859 : toneR = E5;
14'd1860 : toneR = E5; 14'd1861 : toneR = E5; 14'd1862 : toneR = E5; 14'd1863 : toneR = 1;
14'd1864 : toneR = Eflat5; 14'd1865 : toneR = Eflat5; 14'd1866 : toneR = Eflat5; 14'd1867 : toneR = Eflat5;
14'd1868 : toneR = Eflat5; 14'd1869 : toneR = Eflat5; 14'd1870 : toneR = Eflat5; 14'd1871 : toneR = 1;
14'd1872 : toneR = E5; 14'd1873 : toneR = E5; 14'd1874 : toneR = E5; 14'd1875 : toneR = E5;
14'd1876 : toneR = E5; 14'd1877 : toneR = E5; 14'd1878 : toneR = E5; 14'd1879 : toneR = 1;
14'd1880 : toneR = F5; 14'd1881 : toneR = F5; 14'd1882 : toneR = F5; 14'd1883 : toneR = F5;
14'd1884 : toneR = F5; 14'd1885 : toneR = F5; 14'd1886 : toneR = F5; 14'd1887 : toneR = 1;
14'd1888 : toneR = E5; 14'd1889 : toneR = E5; 14'd1890 : toneR = E5; 14'd1891 : toneR = E5;
14'd1892 : toneR = E5; 14'd1893 : toneR = E5; 14'd1894 : toneR = E5; 14'd1895 : toneR = 1;
14'd1896 : toneR = D5; 14'd1897 : toneR = D5; 14'd1898 : toneR = D5; 14'd1899 : toneR = D5;
14'd1900 : toneR = D5; 14'd1901 : toneR = D5; 14'd1902 : toneR = D5; 14'd1903 : toneR = 1;
14'd1904 : toneR = C5; 14'd1905 : toneR = C5; 14'd1906 : toneR = C5; 14'd1907 : toneR = C5;
14'd1908 : toneR = C5; 14'd1909 : toneR = C5; 14'd1910 : toneR = C5; 14'd1911 : toneR = 1;
14'd1912 : toneR = D5; 14'd1913 : toneR = D5; 14'd1914 : toneR = D5; 14'd1915 : toneR = D5;
14'd1916 : toneR = D5; 14'd1917 : toneR = D5; 14'd1918 : toneR = D5; 14'd1919 : toneR = 1;
/*measure 31 */
14'd1920 : toneR = E5; 14'd1921 : toneR = E5; 14'd1922 : toneR = E5; 14'd1923 : toneR = E5;
14'd1924 : toneR = E5; 14'd1925 : toneR = E5; 14'd1926 : toneR = E5; 14'd1927 : toneR = E5;
14'd1928 : toneR = E5; 14'd1929 : toneR = E5; 14'd1930 : toneR = E5; 14'd1931 : toneR = E5;
14'd1932 : toneR = E5; 14'd1933 : toneR = E5; 14'd1934 : toneR = E5; 14'd1935 : toneR = 1;
14'd1936 : toneR = A4; 14'd1937 : toneR = A4; 14'd1938 : toneR = A4; 14'd1939 : toneR = A4;
14'd1940 : toneR = A4; 14'd1941 : toneR = A4; 14'd1942 : toneR = A4; 14'd1943 : toneR = 1;
14'd1944 : toneR = A5; 14'd1945 : toneR = A5; 14'd1946 : toneR = A5; 14'd1947 : toneR = A5;
14'd1948 : toneR = A5; 14'd1949 : toneR = A5; 14'd1950 : toneR = A5; 14'd1951 : toneR = 1;
14'd1952 : toneR = B4; 14'd1953 : toneR = B4; 14'd1954 : toneR = B4; 14'd1955 : toneR = B4;
14'd1956 : toneR = B4; 14'd1957 : toneR = B4; 14'd1958 : toneR = B4; 14'd1959 : toneR = 1;
14'd1960 : toneR = B5; 14'd1961 : toneR = B5; 14'd1962 : toneR = B5; 14'd1963 : toneR = B5;
14'd1964 : toneR = B5; 14'd1965 : toneR = B5; 14'd1966 : toneR = B5; 14'd1967 : toneR = 1;
14'd1968 : toneR = C5; 14'd1969 : toneR = C5; 14'd1970 : toneR = C5; 14'd1971 : toneR = C5;
14'd1972 : toneR = C5; 14'd1973 : toneR = C5; 14'd1974 : toneR = C5; 14'd1975 : toneR = 1;
14'd1976 : toneR = C6; 14'd1977 : toneR = C6; 14'd1978 : toneR = C6; 14'd1979 : toneR = C6;
14'd1980 : toneR = C6; 14'd1981 : toneR = C6; 14'd1982 : toneR = C6; 14'd1983 : toneR = 1;
/*measure 32 */
14'd1984 : toneR = Csharp5; 14'd1985 : toneR = Csharp5; 14'd1986 : toneR = Csharp5; 14'd1987 : toneR = Csharp5;
14'd1988 : toneR = Csharp5; 14'd1989 : toneR = Csharp5; 14'd1990 : toneR = Csharp5; 14'd1991 : toneR = 1;
14'd1992 : toneR = Csharp6; 14'd1993 : toneR = Csharp6; 14'd1994 : toneR = Csharp6; 14'd1995 : toneR = Csharp6;
14'd1996 : toneR = Csharp6; 14'd1997 : toneR = Csharp6; 14'd1998 : toneR = Csharp6; 14'd1999 : toneR = 1;
14'd2000 : toneR = D5; 14'd2001 : toneR = D5; 14'd2002 : toneR = D5; 14'd2003 : toneR = D5;
14'd2004 : toneR = D5; 14'd2005 : toneR = D5; 14'd2006 : toneR = D5; 14'd2007 : toneR = 1;
14'd2008 : toneR = D6; 14'd2009 : toneR = D6; 14'd2010 : toneR = D6; 14'd2011 : toneR = D6;
14'd2012 : toneR = D6; 14'd2013 : toneR = D6; 14'd2014 : toneR = D6; 14'd2015 : toneR = 1;
14'd2016 : toneR = F5; 14'd2017 : toneR = F5; 14'd2018 : toneR = F5; 14'd2019 : toneR = F5;
14'd2020 : toneR = F5; 14'd2021 : toneR = F5; 14'd2022 : toneR = F5; 14'd2023 : toneR = 1;
14'd2024 : toneR = F6; 14'd2025 : toneR = F6; 14'd2026 : toneR = F6; 14'd2027 : toneR = F6;
14'd2028 : toneR = F6; 14'd2029 : toneR = F6; 14'd2030 : toneR = F6; 14'd2031 : toneR = 1;
14'd2032 : toneR = E5; 14'd2033 : toneR = E5; 14'd2034 : toneR = E5; 14'd2035 : toneR = E5;
14'd2036 : toneR = E5; 14'd2037 : toneR = E5; 14'd2038 : toneR = E5; 14'd2039 : toneR = 1;
14'd2040 : toneR = E6; 14'd2041 : toneR = E6; 14'd2042 : toneR = E6; 14'd2043 : toneR = E6;
14'd2044 : toneR = E6; 14'd2045 : toneR = E6; 14'd2046 : toneR = E6; 14'd2047 : toneR = 1;
/*measure 33 */
14'd2048 : toneR = E5; 14'd2049 : toneR = E5; 14'd2050 : toneR = E5; 14'd2051 : toneR = E5;
14'd2052 : toneR = E5; 14'd2053 : toneR = E5; 14'd2054 : toneR = E5; 14'd2055 : toneR = 1;
14'd2056 : toneR = Eflat5; 14'd2057 : toneR = Eflat5; 14'd2058 : toneR = Eflat5; 14'd2059 : toneR = Eflat5;
14'd2060 : toneR = Eflat5; 14'd2061 : toneR = Eflat5; 14'd2062 : toneR = Eflat5; 14'd2063 : toneR = 1;
14'd2064 : toneR = E5; 14'd2065 : toneR = E5; 14'd2066 : toneR = E5; 14'd2067 : toneR = E5;
14'd2068 : toneR = E5; 14'd2069 : toneR = E5; 14'd2070 : toneR = E5; 14'd2071 : toneR = 1;
14'd2072 : toneR = F5; 14'd2073 : toneR = F5; 14'd2074 : toneR = F5; 14'd2075 : toneR = F5;
14'd2076 : toneR = F5; 14'd2077 : toneR = F5; 14'd2078 : toneR = F5; 14'd2079 : toneR = 1;
14'd2080 : toneR = E5; 14'd2081 : toneR = E5; 14'd2082 : toneR = E5; 14'd2083 : toneR = E5;
14'd2084 : toneR = E5; 14'd2085 : toneR = E5; 14'd2086 : toneR = E5; 14'd2087 : toneR = 1;
14'd2088 : toneR = D5; 14'd2089 : toneR = D5; 14'd2090 : toneR = D5; 14'd2091 : toneR = D5;
14'd2092 : toneR = D5; 14'd2093 : toneR = D5; 14'd2094 : toneR = D5; 14'd2095 : toneR = 1;
14'd2096 : toneR = C5; 14'd2097 : toneR = C5; 14'd2098 : toneR = C5; 14'd2099 : toneR = C5;
14'd2100 : toneR = C5; 14'd2101 : toneR = C5; 14'd2102 : toneR = C5; 14'd2103 : toneR = 1;
14'd2104 : toneR = D5; 14'd2105 : toneR = D5; 14'd2106 : toneR = D5; 14'd2107 : toneR = D5;
14'd2108 : toneR = D5; 14'd2109 : toneR = D5; 14'd2110 : toneR = D5; 14'd2111 : toneR = 1;
/*measure 34 */
14'd2112 : toneR = E5; 14'd2113 : toneR = E5; 14'd2114 : toneR = E5; 14'd2115 : toneR = E5;
14'd2116 : toneR = E5; 14'd2117 : toneR = E5; 14'd2118 : toneR = E5; 14'd2119 : toneR = 1;
14'd2120 : toneR = Eflat5; 14'd2121 : toneR = Eflat5; 14'd2122 : toneR = Eflat5; 14'd2123 : toneR = Eflat5;
14'd2124 : toneR = Eflat5; 14'd2125 : toneR = Eflat5; 14'd2126 : toneR = Eflat5; 14'd2127 : toneR = 1;
14'd2128 : toneR = E5; 14'd2129 : toneR = E5; 14'd2130 : toneR = E5; 14'd2131 : toneR = E5;
14'd2132 : toneR = E5; 14'd2133 : toneR = E5; 14'd2134 : toneR = E5; 14'd2135 : toneR = 1;
14'd2136 : toneR = F5; 14'd2137 : toneR = F5; 14'd2138 : toneR = F5; 14'd2139 : toneR = F5;
14'd2140 : toneR = F5; 14'd2141 : toneR = F5; 14'd2142 : toneR = F5; 14'd2143 : toneR = 1;
14'd2144 : toneR = E5; 14'd2145 : toneR = E5; 14'd2146 : toneR = E5; 14'd2147 : toneR = E5;
14'd2148 : toneR = E5; 14'd2149 : toneR = E5; 14'd2150 : toneR = E5; 14'd2151 : toneR = 1;
14'd2152 : toneR = D5; 14'd2153 : toneR = D5; 14'd2154 : toneR = D5; 14'd2155 : toneR = D5;
14'd2156 : toneR = D5; 14'd2157 : toneR = D5; 14'd2158 : toneR = D5; 14'd2159 : toneR = 1;
14'd2160 : toneR = C5; 14'd2161 : toneR = C5; 14'd2162 : toneR = C5; 14'd2163 : toneR = C5;
14'd2164 : toneR = C5; 14'd2165 : toneR = C5; 14'd2166 : toneR = C5; 14'd2167 : toneR = 1;
14'd2168 : toneR = B4; 14'd2169 : toneR = B4; 14'd2170 : toneR = B4; 14'd2171 : toneR = B4;
14'd2172 : toneR = B4; 14'd2173 : toneR = B4; 14'd2174 : toneR = B4; 14'd2175 : toneR = 1;
/*measure 35 */
14'd2176 : toneR = A4; 14'd2177 : toneR = A4; 14'd2178 : toneR = A4; 14'd2179 : toneR = A4;
14'd2180 : toneR = A4; 14'd2181 : toneR = A4; 14'd2182 : toneR = A4; 14'd2183 : toneR = A4;
14'd2184 : toneR = A4; 14'd2185 : toneR = A4; 14'd2186 : toneR = A4; 14'd2187 : toneR = A4;
14'd2188 : toneR = A4; 14'd2189 : toneR = A4; 14'd2190 : toneR = A4; 14'd2191 : toneR = 1;
14'd2192 : toneR = A6; 14'd2193 : toneR = A6; 14'd2194 : toneR = A6; 14'd2195 : toneR = A6;
14'd2196 : toneR = A6; 14'd2197 : toneR = A6; 14'd2198 : toneR = A6; 14'd2199 : toneR = 1;
14'd2200 : toneR = A5; 14'd2201 : toneR = A5; 14'd2202 : toneR = A5; 14'd2203 : toneR = A5;
14'd2204 : toneR = A5; 14'd2205 : toneR = A5; 14'd2206 : toneR = A5; 14'd2207 : toneR = 1;
14'd2208 : toneR = Gsharp6; 14'd2209 : toneR = Gsharp6; 14'd2210 : toneR = Gsharp6; 14'd2211 : toneR = Gsharp6;
14'd2212 : toneR = Gsharp6; 14'd2213 : toneR = Gsharp6; 14'd2214 : toneR = Gsharp6; 14'd2215 : toneR = 1;
14'd2216 : toneR = Gsharp5; 14'd2217 : toneR = Gsharp5; 14'd2218 : toneR = Gsharp5; 14'd2219 : toneR = Gsharp5;
14'd2220 : toneR = Gsharp5; 14'd2221 : toneR = Gsharp5; 14'd2222 : toneR = Gsharp5; 14'd2223 : toneR = 1;
14'd2224 : toneR = G6; 14'd2225 : toneR = G6; 14'd2226 : toneR = G6; 14'd2227 : toneR = G6;
14'd2228 : toneR = G6; 14'd2229 : toneR = G6; 14'd2230 : toneR = G6; 14'd2231 : toneR = 1;
14'd2232 : toneR = G5; 14'd2233 : toneR = G5; 14'd2234 : toneR = G5; 14'd2235 : toneR = G5;
14'd2236 : toneR = G5; 14'd2237 : toneR = G5; 14'd2238 : toneR = G5; 14'd2239 : toneR = 1;
/*measure 36 */
14'd2240 : toneR = Fsharp6; 14'd2241 : toneR = Fsharp6; 14'd2242 : toneR = Fsharp6; 14'd2243 : toneR = Fsharp6;
14'd2244 : toneR = Fsharp6; 14'd2245 : toneR = Fsharp6; 14'd2246 : toneR = Fsharp6; 14'd2247 : toneR = 1;
14'd2248 : toneR = Fsharp5; 14'd2249 : toneR = Fsharp5; 14'd2250 : toneR = Fsharp5; 14'd2251 : toneR = Fsharp5;
14'd2252 : toneR = Fsharp5; 14'd2253 : toneR = Fsharp5; 14'd2254 : toneR = Fsharp5; 14'd2255 : toneR = 1;
14'd2256 : toneR = F6; 14'd2257 : toneR = F6; 14'd2258 : toneR = F6; 14'd2259 : toneR = F6;
14'd2260 : toneR = F6; 14'd2261 : toneR = F6; 14'd2262 : toneR = F6; 14'd2263 : toneR = 1;
14'd2264 : toneR = F5; 14'd2265 : toneR = F5; 14'd2266 : toneR = F5; 14'd2267 : toneR = F5;
14'd2268 : toneR = F5; 14'd2269 : toneR = F5; 14'd2270 : toneR = F5; 14'd2271 : toneR = 1;
14'd2272 : toneR = Dsharp6; 14'd2273 : toneR = Dsharp6; 14'd2274 : toneR = Dsharp6; 14'd2275 : toneR = Dsharp6;
14'd2276 : toneR = Dsharp6; 14'd2277 : toneR = Dsharp6; 14'd2278 : toneR = Dsharp6; 14'd2279 : toneR = 1;
14'd2280 : toneR = Dsharp5; 14'd2281 : toneR = Dsharp5; 14'd2282 : toneR = Dsharp5; 14'd2283 : toneR = Dsharp5;
14'd2284 : toneR = Dsharp5; 14'd2285 : toneR = Dsharp5; 14'd2286 : toneR = Dsharp5; 14'd2287 : toneR = 1;
14'd2288 : toneR = E6; 14'd2289 : toneR = E6; 14'd2290 : toneR = E6; 14'd2291 : toneR = E6;
14'd2292 : toneR = E6; 14'd2293 : toneR = E6; 14'd2294 : toneR = E6; 14'd2295 : toneR = 1;
14'd2296 : toneR = E5; 14'd2297 : toneR = E5; 14'd2298 : toneR = E5; 14'd2299 : toneR = E5;
14'd2300 : toneR = E5; 14'd2301 : toneR = E5; 14'd2302 : toneR = E5; 14'd2303 : toneR = 1;
/*measure 37 */
14'd2304 : toneR = E5; 14'd2305 : toneR = E5; 14'd2306 : toneR = E5; 14'd2307 : toneR = E5;
14'd2308 : toneR = E5; 14'd2309 : toneR = E5; 14'd2310 : toneR = E5; 14'd2311 : toneR = 1;
14'd2312 : toneR = Eflat5; 14'd2313 : toneR = Eflat5; 14'd2314 : toneR = Eflat5; 14'd2315 : toneR = Eflat5;
14'd2316 : toneR = Eflat5; 14'd2317 : toneR = Eflat5; 14'd2318 : toneR = Eflat5; 14'd2319 : toneR = 1;
14'd2320 : toneR = E5; 14'd2321 : toneR = E5; 14'd2322 : toneR = E5; 14'd2323 : toneR = E5;
14'd2324 : toneR = E5; 14'd2325 : toneR = E5; 14'd2326 : toneR = E5; 14'd2327 : toneR = 1;
14'd2328 : toneR = F5; 14'd2329 : toneR = F5; 14'd2330 : toneR = F5; 14'd2331 : toneR = F5;
14'd2332 : toneR = F5; 14'd2333 : toneR = F5; 14'd2334 : toneR = F5; 14'd2335 : toneR = 1;
14'd2336 : toneR = E5; 14'd2337 : toneR = E5; 14'd2338 : toneR = E5; 14'd2339 : toneR = E5;
14'd2340 : toneR = E5; 14'd2341 : toneR = E5; 14'd2342 : toneR = E5; 14'd2343 : toneR = 1;
14'd2344 : toneR = D5; 14'd2345 : toneR = D5; 14'd2346 : toneR = D5; 14'd2347 : toneR = D5;
14'd2348 : toneR = D5; 14'd2349 : toneR = D5; 14'd2350 : toneR = D5; 14'd2351 : toneR = 1;
14'd2352 : toneR = C5; 14'd2353 : toneR = C5; 14'd2354 : toneR = C5; 14'd2355 : toneR = C5;
14'd2356 : toneR = C5; 14'd2357 : toneR = C5; 14'd2358 : toneR = C5; 14'd2359 : toneR = 1;
14'd2360 : toneR = D5; 14'd2361 : toneR = D5; 14'd2362 : toneR = D5; 14'd2363 : toneR = D5;
14'd2364 : toneR = D5; 14'd2365 : toneR = D5; 14'd2366 : toneR = D5; 14'd2367 : toneR = 1;
/*measure 38 */
14'd2368 : toneR = E5; 14'd2369 : toneR = E5; 14'd2370 : toneR = E5; 14'd2371 : toneR = E5;
14'd2372 : toneR = E5; 14'd2373 : toneR = E5; 14'd2374 : toneR = E5; 14'd2375 : toneR = 1;
14'd2376 : toneR = Eflat5; 14'd2377 : toneR = Eflat5; 14'd2378 : toneR = Eflat5; 14'd2379 : toneR = Eflat5;
14'd2380 : toneR = Eflat5; 14'd2381 : toneR = Eflat5; 14'd2382 : toneR = Eflat5; 14'd2383 : toneR = 1;
14'd2384 : toneR = E5; 14'd2385 : toneR = E5; 14'd2386 : toneR = E5; 14'd2387 : toneR = E5;
14'd2388 : toneR = E5; 14'd2389 : toneR = E5; 14'd2390 : toneR = E5; 14'd2391 : toneR = 1;
14'd2392 : toneR = F5; 14'd2393 : toneR = F5; 14'd2394 : toneR = F5; 14'd2395 : toneR = F5;
14'd2396 : toneR = F5; 14'd2397 : toneR = F5; 14'd2398 : toneR = F5; 14'd2399 : toneR = 1;
14'd2400 : toneR = E5; 14'd2401 : toneR = E5; 14'd2402 : toneR = E5; 14'd2403 : toneR = E5;
14'd2404 : toneR = E5; 14'd2405 : toneR = E5; 14'd2406 : toneR = E5; 14'd2407 : toneR = 1;
14'd2408 : toneR = D5; 14'd2409 : toneR = D5; 14'd2410 : toneR = D5; 14'd2411 : toneR = D5;
14'd2412 : toneR = D5; 14'd2413 : toneR = D5; 14'd2414 : toneR = D5; 14'd2415 : toneR = 1;
14'd2416 : toneR = C5; 14'd2417 : toneR = C5; 14'd2418 : toneR = C5; 14'd2419 : toneR = C5;
14'd2420 : toneR = C5; 14'd2421 : toneR = C5; 14'd2422 : toneR = C5; 14'd2423 : toneR = 1;
14'd2424 : toneR = B4; 14'd2425 : toneR = B4; 14'd2426 : toneR = B4; 14'd2427 : toneR = B4;
14'd2428 : toneR = B4; 14'd2429 : toneR = B4; 14'd2430 : toneR = B4; 14'd2431 : toneR = 1;
/*measure 39 */
14'd2432 : toneR = A4; 14'd2433 : toneR = A4; 14'd2434 : toneR = A4; 14'd2435 : toneR = A4;
14'd2436 : toneR = A4; 14'd2437 : toneR = A4; 14'd2438 : toneR = A4; 14'd2439 : toneR = 1;
14'd2440 : toneR = 1; 14'd2441 : toneR = 1; 14'd2442 : toneR = 1; 14'd2443 : toneR = 1;
14'd2444 : toneR = 1; 14'd2445 : toneR = 1; 14'd2446 : toneR = 1; 14'd2447 : toneR = 1;
14'd2448 : toneR = E5; 14'd2449 : toneR = E5; 14'd2450 : toneR = E5; 14'd2451 : toneR = E5;
14'd2452 : toneR = E5; 14'd2453 : toneR = E5; 14'd2454 : toneR = E5; 14'd2455 : toneR = 1;
14'd2456 : toneR = C5; 14'd2457 : toneR = C5; 14'd2458 : toneR = C5; 14'd2459 : toneR = C5;
14'd2460 : toneR = C5; 14'd2461 : toneR = C5; 14'd2462 : toneR = C5; 14'd2463 : toneR = 1;
14'd2464 : toneR = D5; 14'd2465 : toneR = D5; 14'd2466 : toneR = D5; 14'd2467 : toneR = D5;
14'd2468 : toneR = D5; 14'd2469 : toneR = D5; 14'd2470 : toneR = D5; 14'd2471 : toneR = 1;
14'd2472 : toneR = C5; 14'd2473 : toneR = C5; 14'd2474 : toneR = C5; 14'd2475 : toneR = C5;
14'd2476 : toneR = C5; 14'd2477 : toneR = C5; 14'd2478 : toneR = C5; 14'd2479 : toneR = 1;
14'd2480 : toneR = A4; 14'd2481 : toneR = A4; 14'd2482 : toneR = A4; 14'd2483 : toneR = A4;
14'd2484 : toneR = A4; 14'd2485 : toneR = A4; 14'd2486 : toneR = A4; 14'd2487 : toneR = 1;
14'd2488 : toneR = C5; 14'd2489 : toneR = C5; 14'd2490 : toneR = C5; 14'd2491 : toneR = C5;
14'd2492 : toneR = C5; 14'd2493 : toneR = C5; 14'd2494 : toneR = C5; 14'd2495 : toneR = 1;
/*measure 40 */
14'd2496 : toneR = E5; 14'd2497 : toneR = E5; 14'd2498 : toneR = E5; 14'd2499 : toneR = E5;
14'd2500 : toneR = E5; 14'd2501 : toneR = E5; 14'd2502 : toneR = E5; 14'd2503 : toneR = 1;
14'd2504 : toneR = C5; 14'd2505 : toneR = C5; 14'd2506 : toneR = C5; 14'd2507 : toneR = C5;
14'd2508 : toneR = C5; 14'd2509 : toneR = C5; 14'd2510 : toneR = C5; 14'd2511 : toneR = 1;
14'd2512 : toneR = D5; 14'd2513 : toneR = D5; 14'd2514 : toneR = D5; 14'd2515 : toneR = D5;
14'd2516 : toneR = D5; 14'd2517 : toneR = D5; 14'd2518 : toneR = D5; 14'd2519 : toneR = 1;
14'd2520 : toneR = C5; 14'd2521 : toneR = C5; 14'd2522 : toneR = C5; 14'd2523 : toneR = C5;
14'd2524 : toneR = C5; 14'd2525 : toneR = C5; 14'd2526 : toneR = C5; 14'd2527 : toneR = 1;
14'd2528 : toneR = 1; 14'd2529 : toneR = 1; 14'd2530 : toneR = 1; 14'd2531 : toneR = 1;
14'd2532 : toneR = 1; 14'd2533 : toneR = 1; 14'd2534 : toneR = 1; 14'd2535 : toneR = 1;
14'd2536 : toneR = 1; 14'd2537 : toneR = 1; 14'd2538 : toneR = 1; 14'd2539 : toneR = 1;
14'd2540 : toneR = 1; 14'd2541 : toneR = 1; 14'd2542 : toneR = 1; 14'd2543 : toneR = 1;
14'd2544 : toneR = 1; 14'd2545 : toneR = 1; 14'd2546 : toneR = 1; 14'd2547 : toneR = 1;
14'd2548 : toneR = 1; 14'd2549 : toneR = 1; 14'd2550 : toneR = 1; 14'd2551 : toneR = 1;
14'd2552 : toneR = 1; 14'd2553 : toneR = 1; 14'd2554 : toneR = 1; 14'd2555 : toneR = 1;
14'd2556 : toneR = 1; 14'd2557 : toneR = 1; 14'd2558 : toneR = 1; 14'd2559 : toneR = 1;
/*measure 41 */
14'd2560 : toneR = A4; 14'd2561 : toneR = A4; 14'd2562 : toneR = A4; 14'd2563 : toneR = A4;
14'd2564 : toneR = A4; 14'd2565 : toneR = A4; 14'd2566 : toneR = A4; 14'd2567 : toneR = A4;
14'd2568 : toneR = A4; 14'd2569 : toneR = A4; 14'd2570 : toneR = A4; 14'd2571 : toneR = A4;
14'd2572 : toneR = A4; 14'd2573 : toneR = A4; 14'd2574 : toneR = A4; 14'd2575 : toneR = 1;
14'd2576 : toneR = C5; 14'd2577 : toneR = C5; 14'd2578 : toneR = C5; 14'd2579 : toneR = C5;
14'd2580 : toneR = C5; 14'd2581 : toneR = C5; 14'd2582 : toneR = C5; 14'd2583 : toneR = C5;
14'd2584 : toneR = C5; 14'd2585 : toneR = C5; 14'd2586 : toneR = C5; 14'd2587 : toneR = C5;
14'd2588 : toneR = C5; 14'd2589 : toneR = C5; 14'd2590 : toneR = C5; 14'd2591 : toneR = 1;
14'd2592 : toneR = Eflat5; 14'd2593 : toneR = Eflat5; 14'd2594 : toneR = Eflat5; 14'd2595 : toneR = Eflat5;
14'd2596 : toneR = Eflat5; 14'd2597 : toneR = Eflat5; 14'd2598 : toneR = Eflat5; 14'd2599 : toneR = Eflat5;
14'd2600 : toneR = Eflat5; 14'd2601 : toneR = Eflat5; 14'd2602 : toneR = Eflat5; 14'd2603 : toneR = 1;
14'd2604 : toneR = E5; 14'd2605 : toneR = E5; 14'd2606 : toneR = E5; 14'd2607 : toneR = 1;
14'd2608 : toneR = 1; 14'd2609 : toneR = 1; 14'd2610 : toneR = 1; 14'd2611 : toneR = 1;
14'd2612 : toneR = 1; 14'd2613 : toneR = 1; 14'd2614 : toneR = 1; 14'd2615 : toneR = 1;
14'd2616 : toneR = Gsharp4; 14'd2617 : toneR = Gsharp4; 14'd2618 : toneR = Gsharp4; 14'd2619 : toneR = Gsharp4;
14'd2620 : toneR = Gsharp4; 14'd2621 : toneR = Gsharp4; 14'd2622 : toneR = Gsharp4; 14'd2623 : toneR = 1;
/*measure 42 */
14'd2624 : toneR = A4; 14'd2625 : toneR = A4; 14'd2626 : toneR = A4; 14'd2627 : toneR = A4;
14'd2628 : toneR = A4; 14'd2629 : toneR = A4; 14'd2630 : toneR = A4; 14'd2631 : toneR = 1;
14'd2632 : toneR = C5; 14'd2633 : toneR = C5; 14'd2634 : toneR = C5; 14'd2635 : toneR = C5;
14'd2636 : toneR = C5; 14'd2637 : toneR = C5; 14'd2638 : toneR = C5; 14'd2639 : toneR = 1;
14'd2640 : toneR = D5; 14'd2641 : toneR = D5; 14'd2642 : toneR = D5; 14'd2643 : toneR = D5;
14'd2644 : toneR = D5; 14'd2645 : toneR = D5; 14'd2646 : toneR = D5; 14'd2647 : toneR = 1;
14'd2648 : toneR = C5; 14'd2649 : toneR = C5; 14'd2650 : toneR = C5; 14'd2651 : toneR = C5;
14'd2652 : toneR = C5; 14'd2653 : toneR = C5; 14'd2654 : toneR = C5; 14'd2655 : toneR = 1;
14'd2656 : toneR = Eflat5; 14'd2657 : toneR = Eflat5; 14'd2658 : toneR = Eflat5; 14'd2659 : toneR = Eflat5;
14'd2660 : toneR = Eflat5; 14'd2661 : toneR = Eflat5; 14'd2662 : toneR = Eflat5; 14'd2663 : toneR = 1;
14'd2664 : toneR = Eflat5; 14'd2665 : toneR = Eflat5; 14'd2666 : toneR = Eflat5; 14'd2667 : toneR = 1;
14'd2668 : toneR = E5; 14'd2669 : toneR = E5; 14'd2670 : toneR = E5; 14'd2671 : toneR = E5;
14'd2672 : toneR = E5; 14'd2673 : toneR = E5; 14'd2674 : toneR = E5; 14'd2675 : toneR = E5;
14'd2676 : toneR = E5; 14'd2677 : toneR = E5; 14'd2678 : toneR = E5; 14'd2679 : toneR = 1;
14'd2680 : toneR = 1; 14'd2681 : toneR = 1; 14'd2682 : toneR = 1; 14'd2683 : toneR = 1;
14'd2684 : toneR = 1; 14'd2685 : toneR = 1; 14'd2686 : toneR = 1; 14'd2687 : toneR = 1;
/*measure 43 */
14'd2688 : toneR = G5; 14'd2689 : toneR = G5; 14'd2690 : toneR = G5; 14'd2691 : toneR = G5;
14'd2692 : toneR = G5; 14'd2693 : toneR = G5; 14'd2694 : toneR = G5; 14'd2695 : toneR = 1;
14'd2696 : toneR = Fsharp5; 14'd2697 : toneR = Fsharp5; 14'd2698 : toneR = Fsharp5; 14'd2699 : toneR = Fsharp5;
14'd2700 : toneR = Fsharp5; 14'd2701 : toneR = Fsharp5; 14'd2702 : toneR = Fsharp5; 14'd2703 : toneR = 1;
14'd2704 : toneR = F5; 14'd2705 : toneR = F5; 14'd2706 : toneR = F5; 14'd2707 : toneR = F5;
14'd2708 : toneR = F5; 14'd2709 : toneR = F5; 14'd2710 : toneR = F5; 14'd2711 : toneR = 1;
14'd2712 : toneR = Dsharp5; 14'd2713 : toneR = Dsharp5; 14'd2714 : toneR = Dsharp5; 14'd2715 : toneR = Dsharp5;
14'd2716 : toneR = Dsharp5; 14'd2717 : toneR = Dsharp5; 14'd2718 : toneR = Dsharp5; 14'd2719 : toneR = 1;
14'd2720 : toneR = D5; 14'd2721 : toneR = D5; 14'd2722 : toneR = D5; 14'd2723 : toneR = D5;
14'd2724 : toneR = D5; 14'd2725 : toneR = D5; 14'd2726 : toneR = D5; 14'd2727 : toneR = 1;
14'd2728 : toneR = C5; 14'd2729 : toneR = C5; 14'd2730 : toneR = C5; 14'd2731 : toneR = C5;
14'd2732 : toneR = C5; 14'd2733 : toneR = C5; 14'd2734 : toneR = C5; 14'd2735 : toneR = 1;
14'd2736 : toneR = B4; 14'd2737 : toneR = B4; 14'd2738 : toneR = B4; 14'd2739 : toneR = B4;
14'd2740 : toneR = B4; 14'd2741 : toneR = B4; 14'd2742 : toneR = B4; 14'd2743 : toneR = 1;
14'd2744 : toneR = Asharp4; 14'd2745 : toneR = Asharp4; 14'd2746 : toneR = Asharp4; 14'd2747 : toneR = Asharp4;
14'd2748 : toneR = Asharp4; 14'd2749 : toneR = Asharp4; 14'd2750 : toneR = Asharp4; 14'd2751 : toneR = 1;
/*measure 44 */
14'd2752 : toneR = B4; 14'd2753 : toneR = B4; 14'd2754 : toneR = B4; 14'd2755 : toneR = B4;
14'd2756 : toneR = B4; 14'd2757 : toneR = B4; 14'd2758 : toneR = B4; 14'd2759 : toneR = 1;
14'd2760 : toneR = C5; 14'd2761 : toneR = C5; 14'd2762 : toneR = C5; 14'd2763 : toneR = C5;
14'd2764 : toneR = C5; 14'd2765 : toneR = C5; 14'd2766 : toneR = C5; 14'd2767 : toneR = 1;
14'd2768 : toneR = D5; 14'd2769 : toneR = D5; 14'd2770 : toneR = D5; 14'd2771 : toneR = D5;
14'd2772 : toneR = D5; 14'd2773 : toneR = D5; 14'd2774 : toneR = D5; 14'd2775 : toneR = 1;
14'd2776 : toneR = Dsharp5; 14'd2777 : toneR = Dsharp5; 14'd2778 : toneR = Dsharp5; 14'd2779 : toneR = Dsharp5;
14'd2780 : toneR = Dsharp5; 14'd2781 : toneR = Dsharp5; 14'd2782 : toneR = Dsharp5; 14'd2783 : toneR = 1;
14'd2784 : toneR = E5; 14'd2785 : toneR = E5; 14'd2786 : toneR = E5; 14'd2787 : toneR = E5;
14'd2788 : toneR = E5; 14'd2789 : toneR = E5; 14'd2790 : toneR = E5; 14'd2791 : toneR = E5;
14'd2792 : toneR = E5; 14'd2793 : toneR = E5; 14'd2794 : toneR = E5; 14'd2795 : toneR = E5;
14'd2796 : toneR = E5; 14'd2797 : toneR = E5; 14'd2798 : toneR = E5; 14'd2799 : toneR = 1;
14'd2800 : toneR = E4; 14'd2801 : toneR = E4; 14'd2802 : toneR = E4; 14'd2803 : toneR = E4;
14'd2804 : toneR = E4; 14'd2805 : toneR = E4; 14'd2806 : toneR = E4; 14'd2807 : toneR = E4;
14'd2808 : toneR = E4; 14'd2809 : toneR = E4; 14'd2810 : toneR = E4; 14'd2811 : toneR = E4;
14'd2812 : toneR = E4; 14'd2813 : toneR = E4; 14'd2814 : toneR = E4; 14'd2815 : toneR = 1;
/*measure 45 */
14'd2816 : toneR = A4; 14'd2817 : toneR = A4; 14'd2818 : toneR = A4; 14'd2819 : toneR = A4;
14'd2820 : toneR = A4; 14'd2821 : toneR = A4; 14'd2822 : toneR = A4; 14'd2823 : toneR = A4;
14'd2824 : toneR = A4; 14'd2825 : toneR = A4; 14'd2826 : toneR = A4; 14'd2827 : toneR = A4;
14'd2828 : toneR = A4; 14'd2829 : toneR = A4; 14'd2830 : toneR = A4; 14'd2831 : toneR = 1;
14'd2832 : toneR = C5; 14'd2833 : toneR = C5; 14'd2834 : toneR = C5; 14'd2835 : toneR = C5;
14'd2836 : toneR = C5; 14'd2837 : toneR = C5; 14'd2838 : toneR = C5; 14'd2839 : toneR = C5;
14'd2840 : toneR = C5; 14'd2841 : toneR = C5; 14'd2842 : toneR = C5; 14'd2843 : toneR = C5;
14'd2844 : toneR = C5; 14'd2845 : toneR = C5; 14'd2846 : toneR = C5; 14'd2847 : toneR = 1;
14'd2848 : toneR = Eflat5; 14'd2849 : toneR = Eflat5; 14'd2850 : toneR = Eflat5; 14'd2851 : toneR = Eflat5;
14'd2852 : toneR = Eflat5; 14'd2853 : toneR = Eflat5; 14'd2854 : toneR = Eflat5; 14'd2855 : toneR = Eflat5;
14'd2856 : toneR = Eflat5; 14'd2857 : toneR = Eflat5; 14'd2858 : toneR = Eflat5; 14'd2859 : toneR = 1;
14'd2860 : toneR = E5; 14'd2861 : toneR = E5; 14'd2862 : toneR = E5; 14'd2863 : toneR = 1;
14'd2864 : toneR = 1; 14'd2865 : toneR = 1; 14'd2866 : toneR = 1; 14'd2867 : toneR = 1;
14'd2868 : toneR = 1; 14'd2869 : toneR = 1; 14'd2870 : toneR = 1; 14'd2871 : toneR = 1;
14'd2872 : toneR = Gsharp4; 14'd2873 : toneR = Gsharp4; 14'd2874 : toneR = Gsharp4; 14'd2875 : toneR = Gsharp4;
14'd2876 : toneR = Gsharp4; 14'd2877 : toneR = Gsharp4; 14'd2878 : toneR = Gsharp4; 14'd2879 : toneR = 1;
/*measure 46 */
14'd2880 : toneR = A4; 14'd2881 : toneR = A4; 14'd2882 : toneR = A4; 14'd2883 : toneR = A4;
14'd2884 : toneR = A4; 14'd2885 : toneR = A4; 14'd2886 : toneR = A4; 14'd2887 : toneR = 1;
14'd2888 : toneR = C5; 14'd2889 : toneR = C5; 14'd2890 : toneR = C5; 14'd2891 : toneR = C5;
14'd2892 : toneR = C5; 14'd2893 : toneR = C5; 14'd2894 : toneR = C5; 14'd2895 : toneR = 1;
14'd2896 : toneR = D5; 14'd2897 : toneR = D5; 14'd2898 : toneR = D5; 14'd2899 : toneR = D5;
14'd2900 : toneR = D5; 14'd2901 : toneR = D5; 14'd2902 : toneR = D5; 14'd2903 : toneR = 1;
14'd2904 : toneR = C5; 14'd2905 : toneR = C5; 14'd2906 : toneR = C5; 14'd2907 : toneR = C5;
14'd2908 : toneR = C5; 14'd2909 : toneR = C5; 14'd2910 : toneR = C5; 14'd2911 : toneR = 1;
14'd2912 : toneR = Eflat5; 14'd2913 : toneR = Eflat5; 14'd2914 : toneR = Eflat5; 14'd2915 : toneR = Eflat5;
14'd2916 : toneR = Eflat5; 14'd2917 : toneR = Eflat5; 14'd2918 : toneR = Eflat5; 14'd2919 : toneR = 1;
14'd2920 : toneR = Eflat5; 14'd2921 : toneR = Eflat5; 14'd2922 : toneR = Eflat5; 14'd2923 : toneR = 1;
14'd2924 : toneR = E5; 14'd2925 : toneR = E5; 14'd2926 : toneR = E5; 14'd2927 : toneR = E5;
14'd2928 : toneR = E5; 14'd2929 : toneR = E5; 14'd2930 : toneR = E5; 14'd2931 : toneR = E5;
14'd2932 : toneR = E5; 14'd2933 : toneR = E5; 14'd2934 : toneR = E5; 14'd2935 : toneR = 1;
14'd2936 : toneR = 1; 14'd2937 : toneR = 1; 14'd2938 : toneR = 1; 14'd2939 : toneR = 1;
14'd2940 : toneR = 1; 14'd2941 : toneR = 1; 14'd2942 : toneR = 1; 14'd2943 : toneR = 1;
/*measure 47 */
14'd2944 : toneR = G5; 14'd2945 : toneR = G5; 14'd2946 : toneR = G5; 14'd2947 : toneR = G5;
14'd2948 : toneR = G5; 14'd2949 : toneR = G5; 14'd2950 : toneR = G5; 14'd2951 : toneR = 1;
14'd2952 : toneR = Fsharp5; 14'd2953 : toneR = Fsharp5; 14'd2954 : toneR = Fsharp5; 14'd2955 : toneR = Fsharp5;
14'd2956 : toneR = Fsharp5; 14'd2957 : toneR = Fsharp5; 14'd2958 : toneR = Fsharp5; 14'd2959 : toneR = 1;
14'd2960 : toneR = F5; 14'd2961 : toneR = F5; 14'd2962 : toneR = F5; 14'd2963 : toneR = F5;
14'd2964 : toneR = F5; 14'd2965 : toneR = F5; 14'd2966 : toneR = F5; 14'd2967 : toneR = 1;
14'd2968 : toneR = Dsharp5; 14'd2969 : toneR = Dsharp5; 14'd2970 : toneR = Dsharp5; 14'd2971 : toneR = Dsharp5;
14'd2972 : toneR = Dsharp5; 14'd2973 : toneR = Dsharp5; 14'd2974 : toneR = Dsharp5; 14'd2975 : toneR = 1;
14'd2976 : toneR = E5; 14'd2977 : toneR = E5; 14'd2978 : toneR = E5; 14'd2979 : toneR = E5;
14'd2980 : toneR = E5; 14'd2981 : toneR = E5; 14'd2982 : toneR = E5; 14'd2983 : toneR = 1;
14'd2984 : toneR = F5; 14'd2985 : toneR = F5; 14'd2986 : toneR = F5; 14'd2987 : toneR = F5;
14'd2988 : toneR = F5; 14'd2989 : toneR = F5; 14'd2990 : toneR = F5; 14'd2991 : toneR = 1;
14'd2992 : toneR = Fsharp5; 14'd2993 : toneR = Fsharp5; 14'd2994 : toneR = Fsharp5; 14'd2995 : toneR = Fsharp5;
14'd2996 : toneR = Fsharp5; 14'd2997 : toneR = Fsharp5; 14'd2998 : toneR = Fsharp5; 14'd2999 : toneR = 1;
14'd3000 : toneR = G5; 14'd3001 : toneR = G5; 14'd3002 : toneR = G5; 14'd3003 : toneR = G5;
14'd3004 : toneR = G5; 14'd3005 : toneR = G5; 14'd3006 : toneR = G5; 14'd3007 : toneR = 1;
/*measure 48 */
14'd3008 : toneR = Gsharp5; 14'd3009 : toneR = Gsharp5; 14'd3010 : toneR = Gsharp5; 14'd3011 : toneR = Gsharp5;
14'd3012 : toneR = Gsharp5; 14'd3013 : toneR = Gsharp5; 14'd3014 : toneR = Gsharp5; 14'd3015 : toneR = 1;
14'd3016 : toneR = Gsharp5; 14'd3017 : toneR = Gsharp5; 14'd3018 : toneR = Gsharp5; 14'd3019 : toneR = Gsharp5;
14'd3020 : toneR = Gsharp5; 14'd3021 : toneR = Gsharp5; 14'd3022 : toneR = Gsharp5; 14'd3023 : toneR = 1;
14'd3024 : toneR = A5; 14'd3025 : toneR = A5; 14'd3026 : toneR = A5; 14'd3027 : toneR = A5;
14'd3028 : toneR = A5; 14'd3029 : toneR = A5; 14'd3030 : toneR = A5; 14'd3031 : toneR = 1;
14'd3032 : toneR = A5; 14'd3033 : toneR = A5; 14'd3034 : toneR = A5; 14'd3035 : toneR = A5;
14'd3036 : toneR = A5; 14'd3037 : toneR = A5; 14'd3038 : toneR = A5; 14'd3039 : toneR = 1;
14'd3040 : toneR = B5; 14'd3041 : toneR = B5; 14'd3042 : toneR = B5; 14'd3043 : toneR = B5;
14'd3044 : toneR = B5; 14'd3045 : toneR = B5; 14'd3046 : toneR = B5; 14'd3047 : toneR = 1;
14'd3048 : toneR = 1; 14'd3049 : toneR = 1; 14'd3050 : toneR = 1; 14'd3051 : toneR = 1;
14'd3052 : toneR = 1; 14'd3053 : toneR = 1; 14'd3054 : toneR = 1; 14'd3055 : toneR = 1;
14'd3056 : toneR = 1; 14'd3057 : toneR = 1; 14'd3058 : toneR = 1; 14'd3059 : toneR = 1;
14'd3060 : toneR = 1; 14'd3061 : toneR = 1; 14'd3062 : toneR = 1; 14'd3063 : toneR = 1;
14'd3064 : toneR = 1; 14'd3065 : toneR = 1; 14'd3066 : toneR = 1; 14'd3067 : toneR = 1;
14'd3068 : toneR = 1; 14'd3069 : toneR = 1; 14'd3070 : toneR = 1; 14'd3071 : toneR = 1;
/*measure 49 */
14'd3072 : toneR = A5; 14'd3073 : toneR = A5; 14'd3074 : toneR = A5; 14'd3075 : toneR = A5;
14'd3076 : toneR = A5; 14'd3077 : toneR = A5; 14'd3078 : toneR = A5; 14'd3079 : toneR = A5;
14'd3080 : toneR = A5; 14'd3081 : toneR = A5; 14'd3082 : toneR = A5; 14'd3083 : toneR = A5;
14'd3084 : toneR = A5; 14'd3085 : toneR = A5; 14'd3086 : toneR = A5; 14'd3087 : toneR = 1;
14'd3088 : toneR = C6; 14'd3089 : toneR = C6; 14'd3090 : toneR = C6; 14'd3091 : toneR = C6;
14'd3092 : toneR = C6; 14'd3093 : toneR = C6; 14'd3094 : toneR = C6; 14'd3095 : toneR = C6;
14'd3096 : toneR = C6; 14'd3097 : toneR = C6; 14'd3098 : toneR = C6; 14'd3099 : toneR = C6;
14'd3100 : toneR = C6; 14'd3101 : toneR = C6; 14'd3102 : toneR = C6; 14'd3103 : toneR = 1;
14'd3104 : toneR = Dsharp6; 14'd3105 : toneR = Dsharp6; 14'd3106 : toneR = Dsharp6; 14'd3107 : toneR = Dsharp6;
14'd3108 : toneR = Dsharp6; 14'd3109 : toneR = Dsharp6; 14'd3110 : toneR = Dsharp6; 14'd3111 : toneR = Dsharp6;
14'd3112 : toneR = Dsharp6; 14'd3113 : toneR = Dsharp6; 14'd3114 : toneR = Dsharp6; 14'd3115 : toneR = 1;
14'd3116 : toneR = E6; 14'd3117 : toneR = E6; 14'd3118 : toneR = E6; 14'd3119 : toneR = 1;
14'd3120 : toneR = 1; 14'd3121 : toneR = 1; 14'd3122 : toneR = 1; 14'd3123 : toneR = 1;
14'd3124 : toneR = 1; 14'd3125 : toneR = 1; 14'd3126 : toneR = 1; 14'd3127 : toneR = 1;
14'd3128 : toneR = Gsharp5; 14'd3129 : toneR = Gsharp5; 14'd3130 : toneR = Gsharp5; 14'd3131 : toneR = Gsharp5;
14'd3132 : toneR = Gsharp5; 14'd3133 : toneR = Gsharp5; 14'd3134 : toneR = Gsharp5; 14'd3135 : toneR = 1;
/*measure 50 */
14'd3136 : toneR = A5; 14'd3137 : toneR = A5; 14'd3138 : toneR = A5; 14'd3139 : toneR = A5;
14'd3140 : toneR = A5; 14'd3141 : toneR = A5; 14'd3142 : toneR = A5; 14'd3143 : toneR = 1;
14'd3144 : toneR = C6; 14'd3145 : toneR = C6; 14'd3146 : toneR = C6; 14'd3147 : toneR = C6;
14'd3148 : toneR = C6; 14'd3149 : toneR = C6; 14'd3150 : toneR = C6; 14'd3151 : toneR = 1;
14'd3152 : toneR = D6; 14'd3153 : toneR = D6; 14'd3154 : toneR = D6; 14'd3155 : toneR = D6;
14'd3156 : toneR = D6; 14'd3157 : toneR = D6; 14'd3158 : toneR = D6; 14'd3159 : toneR = 1;
14'd3160 : toneR = C6; 14'd3161 : toneR = C6; 14'd3162 : toneR = C6; 14'd3163 : toneR = C6;
14'd3164 : toneR = C6; 14'd3165 : toneR = C6; 14'd3166 : toneR = C6; 14'd3167 : toneR = 1;
14'd3168 : toneR = Dsharp6; 14'd3169 : toneR = Dsharp6; 14'd3170 : toneR = Dsharp6; 14'd3171 : toneR = Dsharp6;
14'd3172 : toneR = Dsharp6; 14'd3173 : toneR = Dsharp6; 14'd3174 : toneR = Dsharp6; 14'd3175 : toneR = 1;
14'd3176 : toneR = Dsharp6; 14'd3177 : toneR = Dsharp6; 14'd3178 : toneR = Dsharp6; 14'd3179 : toneR = 1;
14'd3180 : toneR = E6; 14'd3181 : toneR = E6; 14'd3182 : toneR = E6; 14'd3183 : toneR = E6;
14'd3184 : toneR = E6; 14'd3185 : toneR = E6; 14'd3186 : toneR = E6; 14'd3187 : toneR = E6;
14'd3188 : toneR = E6; 14'd3189 : toneR = E6; 14'd3190 : toneR = E6; 14'd3191 : toneR = 1;
14'd3192 : toneR = 1; 14'd3193 : toneR = 1; 14'd3194 : toneR = 1; 14'd3195 : toneR = 1;
14'd3196 : toneR = 1; 14'd3197 : toneR = 1; 14'd3198 : toneR = 1; 14'd3199 : toneR = 1;
/*measure 51 */
14'd3200 : toneR = G6; 14'd3201 : toneR = G6; 14'd3202 : toneR = G6; 14'd3203 : toneR = G6;
14'd3204 : toneR = G6; 14'd3205 : toneR = G6; 14'd3206 : toneR = G6; 14'd3207 : toneR = 1;
14'd3208 : toneR = Fsharp6; 14'd3209 : toneR = Fsharp6; 14'd3210 : toneR = Fsharp6; 14'd3211 : toneR = Fsharp6;
14'd3212 : toneR = Fsharp6; 14'd3213 : toneR = Fsharp6; 14'd3214 : toneR = Fsharp6; 14'd3215 : toneR = 1;
14'd3216 : toneR = F6; 14'd3217 : toneR = F6; 14'd3218 : toneR = F6; 14'd3219 : toneR = F6;
14'd3220 : toneR = F6; 14'd3221 : toneR = F6; 14'd3222 : toneR = F6; 14'd3223 : toneR = 1;
14'd3224 : toneR = Dsharp6; 14'd3225 : toneR = Dsharp6; 14'd3226 : toneR = Dsharp6; 14'd3227 : toneR = Dsharp6;
14'd3228 : toneR = Dsharp6; 14'd3229 : toneR = Dsharp6; 14'd3230 : toneR = Dsharp6; 14'd3231 : toneR = 1;
14'd3232 : toneR = D6; 14'd3233 : toneR = D6; 14'd3234 : toneR = D6; 14'd3235 : toneR = D6;
14'd3236 : toneR = D6; 14'd3237 : toneR = D6; 14'd3238 : toneR = D6; 14'd3239 : toneR = 1;
14'd3240 : toneR = C6; 14'd3241 : toneR = C6; 14'd3242 : toneR = C6; 14'd3243 : toneR = C6;
14'd3244 : toneR = C6; 14'd3245 : toneR = C6; 14'd3246 : toneR = C6; 14'd3247 : toneR = 1;
14'd3248 : toneR = B5; 14'd3249 : toneR = B5; 14'd3250 : toneR = B5; 14'd3251 : toneR = B5;
14'd3252 : toneR = B5; 14'd3253 : toneR = B5; 14'd3254 : toneR = B5; 14'd3255 : toneR = 1;
14'd3256 : toneR = Asharp5; 14'd3257 : toneR = Asharp5; 14'd3258 : toneR = Asharp5; 14'd3259 : toneR = Asharp5;
14'd3260 : toneR = Asharp5; 14'd3261 : toneR = Asharp5; 14'd3262 : toneR = Asharp5; 14'd3263 : toneR = 1;
/*measure 52 */
14'd3264 : toneR = B5; 14'd3265 : toneR = B5; 14'd3266 : toneR = B5; 14'd3267 : toneR = B5;
14'd3268 : toneR = B5; 14'd3269 : toneR = B5; 14'd3270 : toneR = B5; 14'd3271 : toneR = 1;
14'd3272 : toneR = C6; 14'd3273 : toneR = C6; 14'd3274 : toneR = C6; 14'd3275 : toneR = C6;
14'd3276 : toneR = C6; 14'd3277 : toneR = C6; 14'd3278 : toneR = C6; 14'd3279 : toneR = 1;
14'd3280 : toneR = D6; 14'd3281 : toneR = D6; 14'd3282 : toneR = D6; 14'd3283 : toneR = D6;
14'd3284 : toneR = D6; 14'd3285 : toneR = D6; 14'd3286 : toneR = D6; 14'd3287 : toneR = 1;
14'd3288 : toneR = Dsharp6; 14'd3289 : toneR = Dsharp6; 14'd3290 : toneR = Dsharp6; 14'd3291 : toneR = Dsharp6;
14'd3292 : toneR = Dsharp6; 14'd3293 : toneR = Dsharp6; 14'd3294 : toneR = Dsharp6; 14'd3295 : toneR = 1;
14'd3296 : toneR = E6; 14'd3297 : toneR = E6; 14'd3298 : toneR = E6; 14'd3299 : toneR = E6;
14'd3300 : toneR = E6; 14'd3301 : toneR = E6; 14'd3302 : toneR = E6; 14'd3303 : toneR = E6;
14'd3304 : toneR = E6; 14'd3305 : toneR = E6; 14'd3306 : toneR = E6; 14'd3307 : toneR = E6;
14'd3308 : toneR = E6; 14'd3309 : toneR = E6; 14'd3310 : toneR = E6; 14'd3311 : toneR = 1;
14'd3312 : toneR = E5; 14'd3313 : toneR = E5; 14'd3314 : toneR = E5; 14'd3315 : toneR = E5;
14'd3316 : toneR = E5; 14'd3317 : toneR = E5; 14'd3318 : toneR = E5; 14'd3319 : toneR = E5;
14'd3320 : toneR = E5; 14'd3321 : toneR = E5; 14'd3322 : toneR = E5; 14'd3323 : toneR = E5;
14'd3324 : toneR = E5; 14'd3325 : toneR = E5; 14'd3326 : toneR = E5; 14'd3327 : toneR = 1;
/*measure 53 */
14'd3328 : toneR = A5; 14'd3329 : toneR = A5; 14'd3330 : toneR = A5; 14'd3331 : toneR = A5;
14'd3332 : toneR = A5; 14'd3333 : toneR = A5; 14'd3334 : toneR = A5; 14'd3335 : toneR = A5;
14'd3336 : toneR = A5; 14'd3337 : toneR = A5; 14'd3338 : toneR = A5; 14'd3339 : toneR = A5;
14'd3340 : toneR = A5; 14'd3341 : toneR = A5; 14'd3342 : toneR = A5; 14'd3343 : toneR = 1;
14'd3344 : toneR = C6; 14'd3345 : toneR = C6; 14'd3346 : toneR = C6; 14'd3347 : toneR = C6;
14'd3348 : toneR = C6; 14'd3349 : toneR = C6; 14'd3350 : toneR = C6; 14'd3351 : toneR = C6;
14'd3352 : toneR = C6; 14'd3353 : toneR = C6; 14'd3354 : toneR = C6; 14'd3355 : toneR = C6;
14'd3356 : toneR = C6; 14'd3357 : toneR = C6; 14'd3358 : toneR = C6; 14'd3359 : toneR = 1;
14'd3360 : toneR = Dsharp6; 14'd3361 : toneR = Dsharp6; 14'd3362 : toneR = Dsharp6; 14'd3363 : toneR = Dsharp6;
14'd3364 : toneR = Dsharp6; 14'd3365 : toneR = Dsharp6; 14'd3366 : toneR = Dsharp6; 14'd3367 : toneR = Dsharp6;
14'd3368 : toneR = Dsharp6; 14'd3369 : toneR = Dsharp6; 14'd3370 : toneR = Dsharp6; 14'd3371 : toneR = 1;
14'd3372 : toneR = E6; 14'd3373 : toneR = E6; 14'd3374 : toneR = E6; 14'd3375 : toneR = 1;
14'd3376 : toneR = 1; 14'd3377 : toneR = 1; 14'd3378 : toneR = 1; 14'd3379 : toneR = 1;
14'd3380 : toneR = 1; 14'd3381 : toneR = 1; 14'd3382 : toneR = 1; 14'd3383 : toneR = 1;
14'd3384 : toneR = Gsharp5; 14'd3385 : toneR = Gsharp5; 14'd3386 : toneR = Gsharp5; 14'd3387 : toneR = Gsharp5;
14'd3388 : toneR = Gsharp5; 14'd3389 : toneR = Gsharp5; 14'd3390 : toneR = Gsharp5; 14'd3391 : toneR = 1;
/*measure 54 */
14'd3392 : toneR = A5; 14'd3393 : toneR = A5; 14'd3394 : toneR = A5; 14'd3395 : toneR = A5;
14'd3396 : toneR = A5; 14'd3397 : toneR = A5; 14'd3398 : toneR = A5; 14'd3399 : toneR = 1;
14'd3400 : toneR = C6; 14'd3401 : toneR = C6; 14'd3402 : toneR = C6; 14'd3403 : toneR = C6;
14'd3404 : toneR = C6; 14'd3405 : toneR = C6; 14'd3406 : toneR = C6; 14'd3407 : toneR = 1;
14'd3408 : toneR = D6; 14'd3409 : toneR = D6; 14'd3410 : toneR = D6; 14'd3411 : toneR = D6;
14'd3412 : toneR = D6; 14'd3413 : toneR = D6; 14'd3414 : toneR = D6; 14'd3415 : toneR = 1;
14'd3416 : toneR = C6; 14'd3417 : toneR = C6; 14'd3418 : toneR = C6; 14'd3419 : toneR = C6;
14'd3420 : toneR = C6; 14'd3421 : toneR = C6; 14'd3422 : toneR = C6; 14'd3423 : toneR = 1;
14'd3424 : toneR = Dsharp6; 14'd3425 : toneR = Dsharp6; 14'd3426 : toneR = Dsharp6; 14'd3427 : toneR = Dsharp6;
14'd3428 : toneR = Dsharp6; 14'd3429 : toneR = Dsharp6; 14'd3430 : toneR = Dsharp6; 14'd3431 : toneR = 1;
14'd3432 : toneR = Dsharp6; 14'd3433 : toneR = Dsharp6; 14'd3434 : toneR = Dsharp6; 14'd3435 : toneR = 1;
14'd3436 : toneR = E6; 14'd3437 : toneR = E6; 14'd3438 : toneR = E6; 14'd3439 : toneR = E6;
14'd3440 : toneR = E6; 14'd3441 : toneR = E6; 14'd3442 : toneR = E6; 14'd3443 : toneR = E6;
14'd3444 : toneR = E6; 14'd3445 : toneR = E6; 14'd3446 : toneR = E6; 14'd3447 : toneR = 1;
14'd3448 : toneR = 1; 14'd3449 : toneR = 1; 14'd3450 : toneR = 1; 14'd3451 : toneR = 1;
14'd3452 : toneR = 1; 14'd3453 : toneR = 1; 14'd3454 : toneR = 1; 14'd3455 : toneR = 1;
/*measure 55 */
14'd3456 : toneR = G6; 14'd3457 : toneR = G6; 14'd3458 : toneR = G6; 14'd3459 : toneR = G6;
14'd3460 : toneR = G6; 14'd3461 : toneR = G6; 14'd3462 : toneR = G6; 14'd3463 : toneR = 1;
14'd3464 : toneR = Fsharp6; 14'd3465 : toneR = Fsharp6; 14'd3466 : toneR = Fsharp6; 14'd3467 : toneR = Fsharp6;
14'd3468 : toneR = Fsharp6; 14'd3469 : toneR = Fsharp6; 14'd3470 : toneR = Fsharp6; 14'd3471 : toneR = 1;
14'd3472 : toneR = F6; 14'd3473 : toneR = F6; 14'd3474 : toneR = F6; 14'd3475 : toneR = F6;
14'd3476 : toneR = F6; 14'd3477 : toneR = F6; 14'd3478 : toneR = F6; 14'd3479 : toneR = 1;
14'd3480 : toneR = Dsharp6; 14'd3481 : toneR = Dsharp6; 14'd3482 : toneR = Dsharp6; 14'd3483 : toneR = Dsharp6;
14'd3484 : toneR = Dsharp6; 14'd3485 : toneR = Dsharp6; 14'd3486 : toneR = Dsharp6; 14'd3487 : toneR = 1;
14'd3488 : toneR = E6; 14'd3489 : toneR = E6; 14'd3490 : toneR = E6; 14'd3491 : toneR = E6;
14'd3492 : toneR = E6; 14'd3493 : toneR = E6; 14'd3494 : toneR = E6; 14'd3495 : toneR = 1;
14'd3496 : toneR = F6; 14'd3497 : toneR = F6; 14'd3498 : toneR = F6; 14'd3499 : toneR = F6;
14'd3500 : toneR = F6; 14'd3501 : toneR = F6; 14'd3502 : toneR = F6; 14'd3503 : toneR = 1;
14'd3504 : toneR = Fsharp6; 14'd3505 : toneR = Fsharp6; 14'd3506 : toneR = Fsharp6; 14'd3507 : toneR = Fsharp6;
14'd3508 : toneR = Fsharp6; 14'd3509 : toneR = Fsharp6; 14'd3510 : toneR = Fsharp6; 14'd3511 : toneR = 1;
14'd3512 : toneR = G6; 14'd3513 : toneR = G6; 14'd3514 : toneR = G6; 14'd3515 : toneR = G6;
14'd3516 : toneR = G6; 14'd3517 : toneR = G6; 14'd3518 : toneR = G6; 14'd3519 : toneR = 1;
/*measure 56 */
14'd3520 : toneR = Gsharp6; 14'd3521 : toneR = Gsharp6; 14'd3522 : toneR = Gsharp6; 14'd3523 : toneR = Gsharp6;
14'd3524 : toneR = Gsharp6; 14'd3525 : toneR = Gsharp6; 14'd3526 : toneR = Gsharp6; 14'd3527 : toneR = 1;
14'd3528 : toneR = Gsharp6; 14'd3529 : toneR = Gsharp6; 14'd3530 : toneR = Gsharp6; 14'd3531 : toneR = Gsharp6;
14'd3532 : toneR = Gsharp6; 14'd3533 : toneR = Gsharp6; 14'd3534 : toneR = Gsharp6; 14'd3535 : toneR = 1;
14'd3536 : toneR = A6; 14'd3537 : toneR = A6; 14'd3538 : toneR = A6; 14'd3539 : toneR = A6;
14'd3540 : toneR = A6; 14'd3541 : toneR = A6; 14'd3542 : toneR = A6; 14'd3543 : toneR = 1;
14'd3544 : toneR = A6; 14'd3545 : toneR = A6; 14'd3546 : toneR = A6; 14'd3547 : toneR = A6;
14'd3548 : toneR = A6; 14'd3549 : toneR = A6; 14'd3550 : toneR = A6; 14'd3551 : toneR = 1;
14'd3552 : toneR = B6; 14'd3553 : toneR = B6; 14'd3554 : toneR = B6; 14'd3555 : toneR = B6;
14'd3556 : toneR = B6; 14'd3557 : toneR = B6; 14'd3558 : toneR = B6; 14'd3559 : toneR = B6;
14'd3560 : toneR = B6; 14'd3561 : toneR = B6; 14'd3562 : toneR = B6; 14'd3563 : toneR = B6;
14'd3564 : toneR = B6; 14'd3565 : toneR = B6; 14'd3566 : toneR = B6; 14'd3567 : toneR = 1;
14'd3568 : toneR = 1; 14'd3569 : toneR = 1; 14'd3570 : toneR = 1; 14'd3571 : toneR = 1;
14'd3572 : toneR = 1; 14'd3573 : toneR = 1; 14'd3574 : toneR = 1; 14'd3575 : toneR = 1;
14'd3576 : toneR = 1; 14'd3577 : toneR = 1; 14'd3578 : toneR = 1; 14'd3579 : toneR = 1;
14'd3580 : toneR = 1; 14'd3581 : toneR = 1; 14'd3582 : toneR = 1; 14'd3583 : toneR = 1;
/*measure 57 */
14'd3584 : toneR = A5; 14'd3585 : toneR = A5; 14'd3586 : toneR = A5; 14'd3587 : toneR = 1;
14'd3588 : toneR = G5; 14'd3589 : toneR = G5; 14'd3590 : toneR = G5; 14'd3591 : toneR = 1;
14'd3592 : toneR = A5; 14'd3593 : toneR = A5; 14'd3594 : toneR = A5; 14'd3595 : toneR = 1;
14'd3596 : toneR = C6; 14'd3597 : toneR = C6; 14'd3598 : toneR = C6; 14'd3599 : toneR = 1;
14'd3600 : toneR = A5; 14'd3601 : toneR = A5; 14'd3602 : toneR = A5; 14'd3603 : toneR = 1;
14'd3604 : toneR = G5; 14'd3605 : toneR = G5; 14'd3606 : toneR = G5; 14'd3607 : toneR = 1;
14'd3608 : toneR = A5; 14'd3609 : toneR = A5; 14'd3610 : toneR = A5; 14'd3611 : toneR = 1;
14'd3612 : toneR = C6; 14'd3613 : toneR = C6; 14'd3614 : toneR = C6; 14'd3615 : toneR = 1;
14'd3616 : toneR = A5; 14'd3617 : toneR = A5; 14'd3618 : toneR = A5; 14'd3619 : toneR = 1;
14'd3620 : toneR = G5; 14'd3621 : toneR = G5; 14'd3622 : toneR = G5; 14'd3623 : toneR = 1;
14'd3624 : toneR = A5; 14'd3625 : toneR = A5; 14'd3626 : toneR = A5; 14'd3627 : toneR = 1;
14'd3628 : toneR = C6; 14'd3629 : toneR = C6; 14'd3630 : toneR = C6; 14'd3631 : toneR = 1;
14'd3632 : toneR = A5; 14'd3633 : toneR = A5; 14'd3634 : toneR = A5; 14'd3635 : toneR = 1;
14'd3636 : toneR = G5; 14'd3637 : toneR = G5; 14'd3638 : toneR = G5; 14'd3639 : toneR = 1;
14'd3640 : toneR = A5; 14'd3641 : toneR = A5; 14'd3642 : toneR = A5; 14'd3643 : toneR = 1;
14'd3644 : toneR = C6; 14'd3645 : toneR = C6; 14'd3646 : toneR = C6; 14'd3647 : toneR = 1;
/*measure 58 */
14'd3648 : toneR = A5; 14'd3649 : toneR = A5; 14'd3650 : toneR = A5; 14'd3651 : toneR = 1;
14'd3652 : toneR = G5; 14'd3653 : toneR = G5; 14'd3654 : toneR = G5; 14'd3655 : toneR = 1;
14'd3656 : toneR = A5; 14'd3657 : toneR = A5; 14'd3658 : toneR = A5; 14'd3659 : toneR = 1;
14'd3660 : toneR = C6; 14'd3661 : toneR = C6; 14'd3662 : toneR = C6; 14'd3663 : toneR = 1;
14'd3664 : toneR = A5; 14'd3665 : toneR = A5; 14'd3666 : toneR = A5; 14'd3667 : toneR = 1;
14'd3668 : toneR = G5; 14'd3669 : toneR = G5; 14'd3670 : toneR = G5; 14'd3671 : toneR = 1;
14'd3672 : toneR = E5; 14'd3673 : toneR = E5; 14'd3674 : toneR = E5; 14'd3675 : toneR = 1;
14'd3676 : toneR = Eflat5; 14'd3677 : toneR = Eflat5; 14'd3678 : toneR = Eflat5; 14'd3679 : toneR = 1;
14'd3680 : toneR = D5; 14'd3681 : toneR = D5; 14'd3682 : toneR = D5; 14'd3683 : toneR = 1;
14'd3684 : toneR = C5; 14'd3685 : toneR = C5; 14'd3686 : toneR = C5; 14'd3687 : toneR = 1;
14'd3688 : toneR = A4; 14'd3689 : toneR = A4; 14'd3690 : toneR = A4; 14'd3691 : toneR = 1;
14'd3692 : toneR = Gsharp4; 14'd3693 : toneR = Gsharp4; 14'd3694 : toneR = Gsharp4; 14'd3695 : toneR = 1;
14'd3696 : toneR = Eflat4; 14'd3697 : toneR = Eflat4; 14'd3698 : toneR = Eflat4; 14'd3699 : toneR = 1;
14'd3700 : toneR = D4; 14'd3701 : toneR = D4; 14'd3702 : toneR = D4; 14'd3703 : toneR = 1;
14'd3704 : toneR = C4; 14'd3705 : toneR = C4; 14'd3706 : toneR = C4; 14'd3707 : toneR = 1;
14'd3708 : toneR = A3; 14'd3709 : toneR = A3; 14'd3710 : toneR = A3; 14'd3711 : toneR = 1;
/*measure 59 */
14'd3712 : toneR = D4; 14'd3713 : toneR = D4; 14'd3714 : toneR = D4; 14'd3715 : toneR = 1;
14'd3716 : toneR = Eflat4; 14'd3717 : toneR = Eflat4; 14'd3718 : toneR = Eflat4; 14'd3719 : toneR = 1;
14'd3720 : toneR = E4; 14'd3721 : toneR = E4; 14'd3722 : toneR = E4; 14'd3723 : toneR = 1;
14'd3724 : toneR = G4; 14'd3725 : toneR = G4; 14'd3726 : toneR = G4; 14'd3727 : toneR = 1;
14'd3728 : toneR = A4; 14'd3729 : toneR = A4; 14'd3730 : toneR = A4; 14'd3731 : toneR = 1;
14'd3732 : toneR = G4; 14'd3733 : toneR = G4; 14'd3734 : toneR = G4; 14'd3735 : toneR = 1;
14'd3736 : toneR = A4; 14'd3737 : toneR = A4; 14'd3738 : toneR = A4; 14'd3739 : toneR = 1;
14'd3740 : toneR = C5; 14'd3741 : toneR = C5; 14'd3742 : toneR = C5; 14'd3743 : toneR = 1;
14'd3744 : toneR = D5; 14'd3745 : toneR = D5; 14'd3746 : toneR = D5; 14'd3747 : toneR = 1;
14'd3748 : toneR = Eflat5; 14'd3749 : toneR = Eflat5; 14'd3750 : toneR = Eflat5; 14'd3751 : toneR = 1;
14'd3752 : toneR = F5; 14'd3753 : toneR = F5; 14'd3754 : toneR = F5; 14'd3755 : toneR = 1;
14'd3756 : toneR = G5; 14'd3757 : toneR = G5; 14'd3758 : toneR = G5; 14'd3759 : toneR = 1;
14'd3760 : toneR = A5; 14'd3761 : toneR = A5; 14'd3762 : toneR = A5; 14'd3763 : toneR = 1;
14'd3764 : toneR = C6; 14'd3765 : toneR = C6; 14'd3766 : toneR = C6; 14'd3767 : toneR = 1;
14'd3768 : toneR = D6; 14'd3769 : toneR = D6; 14'd3770 : toneR = D6; 14'd3771 : toneR = 1;
14'd3772 : toneR = Eflat6; 14'd3773 : toneR = Eflat6; 14'd3774 : toneR = Eflat6; 14'd3775 : toneR = 1;
/*measure 60 */
14'd3776 : toneR = Eflat6; 14'd3777 : toneR = Eflat6; 14'd3778 : toneR = Eflat6; 14'd3779 : toneR = Eflat6;
14'd3780 : toneR = Eflat6; 14'd3781 : toneR = Eflat6; 14'd3782 : toneR = Eflat6; 14'd3783 : toneR = Eflat6;
14'd3784 : toneR = Eflat6; 14'd3785 : toneR = Eflat6; 14'd3786 : toneR = Eflat6; 14'd3787 : toneR = 1;
14'd3788 : toneR = Eflat6; 14'd3789 : toneR = Eflat6; 14'd3790 : toneR = Eflat6; 14'd3791 : toneR = Eflat6;
14'd3792 : toneR = Eflat6; 14'd3793 : toneR = Eflat6; 14'd3794 : toneR = Eflat6; 14'd3795 : toneR = Eflat6;
14'd3796 : toneR = Eflat6; 14'd3797 : toneR = Eflat6; 14'd3798 : toneR = Eflat6; 14'd3799 : toneR = 1;
14'd3800 : toneR = E6; 14'd3801 : toneR = E6; 14'd3802 : toneR = E6; 14'd3803 : toneR = E6;
14'd3804 : toneR = E6; 14'd3805 : toneR = E6; 14'd3806 : toneR = E6; 14'd3807 : toneR = 1;
14'd3808 : toneR = E6; 14'd3809 : toneR = E6; 14'd3810 : toneR = E6; 14'd3811 : toneR = E6;
14'd3812 : toneR = E6; 14'd3813 : toneR = E6; 14'd3814 : toneR = E6; 14'd3815 : toneR = E6;
14'd3816 : toneR = E6; 14'd3817 : toneR = E6; 14'd3818 : toneR = E6; 14'd3819 : toneR = E6;
14'd3820 : toneR = E6; 14'd3821 : toneR = E6; 14'd3822 : toneR = E6; 14'd3823 : toneR = E6;
14'd3824 : toneR = E6; 14'd3825 : toneR = E6; 14'd3826 : toneR = E6; 14'd3827 : toneR = E6;
14'd3828 : toneR = E6; 14'd3829 : toneR = E6; 14'd3830 : toneR = E6; 14'd3831 : toneR = 1;
14'd3832 : toneR = A6; 14'd3833 : toneR = A6; 14'd3834 : toneR = A6; 14'd3835 : toneR = 1;
14'd3836 : toneR = G6; 14'd3837 : toneR = G6; 14'd3838 : toneR = G6; 14'd3839 : toneR = 1;
/*measure 61 */
14'd3840 : toneR = Eflat6; 14'd3841 : toneR = Eflat6; 14'd3842 : toneR = Eflat6; 14'd3843 : toneR = 1;
14'd3844 : toneR = D6; 14'd3845 : toneR = D6; 14'd3846 : toneR = D6; 14'd3847 : toneR = 1;
14'd3848 : toneR = C6; 14'd3849 : toneR = C6; 14'd3850 : toneR = C6; 14'd3851 : toneR = 1;
14'd3852 : toneR = Eflat6; 14'd3853 : toneR = Eflat6; 14'd3854 : toneR = Eflat6; 14'd3855 : toneR = 1;
14'd3856 : toneR = D6; 14'd3857 : toneR = D6; 14'd3858 : toneR = D6; 14'd3859 : toneR = 1;
14'd3860 : toneR = C6; 14'd3861 : toneR = C6; 14'd3862 : toneR = C6; 14'd3863 : toneR = 1;
14'd3864 : toneR = Eflat6; 14'd3865 : toneR = Eflat6; 14'd3866 : toneR = Eflat6; 14'd3867 : toneR = 1;
14'd3868 : toneR = D6; 14'd3869 : toneR = D6; 14'd3870 : toneR = D6; 14'd3871 : toneR = 1;
14'd3872 : toneR = C6; 14'd3873 : toneR = C6; 14'd3874 : toneR = C6; 14'd3875 : toneR = 1;
14'd3876 : toneR = Eflat6; 14'd3877 : toneR = Eflat6; 14'd3878 : toneR = Eflat6; 14'd3879 : toneR = 1;
14'd3880 : toneR = D6; 14'd3881 : toneR = D6; 14'd3882 : toneR = D6; 14'd3883 : toneR = 1;
14'd3884 : toneR = C6; 14'd3885 : toneR = C6; 14'd3886 : toneR = C6; 14'd3887 : toneR = 1;
14'd3888 : toneR = Eflat6; 14'd3889 : toneR = Eflat6; 14'd3890 : toneR = Eflat6; 14'd3891 : toneR = 1;
14'd3892 : toneR = D6; 14'd3893 : toneR = D6; 14'd3894 : toneR = D6; 14'd3895 : toneR = 1;
14'd3896 : toneR = C6; 14'd3897 : toneR = C6; 14'd3898 : toneR = C6; 14'd3899 : toneR = 1;
14'd3900 : toneR = A5; 14'd3901 : toneR = A5; 14'd3902 : toneR = A5; 14'd3903 : toneR = 1;
/*measure 62 */
14'd3904 : toneR = Gsharp5; 14'd3905 : toneR = Gsharp5; 14'd3906 : toneR = Gsharp5; 14'd3907 : toneR = 1;
14'd3908 : toneR = A5; 14'd3909 : toneR = A5; 14'd3910 : toneR = A5; 14'd3911 : toneR = 1;
14'd3912 : toneR = Eflat5; 14'd3913 : toneR = Eflat5; 14'd3914 : toneR = 1; 14'd3915 : toneR = D5;
14'd3916 : toneR = 1; 14'd3917 : toneR = C5; 14'd3918 : toneR = C5; 14'd3919 : toneR = 1;
14'd3920 : toneR = D5; 14'd3921 : toneR = D5; 14'd3922 : toneR = D5; 14'd3923 : toneR = 1;
14'd3924 : toneR = Eflat5; 14'd3925 : toneR = Eflat5; 14'd3926 : toneR = Eflat5; 14'd3927 : toneR = 1;
14'd3928 : toneR = C5; 14'd3929 : toneR = C5; 14'd3930 : toneR = 1; 14'd3931 : toneR = A4;
14'd3932 : toneR = 1; 14'd3933 : toneR = Aflat4; 14'd3934 : toneR = Aflat4; 14'd3935 : toneR = 1;
14'd3936 : toneR = G4; 14'd3937 : toneR = G4; 14'd3938 : toneR = G4; 14'd3939 : toneR = 1;
14'd3940 : toneR = A4; 14'd3941 : toneR = A4; 14'd3942 : toneR = A4; 14'd3943 : toneR = 1;
14'd3944 : toneR = E4; 14'd3945 : toneR = E4; 14'd3946 : toneR = 1; 14'd3947 : toneR = D4;
14'd3948 : toneR = 1; 14'd3949 : toneR = C4; 14'd3950 : toneR = C4; 14'd3951 : toneR = 1;
14'd3952 : toneR = D4; 14'd3953 : toneR = D4; 14'd3954 : toneR = D4; 14'd3955 : toneR = 1;
14'd3956 : toneR = C4; 14'd3957 : toneR = C4; 14'd3958 : toneR = C4; 14'd3959 : toneR = 1;
14'd3960 : toneR = A3; 14'd3961 : toneR = A3; 14'd3962 : toneR = A3; 14'd3963 : toneR = 1;
14'd3964 : toneR = G3; 14'd3965 : toneR = G3; 14'd3966 : toneR = G3; 14'd3967 : toneR = 1;
/*measure 63 */
14'd3968 : toneR = A4; 14'd3969 : toneR = A4; 14'd3970 : toneR = A4; 14'd3971 : toneR = 1;
14'd3972 : toneR = A3; 14'd3973 : toneR = A3; 14'd3974 : toneR = A3; 14'd3975 : toneR = 1;
14'd3976 : toneR = G4; 14'd3977 : toneR = G4; 14'd3978 : toneR = G4; 14'd3979 : toneR = 1;
14'd3980 : toneR = 1; 14'd3981 : toneR = 1; 14'd3982 : toneR = 1; 14'd3983 : toneR = 1;
14'd3984 : toneR = C5; 14'd3985 : toneR = C5; 14'd3986 : toneR = C5; 14'd3987 : toneR = 1;
14'd3988 : toneR = C4; 14'd3989 : toneR = C4; 14'd3990 : toneR = C4; 14'd3991 : toneR = 1;
14'd3992 : toneR = G4; 14'd3993 : toneR = G4; 14'd3994 : toneR = G4; 14'd3995 : toneR = 1;
14'd3996 : toneR = 1; 14'd3997 : toneR = 1; 14'd3998 : toneR = 1; 14'd3999 : toneR = 1;
14'd4000 : toneR = A4; 14'd4001 : toneR = A4; 14'd4002 : toneR = A4; 14'd4003 : toneR = 1;
14'd4004 : toneR = A3; 14'd4005 : toneR = A3; 14'd4006 : toneR = A3; 14'd4007 : toneR = 1;
14'd4008 : toneR = G4; 14'd4009 : toneR = G4; 14'd4010 : toneR = G4; 14'd4011 : toneR = 1;
14'd4012 : toneR = 1; 14'd4013 : toneR = 1; 14'd4014 : toneR = 1; 14'd4015 : toneR = 1;
14'd4016 : toneR = C5; 14'd4017 : toneR = C5; 14'd4018 : toneR = C5; 14'd4019 : toneR = 1;
14'd4020 : toneR = C4; 14'd4021 : toneR = C4; 14'd4022 : toneR = C4; 14'd4023 : toneR = 1;
14'd4024 : toneR = D5; 14'd4025 : toneR = D5; 14'd4026 : toneR = D5; 14'd4027 : toneR = 1;
14'd4028 : toneR = 1; 14'd4029 : toneR = 1; 14'd4030 : toneR = 1; 14'd4031 : toneR = 1;
/*measure 64 */
14'd4032 : toneR = Eflat5; 14'd4033 : toneR = Eflat5; 14'd4034 : toneR = Eflat5; 14'd4035 : toneR = 1;
14'd4036 : toneR = Eflat4; 14'd4037 : toneR = Eflat4; 14'd4038 : toneR = Eflat4; 14'd4039 : toneR = 1;
14'd4040 : toneR = C5; 14'd4041 : toneR = C5; 14'd4042 : toneR = C5; 14'd4043 : toneR = 1;
14'd4044 : toneR = 1; 14'd4045 : toneR = 1; 14'd4046 : toneR = 1; 14'd4047 : toneR = 1;
14'd4048 : toneR = D5; 14'd4049 : toneR = D5; 14'd4050 : toneR = D5; 14'd4051 : toneR = 1;
14'd4052 : toneR = D4; 14'd4053 : toneR = D4; 14'd4054 : toneR = D4; 14'd4055 : toneR = 1;
14'd4056 : toneR = C5; 14'd4057 : toneR = C5; 14'd4058 : toneR = C5; 14'd4059 : toneR = 1;
14'd4060 : toneR = 1; 14'd4061 : toneR = 1; 14'd4062 : toneR = 1; 14'd4063 : toneR = 1;
14'd4064 : toneR = Eflat5; 14'd4065 : toneR = Eflat5; 14'd4066 : toneR = Eflat5; 14'd4067 : toneR = Eflat5;
14'd4068 : toneR = Eflat5; 14'd4069 : toneR = Eflat5; 14'd4070 : toneR = Eflat5; 14'd4071 : toneR = 1;
14'd4072 : toneR = E5; 14'd4073 : toneR = E5; 14'd4074 : toneR = E5; 14'd4075 : toneR = E5;
14'd4076 : toneR = E5; 14'd4077 : toneR = E5; 14'd4078 : toneR = E5; 14'd4079 : toneR = 1;
14'd4080 : toneR = F5; 14'd4081 : toneR = F5; 14'd4082 : toneR = F5; 14'd4083 : toneR = F5;
14'd4084 : toneR = F5; 14'd4085 : toneR = F5; 14'd4086 : toneR = F5; 14'd4087 : toneR = 1;
14'd4088 : toneR = Dsharp5; 14'd4089 : toneR = Dsharp5; 14'd4090 : toneR = Dsharp5; 14'd4091 : toneR = Dsharp5;        
14'd4092 : toneR = Dsharp5; 14'd4093 : toneR = Dsharp5; 14'd4094 : toneR = Dsharp5; 14'd4095 : toneR = 1;
/*measure 65 */
14'd4096 : toneR = E5; 14'd4097 : toneR = E5; 14'd4098 : toneR = E5; 14'd4099 : toneR = 1;
14'd4100 : toneR = A4; 14'd4101 : toneR = A4; 14'd4102 : toneR = A4; 14'd4103 : toneR = 1;
14'd4104 : toneR = B4; 14'd4105 : toneR = B4; 14'd4106 : toneR = B4; 14'd4107 : toneR = 1;
14'd4108 : toneR = A4; 14'd4109 : toneR = A4; 14'd4110 : toneR = A4; 14'd4111 : toneR = 1;
14'd4112 : toneR = B4; 14'd4113 : toneR = B4; 14'd4114 : toneR = B4; 14'd4115 : toneR = B4;
14'd4116 : toneR = B4; 14'd4117 : toneR = B4; 14'd4118 : toneR = B4; 14'd4119 : toneR = 1;
14'd4120 : toneR = C5; 14'd4121 : toneR = C5; 14'd4122 : toneR = C5; 14'd4123 : toneR = C5;
14'd4124 : toneR = C5; 14'd4125 : toneR = C5; 14'd4126 : toneR = C5; 14'd4127 : toneR = 1;
14'd4128 : toneR = C5; 14'd4129 : toneR = C5; 14'd4130 : toneR = C5; 14'd4131 : toneR = C5;
14'd4132 : toneR = C5; 14'd4133 : toneR = C5; 14'd4134 : toneR = C5; 14'd4135 : toneR = 1;
14'd4136 : toneR = Csharp5; 14'd4137 : toneR = Csharp5; 14'd4138 : toneR = Csharp5; 14'd4139 : toneR = Csharp5;        
14'd4140 : toneR = Csharp5; 14'd4141 : toneR = Csharp5; 14'd4142 : toneR = Csharp5; 14'd4143 : toneR = 1;
14'd4144 : toneR = D5; 14'd4145 : toneR = D5; 14'd4146 : toneR = D5; 14'd4147 : toneR = D5;
14'd4148 : toneR = D5; 14'd4149 : toneR = D5; 14'd4150 : toneR = D5; 14'd4151 : toneR = 1;
14'd4152 : toneR = Eflat5; 14'd4153 : toneR = Eflat5; 14'd4154 : toneR = Eflat5; 14'd4155 : toneR = Eflat5;
14'd4156 : toneR = Eflat5; 14'd4157 : toneR = Eflat5; 14'd4158 : toneR = Eflat5; 14'd4159 : toneR = 1;
/*measure 66 */
14'd4160 : toneR = E5; 14'd4161 : toneR = E5; 14'd4162 : toneR = E5; 14'd4163 : toneR = E5;
14'd4164 : toneR = E5; 14'd4165 : toneR = E5; 14'd4166 : toneR = E5; 14'd4167 : toneR = 1;
14'd4168 : toneR = Eflat5; 14'd4169 : toneR = Eflat5; 14'd4170 : toneR = Eflat5; 14'd4171 : toneR = 1;
14'd4172 : toneR = D5; 14'd4173 : toneR = D5; 14'd4174 : toneR = D5; 14'd4175 : toneR = 1;
14'd4176 : toneR = C5; 14'd4177 : toneR = C5; 14'd4178 : toneR = C5; 14'd4179 : toneR = 1;
14'd4180 : toneR = A5; 14'd4181 : toneR = A5; 14'd4182 : toneR = A5; 14'd4183 : toneR = 1;
14'd4184 : toneR = D5; 14'd4185 : toneR = D5; 14'd4186 : toneR = D5; 14'd4187 : toneR = 1;
14'd4188 : toneR = C5; 14'd4189 : toneR = C5; 14'd4190 : toneR = C5; 14'd4191 : toneR = 1;
14'd4192 : toneR = A5; 14'd4193 : toneR = A5; 14'd4194 : toneR = A5; 14'd4195 : toneR = 1;
14'd4196 : toneR = D5; 14'd4197 : toneR = D5; 14'd4198 : toneR = D5; 14'd4199 : toneR = 1;
14'd4200 : toneR = C5; 14'd4201 : toneR = C5; 14'd4202 : toneR = C5; 14'd4203 : toneR = 1;
14'd4204 : toneR = A5; 14'd4205 : toneR = A5; 14'd4206 : toneR = A5; 14'd4207 : toneR = 1;
14'd4208 : toneR = D5; 14'd4209 : toneR = D5; 14'd4210 : toneR = D5; 14'd4211 : toneR = 1;
14'd4212 : toneR = C5; 14'd4213 : toneR = C5; 14'd4214 : toneR = C5; 14'd4215 : toneR = 1;
14'd4216 : toneR = A5; 14'd4217 : toneR = A5; 14'd4218 : toneR = A5; 14'd4219 : toneR = 1;
14'd4220 : toneR = C5; 14'd4221 : toneR = C5; 14'd4222 : toneR = C5; 14'd4223 : toneR = 1;
/*measure 67 */
14'd4224 : toneR = A5; 14'd4225 : toneR = A5; 14'd4226 : toneR = A5; 14'd4227 : toneR = 1;
14'd4228 : toneR = B5; 14'd4229 : toneR = B5; 14'd4230 : toneR = B5; 14'd4231 : toneR = 1;
14'd4232 : toneR = C6; 14'd4233 : toneR = C6; 14'd4234 : toneR = C6; 14'd4235 : toneR = 1;
14'd4236 : toneR = Gsharp5; 14'd4237 : toneR = Gsharp5; 14'd4238 : toneR = Gsharp5; 14'd4239 : toneR = 1;
14'd4240 : toneR = A5; 14'd4241 : toneR = A5; 14'd4242 : toneR = A5; 14'd4243 : toneR = 1;
14'd4244 : toneR = Eflat5; 14'd4245 : toneR = Eflat5; 14'd4246 : toneR = Eflat5; 14'd4247 : toneR = 1;
14'd4248 : toneR = C5; 14'd4249 : toneR = C5; 14'd4250 : toneR = C5; 14'd4251 : toneR = 1;
14'd4252 : toneR = Gsharp4; 14'd4253 : toneR = Gsharp4; 14'd4254 : toneR = Gsharp4; 14'd4255 : toneR = 1;
14'd4256 : toneR = A4; 14'd4257 : toneR = A4; 14'd4258 : toneR = A4; 14'd4259 : toneR = 1;
14'd4260 : toneR = B4; 14'd4261 : toneR = B4; 14'd4262 : toneR = B4; 14'd4263 : toneR = 1;
14'd4264 : toneR = C5; 14'd4265 : toneR = C5; 14'd4266 : toneR = C5; 14'd4267 : toneR = 1;
14'd4268 : toneR = Csharp5; 14'd4269 : toneR = Csharp5; 14'd4270 : toneR = Csharp5; 14'd4271 : toneR = 1;
14'd4272 : toneR = D5; 14'd4273 : toneR = D5; 14'd4274 : toneR = D5; 14'd4275 : toneR = 1;
14'd4276 : toneR = Eflat5; 14'd4277 : toneR = Eflat5; 14'd4278 : toneR = Eflat5; 14'd4279 : toneR = 1;
14'd4280 : toneR = F5; 14'd4281 : toneR = F5; 14'd4282 : toneR = F5; 14'd4283 : toneR = 1;
14'd4284 : toneR = Eflat5; 14'd4285 : toneR = Eflat5; 14'd4286 : toneR = Eflat5; 14'd4287 : toneR = 1;
/*measure 68 */
14'd4288 : toneR = E5; 14'd4289 : toneR = E5; 14'd4290 : toneR = E5; 14'd4291 : toneR = 1;
14'd4292 : toneR = F5; 14'd4293 : toneR = F5; 14'd4294 : toneR = F5; 14'd4295 : toneR = 1;
14'd4296 : toneR = Gsharp5; 14'd4297 : toneR = Gsharp5; 14'd4298 : toneR = Gsharp5; 14'd4299 : toneR = 1;
14'd4300 : toneR = A5; 14'd4301 : toneR = A5; 14'd4302 : toneR = A5; 14'd4303 : toneR = 1;
14'd4304 : toneR = B5; 14'd4305 : toneR = B5; 14'd4306 : toneR = B5; 14'd4307 : toneR = 1;
14'd4308 : toneR = C6; 14'd4309 : toneR = C6; 14'd4310 : toneR = C6; 14'd4311 : toneR = 1;
14'd4312 : toneR = Eflat6; 14'd4313 : toneR = Eflat6; 14'd4314 : toneR = Eflat6; 14'd4315 : toneR = 1;
14'd4316 : toneR = E6; 14'd4317 : toneR = E6; 14'd4318 : toneR = E6; 14'd4319 : toneR = 1;
14'd4320 : toneR = F6; 14'd4321 : toneR = F6; 14'd4322 : toneR = F6; 14'd4323 : toneR = 1;
14'd4324 : toneR = E6; 14'd4325 : toneR = E6; 14'd4326 : toneR = E6; 14'd4327 : toneR = 1;
14'd4328 : toneR = Eflat6; 14'd4329 : toneR = Eflat6; 14'd4330 : toneR = Eflat6; 14'd4331 : toneR = 1;
14'd4332 : toneR = E6; 14'd4333 : toneR = E6; 14'd4334 : toneR = E6; 14'd4335 : toneR = 1;
14'd4336 : toneR = B5; 14'd4337 : toneR = B5; 14'd4338 : toneR = B5; 14'd4339 : toneR = 1;
14'd4340 : toneR = G5; 14'd4341 : toneR = G5; 14'd4342 : toneR = G5; 14'd4343 : toneR = 1;
14'd4344 : toneR = D5; 14'd4345 : toneR = D5; 14'd4346 : toneR = D5; 14'd4347 : toneR = 1;
14'd4348 : toneR = B4; 14'd4349 : toneR = B4; 14'd4350 : toneR = B4; 14'd4351 : toneR = 1;
/*measure 69 */
14'd4352 : toneR = C5; 14'd4353 : toneR = C5; 14'd4354 : toneR = C5; 14'd4355 : toneR = 1;
14'd4356 : toneR = B4; 14'd4357 : toneR = B4; 14'd4358 : toneR = B4; 14'd4359 : toneR = 1;
14'd4360 : toneR = A4; 14'd4361 : toneR = A4; 14'd4362 : toneR = A4; 14'd4363 : toneR = 1;
14'd4364 : toneR = B4; 14'd4365 : toneR = B4; 14'd4366 : toneR = B4; 14'd4367 : toneR = 1;
14'd4368 : toneR = C5; 14'd4369 : toneR = C5; 14'd4370 : toneR = C5; 14'd4371 : toneR = 1;
14'd4372 : toneR = Eflat5; 14'd4373 : toneR = Eflat5; 14'd4374 : toneR = Eflat5; 14'd4375 : toneR = 1;
14'd4376 : toneR = E5; 14'd4377 : toneR = E5; 14'd4378 : toneR = E5; 14'd4379 : toneR = 1;
14'd4380 : toneR = A5; 14'd4381 : toneR = A5; 14'd4382 : toneR = A5; 14'd4383 : toneR = 1;
14'd4384 : toneR = C6; 14'd4385 : toneR = C6; 14'd4386 : toneR = C6; 14'd4387 : toneR = 1;
14'd4388 : toneR = B5; 14'd4389 : toneR = B5; 14'd4390 : toneR = B5; 14'd4391 : toneR = 1;
14'd4392 : toneR = Gsharp5; 14'd4393 : toneR = Gsharp5; 14'd4394 : toneR = Gsharp5; 14'd4395 : toneR = 1;
14'd4396 : toneR = B5; 14'd4397 : toneR = B5; 14'd4398 : toneR = B5; 14'd4399 : toneR = 1;
14'd4400 : toneR = A5; 14'd4401 : toneR = A5; 14'd4402 : toneR = A5; 14'd4403 : toneR = 1;
14'd4404 : toneR = Eflat5; 14'd4405 : toneR = Eflat5; 14'd4406 : toneR = Eflat5; 14'd4407 : toneR = 1;
14'd4408 : toneR = D5; 14'd4409 : toneR = D5; 14'd4410 : toneR = D5; 14'd4411 : toneR = 1;
14'd4412 : toneR = C5; 14'd4413 : toneR = C5; 14'd4414 : toneR = C5; 14'd4415 : toneR = 1;
/*measure 70 */
14'd4416 : toneR = D5; 14'd4417 : toneR = D5; 14'd4418 : toneR = D5; 14'd4419 : toneR = 1;
14'd4420 : toneR = 1; 14'd4421 : toneR = 1; 14'd4422 : toneR = 1; 14'd4423 : toneR = 1;
14'd4424 : toneR = D5; 14'd4425 : toneR = D5; 14'd4426 : toneR = D5; 14'd4427 : toneR = 1;
14'd4428 : toneR = C5; 14'd4429 : toneR = C5; 14'd4430 : toneR = C5; 14'd4431 : toneR = 1;
14'd4432 : toneR = D5; 14'd4433 : toneR = D5; 14'd4434 : toneR = D5; 14'd4435 : toneR = 1;
14'd4436 : toneR = 1; 14'd4437 : toneR = 1; 14'd4438 : toneR = 1; 14'd4439 : toneR = 1;
14'd4440 : toneR = D5; 14'd4441 : toneR = D5; 14'd4442 : toneR = D5; 14'd4443 : toneR = 1;
14'd4444 : toneR = C5; 14'd4445 : toneR = C5; 14'd4446 : toneR = C5; 14'd4447 : toneR = 1;
14'd4448 : toneR = D5; 14'd4449 : toneR = D5; 14'd4450 : toneR = D5; 14'd4451 : toneR = D5;
14'd4452 : toneR = D5; 14'd4453 : toneR = D5; 14'd4454 : toneR = D5; 14'd4455 : toneR = 1;
14'd4456 : toneR = E5; 14'd4457 : toneR = E5; 14'd4458 : toneR = E5; 14'd4459 : toneR = E5;
14'd4460 : toneR = E5; 14'd4461 : toneR = E5; 14'd4462 : toneR = E5; 14'd4463 : toneR = 1;
14'd4464 : toneR = A4; 14'd4465 : toneR = A4; 14'd4466 : toneR = A4; 14'd4467 : toneR = A4;
14'd4468 : toneR = A4; 14'd4469 : toneR = A4; 14'd4470 : toneR = A4; 14'd4471 : toneR = 1;
14'd4472 : toneR = C5; 14'd4473 : toneR = C5; 14'd4474 : toneR = C5; 14'd4475 : toneR = C5;
14'd4476 : toneR = C5; 14'd4477 : toneR = C5; 14'd4478 : toneR = C5; 14'd4479 : toneR = 1;
/*measure 71 */
14'd4480 : toneR = Eflat6; 14'd4481 : toneR = Eflat6; 14'd4482 : toneR = Eflat6; 14'd4483 : toneR = Eflat6;
14'd4484 : toneR = Eflat6; 14'd4485 : toneR = Eflat6; 14'd4486 : toneR = Eflat6; 14'd4487 : toneR = 1;
14'd4488 : toneR = F6; 14'd4489 : toneR = F6; 14'd4490 : toneR = F6; 14'd4491 : toneR = F6;
14'd4492 : toneR = F6; 14'd4493 : toneR = F6; 14'd4494 : toneR = F6; 14'd4495 : toneR = 1;
14'd4496 : toneR = G6; 14'd4497 : toneR = G6; 14'd4498 : toneR = G6; 14'd4499 : toneR = G6;
14'd4500 : toneR = G6; 14'd4501 : toneR = G6; 14'd4502 : toneR = G6; 14'd4503 : toneR = 1;
14'd4504 : toneR = A6; 14'd4505 : toneR = A6; 14'd4506 : toneR = A6; 14'd4507 : toneR = A6;
14'd4508 : toneR = A6; 14'd4509 : toneR = A6; 14'd4510 : toneR = A6; 14'd4511 : toneR = 1;
14'd4512 : toneR = B6; 14'd4513 : toneR = B6; 14'd4514 : toneR = B6; 14'd4515 : toneR = B6;
14'd4516 : toneR = B6; 14'd4517 : toneR = B6; 14'd4518 : toneR = B6; 14'd4519 : toneR = 1;
14'd4520 : toneR = C7; 14'd4521 : toneR = C7; 14'd4522 : toneR = C7; 14'd4523 : toneR = C7;
14'd4524 : toneR = C7; 14'd4525 : toneR = C7; 14'd4526 : toneR = C7; 14'd4527 : toneR = 1;
14'd4528 : toneR = D7; 14'd4529 : toneR = D7; 14'd4530 : toneR = D7; 14'd4531 : toneR = D7;
14'd4532 : toneR = D7; 14'd4533 : toneR = D7; 14'd4534 : toneR = D7; 14'd4535 : toneR = 1;
14'd4536 : toneR = Eflat7; 14'd4537 : toneR = Eflat7; 14'd4538 : toneR = Eflat7; 14'd4539 : toneR = Eflat7;
14'd4540 : toneR = Eflat7; 14'd4541 : toneR = Eflat7; 14'd4542 : toneR = Eflat7; 14'd4543 : toneR = 1;
/*measure 72 */
14'd4544 : toneR = Eflat7; 14'd4545 : toneR = Eflat7; 14'd4546 : toneR = Eflat7; 14'd4547 : toneR = Eflat7;
14'd4548 : toneR = Eflat7; 14'd4549 : toneR = Eflat7; 14'd4550 : toneR = Eflat7; 14'd4551 : toneR = 1;
14'd4552 : toneR = Eflat7; 14'd4553 : toneR = Eflat7; 14'd4554 : toneR = Eflat7; 14'd4555 : toneR = Eflat7;
14'd4556 : toneR = Eflat7; 14'd4557 : toneR = Eflat7; 14'd4558 : toneR = Eflat7; 14'd4559 : toneR = 1;
14'd4560 : toneR = Eflat7; 14'd4561 : toneR = Eflat7; 14'd4562 : toneR = Eflat7; 14'd4563 : toneR = Eflat7;
14'd4564 : toneR = Eflat7; 14'd4565 : toneR = Eflat7; 14'd4566 : toneR = Eflat7; 14'd4567 : toneR = 1;
14'd4568 : toneR = Eflat6; 14'd4569 : toneR = Eflat6; 14'd4570 : toneR = Eflat6; 14'd4571 : toneR = Eflat6;
14'd4572 : toneR = Eflat6; 14'd4573 : toneR = Eflat6; 14'd4574 : toneR = Eflat6; 14'd4575 : toneR = 1;
14'd4576 : toneR = Eflat7; 14'd4577 : toneR = Eflat7; 14'd4578 : toneR = Eflat7; 14'd4579 : toneR = Eflat7;
14'd4580 : toneR = Eflat7; 14'd4581 : toneR = Eflat7; 14'd4582 : toneR = Eflat7; 14'd4583 : toneR = Eflat7;
14'd4584 : toneR = Eflat7; 14'd4585 : toneR = Eflat7; 14'd4586 : toneR = Eflat7; 14'd4587 : toneR = Eflat7;
14'd4588 : toneR = Eflat7; 14'd4589 : toneR = Eflat7; 14'd4590 : toneR = Eflat7; 14'd4591 : toneR = Eflat7;
14'd4592 : toneR = Eflat7; 14'd4593 : toneR = Eflat7; 14'd4594 : toneR = Eflat7; 14'd4595 : toneR = Eflat7;
14'd4596 : toneR = Eflat7; 14'd4597 : toneR = Eflat7; 14'd4598 : toneR = Eflat7; 14'd4599 : toneR = Eflat7;
14'd4600 : toneR = Eflat7; 14'd4601 : toneR = Eflat7; 14'd4602 : toneR = Eflat7; 14'd4603 : toneR = Eflat7;
14'd4604 : toneR = Eflat7; 14'd4605 : toneR = Eflat7; 14'd4606 : toneR = Eflat7; 14'd4607 : toneR = 1;
/*measure 73 */
14'd4608 : toneR = E5; 14'd4609 : toneR = E5; 14'd4610 : toneR = E5; 14'd4611 : toneR = E5;
14'd4612 : toneR = E5; 14'd4613 : toneR = E5; 14'd4614 : toneR = E5; 14'd4615 : toneR = 1;
14'd4616 : toneR = Eflat5; 14'd4617 : toneR = Eflat5; 14'd4618 : toneR = Eflat5; 14'd4619 : toneR = Eflat5;
14'd4620 : toneR = Eflat5; 14'd4621 : toneR = Eflat5; 14'd4622 : toneR = Eflat5; 14'd4623 : toneR = 1;
14'd4624 : toneR = E5; 14'd4625 : toneR = E5; 14'd4626 : toneR = E5; 14'd4627 : toneR = E5;
14'd4628 : toneR = E5; 14'd4629 : toneR = E5; 14'd4630 : toneR = E5; 14'd4631 : toneR = 1;
14'd4632 : toneR = F5; 14'd4633 : toneR = F5; 14'd4634 : toneR = F5; 14'd4635 : toneR = F5;
14'd4636 : toneR = F5; 14'd4637 : toneR = F5; 14'd4638 : toneR = F5; 14'd4639 : toneR = 1;
14'd4640 : toneR = E5; 14'd4641 : toneR = E5; 14'd4642 : toneR = E5; 14'd4643 : toneR = E5;
14'd4644 : toneR = E5; 14'd4645 : toneR = E5; 14'd4646 : toneR = E5; 14'd4647 : toneR = 1;
14'd4648 : toneR = D5; 14'd4649 : toneR = D5; 14'd4650 : toneR = D5; 14'd4651 : toneR = D5;
14'd4652 : toneR = D5; 14'd4653 : toneR = D5; 14'd4654 : toneR = D5; 14'd4655 : toneR = 1;
14'd4656 : toneR = C5; 14'd4657 : toneR = C5; 14'd4658 : toneR = C5; 14'd4659 : toneR = C5;
14'd4660 : toneR = C5; 14'd4661 : toneR = C5; 14'd4662 : toneR = C5; 14'd4663 : toneR = 1;
14'd4664 : toneR = D5; 14'd4665 : toneR = D5; 14'd4666 : toneR = D5; 14'd4667 : toneR = D5;
14'd4668 : toneR = D5; 14'd4669 : toneR = D5; 14'd4670 : toneR = D5; 14'd4671 : toneR = 1;
/*measure 74 */
14'd4672 : toneR = E5; 14'd4673 : toneR = E5; 14'd4674 : toneR = E5; 14'd4675 : toneR = E5;
14'd4676 : toneR = E5; 14'd4677 : toneR = E5; 14'd4678 : toneR = E5; 14'd4679 : toneR = 1;
14'd4680 : toneR = Eflat5; 14'd4681 : toneR = Eflat5; 14'd4682 : toneR = Eflat5; 14'd4683 : toneR = Eflat5;
14'd4684 : toneR = Eflat5; 14'd4685 : toneR = Eflat5; 14'd4686 : toneR = Eflat5; 14'd4687 : toneR = 1;
14'd4688 : toneR = E5; 14'd4689 : toneR = E5; 14'd4690 : toneR = E5; 14'd4691 : toneR = E5;
14'd4692 : toneR = E5; 14'd4693 : toneR = E5; 14'd4694 : toneR = E5; 14'd4695 : toneR = 1;
14'd4696 : toneR = F5; 14'd4697 : toneR = F5; 14'd4698 : toneR = F5; 14'd4699 : toneR = F5;
14'd4700 : toneR = F5; 14'd4701 : toneR = F5; 14'd4702 : toneR = F5; 14'd4703 : toneR = 1;
14'd4704 : toneR = E5; 14'd4705 : toneR = E5; 14'd4706 : toneR = E5; 14'd4707 : toneR = E5;
14'd4708 : toneR = E5; 14'd4709 : toneR = E5; 14'd4710 : toneR = E5; 14'd4711 : toneR = 1;
14'd4712 : toneR = D5; 14'd4713 : toneR = D5; 14'd4714 : toneR = D5; 14'd4715 : toneR = D5;
14'd4716 : toneR = D5; 14'd4717 : toneR = D5; 14'd4718 : toneR = D5; 14'd4719 : toneR = 1;
14'd4720 : toneR = C5; 14'd4721 : toneR = C5; 14'd4722 : toneR = C5; 14'd4723 : toneR = C5;
14'd4724 : toneR = C5; 14'd4725 : toneR = C5; 14'd4726 : toneR = C5; 14'd4727 : toneR = 1;
14'd4728 : toneR = B4; 14'd4729 : toneR = B4; 14'd4730 : toneR = B4; 14'd4731 : toneR = B4;
14'd4732 : toneR = B4; 14'd4733 : toneR = B4; 14'd4734 : toneR = B4; 14'd4735 : toneR = 1;
/*measure 75 */
14'd4736 : toneR = A4; 14'd4737 : toneR = A4; 14'd4738 : toneR = A4; 14'd4739 : toneR = A4;
14'd4740 : toneR = A4; 14'd4741 : toneR = A4; 14'd4742 : toneR = A4; 14'd4743 : toneR = A4;
14'd4744 : toneR = A4; 14'd4745 : toneR = A4; 14'd4746 : toneR = A4; 14'd4747 : toneR = A4;
14'd4748 : toneR = A4; 14'd4749 : toneR = A4; 14'd4750 : toneR = A4; 14'd4751 : toneR = 1;
14'd4752 : toneR = A6; 14'd4753 : toneR = A6; 14'd4754 : toneR = A6; 14'd4755 : toneR = A6;
14'd4756 : toneR = A6; 14'd4757 : toneR = A6; 14'd4758 : toneR = A6; 14'd4759 : toneR = 1;
14'd4760 : toneR = A5; 14'd4761 : toneR = A5; 14'd4762 : toneR = A5; 14'd4763 : toneR = A5;
14'd4764 : toneR = A5; 14'd4765 : toneR = A5; 14'd4766 : toneR = A5; 14'd4767 : toneR = 1;
14'd4768 : toneR = Gsharp6; 14'd4769 : toneR = Gsharp6; 14'd4770 : toneR = Gsharp6; 14'd4771 : toneR = Gsharp6;
14'd4772 : toneR = Gsharp6; 14'd4773 : toneR = Gsharp6; 14'd4774 : toneR = Gsharp6; 14'd4775 : toneR = 1;
14'd4776 : toneR = Gsharp5; 14'd4777 : toneR = Gsharp5; 14'd4778 : toneR = Gsharp5; 14'd4779 : toneR = Gsharp5;        
14'd4780 : toneR = Gsharp5; 14'd4781 : toneR = Gsharp5; 14'd4782 : toneR = Gsharp5; 14'd4783 : toneR = 1;
14'd4784 : toneR = G6; 14'd4785 : toneR = G6; 14'd4786 : toneR = G6; 14'd4787 : toneR = G6;
14'd4788 : toneR = G6; 14'd4789 : toneR = G6; 14'd4790 : toneR = G6; 14'd4791 : toneR = 1;
14'd4792 : toneR = G5; 14'd4793 : toneR = G5; 14'd4794 : toneR = G5; 14'd4795 : toneR = G5;
14'd4796 : toneR = G5; 14'd4797 : toneR = G5; 14'd4798 : toneR = G5; 14'd4799 : toneR = 1;
/*measure 76 */
14'd4800 : toneR = Fsharp6; 14'd4801 : toneR = Fsharp6; 14'd4802 : toneR = Fsharp6; 14'd4803 : toneR = Fsharp6;        
14'd4804 : toneR = Fsharp6; 14'd4805 : toneR = Fsharp6; 14'd4806 : toneR = Fsharp6; 14'd4807 : toneR = 1;
14'd4808 : toneR = Fsharp5; 14'd4809 : toneR = Fsharp5; 14'd4810 : toneR = Fsharp5; 14'd4811 : toneR = Fsharp5;        
14'd4812 : toneR = Fsharp5; 14'd4813 : toneR = Fsharp5; 14'd4814 : toneR = Fsharp5; 14'd4815 : toneR = 1;
14'd4816 : toneR = F6; 14'd4817 : toneR = F6; 14'd4818 : toneR = F6; 14'd4819 : toneR = F6;
14'd4820 : toneR = F6; 14'd4821 : toneR = F6; 14'd4822 : toneR = F6; 14'd4823 : toneR = 1;
14'd4824 : toneR = F5; 14'd4825 : toneR = F5; 14'd4826 : toneR = F5; 14'd4827 : toneR = F5;
14'd4828 : toneR = F5; 14'd4829 : toneR = F5; 14'd4830 : toneR = F5; 14'd4831 : toneR = 1;
14'd4832 : toneR = Dsharp6; 14'd4833 : toneR = Dsharp6; 14'd4834 : toneR = Dsharp6; 14'd4835 : toneR = Dsharp6;        
14'd4836 : toneR = Dsharp6; 14'd4837 : toneR = Dsharp6; 14'd4838 : toneR = Dsharp6; 14'd4839 : toneR = 1;
14'd4840 : toneR = Dsharp5; 14'd4841 : toneR = Dsharp5; 14'd4842 : toneR = Dsharp5; 14'd4843 : toneR = Dsharp5;        
14'd4844 : toneR = Dsharp5; 14'd4845 : toneR = Dsharp5; 14'd4846 : toneR = Dsharp5; 14'd4847 : toneR = 1;
14'd4848 : toneR = E6; 14'd4849 : toneR = E6; 14'd4850 : toneR = E6; 14'd4851 : toneR = E6;
14'd4852 : toneR = E6; 14'd4853 : toneR = E6; 14'd4854 : toneR = E6; 14'd4855 : toneR = 1;
14'd4856 : toneR = E5; 14'd4857 : toneR = E5; 14'd4858 : toneR = E5; 14'd4859 : toneR = E5;
14'd4860 : toneR = E5; 14'd4861 : toneR = E5; 14'd4862 : toneR = E5; 14'd4863 : toneR = 1;
/*measure 77 */
14'd4864 : toneR = E5; 14'd4865 : toneR = E5; 14'd4866 : toneR = E5; 14'd4867 : toneR = E5;
14'd4868 : toneR = E5; 14'd4869 : toneR = E5; 14'd4870 : toneR = E5; 14'd4871 : toneR = 1;
14'd4872 : toneR = Eflat5; 14'd4873 : toneR = Eflat5; 14'd4874 : toneR = Eflat5; 14'd4875 : toneR = Eflat5;
14'd4876 : toneR = Eflat5; 14'd4877 : toneR = Eflat5; 14'd4878 : toneR = Eflat5; 14'd4879 : toneR = 1;
14'd4880 : toneR = E5; 14'd4881 : toneR = E5; 14'd4882 : toneR = E5; 14'd4883 : toneR = E5;
14'd4884 : toneR = E5; 14'd4885 : toneR = E5; 14'd4886 : toneR = E5; 14'd4887 : toneR = 1;
14'd4888 : toneR = F5; 14'd4889 : toneR = F5; 14'd4890 : toneR = F5; 14'd4891 : toneR = F5;
14'd4892 : toneR = F5; 14'd4893 : toneR = F5; 14'd4894 : toneR = F5; 14'd4895 : toneR = 1;
14'd4896 : toneR = E5; 14'd4897 : toneR = E5; 14'd4898 : toneR = E5; 14'd4899 : toneR = E5;
14'd4900 : toneR = E5; 14'd4901 : toneR = E5; 14'd4902 : toneR = E5; 14'd4903 : toneR = 1;
14'd4904 : toneR = D5; 14'd4905 : toneR = D5; 14'd4906 : toneR = D5; 14'd4907 : toneR = D5;
14'd4908 : toneR = D5; 14'd4909 : toneR = D5; 14'd4910 : toneR = D5; 14'd4911 : toneR = 1;
14'd4912 : toneR = C5; 14'd4913 : toneR = C5; 14'd4914 : toneR = C5; 14'd4915 : toneR = C5;
14'd4916 : toneR = C5; 14'd4917 : toneR = C5; 14'd4918 : toneR = C5; 14'd4919 : toneR = 1;
14'd4920 : toneR = D5; 14'd4921 : toneR = D5; 14'd4922 : toneR = D5; 14'd4923 : toneR = D5;
14'd4924 : toneR = D5; 14'd4925 : toneR = D5; 14'd4926 : toneR = D5; 14'd4927 : toneR = 1;
/*measure 78 */
14'd4928 : toneR = E5; 14'd4929 : toneR = E5; 14'd4930 : toneR = E5; 14'd4931 : toneR = E5;
14'd4932 : toneR = E5; 14'd4933 : toneR = E5; 14'd4934 : toneR = E5; 14'd4935 : toneR = 1;
14'd4936 : toneR = Eflat5; 14'd4937 : toneR = Eflat5; 14'd4938 : toneR = Eflat5; 14'd4939 : toneR = Eflat5;
14'd4940 : toneR = Eflat5; 14'd4941 : toneR = Eflat5; 14'd4942 : toneR = Eflat5; 14'd4943 : toneR = 1;
14'd4944 : toneR = E5; 14'd4945 : toneR = E5; 14'd4946 : toneR = E5; 14'd4947 : toneR = E5;
14'd4948 : toneR = E5; 14'd4949 : toneR = E5; 14'd4950 : toneR = E5; 14'd4951 : toneR = 1;
14'd4952 : toneR = F5; 14'd4953 : toneR = F5; 14'd4954 : toneR = F5; 14'd4955 : toneR = F5;
14'd4956 : toneR = F5; 14'd4957 : toneR = F5; 14'd4958 : toneR = F5; 14'd4959 : toneR = 1;
14'd4960 : toneR = E5; 14'd4961 : toneR = E5; 14'd4962 : toneR = E5; 14'd4963 : toneR = E5;
14'd4964 : toneR = E5; 14'd4965 : toneR = E5; 14'd4966 : toneR = E5; 14'd4967 : toneR = 1;
14'd4968 : toneR = D5; 14'd4969 : toneR = D5; 14'd4970 : toneR = D5; 14'd4971 : toneR = D5;
14'd4972 : toneR = D5; 14'd4973 : toneR = D5; 14'd4974 : toneR = D5; 14'd4975 : toneR = 1;
14'd4976 : toneR = C5; 14'd4977 : toneR = C5; 14'd4978 : toneR = C5; 14'd4979 : toneR = C5;
14'd4980 : toneR = C5; 14'd4981 : toneR = C5; 14'd4982 : toneR = C5; 14'd4983 : toneR = 1;
14'd4984 : toneR = D5; 14'd4985 : toneR = D5; 14'd4986 : toneR = D5; 14'd4987 : toneR = D5;
14'd4988 : toneR = D5; 14'd4989 : toneR = D5; 14'd4990 : toneR = D5; 14'd4991 : toneR = 1;
/*measure 79 */
14'd4992 : toneR = E5; 14'd4993 : toneR = E5; 14'd4994 : toneR = E5; 14'd4995 : toneR = E5;
14'd4996 : toneR = E5; 14'd4997 : toneR = E5; 14'd4998 : toneR = E5; 14'd4999 : toneR = E5;
14'd5000 : toneR = E5; 14'd5001 : toneR = E5; 14'd5002 : toneR = E5; 14'd5003 : toneR = E5;
14'd5004 : toneR = E5; 14'd5005 : toneR = E5; 14'd5006 : toneR = E5; 14'd5007 : toneR = 1;
14'd5008 : toneR = A4; 14'd5009 : toneR = A4; 14'd5010 : toneR = A4; 14'd5011 : toneR = A4;
14'd5012 : toneR = A4; 14'd5013 : toneR = A4; 14'd5014 : toneR = A4; 14'd5015 : toneR = 1;
14'd5016 : toneR = A5; 14'd5017 : toneR = A5; 14'd5018 : toneR = A5; 14'd5019 : toneR = A5;
14'd5020 : toneR = A5; 14'd5021 : toneR = A5; 14'd5022 : toneR = A5; 14'd5023 : toneR = 1;
14'd5024 : toneR = B4; 14'd5025 : toneR = B4; 14'd5026 : toneR = B4; 14'd5027 : toneR = B4;
14'd5028 : toneR = B4; 14'd5029 : toneR = B4; 14'd5030 : toneR = B4; 14'd5031 : toneR = 1;
14'd5032 : toneR = B5; 14'd5033 : toneR = B5; 14'd5034 : toneR = B5; 14'd5035 : toneR = B5;
14'd5036 : toneR = B5; 14'd5037 : toneR = B5; 14'd5038 : toneR = B5; 14'd5039 : toneR = 1;
14'd5040 : toneR = C5; 14'd5041 : toneR = C5; 14'd5042 : toneR = C5; 14'd5043 : toneR = C5;
14'd5044 : toneR = C5; 14'd5045 : toneR = C5; 14'd5046 : toneR = C5; 14'd5047 : toneR = 1;
14'd5048 : toneR = C6; 14'd5049 : toneR = C6; 14'd5050 : toneR = C6; 14'd5051 : toneR = C6;
14'd5052 : toneR = C6; 14'd5053 : toneR = C6; 14'd5054 : toneR = C6; 14'd5055 : toneR = 1;
/*measure 80 */
14'd5056 : toneR = Csharp5; 14'd5057 : toneR = Csharp5; 14'd5058 : toneR = Csharp5; 14'd5059 : toneR = Csharp5;        
14'd5060 : toneR = Csharp5; 14'd5061 : toneR = Csharp5; 14'd5062 : toneR = Csharp5; 14'd5063 : toneR = 1;
14'd5064 : toneR = Csharp6; 14'd5065 : toneR = Csharp6; 14'd5066 : toneR = Csharp6; 14'd5067 : toneR = Csharp6;        
14'd5068 : toneR = Csharp6; 14'd5069 : toneR = Csharp6; 14'd5070 : toneR = Csharp6; 14'd5071 : toneR = 1;
14'd5072 : toneR = D5; 14'd5073 : toneR = D5; 14'd5074 : toneR = D5; 14'd5075 : toneR = D5;
14'd5076 : toneR = D5; 14'd5077 : toneR = D5; 14'd5078 : toneR = D5; 14'd5079 : toneR = 1;
14'd5080 : toneR = D6; 14'd5081 : toneR = D6; 14'd5082 : toneR = D6; 14'd5083 : toneR = D6;
14'd5084 : toneR = D6; 14'd5085 : toneR = D6; 14'd5086 : toneR = D6; 14'd5087 : toneR = 1;
14'd5088 : toneR = F5; 14'd5089 : toneR = F5; 14'd5090 : toneR = F5; 14'd5091 : toneR = F5;
14'd5092 : toneR = F5; 14'd5093 : toneR = F5; 14'd5094 : toneR = F5; 14'd5095 : toneR = 1;
14'd5096 : toneR = F6; 14'd5097 : toneR = F6; 14'd5098 : toneR = F6; 14'd5099 : toneR = F6;
14'd5100 : toneR = F6; 14'd5101 : toneR = F6; 14'd5102 : toneR = F6; 14'd5103 : toneR = 1;
14'd5104 : toneR = E5; 14'd5105 : toneR = E5; 14'd5106 : toneR = E5; 14'd5107 : toneR = E5;
14'd5108 : toneR = E5; 14'd5109 : toneR = E5; 14'd5110 : toneR = E5; 14'd5111 : toneR = 1;
14'd5112 : toneR = E6; 14'd5113 : toneR = E6; 14'd5114 : toneR = E6; 14'd5115 : toneR = E6;
14'd5116 : toneR = E6; 14'd5117 : toneR = E6; 14'd5118 : toneR = E6; 14'd5119 : toneR = 1;
/*measure 81 */
14'd5120 : toneR = E5; 14'd5121 : toneR = E5; 14'd5122 : toneR = E5; 14'd5123 : toneR = E5;
14'd5124 : toneR = E5; 14'd5125 : toneR = E5; 14'd5126 : toneR = E5; 14'd5127 : toneR = 1;
14'd5128 : toneR = Eflat5; 14'd5129 : toneR = Eflat5; 14'd5130 : toneR = Eflat5; 14'd5131 : toneR = Eflat5;
14'd5132 : toneR = Eflat5; 14'd5133 : toneR = Eflat5; 14'd5134 : toneR = Eflat5; 14'd5135 : toneR = 1;
14'd5136 : toneR = E5; 14'd5137 : toneR = E5; 14'd5138 : toneR = E5; 14'd5139 : toneR = E5;
14'd5140 : toneR = E5; 14'd5141 : toneR = E5; 14'd5142 : toneR = E5; 14'd5143 : toneR = 1;
14'd5144 : toneR = F5; 14'd5145 : toneR = F5; 14'd5146 : toneR = F5; 14'd5147 : toneR = F5;
14'd5148 : toneR = F5; 14'd5149 : toneR = F5; 14'd5150 : toneR = F5; 14'd5151 : toneR = 1;
14'd5152 : toneR = E5; 14'd5153 : toneR = E5; 14'd5154 : toneR = E5; 14'd5155 : toneR = E5;
14'd5156 : toneR = E5; 14'd5157 : toneR = E5; 14'd5158 : toneR = E5; 14'd5159 : toneR = 1;
14'd5160 : toneR = D5; 14'd5161 : toneR = D5; 14'd5162 : toneR = D5; 14'd5163 : toneR = D5;
14'd5164 : toneR = D5; 14'd5165 : toneR = D5; 14'd5166 : toneR = D5; 14'd5167 : toneR = 1;
14'd5168 : toneR = C5; 14'd5169 : toneR = C5; 14'd5170 : toneR = C5; 14'd5171 : toneR = C5;
14'd5172 : toneR = C5; 14'd5173 : toneR = C5; 14'd5174 : toneR = C5; 14'd5175 : toneR = 1;
14'd5176 : toneR = D5; 14'd5177 : toneR = D5; 14'd5178 : toneR = D5; 14'd5179 : toneR = D5;
14'd5180 : toneR = D5; 14'd5181 : toneR = D5; 14'd5182 : toneR = D5; 14'd5183 : toneR = 1;
/*measure 82 */
14'd5184 : toneR = E5; 14'd5185 : toneR = E5; 14'd5186 : toneR = E5; 14'd5187 : toneR = E5;
14'd5188 : toneR = E5; 14'd5189 : toneR = E5; 14'd5190 : toneR = E5; 14'd5191 : toneR = 1;
14'd5192 : toneR = Eflat5; 14'd5193 : toneR = Eflat5; 14'd5194 : toneR = Eflat5; 14'd5195 : toneR = Eflat5;
14'd5196 : toneR = Eflat5; 14'd5197 : toneR = Eflat5; 14'd5198 : toneR = Eflat5; 14'd5199 : toneR = 1;
14'd5200 : toneR = E5; 14'd5201 : toneR = E5; 14'd5202 : toneR = E5; 14'd5203 : toneR = E5;
14'd5204 : toneR = E5; 14'd5205 : toneR = E5; 14'd5206 : toneR = E5; 14'd5207 : toneR = 1;
14'd5208 : toneR = F5; 14'd5209 : toneR = F5; 14'd5210 : toneR = F5; 14'd5211 : toneR = F5;
14'd5212 : toneR = F5; 14'd5213 : toneR = F5; 14'd5214 : toneR = F5; 14'd5215 : toneR = 1;
14'd5216 : toneR = E5; 14'd5217 : toneR = E5; 14'd5218 : toneR = E5; 14'd5219 : toneR = E5;
14'd5220 : toneR = E5; 14'd5221 : toneR = E5; 14'd5222 : toneR = E5; 14'd5223 : toneR = 1;
14'd5224 : toneR = D5; 14'd5225 : toneR = D5; 14'd5226 : toneR = D5; 14'd5227 : toneR = D5;
14'd5228 : toneR = D5; 14'd5229 : toneR = D5; 14'd5230 : toneR = D5; 14'd5231 : toneR = 1;
14'd5232 : toneR = C5; 14'd5233 : toneR = C5; 14'd5234 : toneR = C5; 14'd5235 : toneR = C5;
14'd5236 : toneR = C5; 14'd5237 : toneR = C5; 14'd5238 : toneR = C5; 14'd5239 : toneR = 1;
14'd5240 : toneR = B4; 14'd5241 : toneR = B4; 14'd5242 : toneR = B4; 14'd5243 : toneR = B4;
14'd5244 : toneR = B4; 14'd5245 : toneR = B4; 14'd5246 : toneR = B4; 14'd5247 : toneR = 1;
/*measure 83 */
14'd5248 : toneR = A4; 14'd5249 : toneR = A4; 14'd5250 : toneR = A4; 14'd5251 : toneR = A4;
14'd5252 : toneR = A4; 14'd5253 : toneR = A4; 14'd5254 : toneR = A4; 14'd5255 : toneR = A4;
14'd5256 : toneR = A4; 14'd5257 : toneR = A4; 14'd5258 : toneR = A4; 14'd5259 : toneR = A4;
14'd5260 : toneR = A4; 14'd5261 : toneR = A4; 14'd5262 : toneR = A4; 14'd5263 : toneR = 1;
14'd5264 : toneR = A6; 14'd5265 : toneR = A6; 14'd5266 : toneR = A6; 14'd5267 : toneR = A6;
14'd5268 : toneR = A6; 14'd5269 : toneR = A6; 14'd5270 : toneR = A6; 14'd5271 : toneR = 1;
14'd5272 : toneR = A5; 14'd5273 : toneR = A5; 14'd5274 : toneR = A5; 14'd5275 : toneR = A5;
14'd5276 : toneR = A5; 14'd5277 : toneR = A5; 14'd5278 : toneR = A5; 14'd5279 : toneR = 1;
14'd5280 : toneR = Gsharp6; 14'd5281 : toneR = Gsharp6; 14'd5282 : toneR = Gsharp6; 14'd5283 : toneR = Gsharp6;
14'd5284 : toneR = Gsharp6; 14'd5285 : toneR = Gsharp6; 14'd5286 : toneR = Gsharp6; 14'd5287 : toneR = 1;
14'd5288 : toneR = Gsharp5; 14'd5289 : toneR = Gsharp5; 14'd5290 : toneR = Gsharp5; 14'd5291 : toneR = Gsharp5;        
14'd5292 : toneR = Gsharp5; 14'd5293 : toneR = Gsharp5; 14'd5294 : toneR = Gsharp5; 14'd5295 : toneR = 1;
14'd5296 : toneR = G6; 14'd5297 : toneR = G6; 14'd5298 : toneR = G6; 14'd5299 : toneR = G6;
14'd5300 : toneR = G6; 14'd5301 : toneR = G6; 14'd5302 : toneR = G6; 14'd5303 : toneR = 1;
14'd5304 : toneR = G5; 14'd5305 : toneR = G5; 14'd5306 : toneR = G5; 14'd5307 : toneR = G5;
14'd5308 : toneR = G5; 14'd5309 : toneR = G5; 14'd5310 : toneR = G5; 14'd5311 : toneR = 1;
/*measure 84 */
14'd5312 : toneR = Fsharp6; 14'd5313 : toneR = Fsharp6; 14'd5314 : toneR = Fsharp6; 14'd5315 : toneR = Fsharp6;        
14'd5316 : toneR = Fsharp6; 14'd5317 : toneR = Fsharp6; 14'd5318 : toneR = Fsharp6; 14'd5319 : toneR = 1;
14'd5320 : toneR = Fsharp5; 14'd5321 : toneR = Fsharp5; 14'd5322 : toneR = Fsharp5; 14'd5323 : toneR = Fsharp5;        
14'd5324 : toneR = Fsharp5; 14'd5325 : toneR = Fsharp5; 14'd5326 : toneR = Fsharp5; 14'd5327 : toneR = 1;
14'd5328 : toneR = F6; 14'd5329 : toneR = F6; 14'd5330 : toneR = F6; 14'd5331 : toneR = F6;
14'd5332 : toneR = F6; 14'd5333 : toneR = F6; 14'd5334 : toneR = F6; 14'd5335 : toneR = 1;
14'd5336 : toneR = F5; 14'd5337 : toneR = F5; 14'd5338 : toneR = F5; 14'd5339 : toneR = F5;
14'd5340 : toneR = F5; 14'd5341 : toneR = F5; 14'd5342 : toneR = F5; 14'd5343 : toneR = 1;
14'd5344 : toneR = Dsharp6; 14'd5345 : toneR = Dsharp6; 14'd5346 : toneR = Dsharp6; 14'd5347 : toneR = Dsharp6;        
14'd5348 : toneR = Dsharp6; 14'd5349 : toneR = Dsharp6; 14'd5350 : toneR = Dsharp6; 14'd5351 : toneR = 1;
14'd5352 : toneR = Dsharp5; 14'd5353 : toneR = Dsharp5; 14'd5354 : toneR = Dsharp5; 14'd5355 : toneR = Dsharp5;        
14'd5356 : toneR = Dsharp5; 14'd5357 : toneR = Dsharp5; 14'd5358 : toneR = Dsharp5; 14'd5359 : toneR = 1;
14'd5360 : toneR = E6; 14'd5361 : toneR = E6; 14'd5362 : toneR = E6; 14'd5363 : toneR = E6;
14'd5364 : toneR = E6; 14'd5365 : toneR = E6; 14'd5366 : toneR = E6; 14'd5367 : toneR = 1;
14'd5368 : toneR = E5; 14'd5369 : toneR = E5; 14'd5370 : toneR = E5; 14'd5371 : toneR = E5;
14'd5372 : toneR = E5; 14'd5373 : toneR = E5; 14'd5374 : toneR = E5; 14'd5375 : toneR = 1;
/*measure 85 */
14'd5376 : toneR = E5; 14'd5377 : toneR = E5; 14'd5378 : toneR = E5; 14'd5379 : toneR = E5;
14'd5380 : toneR = E5; 14'd5381 : toneR = E5; 14'd5382 : toneR = E5; 14'd5383 : toneR = 1;
14'd5384 : toneR = Eflat5; 14'd5385 : toneR = Eflat5; 14'd5386 : toneR = Eflat5; 14'd5387 : toneR = Eflat5;
14'd5388 : toneR = Eflat5; 14'd5389 : toneR = Eflat5; 14'd5390 : toneR = Eflat5; 14'd5391 : toneR = 1;
14'd5392 : toneR = E5; 14'd5393 : toneR = E5; 14'd5394 : toneR = E5; 14'd5395 : toneR = E5;
14'd5396 : toneR = E5; 14'd5397 : toneR = E5; 14'd5398 : toneR = E5; 14'd5399 : toneR = 1;
14'd5400 : toneR = F5; 14'd5401 : toneR = F5; 14'd5402 : toneR = F5; 14'd5403 : toneR = F5;
14'd5404 : toneR = F5; 14'd5405 : toneR = F5; 14'd5406 : toneR = F5; 14'd5407 : toneR = 1;
14'd5408 : toneR = E5; 14'd5409 : toneR = E5; 14'd5410 : toneR = E5; 14'd5411 : toneR = E5;
14'd5412 : toneR = E5; 14'd5413 : toneR = E5; 14'd5414 : toneR = E5; 14'd5415 : toneR = 1;
14'd5416 : toneR = D5; 14'd5417 : toneR = D5; 14'd5418 : toneR = D5; 14'd5419 : toneR = D5;
14'd5420 : toneR = D5; 14'd5421 : toneR = D5; 14'd5422 : toneR = D5; 14'd5423 : toneR = 1;
14'd5424 : toneR = C5; 14'd5425 : toneR = C5; 14'd5426 : toneR = C5; 14'd5427 : toneR = C5;
14'd5428 : toneR = C5; 14'd5429 : toneR = C5; 14'd5430 : toneR = C5; 14'd5431 : toneR = 1;
14'd5432 : toneR = D5; 14'd5433 : toneR = D5; 14'd5434 : toneR = D5; 14'd5435 : toneR = D5;
14'd5436 : toneR = D5; 14'd5437 : toneR = D5; 14'd5438 : toneR = D5; 14'd5439 : toneR = 1;
/*measure 86 */
14'd5440 : toneR = E5; 14'd5441 : toneR = E5; 14'd5442 : toneR = E5; 14'd5443 : toneR = E5;
14'd5444 : toneR = E5; 14'd5445 : toneR = E5; 14'd5446 : toneR = E5; 14'd5447 : toneR = 1;
14'd5448 : toneR = Eflat5; 14'd5449 : toneR = Eflat5; 14'd5450 : toneR = Eflat5; 14'd5451 : toneR = Eflat5;
14'd5452 : toneR = Eflat5; 14'd5453 : toneR = Eflat5; 14'd5454 : toneR = Eflat5; 14'd5455 : toneR = 1;
14'd5456 : toneR = E5; 14'd5457 : toneR = E5; 14'd5458 : toneR = E5; 14'd5459 : toneR = E5;
14'd5460 : toneR = E5; 14'd5461 : toneR = E5; 14'd5462 : toneR = E5; 14'd5463 : toneR = 1;
14'd5464 : toneR = F5; 14'd5465 : toneR = F5; 14'd5466 : toneR = F5; 14'd5467 : toneR = F5;
14'd5468 : toneR = F5; 14'd5469 : toneR = F5; 14'd5470 : toneR = F5; 14'd5471 : toneR = 1;
14'd5472 : toneR = E5; 14'd5473 : toneR = E5; 14'd5474 : toneR = E5; 14'd5475 : toneR = E5;
14'd5476 : toneR = E5; 14'd5477 : toneR = E5; 14'd5478 : toneR = E5; 14'd5479 : toneR = 1;
14'd5480 : toneR = D5; 14'd5481 : toneR = D5; 14'd5482 : toneR = D5; 14'd5483 : toneR = D5;
14'd5484 : toneR = D5; 14'd5485 : toneR = D5; 14'd5486 : toneR = D5; 14'd5487 : toneR = 1;
14'd5488 : toneR = C5; 14'd5489 : toneR = C5; 14'd5490 : toneR = C5; 14'd5491 : toneR = C5;
14'd5492 : toneR = C5; 14'd5493 : toneR = C5; 14'd5494 : toneR = C5; 14'd5495 : toneR = 1;
14'd5496 : toneR = B4; 14'd5497 : toneR = B4; 14'd5498 : toneR = B4; 14'd5499 : toneR = B4;
14'd5500 : toneR = B4; 14'd5501 : toneR = B4; 14'd5502 : toneR = B4; 14'd5503 : toneR = 1;
/*measure 87 */
14'd5504 : toneR = A4; 14'd5505 : toneR = A4; 14'd5506 : toneR = A4; 14'd5507 : toneR = A4;
14'd5508 : toneR = A4; 14'd5509 : toneR = A4; 14'd5510 : toneR = A4; 14'd5511 : toneR = 1;
14'd5512 : toneR = 1; 14'd5513 : toneR = 1; 14'd5514 : toneR = 1; 14'd5515 : toneR = 1;
14'd5516 : toneR = 1; 14'd5517 : toneR = 1; 14'd5518 : toneR = 1; 14'd5519 : toneR = 1;
14'd5520 : toneR = E5; 14'd5521 : toneR = E5; 14'd5522 : toneR = E5; 14'd5523 : toneR = E5;
14'd5524 : toneR = E5; 14'd5525 : toneR = E5; 14'd5526 : toneR = E5; 14'd5527 : toneR = 1;
14'd5528 : toneR = C5; 14'd5529 : toneR = C5; 14'd5530 : toneR = C5; 14'd5531 : toneR = C5;
14'd5532 : toneR = C5; 14'd5533 : toneR = C5; 14'd5534 : toneR = C5; 14'd5535 : toneR = 1;
14'd5536 : toneR = D5; 14'd5537 : toneR = D5; 14'd5538 : toneR = D5; 14'd5539 : toneR = D5;
14'd5540 : toneR = D5; 14'd5541 : toneR = D5; 14'd5542 : toneR = D5; 14'd5543 : toneR = 1;
14'd5544 : toneR = C5; 14'd5545 : toneR = C5; 14'd5546 : toneR = C5; 14'd5547 : toneR = C5;
14'd5548 : toneR = C5; 14'd5549 : toneR = C5; 14'd5550 : toneR = C5; 14'd5551 : toneR = 1;
14'd5552 : toneR = A4; 14'd5553 : toneR = A4; 14'd5554 : toneR = A4; 14'd5555 : toneR = A4;
14'd5556 : toneR = A4; 14'd5557 : toneR = A4; 14'd5558 : toneR = A4; 14'd5559 : toneR = 1;
14'd5560 : toneR = C5; 14'd5561 : toneR = C5; 14'd5562 : toneR = C5; 14'd5563 : toneR = C5;
14'd5564 : toneR = C5; 14'd5565 : toneR = C5; 14'd5566 : toneR = C5; 14'd5567 : toneR = 1;
/*measure 88 */
14'd5568 : toneR = E5; 14'd5569 : toneR = E5; 14'd5570 : toneR = E5; 14'd5571 : toneR = E5;
14'd5572 : toneR = E5; 14'd5573 : toneR = E5; 14'd5574 : toneR = E5; 14'd5575 : toneR = 1;
14'd5576 : toneR = C5; 14'd5577 : toneR = C5; 14'd5578 : toneR = C5; 14'd5579 : toneR = C5;
14'd5580 : toneR = C5; 14'd5581 : toneR = C5; 14'd5582 : toneR = C5; 14'd5583 : toneR = 1;
14'd5584 : toneR = D5; 14'd5585 : toneR = D5; 14'd5586 : toneR = D5; 14'd5587 : toneR = D5;
14'd5588 : toneR = D5; 14'd5589 : toneR = D5; 14'd5590 : toneR = D5; 14'd5591 : toneR = 1;
14'd5592 : toneR = C5; 14'd5593 : toneR = C5; 14'd5594 : toneR = C5; 14'd5595 : toneR = C5;
14'd5596 : toneR = C5; 14'd5597 : toneR = C5; 14'd5598 : toneR = C5; 14'd5599 : toneR = 1;
14'd5600 : toneR = 1; 14'd5601 : toneR = 1; 14'd5602 : toneR = 1; 14'd5603 : toneR = 1;
14'd5604 : toneR = 1; 14'd5605 : toneR = 1; 14'd5606 : toneR = 1; 14'd5607 : toneR = 1;
14'd5608 : toneR = 1; 14'd5609 : toneR = 1; 14'd5610 : toneR = 1; 14'd5611 : toneR = 1;
14'd5612 : toneR = 1; 14'd5613 : toneR = 1; 14'd5614 : toneR = 1; 14'd5615 : toneR = 1;
14'd5616 : toneR = 1; 14'd5617 : toneR = 1; 14'd5618 : toneR = 1; 14'd5619 : toneR = 1;
14'd5620 : toneR = 1; 14'd5621 : toneR = 1; 14'd5622 : toneR = 1; 14'd5623 : toneR = 1;
14'd5624 : toneR = 1; 14'd5625 : toneR = 1; 14'd5626 : toneR = 1; 14'd5627 : toneR = 1;
14'd5628 : toneR = 1; 14'd5629 : toneR = 1; 14'd5630 : toneR = 1; 14'd5631 : toneR = 1;
/*measure 89 */
14'd5632 : toneR = 1; 14'd5633 : toneR = 1; 14'd5634 : toneR = 1; 14'd5635 : toneR = 1;
14'd5636 : toneR = 1; 14'd5637 : toneR = 1; 14'd5638 : toneR = 1; 14'd5639 : toneR = 1;
14'd5640 : toneR = 1; 14'd5641 : toneR = 1; 14'd5642 : toneR = 1; 14'd5643 : toneR = 1;
14'd5644 : toneR = 1; 14'd5645 : toneR = 1; 14'd5646 : toneR = 1; 14'd5647 : toneR = 1;
14'd5648 : toneR = E5; 14'd5649 : toneR = E5; 14'd5650 : toneR = E5; 14'd5651 : toneR = E5;
14'd5652 : toneR = E5; 14'd5653 : toneR = E5; 14'd5654 : toneR = E5; 14'd5655 : toneR = 1;
14'd5656 : toneR = C5; 14'd5657 : toneR = C5; 14'd5658 : toneR = C5; 14'd5659 : toneR = C5;
14'd5660 : toneR = C5; 14'd5661 : toneR = C5; 14'd5662 : toneR = C5; 14'd5663 : toneR = 1;
14'd5664 : toneR = D5; 14'd5665 : toneR = D5; 14'd5666 : toneR = D5; 14'd5667 : toneR = D5;
14'd5668 : toneR = D5; 14'd5669 : toneR = D5; 14'd5670 : toneR = D5; 14'd5671 : toneR = 1;
14'd5672 : toneR = C5; 14'd5673 : toneR = C5; 14'd5674 : toneR = C5; 14'd5675 : toneR = C5;
14'd5676 : toneR = C5; 14'd5677 : toneR = C5; 14'd5678 : toneR = C5; 14'd5679 : toneR = 1;
14'd5680 : toneR = A4; 14'd5681 : toneR = A4; 14'd5682 : toneR = A4; 14'd5683 : toneR = A4;
14'd5684 : toneR = A4; 14'd5685 : toneR = A4; 14'd5686 : toneR = A4; 14'd5687 : toneR = 1;
14'd5688 : toneR = C5; 14'd5689 : toneR = C5; 14'd5690 : toneR = C5; 14'd5691 : toneR = C5;
14'd5692 : toneR = C5; 14'd5693 : toneR = C5; 14'd5694 : toneR = C5; 14'd5695 : toneR = 1;
/*measure 90 */
14'd5696 : toneR = E5; 14'd5697 : toneR = E5; 14'd5698 : toneR = E5; 14'd5699 : toneR = E5;
14'd5700 : toneR = E5; 14'd5701 : toneR = E5; 14'd5702 : toneR = E5; 14'd5703 : toneR = 1;
14'd5704 : toneR = C5; 14'd5705 : toneR = C5; 14'd5706 : toneR = C5; 14'd5707 : toneR = C5;
14'd5708 : toneR = C5; 14'd5709 : toneR = C5; 14'd5710 : toneR = C5; 14'd5711 : toneR = 1;
14'd5712 : toneR = D5; 14'd5713 : toneR = D5; 14'd5714 : toneR = D5; 14'd5715 : toneR = D5;
14'd5716 : toneR = D5; 14'd5717 : toneR = D5; 14'd5718 : toneR = D5; 14'd5719 : toneR = 1;
14'd5720 : toneR = C5; 14'd5721 : toneR = C5; 14'd5722 : toneR = C5; 14'd5723 : toneR = C5;
14'd5724 : toneR = C5; 14'd5725 : toneR = C5; 14'd5726 : toneR = C5; 14'd5727 : toneR = 1;
14'd5728 : toneR = 1; 14'd5729 : toneR = 1; 14'd5730 : toneR = 1; 14'd5731 : toneR = 1;
14'd5732 : toneR = 1; 14'd5733 : toneR = 1; 14'd5734 : toneR = 1; 14'd5735 : toneR = 1;
14'd5736 : toneR = 1; 14'd5737 : toneR = 1; 14'd5738 : toneR = 1; 14'd5739 : toneR = 1;
14'd5740 : toneR = 1; 14'd5741 : toneR = 1; 14'd5742 : toneR = 1; 14'd5743 : toneR = 1;
14'd5744 : toneR = 1; 14'd5745 : toneR = 1; 14'd5746 : toneR = 1; 14'd5747 : toneR = 1;
14'd5748 : toneR = 1; 14'd5749 : toneR = 1; 14'd5750 : toneR = 1; 14'd5751 : toneR = 1;
14'd5752 : toneR = 1; 14'd5753 : toneR = 1; 14'd5754 : toneR = 1; 14'd5755 : toneR = 1;
14'd5756 : toneR = 1; 14'd5757 : toneR = 1; 14'd5758 : toneR = 1; 14'd5759 : toneR = 1;

        default: toneR = 1;
        endcase
    end

    always @* begin
        case(ibeatNum)

        default: toneL = 1;
        endcase
    end

endmodule