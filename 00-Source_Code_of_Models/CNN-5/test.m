clear;
clc;
%load data; 
load cnn_multi_finger;

figure(2)
plot(cnn_multi_finger.test_r);

figure(3)
plot(cnn_multi_finger.verif_r);

figure(4)
plot(cnn_multi_finger.tra_r);
