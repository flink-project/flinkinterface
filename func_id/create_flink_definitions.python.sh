#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT)

# flinkPython
filepath_func_id_flinkpython_dir=./flinkpython/flink/core
filepath_func_id_flinkpython=$filepath_func_id_flinkpython_dir/flink_definitions.py
mkdir -p $filepath_func_id_flinkpython_dir

# definitions of the func ids
source $SCRIPT_DIR/func_id_definitions.sh



# flinkpython: flink_definitions.py
# #################################
filepath=$filepath_func_id_flinkpython

# Empty the content of the file
cp /dev/null $filepath

# Header
echo "# 
#  _________     _____      _____    ____  _____    ___  ____      
# |_   ___  |  |_   _|     |_   _|  |_   \|_   _|  |_  ||_  _|    
#   | |_  \_|    | |         | |      |   \ | |      | |_/ /       
#   |  _|        | |   _     | |      | |\ \| |      |  __'.    
#  _| |_        _| |__/ |   _| |_    _| |_\   |_    _| |  \ \_  
# |_____|      |________|  |_____|  |_____|\____|  |____||____|  
#                                                               
#
#                                                         
# flink definitions                                            
#                                                          
#  THIS FILE WAS CREATED AUTOMATICALLY - do not change      
#                                                            
#  Created with: flinkinterface/func_id/                     
#                   create_flink_definitions.python.sh  
#                                                      
#

__author__ = "Urs Graf, Patrick Good"
__license__ = "http://www.apache.org/licenses/LICENSE-2.0"
__version__ = "1.0"

REGISTER_WIDTH		     = 4     # in byte
REGISTER_WIDTH_BIT	     = REGISTER_WIDTH * 8
HEADER_SIZE		     = 16    # in byte
SUBHEADER_SIZE	             = 16    # in byte
TOTAL_HEADER_SIZE            = HEADER_SIZE + SUBHEADER_SIZE

TYPE_OFFSET                  = 0x0   # in byte
SIZE_OFFSET                  = 0x4   # in byte
CHANNEL_OFFSET               = 0x8   # in byte
UNIQUE_ID_OFFSET             = 0xC   # in byte
MOD_STATUS_OFFSET            = 0x10  # in byte
MOD_CONF_OFFSET              = 0x14  # in byte

INFO_DESC_SIZE               = 28    # in byte

" >> $filepath


# Interface IDs:
content=""

for (( i=0; i < ${#namesDeep[@]}; i++)); do		# whole list
	if [ "${namesDeep[i]}" != "" ]
	then
		content="$content${namesDeep[i]}\t\t\t= 0x${hex[i]}\n"
	fi
done

echo -e $content >> $filepath	# write file

echo "REFLECTIVE_SENSOR_SUBTYP       = 0x4
INTERFACE_TYPE_MASK            = 0xFFFF
INFO_DEVICE_SIZE               = 0x80
" >> $filepath

echo "$filepath created"
exit 0
