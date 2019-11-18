clear
clc
pub_msg = rospublisher('/ros_msg','geometry_msgs/Pose');
msg = rosmessage(pub_msg);
sub_points = rossubscriber('/realsense_f200/depth/points','sensor_msgs/PointCloud2');
msg_points= receive(sub_points);
points=readXYZ(msg_points);
deepdata = Get_Deep_Img(msg_points);
deep_img = Match_Deep_Image(deepdata);
figure;
imshow(deep_img,[]);

disp('get points');
sub_image = rossubscriber('/realsense_f200/rgb/image_rect_color','sensor_msgs/Image');
msg_image = receive(sub_image);
img = readImage(msg_image);
disp('get img');

figure;
imshow(img);

save deep_data_001.mat deep_img
imwrite(img,'image_data_001.png');
