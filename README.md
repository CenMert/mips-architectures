# MIPS Processor Architectures

This repository contains Verilog HDL implementations of various MIPS processor architectures. The project documents the systematic progression from basic single-cycle execution to advanced multi-cycle and pipelined designs, focusing on RTL design principles and computer organization.

## Project Objectives

The primary goal of this repository is to demonstrate the implementation of the MIPS Instruction Set Architecture (ISA) through different hardware design methodologies. Each phase focuses on specific architectural challenges such as control unit logic, resource sharing, and throughput optimization.

## Development Roadmap

| Phase | Architecture | Status | Description |
| :--- | :--- | :--- | :--- |
| 01 | [Single-Cycle](./00-Single-Cycle) | Completed | Fixed CPI of 1. Basic datapath and combinational control unit implementation. |
| 02 | [Multi-Cycle](./01-Multi-Cycle) | In Progress | State-machine driven execution. Optimized for resource reuse and higher clock frequencies. |
| 03 | [Pipelined](./10-Pipelined) | Planned | 5-stage pipeline implementation featuring hazard detection and data forwarding. |

## Technical Specifications

* **Hardware Description Language:** Verilog HDL
* **Instruction Set:** MIPS32 Subset (R-type, I-type, J-type)
* **Simulation Tools:** [Insert Tool Name, e.g., Xilinx Vivado / ModelSim]
* **Design Approach:** Modular RTL design with hierarchical structural modeling.

## Directory Structure

* **00-Single-Cycle/**: Standard single-cycle implementation where each instruction is executed in a single clock period.
* **01-Multi-Cycle/**: Implementation utilizing a Finite State Machine (FSM) to partition instruction execution into multiple steps (Fetch, Decode, Execute, Memory, Write-back).
* **10-Pipelined/**: Future implementation focusing on instruction-level parallelism and hardware utilization.

## Installation and Simulation

### Prerequisites
* A functional Verilog simulation environment (Vivado, Quartus, or Icarus Verilog).
* Waveform viewer (GTKWave or integrated IDE tools).

### Execution
1. Clone the repository:
   ```bash
   git clone [https://github.com/CenMert/mips-architectures.git](https://github.com/CenMert/mips-architectures.git)

2. Navigate to the specific architecture directory:
    ```bash
    cd 00-Single-Cycle

3. Initialize the project files within your simulation environment and execute the testbench located in the testbench/ directory.

Cengiz Mert ÖNCE