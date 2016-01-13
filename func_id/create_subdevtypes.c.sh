#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT)

# flinklib
filepath_func_id_flinklib_dir=.
filepath_func_id_flinklib=$filepath_func_id_flinklib_dir/subdevtypes.c.inc
mkdir -p $filepath_func_id_flinklib_dir

# definitions of the func ids
source $SCRIPT_DIR/func_id_definitions.sh



# flinklib: subdevtypes.c.inc
# #######################
filepath=$filepath_func_id_flinklib

# Empty the content of the file
cp /dev/null $filepath

# Header
echo "/*******************************************************************
 *   _________     _____      _____    ____  _____    ___  ____    *
 *  |_   ___  |  |_   _|     |_   _|  |_   \|_   _|  |_  ||_  _|   *
 *    | |_  \_|    | |         | |      |   \ | |      | |_/ /     *
 *    |  _|        | |   _     | |      | |\ \| |      |  __'.     *
 *   _| |_        _| |__/ |   _| |_    _| |_\   |_    _| |  \ \_   *
 *  |_____|      |________|  |_____|  |_____|\____|  |____||____|  *
 *                                                                 *
 *******************************************************************
 *                                                                 *
 *  fLink userspace library, subdevice types  	                   *
 *                                                                 *
 *******************************************************************/

/** @file subdevtypes.c.inc
 *  @brief flink userspace library, strings for subdevice functions.
 *
 *  This header file contains string definitions for subdevice function id's.
 *   It is included in \"subdevtypes.c\"
 *
 *  THIS FILE WAS CREATED AUTOMATICALLY - do not change
 *
 *  Created with: flinkinterface/func_id/create_subdevtypes.c.sh
 *
 *
 *  @author Martin Züger
 *  @author Marcel Gehrig
 */
 
" >> $filepath

# func_id list
content="#include <stdint.h>\n
\n
const char* flink_subdev_function_strings[] = {\n"

for (( i=0; i < ${#names[@]}; i++)); do		# whole list
   content="$content\t\"${names[i]}\",\t\t\t// 0x${hex[i]}\"\n"
done

content="$content};\n"

content="$content
#define NOF_KNOWNSUBDEVIDS (sizeof(flink_subdev_function_strings) / sizeof(char*))\n
\n
\n
const char* flink_subdevice_id2str(uint16_t id) {\n
	if(id > NOF_KNOWNSUBDEVIDS - 1) { // unknown subdevice id\n
		return \"unknown\";\n
	}\n
	return flink_subdev_function_strings[id];\n
}\n"

echo -e $content >> $filepath	# write file




echo "$filepath created"
exit 0