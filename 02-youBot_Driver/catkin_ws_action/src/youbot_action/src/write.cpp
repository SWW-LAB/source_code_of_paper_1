#include<iostream>
#include <fstream>
#include <ros/ros.h>
#include <string>


#include <sensor_msgs/JointState.h>

using namespace std;


void WriteCallback(const sensor_msgs::JointState::ConstPtr &msg)
{
          std::vector<std::string> joint_name;
           std::vector<double> joint_value;
           joint_name.push_back("arm_joint_1");
           joint_name.push_back("arm_joint_2");
           joint_name.push_back("arm_joint_3");
           joint_name.push_back("arm_joint_4");
           joint_name.push_back("arm_joint_5");

          for(int i=0;i<5;i++)
          {
              joint_value.push_back(0.0);
          }
      if(msg->name[0]=="arm_joint_1")
      {
          for(int i=0;i<joint_name.size();i++)
        {
             for(int k=0;k<msg->name.size();k++)
          {
             if(joint_name[i]==msg->name[k])
                 joint_value[i]=msg->position[k];
         }
       }
      std::ofstream out;
      out.open("/home/zc/catkin_ws_action/conf.txt",ios::app);
      for(int i=0;i<joint_value.size();i++)
      {
          out<<joint_value[i]<<" ";
      }
      out<<" "<<std::endl;
     out.close();

      std::cout<<"yes"<<std::endl;

      ros::shutdown();
      }
      else
          return;
}


int main(int argc,char **argv)
{
    ros::init(argc,argv,"write_joint_value");
    ros::NodeHandle n;

    ros::Subscriber sub=n.subscribe("joint_states",1000,WriteCallback);

    ros::spin();


}
