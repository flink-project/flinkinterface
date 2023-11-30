#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT)

# flinkJava
filepath_func_id_flinkdeep_dir=./flinkdeep/flink/core
filepath_func_id_flinkdeep=$filepath_func_id_flinkdeep_dir/FlinkDefinitions.java
mkdir -p $filepath_func_id_flinkdeep_dir

# definitions of the func ids
source $SCRIPT_DIR/func_id_definitions.sh



# flinkdeep: FLinkDefinitions.java
# ################################
filepath=$filepath_func_id_flinkdeep

# Empty the content of the file
cp /dev/null $filepath

# Header
echo "/** ***************************************************************************
**  _________     _____      _____    ____  _____    ___  ____               **
** |_   ___  |  |_   _|     |_   _|  |_   \|_   _|  |_  ||_  _|              **
**   | |_  \_|    | |         | |      |   \ | |      | |_/ /                **
**   |  _|        | |   _     | |      | |\ \| |      |  __'.                **
**  _| |_        _| |__/ |   _| |_    _| |_\   |_    _| |  \ \_              **
** |_____|      |________|  |_____|  |_____|\____|  |____||____|             **
**                                                                           **
*******************************************************************************
**                                                                           **
** flink definitions                                                         **
**                                                                           **
**  THIS FILE WAS CREATED AUTOMATICALLY - do not change                      **
**                                                                           **
**  Created with: flinkinterface/func_id/                                    **
**                   create_flink_definitions.java_flinkdeep.sh              **
**                                                                           **
*******************************************************************************
*/

package org.deepjava.flink.core;

public interface FlinkDefinitions {

	public static final int REGISTER_WIDTH		= 4;		// byte
	public static final int REGISTER_WIDTH_BIT	= REGISTER_WIDTH*8;	
	public static final int HEADER_SIZE		= 16;		// byte
	public static final int SUBHEADER_SIZE	        = 16;		// byte
	public static final int TOTAL_HEADER_SIZE = HEADER_SIZE + SUBHEADER_SIZE;
	
	
	public static final int TYPE_OFFSET             = 0x0;
	public static final int SIZE_OFFSET             = 0x4;
	public static final int CHANNEL_OFFSET          = 0x8;
	public static final int UNIQUE_ID_OFFSET        = 0xC;
	public static final int MOD_STATUS_OFFSET       = 0x10;
	public static final int MOD_CONF_OFFSET         = 0x14;
	
	" >> $filepath


# Interface IDs:
content=""

for (( i=0; i < ${#namesDeep[@]}; i++)); do		# whole list
	if [ "${namesDeep[i]}" != "" ]
	then
		content="$content\tpublic static final int ${namesDeep[i]}\t\t\t= 0x${hex[i]};\n"
	fi
done


content="$content
\n
\tpublic static final int INTERFACE_TYPE_MASK = 0xFFFF;\n
\tpublic static final int INFO_DEVICE_SIZE = 0x80;\n\n\n}"

echo -e $content >> $filepath	# write file




echo "$filepath created"
exit 0
