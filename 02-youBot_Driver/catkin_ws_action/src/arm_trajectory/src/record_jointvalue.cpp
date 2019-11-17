#include <ros/ros.h>
#include<sensor_msgs/JointState.h>
#include<vector>
#include<iostream>
#include<fstream>

void recordcallback(const sensor_msgs::JointState::ConstPtr &msg)
{
         std::string document="/home/worker/catkin_ws_action/src/joint_value.doc";
         std::ofstream ofc(document.c_str(),std::ofstream::out |std::ofstream::app);
         std::string tab="arm_joint_1";
         std::vector<std::string> joint_name;
         joint_name.push_back("arm_joint_1");
         joint_name.push_back("arm_joint_2");
         joint_name.push_back("arm_joint_3");
         joint_name.push_back("arm_joint_4");
         joint_name.push_back("arm_joint_5");
         if(msg->name[0]==tab)
         {
             for(int i=0;i<joint_name.size();i++)
             {
                 for(int j=0;j<msg->position.size();j++)
                 {
                     if(joint_name[i]==msg->name[j])
                     {
                         ofc << msg->name[j];
                         ofc << ":" << " ";
                         ofc << msg->position[j];
                         ofc << " ";
                     }
                 }
                 ofc << std::endl;
             }
             ofc << std::endl;
             ros::shutdown();
         }
         else
             return;
}

int main(int argv ,char **argc)
{
    ros::init(argv,argc,"record_jointvalue");
    ros::NodeHandle n;
    ros::Subscriber sub =n.subscribe("/joint_states",1,recordcallback);
    ros::spin();
    return 0;
}
