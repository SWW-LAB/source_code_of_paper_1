clear;
clc;
%load data; 
load cnn_multi_finger;

figure(2)
plot(cnn_multi_finger.test_r);%ѵ�������еĲ��Լ�loss
%title('���Լ�loss');
figure(3)
plot(cnn_multi_finger.verif_r);%ѵ�������е���֤��loss������ֹͣѵ����ȷ����������
%title('��֤��loss');
figure(4)
plot(cnn_multi_finger.tra_r);%ѵ�������е�ѵ����loss
%title('ѵ����loss');