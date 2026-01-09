# 01 - Multi-Cycle MIPS Processor

> [!IMPORTANT]
> **Under Construction** Under Development. Moving from a single-clock cycle design to a state-based multi-cycle execution.

### Architecture Overview
Unlike the Single-cycle version, this implementation breaks down instruction execution into multiple clock cycles (steps), allowing for:
- **Resource Reuse:** Using a single Memory and a single ALU for different purposes in different cycles.
- **FSM Control:** A Finite State Machine to manage the execution flow (Fetch -> Decode -> Execute -> Memory -> Write-back).

### Design Progress
- [ ] **FSM Controller:** Defining states for each instruction type.
- [ ] **Shared Resources:** Unified Instruction/Data memory implementation.
- [ ] **Intermediate Registers:** Implementation of `IR` (Instruction Register), `MDR`, `A`, `B`, and `ALUOut`.
- [ ] **Simulation & Verification:** Running complex assembly programs.

---
### Key Differences from Single-Cycle
| Feature | Single-Cycle | Multi-Cycle |
| :--- | :--- | :--- |
| **Clock Cycle** | Longest instruction determines cycle time | Each step is one short cycle |
| **Hardware** | Multiple Adders / Dual Memories | Single ALU / Unified Memory |
| **Efficiency** | Faster for simple tasks | Better resource utilization |