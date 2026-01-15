
// Module Name: Instruction Memory.v
// Project: MIPS Single Cycle Processor
// Description: Instruction Memory module that takes external instructions files to check the data path is working correctly.
// Author: Cengiz Mert ÖNCE
// Date: 2026-01-15

module instruction_memory (
    input wire [31:0] addr,          // Address input (from PC)
    output reg [31:0] instruction    // Instruction output
);

    // Define Instruction Memory Space
    // 256 words (32-bit width).
    reg [31:0] memory [0:255]; 
    
    integer i;

    // Initialize memory to zero (Optional, for clean simulation)
    initial begin
        for (i = 0; i < 256; i = i + 1)
            memory[i] = 32'h0;
        
        // Load instructions from external file
        // Make sure the file "instructions.mem" is in the correct format
        // Corect format is 32 bit whole instructions in bits format,
        // and located in the simulation directory.
        $readmemh("instructions.mem", memory);
    end

    // READ OPERATION (Asynchronous / Combinational)
    always @(*) begin
        // ------------
        // take all the address, cause its already in the file in 32 bit format.
        // ------------
        instruction = memory[addr[31:0]];
    end
endmodule