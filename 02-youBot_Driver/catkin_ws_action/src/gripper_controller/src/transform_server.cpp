#include<ros/ros.h>
#include<math.h>
#include<actionlib/server/simple_action_server.h>
#include<actionlib/client/simple_action_client.h>
#include<gripper_controller/floattypeAction.h>

typedef actionlib::SimpleActionClient<gripper_controller::floattypeAction> FClient;
typedef actionlib::SimpleActionServer<gripper_controller::floattypeAction> Server;

void execute(const gripper_controller::floattypeGoalConstPtr goal, Server* as)
{
    const double s1=0.01475;
    const double s3=0.008;
    const double h=0.047;
    const double l1=0.05518;
    const double l2=0.04148;
    const double pi=3.1415926;
    double theta=0;
    double distance=0;
    double d=0;

    double L=0;
    double fai=0;
    double yeta=0;
    FClient fclient("gripper_jointvalue",true);

    if((goal->data.data<0)||(goal->data.data>0.35))
    {
        ROS_INFO("gripper_position beyond the limits");
        return;
    }
    distance=goal->data.data;
    d=distance+s3-s1;
    L=sqrt(h*h+d*d);
    yeta=asin(d/L);
    fai=acos((l1*l1+L*L-l2*l2)/(2*l1*L));
    theta=pi/2-fai-yeta;

    if(!fclient.waitForServer(ros::Duration(30.0)))
    {
         ROS_INFO("the gripper_jointvalue server does not start");
         return;
    }
    else
         ROS_INFO("the gripper_jointvalue server succeeds to  start");

    gripper_controller::floattypeGoal fgoal;
    fgoal.data.data=theta;
    fclient.sendGoal(fgoal);
    bool finish_time_out=fclient.waitForResult(ros::Duration(500.0));
    if(finish_time_out)
    {
        actionlib::SimpleClientGoalState  state = fclient.getState();
        ROS_INFO("gripper_jointvalue Action Finished : %s", state.toString().c_str());
    }
    else
        ROS_INFO("gripper_jointvalue Action did not finished before time out");

    as->setSucceeded();

    return;
}

int main(int argc,char** argv)
{
    ros::init(argc,argv,"transform_server");
    ros::NodeHandle n;
    Server server(n, "gripper_position_action", boost::bind(&execute,  _1,&server ), false);
    server.start();
    ros::spin();
    return 0;
}
