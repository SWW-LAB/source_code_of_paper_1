Steps for youBot driver:

1. `roslaunch youbot_driver_ros_interface youbot_driver.launch `

2. `roslaunch kw_vision realsense_f200_with_tf.launch`

3. `source catkin_ws_track/devel/setup.bash`

   `roslaunch ar_track_alvar pr2_indiv_no_kinect.launch`

4. `source catkin_ws_action/devel/setup.bash`

   `roslaunch dynamixel_tutorials controller_manager.launch`

   `roslaunch dynamixel_tutorials controller_spawner.launch`

   `roslaunch gripper_controller gripper_controller.launch`

   `rosrun gripper_controller gripper_controller_client`

5. `source catkin_ws_action/devel/setup.bash`

   `roslaunch arm_trajectory arm_trajectory.launch`

6. `source catkin_ws_action/devel/setup.bash`

   `roslaunch ik youbot_ik.launch`

7. `source catkin_ws_action/devel/setup.bash`

   `rosrun CBT grasp `