clear;
clc;
%load data; 
load cnn_deep;


figure(2)
plot(cnn_deep.test_r);%ѵ�������еĲ��Լ�loss
%title('���Լ�loss');
figure(3)
plot(cnn_deep.verif_r);%ѵ�������е���֤��loss������ֹͣѵ����ȷ����������
%title('��֤��loss');
figure(4)
plot(cnn_deep.tra_r);%ѵ�������е�ѵ����loss
%title('ѵ����loss');