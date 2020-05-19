clear;
clc;
%load data; 
load cnn1;

figure(1)
plot(cnn1.rL);
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn1.test_r);

figure(3)
plot(cnn1.verif_r);

figure(4)
plot(cnn1.tra_r);
