//=========================================================================
// Name & Email must be EXACTLY as in Gradescope roster!
// Name: Isaac Lee
// Email: ilee002@ucr.edu
// 
// Assignment name: Lab 01 - Clocks and Test Benches
// Lab section: 21
// TA: Sakshar Chakravarty
// 
// I hereby certify that I have not received assistance on this assignment,
// or used code, from ANY outside source other than the instruction team
// (apart from what was provided in the starter file).
//
//=========================================================================

module gen_tick # (
    parameter SRC_FREQ = 5000,
    parameter TICK_FREQ = 1
) (
    input src_clk,
    input enable,
    output reg tick = 0
);

// Counter limit for 50% duty cycle
localparam COUNTER_LIMIT = (SRC_FREQ / (2 * TICK_FREQ)) - 1;
reg [31:0] counter = 0;

always @(posedge src_clk) begin
    if (enable) begin
        if (counter >= COUNTER_LIMIT) begin
            tick <= ~tick;  // Toggle tick
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end else begin
        tick <= 0;
        counter <= 0;
    end
end

endmodule