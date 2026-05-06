`timescale 1ns / 1ps

module debounce_btn(
    input  clk,
    input  btn_in,
    output reg btn_out        
);
    parameter CLK_FREQ_HZ  = 100_000_000;
    parameter SAMPLE_MS    = 5;

    localparam integer COUNT_MAX = (CLK_FREQ_HZ / 1000) * SAMPLE_MS - 1;
    // Manual width (19 bits is enough for COUNT_MAX=499,999)
    localparam CNT_WIDTH = 19;

    reg [CNT_WIDTH-1:0] cnt = 0;
    wire sample_tick = (cnt == COUNT_MAX);

    reg t0, t1, t2;

    // Sample counter
    always @(posedge clk) begin
        if (sample_tick)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end

    // Shift register - enabled only on sample_tick
    always @(posedge clk) begin
        if (sample_tick) begin
            t0 <= btn_in;
            t1 <= t0;
            t2 <= t1;
        end
    end

    // Update output when all three sampled bits match
    always @(posedge clk) begin
        if (sample_tick && t0 == t1 && t1 == t2)
            btn_out <= t2;
    end
endmodule