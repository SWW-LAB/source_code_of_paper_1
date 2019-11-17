#include <moveit/move_group_interface/move_group.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>

#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>

#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include <moveit/robot_model_loader/robot_model_loader.h>

#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>

#include<moveit/kinematics_base/kinematics_base.h>

#include <iostream>

#include <ros/ros.h>
#include <eigen_conversions/eigen_msg.h>
#include<geometry_msgs/Pose.h>
#include <actionlib/server/simple_action_server.h>
#include <ik/ikAction.h>

typedef actionlib::SimpleActionServer<ik::ikAction> Server;


void execute(const ik::ikGoalConstPtr& pose,Server* as)
{
    ROS_INFO("LALALALALA");
    robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
    robot_model::RobotModelPtr kinematic_model=robot_model_loader.getModel();
    ROS_INFO("Model frame:%s",kinematic_model->getModelFrame().c_str());

    robot_state::RobotStatePtr kinematic_state(new robot_state::RobotState(kinematic_model));
    kinematic_state->setToDefaultValues();
    const robot_state::JointModelGroup* joint_model_group=kinematic_model->getJointModelGroup("arm1");
    const std::vector<std::string>&jointName =joint_model_group->getJointModelNames();

    std::vector<double> joint_vaules;
    kinematic_state->copyJointGroupPositions(joint_model_group,joint_vaules);
    for(std::size_t i=0;i<joint_vaules.size();i++)
    {
       std::cout << jointName[i] << " " << joint_vaules[i] << std::endl;
    }

    joint_vaules[0]=1.57;
    kinematic_state->setJointGroupPositions(joint_model_group,joint_vaules);
    std::cout << "Current state is" << (kinematic_state->satisfiesBounds()?"valid":"not valid") << std::endl;
    kinematic_state->enforceBounds();
    std::cout << "Current state is" << (kinematic_state->satisfiesBounds()?"valid":"not valid") << std::endl;

    for(std::size_t i=0;i<joint_vaules.size();i++)
    {
       std::cout << jointName[i] << " " << joint_vaules[i] << std::endl;
    }


    kinematic_state->setToDefaultValues();
    kinematic_state->setToRandomPositions(joint_model_group);
    //const Eigen::Affine3d&end_effector_state = kinematic_state->getGlobalLinkTransform("gripper_palm_link");
    //std::cout << "Translation:" << end_effector_state.translation() << std::endl;
    //std::cout << "Rotation:" << end_effector_state.rotation() << std::endl;
    geometry_msgs::Pose q;
    q=pose->pose;

     Eigen::Affine3d end_effector_state ;

    tf::poseMsgToEigen(q,end_effector_state);

    std::cout << "Translation:" << end_effector_state.translation() << std::endl;
    std::cout << "Rotation:" << end_effector_state.rotation() << std::endl;

    ros::Time init();
    ros::Time t_1,t_2;
    ros::Duration t;
    t_1=ros::Time::now();
    bool found_ik=kinematic_state->setFromIK(joint_model_group,end_effector_state,10,0.1);
    //bool found_ik=kinematics::KinematicsBase::getPositionIK(q,);
    if(found_ik)
    {
       kinematic_state->copyJointGroupPositions(joint_model_group,joint_vaules);
       for(std::size_t i=0;i<jointName.size();i++)
       {
          std::cout << jointName[i] << " " << joint_vaules[i] << std::endl;
       }
       t_2=ros::Time::now();
       t=t_2-t_1;
       std::cout<<t<<std::endl;
       ik::ikResult result;

       for(int i=0;i<joint_vaules.size();i++)
       {
           result.jointresult.push_back(joint_vaules[i]);
           std::cout<<result.jointresult[i]<<std::endl;
       }

       as->setSucceeded(result,"Successed");

    }
    else
    {
       std::cout << "can't find IK solution." << std::endl;
       as->setAborted();
    }

}

int main(int argc, char **argv)
{
 ros::init(argc,argv,"youbot_ik");
 ros::NodeHandle n;
 ROS_INFO("start");

Server ik_server(n,"youbot_ik",boost::bind(&execute, _1, &ik_server), false);

 ik_server.start();
 ros::spin();

}
