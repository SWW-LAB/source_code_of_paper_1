# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "gripper_controller: 7 messages, 0 services")

set(MSG_I_FLAGS "-Igripper_controller:/home/chao/catkin_ws_action/devel/share/gripper_controller/msg;-Idynamixel_msgs:/home/chao/tools/src/dynamixel_motor/dynamixel_msgs/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg;-Iactionlib:/opt/ros/indigo/share/actionlib/cmake/../msg;-Iroscpp:/opt/ros/indigo/share/roscpp/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(gripper_controller_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg" NAME_WE)
add_custom_target(_gripper_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_controller" "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg" "std_msgs/Float64"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg" NAME_WE)
add_custom_target(_gripper_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_controller" "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg" "gripper_controller/floattypeGoal:actionlib_msgs/GoalID:std_msgs/Header:std_msgs/Float64"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg" NAME_WE)
add_custom_target(_gripper_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_controller" "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg" "std_msgs/Float64"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg" NAME_WE)
add_custom_target(_gripper_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_controller" "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg" "actionlib_msgs/GoalStatus:std_msgs/Float64:actionlib_msgs/GoalID:std_msgs/Header:gripper_controller/floattypeResult"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeAction.msg" NAME_WE)
add_custom_target(_gripper_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_controller" "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeAction.msg" "gripper_controller/floattypeGoal:gripper_controller/floattypeFeedback:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:gripper_controller/floattypeActionResult:gripper_controller/floattypeActionGoal:std_msgs/Header:gripper_controller/floattypeResult:std_msgs/Float64:gripper_controller/floattypeActionFeedback"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg" NAME_WE)
add_custom_target(_gripper_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_controller" "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg" "std_msgs/Float64"
)

get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg" NAME_WE)
add_custom_target(_gripper_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gripper_controller" "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg" "actionlib_msgs/GoalStatus:std_msgs/Float64:actionlib_msgs/GoalID:std_msgs/Header:gripper_controller/floattypeFeedback"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller
)
_generate_msg_cpp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller
)
_generate_msg_cpp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller
)
_generate_msg_cpp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller
)
_generate_msg_cpp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeAction.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller
)
_generate_msg_cpp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller
)
_generate_msg_cpp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller
)

### Generating Services

### Generating Module File
_generate_module_cpp(gripper_controller
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(gripper_controller_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(gripper_controller_generate_messages gripper_controller_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_cpp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_cpp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_cpp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_cpp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeAction.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_cpp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_cpp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_cpp _gripper_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gripper_controller_gencpp)
add_dependencies(gripper_controller_gencpp gripper_controller_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gripper_controller_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller
)
_generate_msg_lisp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller
)
_generate_msg_lisp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller
)
_generate_msg_lisp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller
)
_generate_msg_lisp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeAction.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller
)
_generate_msg_lisp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller
)
_generate_msg_lisp(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller
)

### Generating Services

### Generating Module File
_generate_module_lisp(gripper_controller
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(gripper_controller_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(gripper_controller_generate_messages gripper_controller_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_lisp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_lisp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_lisp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_lisp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeAction.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_lisp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_lisp _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_lisp _gripper_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gripper_controller_genlisp)
add_dependencies(gripper_controller_genlisp gripper_controller_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gripper_controller_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller
)
_generate_msg_py(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller
)
_generate_msg_py(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller
)
_generate_msg_py(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller
)
_generate_msg_py(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeAction.msg"
  "${MSG_I_FLAGS}"
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller
)
_generate_msg_py(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller
)
_generate_msg_py(gripper_controller
  "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller
)

### Generating Services

### Generating Module File
_generate_module_py(gripper_controller
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(gripper_controller_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(gripper_controller_generate_messages gripper_controller_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeFeedback.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_py _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionGoal.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_py _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeGoal.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_py _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionResult.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_py _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeAction.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_py _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeResult.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_py _gripper_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chao/catkin_ws_action/devel/share/gripper_controller/msg/floattypeActionFeedback.msg" NAME_WE)
add_dependencies(gripper_controller_generate_messages_py _gripper_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gripper_controller_genpy)
add_dependencies(gripper_controller_genpy gripper_controller_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gripper_controller_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gripper_controller
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(gripper_controller_generate_messages_cpp dynamixel_msgs_generate_messages_cpp)
add_dependencies(gripper_controller_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(gripper_controller_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
add_dependencies(gripper_controller_generate_messages_cpp actionlib_generate_messages_cpp)
add_dependencies(gripper_controller_generate_messages_cpp roscpp_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gripper_controller
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(gripper_controller_generate_messages_lisp dynamixel_msgs_generate_messages_lisp)
add_dependencies(gripper_controller_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(gripper_controller_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
add_dependencies(gripper_controller_generate_messages_lisp actionlib_generate_messages_lisp)
add_dependencies(gripper_controller_generate_messages_lisp roscpp_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gripper_controller
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(gripper_controller_generate_messages_py dynamixel_msgs_generate_messages_py)
add_dependencies(gripper_controller_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(gripper_controller_generate_messages_py actionlib_msgs_generate_messages_py)
add_dependencies(gripper_controller_generate_messages_py actionlib_generate_messages_py)
add_dependencies(gripper_controller_generate_messages_py roscpp_generate_messages_py)
