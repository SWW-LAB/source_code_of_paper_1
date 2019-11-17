#include <ros/ros.h>
#include<actionlib/server/simple_action_server.h>
#include<dynamixel_msgs/JointState.h>
#include<std_msgs/Float64.h>
#include<gripper_controller/floattypeAction.h>
#include<dynamixel_controllers/SetSpeed.h>
#include<stdlib.h>
#include<iostream>

typedef actionlib::SimpleActionServer<gripper_controller::floattypeAction> Server;
class Gripperserver
{
    public:

        bool is_finish_execute(double position)
        {
            if((std::abs(-position-current_pose_1_)>goal_diff_)||(std::abs(position-current_pose_2_))>goal_diff_)
            {
                count_=0;
                return false;
            }
            count_++;
            if(count_>=goal_success_)
            {
                ROS_INFO("Succeeded to execute");
                return true;
            }
        }

        void executeCB(const gripper_controller::floattypeGoalConstPtr &goal)
        {
            double position=goal->data.data;
            std_msgs::Float64 aux_id_1;
            std_msgs::Float64 aux_id_2;
            aux_id_1.data=0-position;
            aux_id_2.data=position;

            /*ros::ServiceClient pclient =n_.serviceClient<dynamixel_controllers::SetSpeed>("/pan_controller/set_speed");

            ros::ServiceClient tclient =n_.serviceClient<dynamixel_controllers::SetSpeed>("/tilt_controller/set_speed");
            dynamixel_controllers::SetSpeed psrv;
            dynamixel_controllers::SetSpeed tsrv;
            psrv.request.speed=0.05;
            tsrv.request.speed=0.05;
            if(pclient.call(psrv)&&tclient.call(tsrv))
                std::cout <<" ***"<<"succeed to call srv" <<"***"<< std::endl;
            else
                std::cout<< "***"<<"fail to call srv" << "***" << std::endl;*/
            pub_id_1_.publish(aux_id_1);
            pub_id_2_.publish(aux_id_2);

            ros::Rate r(40.0);
            int count = 0;
            /*while(count < 400)
            {
               if(is_finish_execute(position))
                   break;
               r.sleep();
               count ++;
            }*/
            server_.setSucceeded();
            return;
        }

        void tiltstatecallback(const dynamixel_msgs::JointState::ConstPtr &msg)
        {
            current_pose_1_=msg->current_pos;
            return;
        }

        void panstatecallback(const dynamixel_msgs::JointState::ConstPtr &msg)
        {
            current_pose_2_=msg->current_pos;
            return;
        }

        Gripperserver(std::string action_name,const double goal_diff,const int goal_success)
            :server_(n_, action_name, boost::bind(&Gripperserver::executeCB, this, _1), false),
             action_name_(action_name),
             goal_diff_(goal_diff),
             goal_success_(goal_success)
        {
             std::string tilt_controller_command = "/tilt_controller/command";
             std::string pan_controller_command="/pan_controller/command";
             std::string tilt_controller_state="/tilt_controller/state";
             std::string pan_controller_state="/pan_controller/state";
             count_=0;
             current_pose_1_=0;
             current_pose_2_=0;
             pub_id_2_=n_.advertise<std_msgs::Float64>(tilt_controller_command,1000);
             pub_id_1_=n_.advertise<std_msgs::Float64>(pan_controller_command,1000);
             sub_id_2_=n_.subscribe(tilt_controller_state,1000,&Gripperserver::tiltstatecallback, this);
             sub_id_1_=n_.subscribe(pan_controller_state,1000,&Gripperserver::panstatecallback,this);
             ros::ServiceClient pclient =n_.serviceClient<dynamixel_controllers::SetSpeed>("/pan_controller/set_speed");

             ros::ServiceClient tclient =n_.serviceClient<dynamixel_controllers::SetSpeed>("/tilt_controller/set_speed");
             dynamixel_controllers::SetSpeed psrv;
             dynamixel_controllers::SetSpeed tsrv;
             psrv.request.speed=0.3;
             tsrv.request.speed=0.3;
             if(pclient.call(psrv))
                 std::cout <<" ***"<<"succeed to call psrv" <<"***"<< std::endl;
             else
                 std::cout<< "***"<<"fail to call psrv" << "***" << std::endl;
             if(tclient.call(tsrv))
                 std::cout <<" ***"<<"succeed to call tsrv" <<"***"<< std::endl;
             else
                 std::cout<< "***"<<"fail to call tsrv" << "***" << std::endl;
             server_.start();
        }

    private:
        ros::NodeHandle n_;
        ros::Publisher pub_id_1_;
        ros::Publisher pub_id_2_;
        ros::Subscriber sub_id_1_;
        ros::Subscriber sub_id_2_;
        Server server_;
        std::string action_name_;
        double goal_diff_;
        int goal_success_;
        double current_pose_1_;
        double current_pose_2_;
        int count_;
};

int main(int argc,char** argv)
{
    ros::init(argc,argv,"execute_server");
    std::string action_name="gripper_jointvalue";
    double goal_diff =0.01;
    int goal_success=1;
    Gripperserver server(action_name,goal_diff,goal_success);
    ros::spin();
    return 0;
}
