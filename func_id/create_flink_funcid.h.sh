#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT)

# flinklib
filepath_func_id_flinklib_dir=.
filepath_func_id_flinklib=$filepath_func_id_flinklib_dir/flink_funcid.h
mkdir -p $filepath_func_id_flinklib_dir

# definitions of the func ids
source $SCRIPT_DIR/func_id_definitions.sh



# flinklib: flink_funcid.h
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
 *  function id definitions                  	                   *
 *                                                                 *
 *******************************************************************/

/** @file flink_funcid.h
 *  @brief flink userspace library, strings for subdevice functions.
 *
 *  This header file contains string definitions for subdevice function id's.
 *  
 *
 *  THIS FILE WAS CREATED AUTOMATICALLY - do not change
 *
 *  Created with: flinkinterface/func_id/create_flink_funcid.sh
 *
 *
 *  
 *  @author Marcel Gehrig
 */

#ifndef FLINKLIB_FUNCID_H_
#define FLINKLIB_FUNCID_H_
 
" >> $filepath

# func_id #define list
for (( i=0; i < ${#names[@]}; i++)); do		# whole list
    if [[ -z ${namesDeep[i]} ]]; then
        content="$content"  #nop
        else
#        content="$content\tint\t${namesDeep[i]}($i);\n"
        content="$content#define ${namesDeep[i]}\t\t$i\n"
    fi
done

content="$content\n#endif // FLINKLIB_FUNCID_H_\n"

echo -e $content >> $filepath	# write file




echo "$filepath created"
exit 0
