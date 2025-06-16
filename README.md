This repository contains a minimal, reproducible example (MRE) demonstrating what I believe to be an issue in Xilinx's Vivado EDA suite. The latest generally-available version (v2025.1) is still affected.

I opened a [thread dedicated to this issue](https://adaptivesupport.amd.com/s/question/0D54U000093K9nQSAS/bitstream-drc-fails-if-tcl-proc-name-starts-with-a-certain-numbers) in the Xilinx Vivado community forum.

# Context

The final step of the FPGA implementation consists in serializing the generated FPGA design into a bitstream.

Prior to this operation a design rule check (DRC) is performed ensuring that the design is free of obvious electrical issues. One of these checks verifies that input/output pins are properly constrained.

# Usage

Assuming the path to the Vivado binaries is already set.

```shell
make
```

# Results

With Vivado 2024.2 on a Linux box.

| TCL proc name | Vivado 2025.1 | Vivado 2024.2 |
| ------------- | ------------- | ------------- |
| `0_user_proc` | ❌ Fail       | ❌ Fail       |
| `7_user_proc` | ❌ Fail       | ❌ Fail       |
| `8_user_proc` | ✅ Pass       | ✅ Pass       |
| `__user_proc` | ✅ Pass       | ✅ Pass       |
| `a_user_proc` | ✅ Pass       | ✅ Pass       |

Regardless of the results, the TCL procedure is called as expected at the begin of the firmware build process. Reviewing the `vivado.log` file, it appears the XDC file somehow appears messed up:

```
Processing XDC Constraints
Initializing timing engine
Parsing XDC File [/********/vivado-tcl-proc-name-poc/zcu106-zu7ev.xdc]
CRITICAL WARNING: [Designutils 20-1307] Command '7_user_proc' is not supported in the xdc constraint file. [/********/vivado-tcl-proc-name-poc/zcu106-zu7ev.xdc:17]
CRITICAL WARNING: [Designutils 20-1307] Command '7_user_proc' is not supported in the xdc constraint file. [/********/vivado-tcl-proc-name-poc/zcu106-zu7ev.xdc:30]
Finished Parsing XDC File [/********/vivado-tcl-proc-name-poc/zcu106-zu7ev.xdc]
```
