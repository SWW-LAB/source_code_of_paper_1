#include<arm_trajectory/jointsgoalAction.h>
#include<actionlib/client/simple_action_client.h>

typedef actionlib::SimpleActionClient<arm_trajectory::jointsgoalAction> Client;
typedef std::vector<double> Goals;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "jointsgoal_client");
    Client client("jointsgoal", true);
    std::vector<Goals> getfromtopics;//take place of a vector which should be gotten from a topic , just for test

    //intial getfromtopics for test
    //double jointvaule[5] = {2.9608101071072572, 0.3950552761889165, -1.2457828588177644, 3.432167850154922, 0.000154867243486820};
    //Goals joint_vaule(jointvaule,jointvaule+5);
    //getfromtopics.push_back(joint_vaule);

    double jointvaule[5] = {3.002063649100069, 0.007189413957253564, -0.2436776341756923, 0.019778759382459685, 2.91077408911865};
    Goals joint_vaule(jointvaule,jointvaule+5);
    getfromtopics.push_back(joint_vaule);


    double jointvaule2[5] = {3.019342408694813, 1.4766089624305407, -1.3519843984723674, 3.310066090611528, 2.908716567169468};
   //double jointvaule2[5] = {3.0193323394875904, 1.684336707441943, -1.4989166868807622, 3.3082298075816126, 2.908694443277542};
    //double jointvaule2[5] = {3.001378943008902, 0.9000159492173604, -1.0875879607462504, 3.3259731689068164, 2.9088271866291016};
    //double jointvaule2[5] = {3.001389, 1.179094, -0.887107, 3.123097, 2.908893,};
    Goals joint_vaule2(jointvaule2,jointvaule2+5);
    getfromtopics.push_back(joint_vaule2);

    /*double jointvaule[5] = {0.040468143829414674, 0.63593085137858, -3.2954992776891574, 0.3624335975430141, 0.16577432220667832};
    Goals joint_vaule(jointvaule,jointvaule+5);
    getfromtopics.push_back(joint_vaule);

    double jointvaule2[5] = {0.040468143829414674, 0.63593085137858, -3.5724306701030977, 0.44944686449068066, 0.16577432220667832};
    Goals joint_vaule2(jointvaule2,jointvaule2+5);
    getfromtopics.push_back(joint_vaule2);


    double jointvaule4[5] = {0.04, -0.00021145335168392838, 0.0006283185307179586, -0.0021902653007421797, -0.003495574924416812};
    Goals joint_vaule4(jointvaule4,jointvaule4+5);
    getfromtopics.push_back(joint_vaule4);*/


    //wait for server
   if(!client.waitForServer(ros::Duration(30.0)))
   {
        ROS_INFO("the jointsgoals server does not start");
        return 0;
   }
   else
   {
        ROS_INFO("the jointsgoals server succeeds to  start");
   }

   //send goals
    arm_trajectory::jointsgoalGoal goal;
    for(int i=0;i<getfromtopics.size();i++)
    {
        goal.jointsgoal=getfromtopics[i];
        client.sendGoal(goal);
        bool finish_time_out=client.waitForResult(ros::Duration(500.0));
        if(finish_time_out)
        {
            actionlib::SimpleClientGoalState  state = client.getState();
            ROS_INFO("jointsgoalAction Finished : %s", state.toString().c_str());
        }
        else
        {
            ROS_INFO("jointsgoalAction did not finished before time out:%d",i);
        }
     }
    return 0;
}
