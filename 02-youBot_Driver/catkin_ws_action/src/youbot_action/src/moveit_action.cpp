
#include <pluginlib/class_loader.h>
#include <ros/ros.h>
#include <iostream>
#include <string>


#include <moveit/move_group_interface/move_group.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/planning_interface/planning_interface.h>
#include <moveit/planning_scene/planning_scene.h>
#include <moveit/kinematic_constraints/utils.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_msgs/PlanningScene.h>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>
#include <control_msgs/FollowJointTrajectoryAction.h>


int main(int argc, char **argv)
{
  ros::init (argc, argv, "action_client");
  ros::AsyncSpinner spinner(1);
  spinner.start();
  ros::NodeHandle node_handle("~");
  ros::Publisher display_publisher = node_handle.advertise<moveit_msgs::DisplayTrajectory>("/move_group/display_planned_path", 1, true);
  moveit_msgs::DisplayTrajectory display_trajectory;


  moveit::planning_interface::MoveGroup group("kuka_arm");
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  std::cout <<"Reference frame:" << group.getPlanningFrame() << std::endl;
  std::cout <<"Reference frame:" << group.getEndEffectorLink() << std::endl;

  moveit::planning_interface::MoveGroup::Plan my_plan;
  group.setMaxVelocityScalingFactor(0.1);
  group.setMaxAccelerationScalingFactor(0.3);


 std::vector<double> group_variable_values;
 group.getCurrentState()->copyJointGroupPositions(group.getCurrentState()->getRobotModel()->getJointModelGroup(group.getName()), group_variable_values);
 group_variable_values[0]=0;
 group.setStartStateToCurrentState();

 group.setJointValueTarget(group_variable_values);
 ROS_INFO("start to plan");
 bool success = group.plan(my_plan);

 ROS_INFO("Visualizing plan 1 (again)");
  display_trajectory.trajectory_start = my_plan.start_state_;
  display_trajectory.trajectory.push_back(my_plan.trajectory_);
  display_publisher.publish(display_trajectory);

 std::cout << success << std::endl;

 group.execute(my_plan);


  ros::shutdown();
  return 0;
}
