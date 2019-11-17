#include <ros/ros.h>
#include<iostream>
#include<string.h>
#include<math.h>

#include<actionlib/client/simple_action_client.h>
#include<geometry_msgs/Pose.h>
#include<ar_track_alvar_msgs/AlvarMarkers.h>

#include<moveit/move_group_interface/move_group.h>
#include<control_msgs/FollowJointTrajectoryGoal.h>
#include<brics_actuator/JointPositions.h>
#include<gripper_controller/floattypeAction.h>
#include <ik/ikAction.h>
#include<arm_trajectory/jointsgoalAction.h>
#include<actionlib/client/simple_action_client.h>

using namespace std;

#define GRASP 1
#define RELEASE 2

typedef actionlib::SimpleActionClient<gripper_controller::floattypeAction> Client;
//typedef actionlib::SimpleActionClient<gripper_controller::floattypeAction>  send_gripper_action;
typedef  actionlib::SimpleActionClient<brics_actuator::JointPositions> move;
typedef actionlib::SimpleActionClient<ik::ikAction> ik_Client;

typedef actionlib::SimpleActionClient<arm_trajectory::jointsgoalAction> A_Client;
typedef std::vector<double> Goals;

double matrix_realsense2base[4][4]={{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};
double matrix_target2realsense[4][4]={{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};
//double matrix_eef2base[4][4]={{-0.993635,0.0487677,0.101541,0.212775},{0.0486653,0.998807,-0.00348721,-0.00648306 },
   //{-0.10159,0.00147652,-0.994825,0.122564 },{0,0,0,1}};
double matrix_eef2base[4][4]={{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};//{{-1,0,0,0.212775},{0,1,0,-0.00648306 },{0,0,-1,0.122564 },{0,0,0,1}};
double matrix_realsense2eef[4][4]={{-0.0153003,0.992447,-0.121712,-0.0751644 },{-0.999705,-0.0174802,-0.0168622,0.00216888},
                                   {-0.0188624,0.121419,0.992422,0.0146703},{0,0,0,1}};
bool got_joint_states,shutdown;
//geometry_msgs::Pose object_pose;
std::vector<double> conf;
//坐标转换部分
double* convertMatrixToQuaternions(double *sz,double (* m)[4])
{

    double a=0,b=0,c=0,d=0;
    a=sqrt(*(*(m+0)+0)+*(*(m+1)+1)+*(*(m+2)+2)+1)/2.0;
    if(a>0.0001)
    {
        b=(*(*(m+2)+1)-*(*(m+1)+2))/(4*a);
        c=(*(*(m+0)+2)-*(*(m+2)+0))/(4*a);
        d=(*(*(m+1)+0)-*(*(m+0)+1))/(4*a);
    }
    else
    {
        double w1,w2;
        w1=sqrt(pow((*(*(m+0)+1))*(*(*(m+0)+2)),2)+pow((*(*(m+0)+1))*(*(*(m+1)+2)),2)
               +pow((*(*(m+0)+2))*(*(*(m+1)+2)),2));
        w2=(*(*(m+0)+1))*(*(*(m+0)+2));
        if(w1<0.0001)
        {
            a=0;
            b=0;
            c=1;
            d=0;
        }
        else
        {
            b=(*(*(m+0)+1))*(*(*(m+0)+2))/w1;
            c=(*(*(m+0)+1))*(*(*(m+1)+2))/w1;
            d=(*(*(m+0)+2))*(*(*(m+1)+2))/w1;
        }

    }
    sz[0]=*(*(m+0)+3);
    sz[1]=*(*(m+1)+3);
    sz[2]=*(*(m+2)+3);


    sz[3]=b;
    sz[4]=c;
    sz[5]=d;
    sz[6]=a;

    return sz;
}
void convertQuaternionsToMatrix(double x1,double y1,double z1,double x,double y,double z,double w)
{
    double a,b,c,d;
    a   =   w;
    b   =   x;
    c   =   y;
    d   =   z;

    matrix_realsense2base[0][0] =   2*(a*a+b*b)-1;
    matrix_realsense2base[0][1] =   2*(b*c-a*d);
    matrix_realsense2base[0][2] =   2*(b*d+a*c);
    matrix_realsense2base[0][3] = x1;
    matrix_realsense2base[1][0] =   2*(b*c+a*d);
    matrix_realsense2base[1][1] =   2*(a*a+c*c)-1;
    matrix_realsense2base[1][2] =   2*(c*d-a*b);
    matrix_realsense2base[1][3] = y1;
    matrix_realsense2base[2][0] =   2*(b*d-a*c);
    matrix_realsense2base[2][1] =   2*(c*d+a*b);
    matrix_realsense2base[2][2] =   2*(a*a+d*d)-1;
    matrix_realsense2base[2][3] = z1;

}

void convertQuaternionsToMatrix_1(double x1,double y1,double z1,double x,double y,double z,double w)
{
    double a,b,c,d;
    a   =   w;
    b   =   x;
    c   =   y;
    d   =   z;

    matrix_target2realsense[0][0] =   2*(a*a+b*b)-1;
    matrix_target2realsense[0][1] =   2*(b*c-a*d);
    matrix_target2realsense[0][2] =   2*(b*d+a*c);
    matrix_target2realsense[0][3] = x1;
    matrix_target2realsense[1][0] =   2*(b*c+a*d);
    matrix_target2realsense[1][1] =   2*(a*a+c*c)-1;
    matrix_target2realsense[1][2] =   2*(c*d-a*b);
    matrix_target2realsense[1][3] = y1;
    matrix_target2realsense[2][0] =   2*(b*d-a*c);
    matrix_target2realsense[2][1] =   2*(c*d+a*b);
    matrix_target2realsense[2][2] =   2*(a*a+d*d)-1;
    matrix_target2realsense[2][3] = z1;

}
void convertQuaternionsToMatrix_2(geometry_msgs::Pose target)
{
    double a,b,c,d;
    a   =   target.orientation.w;
    b   =   target.orientation.x;
    c   =   target.orientation.y;
    d   =   target.orientation.z;

    matrix_eef2base[0][0] =   2*(a*a+b*b)-1;
    matrix_eef2base[0][1] =   2*(b*c-a*d);
    matrix_eef2base[0][2] =   2*(b*d+a*c);
    matrix_eef2base[0][3] = target.position.x;
    matrix_eef2base[1][0] =   2*(b*c+a*d);
    matrix_eef2base[1][1] =   2*(a*a+c*c)-1;
    matrix_eef2base[1][2] =   2*(c*d-a*b);
    matrix_eef2base[1][3] = target.position.y;
    matrix_eef2base[2][0] =   2*(b*d-a*c);
    matrix_eef2base[2][1] =   2*(c*d+a*b);
    matrix_eef2base[2][2] =   2*(a*a+d*d)-1;
    matrix_eef2base[2][3] = target.position.z;

}

void MultiplyWithOutAMP(double (&cMatrix)[4][4],double ( *aMatrix )[4],double ( *bMatrix )[4])
{

    for (int row = 0; row < 4; row++)
    {
        for (int col = 0; col < 4; col++)
        {
            // Multiply the row of A by the column of B to get the row, column of product.
            for (int inner = 0; inner < 4; inner++)
            {
                *(*(cMatrix+row)+col) += (*(*(aMatrix+row)+inner)) * (*(*(bMatrix+inner)+col));
//				std::cout<<*(*(aMatrix+row)+inner)<<"*"<<*(*(bMatrix+inner)+col)<<"  ";
            }
            std::cout <<*(*(cMatrix+row)+col) << "  ";

        }
        std::cout << "\n";
    }

}

void target2basecordinate(double (&matrix_target2base)[4][4],geometry_msgs::Pose target,double (* m)[4])
    {

            double x1,y1,z1,x,y,z,w;

            //double matrix_realsense2base[4][4]={0};
            x1=target.position.x;
            y1=target.position.y;
            z1=target.position.z;
            x=target.orientation.x;
            y=target.orientation.y;
            z=target.orientation.z;
            w=target.orientation.w;
            for(int i=0;i<4;i++)
            {
                for(int j=0;j<4;j++)
                {
                    *(*(matrix_realsense2base+i)+j)=*(*(m+i)+j);
                }
                std::cout<<std::endl;
            }

            convertQuaternionsToMatrix_1(x1,y1,z1,x,y,z,w);

            std::cout<<matrix_target2realsense[0][3]<<" "<<matrix_target2realsense[1][3]<<" "<<matrix_target2realsense[2][3]<<std::endl;


            //MultiplyWithOutAMP(matrix_realsense2base,matrix_eef2base,matrix_realsense2eef);
            MultiplyWithOutAMP(matrix_target2base,matrix_realsense2base,matrix_target2realsense);


            std::cout<<"target2base:"<<std::endl;
            std::cout<<**matrix_target2base<< "  "<<*(*(matrix_target2base+0)+1)<<"  "<<*(*(matrix_target2base+0)+2)<<"  "<<*(*(matrix_target2base+0)+3)<< std::endl;
            std::cout<<*(*(matrix_target2base+0)+4)<<"  "<<*(*(matrix_target2base+1)+1)<<"  "<<*(*(matrix_target2base+1)+2)<<"  "<<*(*(matrix_target2base+1)+3)<< std::endl;
            std::cout<<*(*(matrix_target2base+2)+0)<<"  "<<*(*(matrix_target2base+2)+1)<<"  "<<*(*(matrix_target2base+2)+2)<<"  "<<*(*(matrix_target2base+2)+3)<< std::endl;
            std::cout<<*(*(matrix_target2base+3)+0)<<"  "<<*(*(matrix_target2base+3)+1)<<"  "<<*(*(matrix_target2base+3)+2)<<"  "<<*(*(matrix_target2base+3)+3)<< std::endl;
    }

bool send_gripper_action(int goal_type)
{
    ros::spinOnce();
    Client gripper("gripper_position_action",true);
    gripper.waitForServer();
    gripper_controller::floattypeGoal goal;


    if(!gripper.waitForServer(ros::Duration(20.0)))
    {
        ROS_INFO("Fail to start the server......");
    }
    else
    {
        ROS_INFO("Succeed to start the server......");
    }

    switch(goal_type)
    {
        case GRASP:
            goal.data.data=0.017;
            break;

        case RELEASE:
            goal.data.data=0.03;
    }

    std::cout<<goal.data.data<<std::endl;
    std::cout<<GRASP<<endl;
    std::cout<<RELEASE<<endl;

    gripper.sendGoal(goal);

    bool finish_before_timeout=gripper.waitForResult(ros::Duration(50.0));

    if(finish_before_timeout)
    {
        actionlib::SimpleClientGoalState state=gripper.getState();
        bool success=(state==actionlib::SimpleClientGoalState::SUCCEEDED);
        if(success)
        {
                ROS_INFO("gripper action finish,%s",state.toString().c_str());
        }
        else
        {
            ROS_INFO("gripper action failed,%s",state.toString().c_str());
        }
    }

    else
       {
         gripper.cancelGoal();
         ROS_INFO("gripper do not finish before timeout");
       }
}

class Youbot_CBT
{
public:

    Youbot_CBT()
    {
        std::cout<<"Start"<<std::endl;
        ros::NodeHandle n;
        sub=n.subscribe("/ar_pose_marker",1000,&Youbot_CBT::imagecallback,this);
        pub=n.advertise<brics_actuator::JointPositions>("/arm_1/arm_controller/position_command",1000);
       // ik_Client ik_client("youbot_ik",true);
       // ik_client.waitForServer();
    }

	//需要改变的函数
     void imagecallback(const ar_track_alvar_msgs::AlvarMarkers::ConstPtr& im_js)
        {

            if(im_js->markers.size()>0)
            {
                got_joint_states=true;
                object_pose=im_js->markers[0].pose.pose;

            }

            else
            {
                got_joint_states=false;


            }
           std::cout<<object_pose.position.x<<" "<<object_pose.position.y<<" "<<object_pose.position.z<<std::endl;

        }


     bool got_joint_states;
     geometry_msgs::Pose object_pose;

     std::vector<double>confirguation;
     double b[5];

    ros::Publisher pub;
    ros::Subscriber sub;
};



int main(int argc,char **argv)
    {
        //定义各种变量
          geometry_msgs::Pose targetpose_last,pose_last;
          ros::Time t_last,t_current;
          ros::Duration t_delta;
        //初始化
          ros::init(argc, argv, "dynamical_object_manipulation");
          Youbot_CBT cbt;

           cbt.got_joint_states=false;
           ros::Rate r(50.0);
           bool shutdown=true;

           A_Client client("jointsgoal", true);
           client.waitForServer();
           std::vector<Goals> getfromtopics;
           double jointvaule[5] = {3.002063649100069, 0.007189413957253564, -0.2436776341756923, 0.019778759382459685, 2.91077408911865};
           Goals joint_vaule(jointvaule,jointvaule+5);
           getfromtopics.push_back(joint_vaule);

           double jointvaule2[5] = {3.019342408694813, 1.4766089624305407, -1.3519843984723674, 3.310066090611528, 2.908716567169468};
           Goals joint_vaule2(jointvaule2,jointvaule2+5);
           getfromtopics.push_back(joint_vaule2);
           arm_trajectory::jointsgoalGoal arm_goal;

           for(int i=0;i<getfromtopics.size();i++)
           {
               arm_goal.jointsgoal=getfromtopics[i];

               client.sendGoal(arm_goal);
                std::cout<<"LALALALALALALALA LALALALLALALA"<<std::endl;
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

    while(ros::ok() && shutdown)
        {
              r.sleep();
              ros::spinOnce();
              if(cbt.got_joint_states==true)
                  {
                          double target2base_last[4][4]={0};
                          double sz[7]={0};

                          pose_last=cbt.object_pose;//此处是建立在视觉返回的数据就是在基坐标系下的四元数，如果不是，还需要转换

                        //将物体在摄像头坐标系的位姿转化为在机器人坐标系的位姿
                          convertQuaternionsToMatrix(0.332368,-0.0150726,0.127547,-0.685128,0.721266,-0.0803073,0.0632225);  //将四元数转换为旋转矩阵
                          std::cout<<matrix_realsense2base[0][3]<<" "<<matrix_realsense2base[1][3]<<" "<<matrix_realsense2base[2][3]<<std::endl;//输出X1，Y1,Z1,在这里是0.332368,-0.0150726,0.127547
                          target2basecordinate(target2base_last,pose_last,matrix_realsense2base);//target2base_last：目标，pose_last：相机到物体的旋转矩阵，matrix_realsense2base：基坐标系到物体的旋转矩阵
                          double* s=convertMatrixToQuaternions(sz,target2base_last);
                          targetpose_last.position.x=s[0];
                          targetpose_last.position.y=s[1];
                          targetpose_last.position.z=s[2];
                          targetpose_last.orientation.x=s[3];
                          targetpose_last.orientation.y=s[4];
                          targetpose_last.orientation.z=s[5];
                          targetpose_last.orientation.w=s[6];
                          std::cout<<"tagetpose_last"<<targetpose_last.position<<std::endl;

                          ros::Time::init();
                          t_last=ros::Time::now();
                          std::cout<<"t_last: "<<t_last<<std::endl;

                          shutdown=false;

              }

         }


          //进行反解
        ik_Client ik_client("youbot_ik",true);
        ik_client.waitForServer();
        geometry_msgs::Pose tf;
        tf.position.x= targetpose_last.position.x-0.1;//0.32774;//0.306907;//0.3075;//0.291829;//0.236127;//0.485805;//0.3092;
        tf.position.y= targetpose_last.position.y+0.001;//0.0403334;//-0.036842;//0.0476939;//-0.0555437;//-0.0283366;//-0.0268962;//-0.00309964;//0.01536;
        tf.position.z= targetpose_last.position.z+0.095;//0.0196299;//0.0057158;//0.0603816;//0.00760306;//0.0416987;//0.0497992;//0.158527;//0.0031;
        tf.orientation.x=0;//-0.00258904;//0.00557639;//-0.0227564;//-0.0276205;//0.00646734;//0.0605274;//0.997249;//-0.0248331;//0.0121;
        tf.orientation.y=1;//0.0907523;//0.087495;//0.00162876;//0.94906;//0.0951041;//0.998112;//0.0467639;//0.999687;//-0.0523;
        tf.orientation.z=0;//0.00206682;//-0.000272122 ;//0.00322423;//0.0431536;//0.00236107;//-0.000467502;//0.0566458;//-0.000124637;//-0.00092;
        tf.orientation.w=0;//0.704197;//0.704394;//0.706919;//0.31903;//0.7039 ;//0.010419;//0.00989743;//0.00308141;//0.9984;

        std::cout<<tf.position.x<<" haha "<<tf.position.y<<" haha "<<tf.position.z<<" haha "<<std::endl;
        ik::ikGoal goal;
         goal.pose=tf;

        ik_client.sendGoal(goal);

        ik_client.waitForResult(ros::Duration(5.0));

        if(ik_client.getState()==actionlib::SimpleClientGoalState::SUCCEEDED)
             {
                ROS_INFO("SUCCESSED,LALALALA");
             }

          ik::ikResult p=*(ik_client.getResult());

           std::cout<<"have "<<p.jointresult.size()<<" joints"<<std::endl;

          for(int i=0;i<p.jointresult.size();i++)
                {
                    cbt.b[i]=p.jointresult[i];
                    std::cout<<p.jointresult[i]<<std::endl;
                 }
           std::cout<<" ok ok ok ok"<<std::endl;


     //发给position_command执行
             brics_actuator::JointPositions move_pose;
             brics_actuator::JointValue move_pose_value;

             std::vector<std::string> joint_name;
             std::vector<double> joint_value;
             std::cout<<" l ll lll ll ll"<<std::endl;
              joint_name.push_back("arm_joint_1");
              joint_name.push_back("arm_joint_2");
              joint_name.push_back("arm_joint_3");
              joint_name.push_back("arm_joint_4");
              joint_name.push_back("arm_joint_5");

             //joint from joint value to brics_actuator::JointPositions;
             for(int i=0;i<5;i++)
                {
                     move_pose_value.joint_uri=joint_name[i];
                     move_pose_value.unit="rad";
                     move_pose_value.value=cbt.b[i];
                     move_pose.positions.push_back(move_pose_value);
                     std::cout<<move_pose.positions[i]<<std::endl;
                }

             std::cout<<" pub pub pub"<<std::endl;

             cbt.pub.publish(move_pose);

             shutdown=true;

            while(ros::ok() && shutdown)
                     {
                           r.sleep();
                           ros::spinOnce();
                           t_current=ros::Time::now();
                           if(cbt.got_joint_states==true&&(t_current-t_last>=ros::Duration(1.8)))
                           {

                                   if((cbt.object_pose.position.z>0&&cbt.object_pose.position.z<0.13)&&(cbt.object_pose.position.y>-0.03&&cbt.object_pose.position.y<0.03))//具体高度需要修改
                                   {




                                       t_current=ros::Time::now();
                                      //发送给爪子执行抓取
                                       Client gripper("gripper_position_action",true);
                                       gripper.waitForServer();
                                       gripper_controller::floattypeGoal goal;
                                       goal.data.data=0.0175; //抓取的单向宽度,总宽度为2*goal.data.data
                                       gripper.sendGoal(goal);


                                       std::cout<<"Got it!!!!!!"<<std::endl;


                                       ros::Rate r(40.0);
                                       int count = 0;
                                       while(count <120)
                                       {
                                           r.sleep();
                                           count ++;
                                       }

                                       //将抓取完成后的将物体提升起来
                                       brics_actuator::JointPositions move_pose1;
                                       brics_actuator::JointValue move_pose_value1;

                                       std::vector<std::string> joint_name1;
                                       std::vector<double> joint_value1;
                                       std::cout<<" l ll lll ll ll"<<std::endl;
                                        joint_name1.push_back("arm_joint_1");
                                        joint_name1.push_back("arm_joint_2");
                                        joint_name1.push_back("arm_joint_3");
                                        joint_name1.push_back("arm_joint_4");
                                        joint_name1.push_back("arm_joint_5");
                                       double c[5]={3.03593646219839, 1.3875871013716072, -1.649446098877517, 3.3259067972310365, 3.0123891247379313};
                                       for(int i=0;i<5;i++)
                                          {
                                               move_pose_value1.joint_uri=joint_name[i];
                                               move_pose_value1.unit="rad";
                                               move_pose_value1.value=c[i];
                                               move_pose1.positions.push_back(move_pose_value1);
                                               std::cout<<move_pose1.positions[i]<<std::endl;
                                          }

                                       std::cout<<" pub2 pub2 pub2"<<std::endl;

                                       cbt.pub.publish(move_pose1);


                                       break;



                                   }




    std::cout<<"Yes, It's right"<<std::endl;
    return 0;

        }
            }
}
