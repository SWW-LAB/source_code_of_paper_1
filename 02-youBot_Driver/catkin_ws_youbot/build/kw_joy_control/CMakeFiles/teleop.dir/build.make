# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/chao/catkin_ws_youbot/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/chao/catkin_ws_youbot/build

# Include any dependencies generated for this target.
include kw_joy_control/CMakeFiles/teleop.dir/depend.make

# Include the progress variables for this target.
include kw_joy_control/CMakeFiles/teleop.dir/progress.make

# Include the compile flags for this target's objects.
include kw_joy_control/CMakeFiles/teleop.dir/flags.make

kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o: kw_joy_control/CMakeFiles/teleop.dir/flags.make
kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o: /home/chao/catkin_ws_youbot/src/kw_joy_control/src/joy_teleop.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/chao/catkin_ws_youbot/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o"
	cd /home/chao/catkin_ws_youbot/build/kw_joy_control && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teleop.dir/src/joy_teleop.cpp.o -c /home/chao/catkin_ws_youbot/src/kw_joy_control/src/joy_teleop.cpp

kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teleop.dir/src/joy_teleop.cpp.i"
	cd /home/chao/catkin_ws_youbot/build/kw_joy_control && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/chao/catkin_ws_youbot/src/kw_joy_control/src/joy_teleop.cpp > CMakeFiles/teleop.dir/src/joy_teleop.cpp.i

kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teleop.dir/src/joy_teleop.cpp.s"
	cd /home/chao/catkin_ws_youbot/build/kw_joy_control && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/chao/catkin_ws_youbot/src/kw_joy_control/src/joy_teleop.cpp -o CMakeFiles/teleop.dir/src/joy_teleop.cpp.s

kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o.requires:
.PHONY : kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o.requires

kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o.provides: kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o.requires
	$(MAKE) -f kw_joy_control/CMakeFiles/teleop.dir/build.make kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o.provides.build
.PHONY : kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o.provides

kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o.provides.build: kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o

# Object files for target teleop
teleop_OBJECTS = \
"CMakeFiles/teleop.dir/src/joy_teleop.cpp.o"

# External object files for target teleop
teleop_EXTERNAL_OBJECTS =

/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: kw_joy_control/CMakeFiles/teleop.dir/build.make
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /opt/ros/indigo/lib/libroscpp.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /opt/ros/indigo/lib/librosconsole.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/liblog4cxx.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /opt/ros/indigo/lib/librostime.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /opt/ros/indigo/lib/libcpp_common.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop: kw_joy_control/CMakeFiles/teleop.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop"
	cd /home/chao/catkin_ws_youbot/build/kw_joy_control && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/teleop.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
kw_joy_control/CMakeFiles/teleop.dir/build: /home/chao/catkin_ws_youbot/devel/lib/kw_joy_control/teleop
.PHONY : kw_joy_control/CMakeFiles/teleop.dir/build

kw_joy_control/CMakeFiles/teleop.dir/requires: kw_joy_control/CMakeFiles/teleop.dir/src/joy_teleop.cpp.o.requires
.PHONY : kw_joy_control/CMakeFiles/teleop.dir/requires

kw_joy_control/CMakeFiles/teleop.dir/clean:
	cd /home/chao/catkin_ws_youbot/build/kw_joy_control && $(CMAKE_COMMAND) -P CMakeFiles/teleop.dir/cmake_clean.cmake
.PHONY : kw_joy_control/CMakeFiles/teleop.dir/clean

kw_joy_control/CMakeFiles/teleop.dir/depend:
	cd /home/chao/catkin_ws_youbot/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/chao/catkin_ws_youbot/src /home/chao/catkin_ws_youbot/src/kw_joy_control /home/chao/catkin_ws_youbot/build /home/chao/catkin_ws_youbot/build/kw_joy_control /home/chao/catkin_ws_youbot/build/kw_joy_control/CMakeFiles/teleop.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : kw_joy_control/CMakeFiles/teleop.dir/depend

