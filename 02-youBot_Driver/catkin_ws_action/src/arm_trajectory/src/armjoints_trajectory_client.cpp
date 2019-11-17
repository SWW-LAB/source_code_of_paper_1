
//for jointsgoal action and FollwTrajectoryAction
#include<arm_trajectory/jointsgoalAction.h>
#include<control_msgs/FollowJointTrajectoryAction.h>
#include<actionlib/server/simple_action_server.h>
#include<actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>
//for basic ros
#include<ros/ros.h>
//for moveit
#include <pluginlib/class_loader.h>
#include <moveit/move_group_interface/move_group.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/planning_interface/planning_interface.h>
#include <moveit/planning_scene/planning_scene.h>
#include <moveit/kinematic_constraints/utils.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_msgs/PlanningScene.h>

typedef actionlib::SimpleActionServer<arm_trajectory::jointsgoalAction> Server;
typedef actionlib::SimpleActionClient<arm_trajectory::jointsgoalAction> JClient;

void execute(const arm_trajectory::jointsgoalGoalConstPtr goal, Server* as)
{
      //initial
      JClient jclient("position_command_action",true);
      ros::AsyncSpinner spinner(1);
      spinner.start();
      ros::NodeHandle node_handle("~");
      ros::Publisher display_publisher = node_handle.advertise<moveit_msgs::DisplayTrajectory>("/move_group/display_planned_path", 1, true);
      moveit_msgs::DisplayTrajectory display_trajectory;
      moveit::planning_interface::MoveGroup group("right_arm");
      std::cout <<"Reference frame:" << group.getPlanningFrame() << std::endl;
      std::cout <<"Reference frame:" << group.getEndEffectorLink() << std::endl;
      moveit::planning_interface::MoveGroup::Plan my_plan;
      std::vector<double> group_variable_values;
      group.setMaxVelocityScalingFactor(0.5);
      group.setMaxAccelerationScalingFactor(0.1);

      //start to plan
      group.getCurrentState()->copyJointGroupPositions(group.getCurrentState()->getRobotModel()->getJointModelGroup(group.getName()), group_variable_values);
      group.setStartStateToCurrentState();
      group.setJointValueTarget(goal->jointsgoal);
      group.plan(my_plan);

      //display in rviz
      ROS_INFO("publish trajectory to rviz");
      display_trajectory.trajectory_start = my_plan.start_state_;
      display_trajectory.trajectory.push_back(my_plan.trajectory_);
      display_publisher.publish(display_trajectory);

      //start to execute
      group.execute(my_plan);

      //waiting for "position_command_action" server started
      if(!jclient.waitForServer(ros::Duration(30.0)))
      {
           ROS_INFO("the 'position_command_action' server does not start");
           return;
      }
      else
      {
           ROS_INFO("the 'position_command_action' server succeeds to  start");
      }

      //send goal
      arm_trajectory::jointsgoalGoal position_command_action_goal;
      position_command_action_goal.jointsgoal=goal->jointsgoal;
      jclient.sendGoal(position_command_action_goal);

      bool finish_time_out=jclient.waitForResult(ros::Duration(500.0));
      if(finish_time_out)
      {
          actionlib::SimpleClientGoalState state = jclient.getState();
          ROS_INFO(" position_command_action Finished : %s", state.toString().c_str());
      }
      else
      {
          ROS_INFO(" position_command_action did not finished before time out");
      }

      //jointsgoal server ends , send success message
      as->setSucceeded();
      return;
}

int main(int argc ,char **argv)
{
     ros::init(argc,argv,"armjoints_trajectory_client");
     ros::NodeHandle n;
     Server server(n, "jointsgoal", boost::bind(&execute, _1, &server), false);
     server.start();
     ros::spin();
     return 0;
}
