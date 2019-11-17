//for action
#include<actionlib/server/simple_action_server.h>
#include<arm_trajectory/jointsgoalAction.h>
//for ros
#include<ros/ros.h>
#include<string>
#include<stdlib.h>
#include<std_msgs/String.h>
//for topics
#include<brics_actuator/JointPositions.h>
#include<sensor_msgs/JointState.h>


typedef actionlib::SimpleActionServer<arm_trajectory::jointsgoalAction> Server;

class Positionserver
{
public:


    void initial_joint_name()
    {
        joint_name_.push_back("arm_joint_1");
        joint_name_.push_back("arm_joint_2");
        joint_name_.push_back("arm_joint_3");
        joint_name_.push_back("arm_joint_4");
        joint_name_.push_back("arm_joint_5");
        return;
    }

    void initial_joint_positions()
    {
        for(int i=0;i<5;i++)
        {
            joint_positions_.push_back(0.0);
        }
        return;
    }

    void positioncallback(const sensor_msgs::JointState::ConstPtr &msg)
    {
        for(int i=0;i<joint_name_.size();i++)
        {
            for(int k=0;k<msg->name.size();k++)
            {
                if(joint_name_[i]==msg->name[k])
                    joint_positions_[i]=msg->position[k];
            }
        }
        return;
    }

    bool is_finish_trajectory(const arm_trajectory::jointsgoalGoalConstPtr goal)
    {
        for(int i=0;i<joint_positions_.size();i++)
        {
            if(std::abs(goal->jointsgoal[i]-joint_positions_[i])>goal_difs_)
            {
                count_=0;
                return false;
            }
        }
        count_++;
        if(count_>=goal_success_)
        {
            count_=0;
            return true;
        }
        else
            return false;
    }

    void execute(const arm_trajectory::jointsgoalGoalConstPtr goal)
    {
        brics_actuator::JointPositions jointpositions;
        for(int i=0;i<joint_name_.size();i++)
        {
            brics_actuator::JointValue jointvaule;
            jointvaule.unit="rad";
            jointvaule.joint_uri=joint_name_[i];
            jointvaule.value=goal->jointsgoal[i];
            jointpositions.positions.push_back(jointvaule);
        }
        pub_.publish(jointpositions);
        ros::Rate r(40.0);
        int count = 0;
        while(count < 800)
        {
            if(Positionserver::is_finish_trajectory(goal))
                break;
            r.sleep();
            count ++;
        }
        server_.setSucceeded();
        return;
    }

//    void create_a_sub()
//    {
//        std::string joint_states = "/joint_states";
//        //sub_=n_.subscribe(joint_states,1000,boost::bind(&Positionserver::positioncallback, this, _1));
//        sub_=n_.subscribe(joint_states,1000, &Positionserver::positioncallback, this);
//    }


    Positionserver(std::string name,double goal_difs,int goal_success):
        server_(n_, name,boost::bind(&Positionserver::execute, this, _1),false),
        action_name_(name),
        goal_difs_(goal_difs),
        goal_success_(goal_success)
    {
        count_=0;
        std::string joint_states = "/joint_states";
        std::string position_command= "/arm_1/arm_controller/position_command";
        initial_joint_positions();
        initial_joint_name();//initial joint_name_
        //create_a_sub();
        sub_=n_.subscribe(joint_states,1000,&Positionserver::positioncallback, this);
        pub_=n_.advertise<brics_actuator::JointPositions>(position_command,1000);
        server_.start();
    }

private:
    ros::NodeHandle n_;
    Server server_;
    std::string action_name_;
    ros::Publisher pub_;
    ros::Subscriber sub_;
    std::vector<double> joint_positions_;
    std::vector<std::string> joint_name_;
    double goal_difs_;
    int goal_success_;
    int count_;
};


int main(int argc,char **argv)
{
    ros::init(argc,argv,"armjoints_trajectory_server");
    std::string name ="position_command_action";
    double goal_difs = 0.01;
    int goal_success = 5;
    Positionserver positionserver(name,goal_difs,goal_success);
    ros::spin();

    return 0;
}
