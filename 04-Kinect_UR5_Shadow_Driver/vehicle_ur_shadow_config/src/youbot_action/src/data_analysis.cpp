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
#include <stdlib.h>
#include<string>
#include<std_msgs/String.h>

#include <ros/ros.h>
#include <eigen_conversions/eigen_msg.h>
#include<geometry_msgs/Pose.h>
#include <actionlib/server/simple_action_server.h>
#include "Eigen/Dense"
#include <fstream>
#include <string>
#include <iostream>


using namespace Eigen;
using namespace std;

//typedef actionlib::SimpleActionServer<ik::ikAction> Server;
//void getInverseJacobi(MatrixXd & Jinv, MatrixXd & Jacobian)
//{
//    MatrixXd Jt(5,6);
//    MatrixXd Jtemp(5,5);
//    Jt = Jacobian.transpose();
//    Jtemp=Jt*Jacobian;
//    Jtemp=Jtemp.inverse();
//    Jinv=Jtemp*Jt;
//}



int main(int argc, char **argv)
{
 ros::init(argc,argv,"youbot_ik");
 ros::NodeHandle n;
 ROS_INFO("start");
 MatrixXd X(6,1);
 for(int i=0;i<6;i++)
 {
     X(i,0)=0;
 }

 MatrixXd Q(5,1);
 MatrixXd Qdot(5,1);

 double a[5][1246]={0};
 double a1[5]={0};
 double b[5][1246]={0};
 double b1[5]={0};

 double c[6][1246]={0};

 std::ifstream in;
 in.open("/home/zc/catkin_ws_action/grasp_smooth.txt",ios::in);
 if(!in.is_open())
 {
     cout<<"Error";
     exit(1);
 }
 std::cout<<"ok"<<endl;

 for(int i=0;i<5;i++)
 {
     for(int j=0;j<1246;j++)
     {
         in>>a[i][j];
     }
 }
in.close();

std::ifstream fin;
fin.open("/home/zc/catkin_ws_action/joint_velo_smooth.txt",ios::in);
if(!fin.is_open())
{
    cout<<"Error";
    exit(1);
}
std::cout<<"ok"<<endl;

for(int i=0;i<5;i++)
{
    for(int j=0;j<1246;j++)
    {
        fin>>b[i][j];
    }
}
fin.close();
 robot_model_loader::RobotModelLoader robot_model_loader("robot_description");

robot_model::RobotModelPtr  kinematic_model=robot_model_loader.getModel();

 ROS_INFO("Model frame:%s",kinematic_model->getModelFrame().c_str());

robot_state::RobotStatePtr kinematic_state(new robot_state::RobotState(kinematic_model));
kinematic_state->setToDefaultValues();
 const robot_state::JointModelGroup* joint_model_group=kinematic_model->getJointModelGroup("arm1");
 const std::vector<std::string>&joint_names=joint_model_group->getJointModelNames();


 //kinematic_state->setToRandomPositions(joint_model_group);
 //const Eigen::Affine3d &end_effector_state = kinematic_state->getGlobalLinkTransform("arm_link_5");




for(int i=0;i<1246;i++)
{
    for(int j=0;j<5;j++)
    {
        a1[j]=a[j][i];
        Qdot(j)=b[j][i];
    }

    kinematic_state->setJointGroupPositions(joint_model_group,a1);
    Eigen::Vector3d reference_point_position(0.0,0.0,0.0);
    Eigen::MatrixXd jacobian;
    kinematic_state->getJacobian(joint_model_group, kinematic_state->getLinkModel(joint_model_group->getLinkModelNames().back()),
                                 reference_point_position,
                                 jacobian);
    ROS_INFO_STREAM("Jacobian: " << jacobian);

    X=jacobian*Qdot;

    for(int k=0;k<6;k++)
    {
        c[k][i]=X(k);
    }


}

std::ofstream out;
out.open("/home/zc/catkin_ws_action/velocities_smooth.txt",ios::app);
for(int i=0;i<6;i++)
{
    for(int j=0;j<1246;j++)
    {
        out<<c[i][j]<<" ";
    }
    out<<"\n";
}
out.close();





}


