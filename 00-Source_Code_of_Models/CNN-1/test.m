clear;
clc;
%load data; 
load cnn0;

figure(1)
plot(cnn0.rL);
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn0.test_r);
figure(3)
plot(cnn0.verif_r);
figure(4)
plot(cnn0.tra_r);
