// Module Name: Data Memory.v
// Project: MIPS Single Cycle Processor
// Description: Data Memory module for MIPS Single Cycle Processor.
// Author: Cengiz Mert ÖNCE
// Date: 2026-01-14

module data_memory (
    input wire clk,              // Clock signal (Critical for writing)
    input wire [31:0] addr,      // Address from ALU
    input wire [31:0] write_data,// Data to be stored (from Register File $rt)
    input wire memWrite,        // Write Enable (Control Unit)
    input wire memRead,         // Read Enable (Control Unit)
    output reg [31:0] read_data  // Data output to Write-Back logic
);

    // Define Memory Space
    // 256 words (32-bit width).
    reg [31:0] memory [0:255]; 
    
    integer i;

    // Initialize memory to zero (Optional, for clean simulation)
    initial begin
        for (i = 0; i < 256; i = i + 1)
            memory[i] = 32'h0;
    end

    // READ OPERATION (Asynchronous / Combinational)
    always @(*) begin
        if (memRead)
            read_data = memory[addr[31:2]]; // Word-aligned access
        else
            read_data = 32'h0;
    end

    // WRITE OPERATION (Synchronous / Clocked)
    always @(posedge clk) begin
        if (memWrite) begin
            memory[addr[31:2]] <= write_data;
            // $display("Memory Write: Addr: %d, Data: %d", addr, write_data);
        end
    end

endmodule