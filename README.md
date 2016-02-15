# flinkinterface

The common definitions for "ioctl" and "function id" are defined in this repository. This repository is a sub-repository of "flinklib" and "flinklinux".

## Function id
 - Defined in "func_id_definitions.sh"
 - flinklib:    CMake automatically executes "create_subdevtypes.c.sh" and generates "subdevtypes.c.inc"
 - flinklinux:  Makefile automatically executes "create_flink_fmi.c.sh" and generates "flink_fmi.c"
 - flinkvhdl:   "create_flink_definitions.vhd_flinkVHDL.sh" has to be executed manually. It generates "flinkinterface/flinkvhdl/fLink/core/flink_definitions.vhd". This file has to be copied in the flinkvhdl repository "flinkvhdl/fLink/core/flink_definitions.vhd"
 - flinkdeep:   "create_FLinkDefinitions.java_flinkdeep.sh" has to be executed manually. It generates "flinkinterface/flinkdeep/fLink/core/FLinkDefinitions.java". This file has to be copied in the flinkdeep repository "flinkdeep/fLink/core/FLinkDefinitions.java"
 
 ## ioctl
 - Defined in "ioctl_definitions.sh"
 - flinklib:    CMake automatically executes "create_flinkioctl_cmd.h.sh" and generates "flinkioctl_cmd.h"
 - flinklinux:  Makefile automatically executes "create_flink_ioctl.h.sh" and generates "flink_ioctl.h"
