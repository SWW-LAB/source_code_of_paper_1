clear;
clc;
%load data; 
load cnn1;

figure(1)
plot(cnn1.rL);  %ѵ�������еľ������
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn1.test_r);%ѵ�������еĲ��Լ�loss
%title('���Լ�loss');
figure(3)
plot(cnn1.verif_r);%ѵ�������е���֤loss������ֹͣѵ����ȷ����������
%title('��֤��loss');
figure(4)
plot(cnn1.tra_r);%ѵ�������е�ѵ����loss
%title('ѵ����loss');