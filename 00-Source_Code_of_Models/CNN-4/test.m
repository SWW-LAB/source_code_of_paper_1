clear;
clc;
%load data; 
load cnn2;

figure(2)
plot(cnn2.test_r);%ѵ�������еĲ��Լ�loss
%title('���Լ�loss');
figure(3)
plot(cnn2.verif_r);%ѵ�������е���֤loss������ֹͣѵ����ȷ����������
%title('��֤��loss');
figure(4)
plot(cnn2.tra_r);%ѵ�������е�ѵ����loss
%title('ѵ����loss');