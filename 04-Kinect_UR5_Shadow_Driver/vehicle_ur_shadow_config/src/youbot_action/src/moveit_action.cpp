#include <pluginlib/class_loader.h>
#include <ros/ros.h>
#include <iostream>
#include <string>


#include <moveit/move_group_interface/move_group.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/planning_pipeline/planning_pipeline.h>
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
  ros::Duration r(10);


  moveit::planning_interface::MoveGroup group("right_arm");
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  //group.setEndEffectorLink("grasp_link");
  std::cout <<"Reference frame:" << group.getPlanningFrame() << std::endl;
  std::cout <<"Reference frame:" << group.getEndEffectorLink() << std::endl;


  for(int i=0;i<1;i++)
  {
        std::vector<double> group_variable_values;
        group.getCurrentState()->copyJointGroupPositions(group.getCurrentState()->getRobotModel()->getJointModelGroup(group.getName()), group_variable_values);
        group.setStartStateToCurrentState();

        geometry_msgs::Pose target_pose1;
         target_pose1.orientation.x = 0.0;
         target_pose1.orientation.y = 1.0;
         target_pose1.orientation.z = 0.0;
         target_pose1.orientation.w = 0.0;
         target_pose1.position.x = 0.436902;
         target_pose1.position.y = 0.0;
         target_pose1.position.z =0.2;

         group.setPoseTarget(target_pose1);




         // Now, we call the planner to compute the plan and visualize it.
         // Note that we are just planning, not asking move_group
         // to actually move the robot.
         moveit::planning_interface::MoveGroup::Plan my_plan;

         ROS_INFO("start to plan");
         bool success = group.plan(my_plan);
         ROS_INFO_STREAM("my_plan"<<my_plan.planning_time_);
         std::cout<<success<<std::endl;

         display_trajectory.trajectory.push_back(my_plan.trajectory_);
         display_publisher.publish(display_trajectory);
          r.sleep();


//         actionlib::SimpleActionClient<control_msgs::FollowJointTrajectoryAction> ac("/arm_1/arm_controller/follow_joint_trajectory",true);
//         ROS_INFO("waiting for start");
//         ac.waitForServer();
//         ROS_INFO("Sever Started");
//         control_msgs::FollowJointTrajectoryGoal goal;
//         goal.trajectory=my_plan.trajectory_.joint_trajectory;
//         ac.sendGoal(goal);

//         bool finished_before_timeout = ac.waitForResult(ros::Duration(60.0));

//         if(finished_before_timeout)
//        {
//            actionlib::SimpleClientGoalState state = ac.getState();
//            ROS_INFO("Action finished: %s",state.toString().c_str());
//        }

//           else
//             ROS_INFO("Action did not finished before time out.");
  }
       // group.execute(my_plan);


  ros::shutdown();
  return 0;
}
