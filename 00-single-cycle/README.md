# 00 - Single-Cycle MIPS Processor

This repository contains a 32 bit MIPS Single Cycle Processor, developed as part of the CSE331 class at the Gebze Technical University.
The project aims a clear understanding of computer architecture and digital logic design.

## Features

* 32-bit ISA (instruction set architecture)
* R-type, I-type and J-type instruction implementation.
* Register File with 32 registers.
* Control Unit.
* Data Memory block to execute the memory operations (LW, SW).

## Architecture

Basicaly it follows 5 stages which are named as:

- IF Instruction Fetch: Fecth the instruction from instruction memory.
- ID Instruction Decode: Decoding the instructions which comes from instr. mem.
- EX Execution: Runs the desired ALU operations.
- MEM Memory: Memory stage to save the data to memory file.
- WB Write Back: Writing back the data to the desired registers.

## Implementation

Various verilog files are created and sorted by their jobs. 

* Atomic designs such as mux's, half adder or full adder keep under 'modules' folder.

Same strategy is followed for better understanding.