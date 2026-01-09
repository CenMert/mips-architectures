// Module Name: Adder.v
// Project: MIPS Single Cycle Processor
// Description: 32 bit default adder to be used in 
//      ALU operations and also in PC+4 calculation.
// Author: Cengiz Mert ÖNCE
// Date: 2026-01-09


// Ill use this CARRY_IN_0 for the sub and add operations.
// I dont want to use one more adder to get 2's comp, in order
// to get rid of that, Ill add 1 from the beginning
module adder_32bit
    #(parameter CARRY_IN_0 = 1'b0)
(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] sum,
    output wire carry_out
);
    
    // Wire for the carry chain: 32 bits for internal carry + 1 for Cin_0 (index 0)
    wire [32:0] carry_chain; 
    
    // Assign the initial carry-in from the parameter
    assign carry_chain[0] = CARRY_IN_0;

    genvar i;
    generate
        for (i = 0; i < 32; i = i+1) begin : concat_full_adder
            
            full_adder generate_full_adder
            (
                .a(a[i]),
                .b(b[i]),
                .carry_in(carry_chain[i]),      // Carry-in from the previous stage
                .sum(sum[i]),
                .carry_out(carry_chain[i+1])    // Carry-out to the next stage
            );

        end
    endgenerate

    // Assign the final carry-out to the module output
    assign carry_out = carry_chain[32];

endmodule