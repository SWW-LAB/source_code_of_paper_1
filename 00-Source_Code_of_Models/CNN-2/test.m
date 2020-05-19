clear;
clc;
%load data; 
load cnn_deep;


figure(2)
plot(cnn_deep.test_r);
%title('test loss');
figure(3)
plot(cnn_deep.verif_r);
%title('valid loss');
figure(4)
plot(cnn_deep.tra_r);
%title('train loss');
