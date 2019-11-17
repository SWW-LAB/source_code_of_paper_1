clear;
clc
load cnn0;
load cnn1;
load cnn2;
load cnn_deep;
% img = imread('image_data_007.png');
% load('deep_0_1_Normalize_007.mat')

pub_msg = rospublisher('/ros_msg','geometry_msgs/Pose');
msg = rosmessage(pub_msg);
sub_points = rossubscriber('/realsense_f200/depth/points','sensor_msgs/PointCloud2');
msg_points= receive(sub_points);
points=readXYZ(msg_points);
deepdata = Get_Deep_Img(msg_points);
deep_img = Match_Deep_Image(deepdata);
deep_data_image = Deal_Deep_Img(deep_img);
deep_0_1 = Normalize(deep_data_image);%归一化
disp('get points');

sub_image = rossubscriber('/realsense_f200/rgb/image_rect_color','sensor_msgs/Image');
msg_image = receive(sub_image);
img = readImage(msg_image);
disp('get img');

figure;
imshow(img);
