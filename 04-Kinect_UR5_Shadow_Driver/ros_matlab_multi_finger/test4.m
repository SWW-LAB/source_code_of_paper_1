sub_points = rossubscriber('/kinect2/qhd/points','sensor_msgs/PointCloud2');
msg_points= receive(sub_points);
points=readXYZ(msg_points);
disp('get points');
sub_image = rossubscriber('/kinect2/qhd/image_color_rect','sensor_msgs/Image');
msg_image = receive(sub_image);
img = readImage(msg_image);
save data_007.mat msg_points points msg_image img


clear;
clc
rosshutdown;
rosinit('192.168.1.30');
pub_msg = rospublisher('/ros_msg','geometry_msgs/Pose');
msg = rosmessage(pub_msg);
load cnn0;
load cnn1;
load cnn2;
load cnn_deep;
load cnn_multi_finger;
load data_003;