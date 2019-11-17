clear;
clc;
%load data; 
load cnn_deep;


figure(2)
plot(cnn_deep.test_r);%训练过程中的测试集loss
%title('测试集loss');
figure(3)
plot(cnn_deep.verif_r);%训练过程中的验证集loss，用于停止训练，确定迭代次数
%title('验证集loss');
figure(4)
plot(cnn_deep.tra_r);%训练过程中的训练集loss
%title('训练集loss');