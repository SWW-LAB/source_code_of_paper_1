clear;
clc;
%load data; 
load cnn1;

figure(1)
plot(cnn1.rL);  %训练过程中的均方误差
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn1.test_r);%训练过程中的测试集loss
%title('测试集loss');
figure(3)
plot(cnn1.verif_r);%训练过程中的验证loss，用于停止训练，确定迭代次数
%title('验证集loss');
figure(4)
plot(cnn1.tra_r);%训练过程中的训练集loss
%title('训练集loss');