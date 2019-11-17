clear
clc
load('data_005.mat')
imwrite(img,'img_004.png')
imwrite(deep_0_1,'deep_004.png')

ima = imread('img_004.png');
dea = imread('deep_004.png');
img2= draw_frame(ima, result_Frame(1), result_Frame(2), result_Frame(3),result_Frame(4), result_Frame(5));
imwrite(img2,'result_img_004.png')
img3= deep_draw_frame(dea, result_Frame(1), result_Frame(2), result_Frame(3),result_Frame(4), result_Frame(5));
imwrite(img3,'result_deep_004.png')