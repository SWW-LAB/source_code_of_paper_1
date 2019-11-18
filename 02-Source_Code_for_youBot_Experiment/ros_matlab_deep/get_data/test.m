% clear
% clc
% load data2.mat
% ab = Match_Deep_Image(deepdata);
% 
% %subplot(2,1,1)
% figure
% imshow(ab,[]);
% %subplot(2,1,2)
% figure
% imshow(img);
% subplot(3,1,3)
% imshow(deepdata,[]);
msg_points= receive(sub_points);
points=readXYZ(msg_points);
deepdata = Get_Deep_Img(msg_points);
deep_img = Match_Deep_Image(deepdata);
figure;
imshow(deep_img,[]);

disp('get points');
msg_image = receive(sub_image);
img = readImage(msg_image);
disp('get img');

figure;
imshow(img);

save class_deep_data_010.mat deep_img points
imwrite(img,'class_image_data_010.png');



