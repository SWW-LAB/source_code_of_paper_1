#include<ros/ros.h>
#include<actionlib/client/simple_action_client.h>
#include<actionlib/server/simple_action_server.h>
#include<gripper_controller/floattypeAction.h>

typedef  actionlib::SimpleActionClient<gripper_controller::floattypeAction> Client;

int main(int argc, char** argv)
{
     ros::init(argc,argv,"gripper_controller_client");
     Client client("gripper_position_action",true);

    const double d = 0.01;

    if(!client.waitForServer(ros::Duration(30.0)))
    {
         ROS_INFO("the gripper_controller server does not start");
         return 0;
    }
    else
         ROS_INFO("the gripper_controller server succeeds to  start");

    gripper_controller::floattypeGoal goal;
    goal.data.data=d;

    client.sendGoal(goal);
   /* bool finish_time_out=client.waitForResult(ros::Duration(500.0));
    if(finish_time_out)
    {
        actionlib::SimpleClientGoalState  state = client.getState();
        ROS_INFO("gripper_position Action Finished : %s", state.toString().c_str());
    }
    else
        ROS_INFO("gripper_position Action did not finished before time out");*/
    goal.data.data=0.03;
    client.sendGoal(goal);

     return 0;
}
