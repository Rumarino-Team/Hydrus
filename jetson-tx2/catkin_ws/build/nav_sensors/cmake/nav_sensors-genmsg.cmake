# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "nav_sensors: 5 messages, 0 services")

set(MSG_I_FLAGS "-Inav_sensors:/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(nav_sensors_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg" NAME_WE)
add_custom_target(_nav_sensors_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nav_sensors" "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg" ""
)

get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg" NAME_WE)
add_custom_target(_nav_sensors_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nav_sensors" "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg" "geometry_msgs/Point:geometry_msgs/Vector3:nav_sensors/DVL_Beams"
)

get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg" NAME_WE)
add_custom_target(_nav_sensors_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nav_sensors" "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg" ""
)

get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg" NAME_WE)
add_custom_target(_nav_sensors_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nav_sensors" "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg" ""
)

get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg" NAME_WE)
add_custom_target(_nav_sensors_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nav_sensors" "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg" "geometry_msgs/Point:nav_sensors/DVL_Power:nav_sensors/DVL_Beams:nav_sensors/DVL_Data:geometry_msgs/Vector3:std_msgs/Header:nav_sensors/DVL_Info:std_msgs/String"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nav_sensors
)
_generate_msg_cpp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nav_sensors
)
_generate_msg_cpp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nav_sensors
)
_generate_msg_cpp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nav_sensors
)
_generate_msg_cpp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nav_sensors
)

### Generating Services

### Generating Module File
_generate_module_cpp(nav_sensors
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nav_sensors
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(nav_sensors_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(nav_sensors_generate_messages nav_sensors_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_cpp _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_cpp _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_cpp _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_cpp _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_cpp _nav_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nav_sensors_gencpp)
add_dependencies(nav_sensors_gencpp nav_sensors_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nav_sensors_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nav_sensors
)
_generate_msg_eus(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nav_sensors
)
_generate_msg_eus(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nav_sensors
)
_generate_msg_eus(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nav_sensors
)
_generate_msg_eus(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nav_sensors
)

### Generating Services

### Generating Module File
_generate_module_eus(nav_sensors
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nav_sensors
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(nav_sensors_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(nav_sensors_generate_messages nav_sensors_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_eus _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_eus _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_eus _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_eus _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_eus _nav_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nav_sensors_geneus)
add_dependencies(nav_sensors_geneus nav_sensors_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nav_sensors_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nav_sensors
)
_generate_msg_lisp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nav_sensors
)
_generate_msg_lisp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nav_sensors
)
_generate_msg_lisp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nav_sensors
)
_generate_msg_lisp(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nav_sensors
)

### Generating Services

### Generating Module File
_generate_module_lisp(nav_sensors
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nav_sensors
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(nav_sensors_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(nav_sensors_generate_messages nav_sensors_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_lisp _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_lisp _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_lisp _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_lisp _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_lisp _nav_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nav_sensors_genlisp)
add_dependencies(nav_sensors_genlisp nav_sensors_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nav_sensors_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nav_sensors
)
_generate_msg_nodejs(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nav_sensors
)
_generate_msg_nodejs(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nav_sensors
)
_generate_msg_nodejs(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nav_sensors
)
_generate_msg_nodejs(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nav_sensors
)

### Generating Services

### Generating Module File
_generate_module_nodejs(nav_sensors
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nav_sensors
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(nav_sensors_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(nav_sensors_generate_messages nav_sensors_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_nodejs _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_nodejs _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_nodejs _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_nodejs _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_nodejs _nav_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nav_sensors_gennodejs)
add_dependencies(nav_sensors_gennodejs nav_sensors_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nav_sensors_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nav_sensors
)
_generate_msg_py(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nav_sensors
)
_generate_msg_py(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nav_sensors
)
_generate_msg_py(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nav_sensors
)
_generate_msg_py(nav_sensors
  "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nav_sensors
)

### Generating Services

### Generating Module File
_generate_module_py(nav_sensors
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nav_sensors
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(nav_sensors_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(nav_sensors_generate_messages nav_sensors_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Beams.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_py _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Data.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_py _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Info.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_py _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_Power.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_py _nav_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/msg/DVL_MSG.msg" NAME_WE)
add_dependencies(nav_sensors_generate_messages_py _nav_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nav_sensors_genpy)
add_dependencies(nav_sensors_genpy nav_sensors_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nav_sensors_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nav_sensors)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nav_sensors
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(nav_sensors_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nav_sensors)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nav_sensors
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(nav_sensors_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nav_sensors)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nav_sensors
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(nav_sensors_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nav_sensors)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nav_sensors
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(nav_sensors_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nav_sensors)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nav_sensors\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nav_sensors
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(nav_sensors_generate_messages_py geometry_msgs_generate_messages_py)
endif()
