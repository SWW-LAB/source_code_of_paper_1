#include<ros/ros.h>
#include<dynamixel_controllers/SetSpeed.h>

int main(int argc,char** argv)
{
    ros::init(argc,argv,"speed_controller");
    ros::NodeHandle n;
    ros::ServiceClient pclient =n.serviceClient<dynamixel_controllers::SetSpeed>("/pan_controller/set_speed");

    ros::ServiceClient tclient =n.serviceClient<dynamixel_controllers::SetSpeed>("/tilt_controller/set_speed");
    dynamixel_controllers::SetSpeed psrv;
    dynamixel_controllers::SetSpeed tsrv;
    psrv.request.speed=0.9;
    tsrv.request.speed=0.9;
    if(pclient.call(psrv))
        std::cout <<" ***"<<"succeed to call psrv" <<"***"<< std::endl;
    else
        std::cout<< "***"<<"fail to call psrv" << "***" << std::endl;
    if(tclient.call(tsrv))
        std::cout <<" ***"<<"succeed to call tsrv" <<"***"<< std::endl;
    else
        std::cout<< "***"<<"fail to call tsrv" << "***" << std::endl;

    ros::spin();
    return 0;
}
