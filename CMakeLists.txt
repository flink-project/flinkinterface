# Create: subdevtypes.c
add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/subdevtypes.c.inc
	COMMAND ${CMAKE_CURRENT_LIST_DIR}/func_id/create_subdevtypes.c.sh
	DEPENDS ${CMAKE_CURRENT_LIST_DIR}/func_id/func_id_definitions.sh
		${CMAKE_CURRENT_LIST_DIR}/func_id/create_subdevtypes.c.sh
)

add_custom_target(subdevtypes
	DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/subdevtypes.c.inc
)


# Create: flink_funcid.h
add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/flink_funcid.h
#        $(dirnam {CMAKE_CURRENT_LIST_DIR}/flink_funcid.h
	COMMAND ${CMAKE_CURRENT_LIST_DIR}/func_id/create_flink_funcid.h.sh
	DEPENDS ${CMAKE_CURRENT_LIST_DIR}/func_id/func_id_definitions.sh
		${CMAKE_CURRENT_LIST_DIR}/func_id/create_flink_funcid.h.sh
)

add_custom_target(flink_funcid
	DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/flink_funcid.h
)


# Create: flinkioctl_cmd
add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/flinkioctl_cmd.h
	COMMAND ${CMAKE_CURRENT_LIST_DIR}/ioctl/create_flinkioctl_cmd.h.sh
	DEPENDS ${CMAKE_CURRENT_LIST_DIR}/ioctl/ioctl_definitions.sh
		${CMAKE_CURRENT_LIST_DIR}/ioctl/create_flinkioctl_cmd.h.sh
)

add_custom_target(flinkioctl_cmd
	DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/flinkioctl_cmd.h
)
