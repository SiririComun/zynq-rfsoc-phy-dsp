# Hardware-Software Co-Design for Physical Layer DSP: From Maxwell's Equations to Silicon

**B.Sc. Physics Thesis** | *Universidad de Antioquia (UdeA), Medellín, Colombia*  
**Author:** Pablo Sanchez ([@SiririComun](https://github.com/SiririComun))

![Status](https://img.shields.io/badge/Status-Research_In_Progress-yellow)
![Platform](https://img.shields.io/badge/Platform-Zynq--7000%20%7C%20RFSoC-blue)
![Framework](https://img.shields.io/badge/Framework-PYNQ%20%7C%20Vivado%202024.2.2-orange)

## 📡 Research Overview
This repository serves as the technical backbone for my Physics undergraduate thesis. The objective is to bridge fundamental electromagnetic theory with high-performance digital implementation. 

Using the **AMD/Xilinx Zynq-7000** (PYNQ-Z1/Arty-Z7) and **RFSoC** platforms, I am developing a modular framework for Physical Layer (PHY) Digital Signal Processing. By leveraging the **PYNQ framework**, I aim to offload computationally intensive radar and telecommunication algorithms to FPGA hardware while maintaining a high-level Python-based control plane.

## 🏗️ Repository Architecture
*   📂 **`docs/`**: Theoretical Plane. Contains academic monographs and thesis drafts.
*   📂 **`gateware/`**: Hardware Plane (PL). Custom VHDL/Verilog, AXI IPs, and Vivado TCL build scripts.
*   📂 **`notebooks/`**: Software Plane (PS). Python drivers and Jupyter-based signal analysis.

## 📍 Research Roadmap

I am following a **Parallel Track** development model, prioritizing hardware prototyping to maximize laboratory access while developing theoretical monographs in tandem.

### 🛠️ Track A: Hardware & Silicon (Active)
- [▶️] **Checkpoint 1:** The Control Plane (AXI4-Lite Register Bridge). <!-- CURRENT FOCUS -->
- [ ] **Checkpoint 2:** The Data Plane (AXI DMA Streaming & Memory Management).
- [ ] **Checkpoint 3:** The Compute Plane (Hardware-Accelerated DSP Benchmarking).
- [ ] **Checkpoint 4:** Real-Time Acquisition (XADC & Spectral Visualization).

### 📚 Track B: Theory & Documentation (In Progress)
- [ ] **Monograph 1:** SoC Architecture for Radar/Telecom Researchers.
- [ ] **Monograph 2:** The PYNQ Paradigm: Bridging Python and Silicon.
- [ ] **Thesis Manuscript:** Physical Layer DSP on Heterogeneous Architectures.

## ⚖️ Licensing
*   **Gateware & Software:** [MIT License](LICENSE)
*   **Thesis Text & Monographs:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)