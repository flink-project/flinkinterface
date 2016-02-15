#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT)

# flinkVHDL
filepath_func_id_flinkvhdl_dir=./flinkvhdl/fLink/core
filepath_func_id_flinkvhdl=$filepath_func_id_flinkvhdl_dir/flink_definitions.vhd
mkdir -p $filepath_func_id_flinkvhdl_dir

# definitions of the func ids
source $SCRIPT_DIR/func_id_definitions.sh



# flinklib: flink_definitions.vhd
# ###############################
filepath=$filepath_func_id_flinkvhdl

# Empty the content of the file
cp /dev/null $filepath

# Header
echo "-------------------------------------------------------------------------------
--  _________     _____      _____    ____  _____    ___  ____               --
-- |_   ___  |  |_   _|     |_   _|  |_   \|_   _|  |_  ||_  _|              --
--   | |_  \_|    | |         | |      |   \ | |      | |_/ /                --
--   |  _|        | |   _     | |      | |\ \| |      |  __'.                --
--  _| |_        _| |__/ |   _| |_    _| |_\   |_    _| |  \ \_              --
-- |_____|      |________|  |_____|  |_____|\____|  |____||____|             --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
-- fLink definitions                                                         --
--                                                                           --
--  THIS FILE WAS CREATED AUTOMATICALLY - do not change                      --
--                                                                           --
--  Created with: flinkinterface/func_id/                                    --
--                   create_flink_definitions.vhd_flinkVHDL.sh               --
--                                                                           --
-------------------------------------------------------------------------------
-- Copyright 2014 NTB University of Applied Sciences in Technology           --
--                                                                           --
-- Licensed under the Apache License, Version 2.0 (the \"License\");           --
-- you may not use this file except in compliance with the License.          --
-- You may obtain a copy of the License at                                   --
--                                                                           --
-- http://www.apache.org/licenses/LICENSE-2.0                                --
--                                                                           --
-- Unless required by applicable law or agreed to in writing, software       --
-- distributed under the License is distributed on an \"AS IS\" BASIS,         --
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  --
-- See the License for the specific language governing permissions and       --
-- limitations under the License.                                            --
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE fLink_definitions IS

	-- Global
	CONSTANT c_fLink_avs_data_width						: INTEGER := 32;
	CONSTANT c_fLink_avs_data_width_in_byte 			: INTEGER := c_fLink_avs_data_width/8;

	-- Header registers
	CONSTANT c_fLink_number_of_std_registers			: INTEGER := 8;
	
	CONSTANT c_fLink_typdef_address						: INTEGER := 0;
	CONSTANT c_fLink_mem_size_address					: INTEGER := 1;
	CONSTANT c_fLink_number_of_channels_address 		: INTEGER := 2;
	CONSTANT c_fLink_unique_id_address					: INTEGER := 3;
	CONSTANT c_fLink_status_address						: INTEGER := 4;
	CONSTANT c_fLink_configuration_address				: INTEGER := 5;
	
	CONSTANT c_fLink_id_length			 				: INTEGER := 16;
	CONSTANT c_fLink_subtype_length						: INTEGER := 8;
	CONSTANT c_fLink_interface_version_length			: INTEGER := 8;
	
	CONSTANT c_fLink_reset_bit_num						: INTEGER := 0;
	
	-- Interface IDs:" >> $filepath


# Interface IDs:
content=""

for (( i=0; i < ${#names[@]}; i++)); do		# whole list
	if [ "${namesVHDL[i]}" != "" ]
	then
		content="$content\tCONSTANT ${namesVHDL[i]}\t\t\t\t\t\t\t: INTEGER := $i;\n"
	fi
done


content="$content
\n	
END PACKAGE fLink_definitions;
\n"

echo -e $content >> $filepath	# write file




echo "$filepath created"
exit 0