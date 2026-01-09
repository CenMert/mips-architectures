# 00 - Single-Cycle MIPS Processor

This directory contains the RTL implementation of a Single-Cycle MIPS processor. In this architecture, every instruction is executed within a single clock cycle, resulting in a theoretical Cycles Per Instruction (CPI) of 1.

## Architectural Features

* **Fixed CPI:** Each instruction, regardless of its complexity, completes in one clock period.
* **Behavioral Control:** Control unit designed as behavioral. It needs to be changed to combintational!
* **Instruction Set Support:** Supports a subset of the MIPS32 ISA, including:
    * **R-Type:** add, sub, and, or, xor, slt
    * **I-Type:** lw, sw, beq, addi
    * **J-Type:** j

## Component Overview

The processor is built using a modular approach, consisting of the following key units:

* **Arithmetic Logic Unit (ALU):** Performs arithmetic and logical operations.
* **Register File:** A 32x32-bit register bank providing dual-read and single-write ports.
* **Control Unit:** Decodes the opcode and funct fields to manage the datapath.
* **Datapath:** The interconnection of all functional units including Program Counter (PC), Instruction Memory, and Data Memory.
* **Modules (Building Blocks):** Common sub-modules such as multiplexers, sign-extenders, and adders.

## Performance Characteristics

* **Cycle Time:** Limited by the longest path in the design (typically the `lw` instruction path).
* **Hardware Utilization:** Redundant hardware (e.g., separate instruction and data memories) is used to avoid structural hazards within a single cycle.

