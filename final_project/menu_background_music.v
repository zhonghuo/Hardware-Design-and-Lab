module background_music(
    input clk, 
    input rst, 
    input en, //whenever posedge en, the song plays from the begining
    output audio_mclk, // master clock
    output audio_lrck, // left-right clock, Word Select clock, or sample rate clock
    output audio_sck, // serial clock
    output audio_sdin // serial audio data input
);
    parameter max_ibeatNum = 5760;

    wire [2:0] vol_in;
    //assign vol_in = ;
    wire [15:0] audio_in_left, audio_in_right;
    wire [13:0] ibeatNum;                     // Beat counter
    wire [31:0] freqL, freqR;                  // Raw frequency, produced by music module
    wire [21:0] freq_outL, freq_outR;    // Processed frequency, adapted to the clock rate of Basys3
    reg [21:0] freq_inL, freq_inR;         // choose the frequency been inputed into note_gen

    //clk_bpm
    bpm_controller  #(.bpm(16*180)) bc2 (.clk(clk), .clk_out(clk_bpm));

    player_control #(.LEN(max_ibeatNum)) playerCtrl_002 ( 
        .clk(clk_bpm),
        .rst(rst),
        .en(en),
        .ibeat(ibeatNum)
    );
    music_unwelcome_school unwelcome_school(
        .ibeatNum(ibeatNum), 
        .toneL(freq_outL), 
        .toneR(freq_outR)
    );

    // Note generation
    // [in]  processed frequency
    // [out] audio wave signal (using square wave here)
    note_gen noteGen_002(
        .clk(clk), 
        .rst(rst), 
        .volume(3),
        .note_div_left(freq_outL), 
        .note_div_right(freq_outR), 
        .audio_left(audio_in_left),     // left sound audio
        .audio_right(audio_in_right)    // right sound audio
    );

    // Speaker controller
    speaker_control sc2(
        .clk(clk), 
        .rst(rst), 
        .audio_in_left(audio_in_left),      // left channel audio data input
        .audio_in_right(audio_in_right),    // right channel audio data input
        .audio_mclk(audio_mclk),            // master clock
        .audio_lrck(audio_lrck),            // left-right clock
        .audio_sck(audio_sck),              // serial clock
        .audio_sdin(audio_sdin)             // serial audio data input
    );
endmodule