clear;
clc;
%load data; 
load cnn0;

figure(1)
plot(cnn0.rL);  %ѵ�������еľ������
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn0.test_r);%ѵ�������еĲ��Լ�loss
%title('���Լ�loss');
figure(3)
plot(cnn0.verif_r);%ѵ�������е���֤loss������ֹͣѵ����ȷ����������
%title('��֤��loss');
figure(4)
plot(cnn0.tra_r);%ѵ�������е�ѵ����loss
%title('ѵ����loss');