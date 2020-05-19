clear;
clc;
%load data; 
load cnn2;

figure(2)
plot(cnn2.test_r);

figure(3)
plot(cnn2.verif_r);

figure(4)
plot(cnn2.tra_r);
