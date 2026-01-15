// Module Name: shift_left_two.v
// Project: MIPS Single Cycle Processor
// Description: Shift Left Two module to shift the input by 2 bits to the left.
// Author: Cengiz Mert ÖNCE
// Date: 2026-01-15

module shift_left_two (
    input wire [31:0] in_data,      // Input data to be shifted
    output wire [31:0] out_data     // Output data after shifting
);

    // Shift left by 2 bits
    assign out_data = in_data << 2;
endmodule