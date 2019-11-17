#include <ros/ros.h>
#include <string.h>

#include <actionlib/client/simple_action_client.h>
#include <ik/ikAction.h>
#include <geometry_msgs/Pose.h>


using namespace std;

typedef actionlib::SimpleActionClient<ik::ikAction> Client;


int main(int argc,char **argv)
{
    ros::init(argc,argv,"ik_client");
    ros::NodeHandle n;

   Client ik_client("youbot_ik",true);
   ik_client.waitForServer();

   geometry_msgs::Pose tf;
   tf.position.x=0.24056;//0.315714;//0.33445;//0.32774;//0.306907;//0.3075;//0.291829;//0.236127;//0.485805;//0.3092;
   tf.position.y=-0.0942323;//-0.0106974;//0.0403334;//-0.036842;//0.0476939;//-0.0555437;//-0.0283366;//-0.0268962;//-0.00309964;//0.01536;
   tf.position.z=0.0395986;//0.044775;//0.0144775;//0.0196299;//0.0057158;//0.0603816;//0.00760306;//0.0416987;//0.0497992;//0.158527;//0.0031;
   tf.orientation.x=0;//-0.00258904;//0.00557639;//-0.0227564;//-0.0276205;//0.00646734;//0.0605274;//0.997249;//-0.0248331;//0.0121;
   tf.orientation.y=1;//0.0907523;//0.087495;//0.00162876;//0.94906;//0.0951041;//0.998112;//0.0467639;//0.999687;//-0.0523;
   tf.orientation.z=0;//0.00206682;//-0.000272122 ;//0.00322423;//0.0431536;//0.00236107;//-0.000467502;//0.0566458;//-0.000124637;//-0.00092;
   tf.orientation.w=0;//0.704197;//0.704394;//0.706919;//0.31903;//0.7039 ;//0.010419;//0.00989743;//0.00308141;//0.9984;


   ik::ikGoal goal;

    goal.pose=tf;

   ik_client.sendGoal(goal);

   ik_client.waitForResult(ros::Duration(5.0));

   if(ik_client.getState()==actionlib::SimpleClientGoalState::SUCCEEDED)
    {
        ROS_INFO("SUCCESSED,LALALALA");
    }

   ik::ikResult p=*(ik_client.getResult());

  // ROS_INFO("have %d joints",p.jointresult.size());
   std::cout<<"have "<<p.jointresult.size()<<" joints"<<std::endl;
   for(int i=0;i<p.jointresult.size();i++)
   {
       std::cout<<p.jointresult[i]<<std::endl;
   }
   std::cout<<"ok ok ok ok ok ok ok ok ok "<<std::endl;

}
