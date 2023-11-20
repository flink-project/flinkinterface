# flinkinterface

The common definitions for "ioctl" and "function id" are defined in this repository. This repository is a sub-repository of "flinklib" and "flinklinux".

## function id
- Definitions of function ids in "func_id_definitions.sh"
- flinklib: CMake automatically executes "create_subdevtypes.c.sh" and generates "subdevtypes.c.inc" (holds strings decribing the function), automatically executes "create_flink_funcid.h.sh" and generates "flink_funcid.h" (holds function ids)
- flinklinux: Makefile automatically executes "create_flink_fmi.c.sh" and generates "flink_fmi.c"
- flinkvhdl: "create_flink_definitions.vhd_flinkVHDL.sh" has to be executed manually. It generates "flinkinterface/flinkvhdl/fLink/core/flink_definitions.vhd". This file has to be copied in the flinkvhdl repository "flinkvhdl/flink/core/flink_definitions.vhd"
- flinkpython: "create_flink_definitions.python.sh" has to be executed manually. It generates "flinkinterface/flinkpython/flink/core/flink_definitions.py"
- flinkdeep: "create_flink_definitions.java_flinkdeep.sh" has to be executed manually. It generates "flinkinterface/flinkdeep/flink/core/FlinkDefinitions.java"

### Changing definitions and updating repositories
- Make desired changes in "ioctl_definitions.sh" and push to remote
- flinklib: Checkout the latest version of the submodule "flinkinterface" and rebuild "flinklib"
- flinklinux: Checkout the latest version of the submodule "flinkinterface" and rebuild "flinklinux"
- flinkvhdl: Manually execute "create_flink_definitions.vhd_flinkVHDL.sh" and copy the file "flink_definitions.vhd" to your "flinkvhdl" repository
- flinkpython: Manually execute "create_flink_definitions.python.sh" and copy the file "flink_definitions.py" your "flinkpython" repository
- flinkdeep: Manually execute "create_flink_definitions.java_flinkdeep.sh" and copy the file "FLinkDefinitions.java" to the repository containing your deep target library

## ioctl
- Defined in "ioctl_definitions.sh"
- flinklib: CMake automatically executes "create_flinkioctl_cmd.h.sh" and generates "flinkioctl_cmd.h"
- flinklinux: Makefile automatically executes "create_flink_ioctl.h.sh" and generates "flink_ioctl.h"

### Changing definitions and updating repositories
- Make desired changes in "ioctl_definitions.sh" and push to remote
- flinklib: Checkout the latest version of the submodule "flinkinterface" and rebuild "flinklib"
- flinklinux: Checkout the latest version of the submodule "flinkinterface" and rebuild "flinklinux"
