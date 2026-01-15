// Module Name: Program Counter.v
// Project: MIPS Single Cycle Processor
// Description: Program Counter that the instructions in the memory runs one by one.
// Author: Cengiz Mert ÖNCE
// Date: 2026-01-15

module program_counter (
    input wire clk,                  // Clock signal
    input wire reset,                // Reset signal (synchronous)
    input wire [31:0] next_pc,       // Next PC value (from adder or branch logic)
    output reg [31:0] pc             // Current PC value (to instruction memory)
);

    // The next pc will be either pc + 4 or branch target address. The upper two adders on the data path calculate that.
    // On each clock cycle, update the PC.

    // On reset, set PC to 0
    always @(posedge clk) begin
        if (reset) begin
            pc <= 32'h00000000;      // Reset PC to 0
        end else begin
            pc <= next_pc;           // Update PC to next value
        end
    end

endmodule