# flinkinterface

The common definitions for "ioctl" and "function id" are defined in this repository. This repository is a sub-repository of "flinklib" and "flinklinux".

## function id
- Defined in "func_id_definitions.sh"
- flinklib: CMake automatically executes "create_subdevtypes.c.sh" and generates "subdevtypes.c.inc"
- flinklinux: Makefile automatically executes "create_flink_fmi.c.sh" and generates "flink_fmi.c"
- flinkvhdl: "create_flink_definitions.vhd_flinkVHDL.sh" has to be executed manually. It generates "flinkinterface/flinkvhdl/fLink/core/flink_definitions.vhd". This file has to be copied in the flinkvhdl repository "flinkvhdl/fLink/core/flink_definitions.vhd"
- flinkdeep: "create_FLinkDefinitions.java_flinkdeep.sh" has to be executed manually. It generates "flinkinterface/flinkdeep/fLink/core/FLinkDefinitions.java". This file has to be copied in the flinkdeep repository "flinkdeep/fLink/core/FLinkDefinitions.java"

### Changing definitions and updating repositories
- Make desired changes in "ioctl_definitions.sh" and push to remote
- flinklib: Checkout the latest version of the submodule "flinkinterface" and rebuild "flinklib"
- flinklinux: Checkout the latest version of the submodule "flinkinterface" and rebuild "flinklinux"
- flinkvhdl: Manually execute "create_flink_definitions.vhd_flinkVHDL.sh" and copy the file "flink_definitions.vhd" to your "flinkvhdl" repository
- flinkdeep: Manually execute "create_FLinkDefinitions.java_flinkdeep.sh" and copy the file "FLinkDefinitions.java" to your "flindeep" repository

## ioctl
- Defined in "ioctl_definitions.sh"
- flinklib: CMake automatically executes "create_flinkioctl_cmd.h.sh" and generates "flinkioctl_cmd.h"
- flinklinux: Makefile automatically executes "create_flink_ioctl.h.sh" and generates "flink_ioctl.h"

### Changing definitions and updating repositories
- Make desired changes in "ioctl_definitions.sh" and push to remote
- flinklib: Checkout the latest version of the submodule "flinkinterface" and rebuild "flinklib"
- flinklinux: Checkout the latest version of the submodule "flinkinterface" and rebuild "flinklinux"
