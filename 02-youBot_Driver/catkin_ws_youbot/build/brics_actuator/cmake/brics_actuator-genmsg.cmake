# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "brics_actuator: 12 messages, 0 services")

set(MSG_I_FLAGS "-Ibrics_actuator:/home/chao/catkin_ws_youbot/src/brics_actuator/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(brics_actuator_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg" ""
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointConstraint.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointConstraint.msg" "brics_actuator/JointValue"
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointAccelerations.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointAccelerations.msg" "brics_actuator/Poison:brics_actuator/JointValue"
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianWrench.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianWrench.msg" "brics_actuator/Poison:brics_actuator/CartesianVector"
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointVelocities.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointVelocities.msg" "brics_actuator/Poison:brics_actuator/JointValue"
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg" ""
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg" ""
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianPose.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianPose.msg" "brics_actuator/Poison:brics_actuator/CartesianVector:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointPositions.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointPositions.msg" "brics_actuator/Poison:brics_actuator/JointValue"
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianTwist.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianTwist.msg" "brics_actuator/Poison:brics_actuator/CartesianVector"
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointTorques.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointTorques.msg" "brics_actuator/Poison:brics_actuator/JointValue"
)

get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointImpedances.msg" NAME_WE)
add_custom_target(_brics_actuator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "brics_actuator" "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointImpedances.msg" "brics_actuator/Poison:brics_actuator/JointValue"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointConstraint.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointTorques.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointPositions.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointVelocities.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianPose.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianWrench.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianTwist.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointAccelerations.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)
_generate_msg_cpp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointImpedances.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
)

### Generating Services

### Generating Module File
_generate_module_cpp(brics_actuator
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(brics_actuator_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(brics_actuator_generate_messages brics_actuator_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointConstraint.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointAccelerations.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianWrench.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointVelocities.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianPose.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointPositions.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianTwist.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointTorques.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointImpedances.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_cpp _brics_actuator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(brics_actuator_gencpp)
add_dependencies(brics_actuator_gencpp brics_actuator_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS brics_actuator_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointConstraint.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointTorques.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointPositions.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointVelocities.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianPose.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianWrench.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianTwist.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointAccelerations.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)
_generate_msg_lisp(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointImpedances.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
)

### Generating Services

### Generating Module File
_generate_module_lisp(brics_actuator
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(brics_actuator_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(brics_actuator_generate_messages brics_actuator_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointConstraint.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointAccelerations.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianWrench.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointVelocities.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianPose.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointPositions.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianTwist.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointTorques.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointImpedances.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_lisp _brics_actuator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(brics_actuator_genlisp)
add_dependencies(brics_actuator_genlisp brics_actuator_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS brics_actuator_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointConstraint.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointTorques.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointPositions.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointVelocities.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianPose.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianWrench.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianTwist.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointAccelerations.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)
_generate_msg_py(brics_actuator
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointImpedances.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg;/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
)

### Generating Services

### Generating Module File
_generate_module_py(brics_actuator
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(brics_actuator_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(brics_actuator_generate_messages brics_actuator_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianVector.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointConstraint.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointAccelerations.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianWrench.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointVelocities.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointValue.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/Poison.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianPose.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointPositions.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/CartesianTwist.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointTorques.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_youbot/src/brics_actuator/msg/JointImpedances.msg" NAME_WE)
add_dependencies(brics_actuator_generate_messages_py _brics_actuator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(brics_actuator_genpy)
add_dependencies(brics_actuator_genpy brics_actuator_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS brics_actuator_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/brics_actuator
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(brics_actuator_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/brics_actuator
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(brics_actuator_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/brics_actuator
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(brics_actuator_generate_messages_py geometry_msgs_generate_messages_py)
