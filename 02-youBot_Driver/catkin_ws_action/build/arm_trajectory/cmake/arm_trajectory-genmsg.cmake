# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "arm_trajectory: 7 messages, 0 services")

set(MSG_I_FLAGS "-Iarm_trajectory:/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg;-Icontrol_msgs:/opt/ros/indigo/share/control_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Iroscpp:/opt/ros/indigo/share/roscpp/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/indigo/share/trajectory_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(arm_trajectory_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg" NAME_WE)
add_custom_target(_arm_trajectory_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_trajectory" "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg" "actionlib_msgs/GoalStatus:arm_trajectory/jointsgoalFeedback:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg" NAME_WE)
add_custom_target(_arm_trajectory_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_trajectory" "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg" ""
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg" NAME_WE)
add_custom_target(_arm_trajectory_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_trajectory" "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg" "actionlib_msgs/GoalID:std_msgs/Header:arm_trajectory/jointsgoalGoal"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg" NAME_WE)
add_custom_target(_arm_trajectory_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_trajectory" "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg" "arm_trajectory/jointsgoalResult:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalAction.msg" NAME_WE)
add_custom_target(_arm_trajectory_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_trajectory" "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalAction.msg" "arm_trajectory/jointsgoalFeedback:arm_trajectory/jointsgoalActionResult:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:arm_trajectory/jointsgoalGoal:std_msgs/Header:arm_trajectory/jointsgoalResult:arm_trajectory/jointsgoalActionGoal:arm_trajectory/jointsgoalActionFeedback"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg" NAME_WE)
add_custom_target(_arm_trajectory_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_trajectory" "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg" ""
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg" NAME_WE)
add_custom_target(_arm_trajectory_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_trajectory" "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_cpp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_cpp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_cpp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_cpp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalAction.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_cpp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_cpp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory
)

### Generating Services

### Generating Module File
_generate_module_cpp(arm_trajectory
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(arm_trajectory_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(arm_trajectory_generate_messages arm_trajectory_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_cpp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_cpp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_cpp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_cpp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalAction.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_cpp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_cpp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_cpp _arm_trajectory_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arm_trajectory_gencpp)
add_dependencies(arm_trajectory_gencpp arm_trajectory_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arm_trajectory_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_lisp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_lisp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_lisp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_lisp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalAction.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_lisp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory
)
_generate_msg_lisp(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory
)

### Generating Services

### Generating Module File
_generate_module_lisp(arm_trajectory
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(arm_trajectory_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(arm_trajectory_generate_messages arm_trajectory_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_lisp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_lisp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_lisp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_lisp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalAction.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_lisp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_lisp _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_lisp _arm_trajectory_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arm_trajectory_genlisp)
add_dependencies(arm_trajectory_genlisp arm_trajectory_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arm_trajectory_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory
)
_generate_msg_py(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory
)
_generate_msg_py(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory
)
_generate_msg_py(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory
)
_generate_msg_py(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalAction.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg;/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory
)
_generate_msg_py(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory
)
_generate_msg_py(arm_trajectory
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory
)

### Generating Services

### Generating Module File
_generate_module_py(arm_trajectory
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(arm_trajectory_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(arm_trajectory_generate_messages arm_trajectory_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionFeedback.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_py _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalGoal.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_py _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionGoal.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_py _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalActionResult.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_py _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalAction.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_py _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalResult.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_py _arm_trajectory_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/arm_trajectory/msg/jointsgoalFeedback.msg" NAME_WE)
add_dependencies(arm_trajectory_generate_messages_py _arm_trajectory_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arm_trajectory_genpy)
add_dependencies(arm_trajectory_genpy arm_trajectory_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arm_trajectory_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_trajectory
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(arm_trajectory_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
add_dependencies(arm_trajectory_generate_messages_cpp control_msgs_generate_messages_cpp)
add_dependencies(arm_trajectory_generate_messages_cpp sensor_msgs_generate_messages_cpp)
add_dependencies(arm_trajectory_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(arm_trajectory_generate_messages_cpp roscpp_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arm_trajectory
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(arm_trajectory_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
add_dependencies(arm_trajectory_generate_messages_lisp control_msgs_generate_messages_lisp)
add_dependencies(arm_trajectory_generate_messages_lisp sensor_msgs_generate_messages_lisp)
add_dependencies(arm_trajectory_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(arm_trajectory_generate_messages_lisp roscpp_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_trajectory
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(arm_trajectory_generate_messages_py actionlib_msgs_generate_messages_py)
add_dependencies(arm_trajectory_generate_messages_py control_msgs_generate_messages_py)
add_dependencies(arm_trajectory_generate_messages_py sensor_msgs_generate_messages_py)
add_dependencies(arm_trajectory_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(arm_trajectory_generate_messages_py roscpp_generate_messages_py)
