module control_unit(
    input wire [5:0] opcode,    // 6-bit opcode from instruction
    output reg regDst,          // 0: rt, 1: rd
    output reg branch,          // 1: if beq
    output reg memRead,         // 1: Read from Data Memory
    output reg memToReg,        // 0: ALU result, 1: Memory Data
    output reg [1:0] aluOp,     // 00: add, 01: sub, 10: funct dependent
    output reg memWrite,        // 1: Write to Data Memory
    output reg aluSrc,          // 0: Register, 1: Immediate
    output reg regWrite         // 1: Write to Register File
);

    // Combinational logic for control signals
    always @(*) begin
        // Initialize to 0 to prevent latches (good practice)
        regDst   = 0;
        aluSrc   = 0;
        memToReg = 0;
        regWrite = 0;
        memRead  = 0;
        memWrite = 0;
        branch   = 0;
        aluOp    = 2'b00;

        case (opcode)
            // ------------------------------------------------
            // R-TYPE Instructions (add, sub, and, or, slt)
            // Opcode: 000000
            // ------------------------------------------------
            6'b000000: begin 
                regDst   = 1;       // Destination is 'rd' (bits 15-11)
                aluSrc   = 0;       // 2nd operand comes from Register
                memToReg = 0;       // Result comes from ALU
                regWrite = 1;       // We are writing to a register
                memRead  = 0;
                memWrite = 0;
                branch   = 0;
                aluOp    = 2'b10;   // 10: Delegate to ALU Control (look at funct)
            end

            // ------------------------------------------------
            // LOAD WORD (lw)
            // Opcode: 100011 (0x23)
            // ------------------------------------------------
            6'b100011: begin 
                regDst   = 0;       // Destination is 'rt' (bits 20-16)
                aluSrc   = 1;       // 2nd operand is Immediate (offset)
                memToReg = 1;       // Result comes from Memory
                regWrite = 1;       // We are writing to a register
                memRead  = 1;       // Read from memory
                memWrite = 0;
                branch   = 0;
                aluOp    = 2'b00;   // 00: Force ADD (Base + Offset)
            end

            // ------------------------------------------------
            // STORE WORD (sw)
            // Opcode: 101011 (0x2B)
            // ------------------------------------------------
            6'b101011: begin 
                regDst   = 1'bx;    // Don't care (we don't write to reg)
                aluSrc   = 1;       // 2nd operand is Immediate (offset)
                memToReg = 1'bx;    // Don't care
                regWrite = 0;       // DO NOT write to register
                memRead  = 0;
                memWrite = 1;       // Write to memory
                branch   = 0;
                aluOp    = 2'b00;   // 00: Force ADD (Base + Offset)
            end

            // ------------------------------------------------
            // BRANCH EQUAL (beq)
            // Opcode: 000100 (0x04)
            // ------------------------------------------------
            6'b000100: begin 
                regDst   = 1'bx;    // Don't care
                aluSrc   = 0;       // Compare two registers
                memToReg = 1'bx;    // Don't care
                regWrite = 0;       // No write back
                memRead  = 0;
                memWrite = 0;
                branch   = 1;       // High for Branch Logic
                aluOp    = 2'b01;   // 01: Force SUBTRACT (to check zero)
            end

            // ------------------------------------------------
            // ADDI (Add Immediate) - Optional but useful
            // Opcode: 001000 (0x08)
            // ------------------------------------------------
            6'b001000: begin
                regDst   = 0;       // Destination is 'rt'
                aluSrc   = 1;       // 2nd operand is Immediate
                memToReg = 0;       // Result comes from ALU
                regWrite = 1;       // Write to register
                memRead  = 0;
                memWrite = 0;
                branch   = 0;
                aluOp    = 2'b00;   // 00: Force ADD
            end
            
            // Default case covers invalid opcodes
            default: begin
                regDst   = 0;
                aluSrc   = 0;
                memToReg = 0;
                regWrite = 0;
                memRead  = 0;
                memWrite = 0;
                branch   = 0;
                aluOp    = 2'b00;
            end
        endcase
    end
endmodule