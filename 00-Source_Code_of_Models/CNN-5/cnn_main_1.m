clear;
clc;

load image_data.mat; 
train_x = [[],[],[],[]];
train_y = [[],[]];
test_x = [[],[],[],[]];
test_y = [[],[]];
verification_x = [[],[],[],[]];
verification_y = [[],[]];


cnn_multi_finger.conv_layer = {  
    struct('type', 'i') %�����   struct(field,value)
%     struct('type', 'c', 'outputmaps', 12, 'kernelsize', 3)%�����
%     struct('type', 's', 'scale', 2) %�ػ���
    struct('type', 'c', 'outputmaps', 12, 'kernelsize', 3) %�����
    struct('type', 's', 'scale_1', 11,'scale_2', 11) %�ռ�������ػ���
};  
cnn_multi_finger.full_layer = {  
    struct('neurons', 24) %ȫ���Ӳ�
    struct('neurons', 1) %ȫ���Ӳ㣬����㡪����train_y������С
}; 
cnn_multi_finger.Parameter.rate = 0.001;%ѧϰ��  
cnn_multi_finger.Parameter.num = 10;%ѵ��num�����������һ��Ȩֵ����
cnn_multi_finger.Parameter.train_num = 100000;%����������ѵ��������
cnn_multi_finger.Parameter.r=0.0001;%ѵ���е���С����С��r�ǣ�ֹͣѵ��
cnn_multi_finger.e_num = 0; %����loss������������ӵļ���
%�����cnn�����ø�cnnsetup������ݴ˹���һ��������CNN���磬������  
cnn_multi_finger = cnn_setup_1(cnn_multi_finger, train_image_x, train_image_y); 

num = size(train_image_x, 4); % m ��ȡ���ݼ���С?
k = randperm(num);  %������ѵ��������������룬����ÿ�ν������һ��
%ѵ����
for i = 1:num*8/10
    train_x(:,:,:,i) = train_image_x(:,:,:,k(i));
    train_y(1,i) = train_image_y(:,k(i));   
end
%���Լ�
for i = num*8/10 + 1:num*9/10
    test_x(:,:,:,i-num*8/10) = train_image_x(:,:,:,k(i));
    test_y(1,i-num*8/10) = train_image_y(:,k(i));   
end
%��֤��
for i = num*9/10 + 1:num
    verification_x(:,:,:,i-num*9/10) = train_image_x(:,:,:,k(i));
    verification_y(1,i-num*9/10) = train_image_y(:,k(i));   
end

% Ȼ��ʼ��ѵ��������������ʼѵ�����CNN����
cnn_multi_finger = cnn_train_1(cnn_multi_finger, train_x, train_y, test_x, test_y,verification_x,verification_y);

figure(1)
plot(cnn_multi_finger.rL);  %ѵ�������еľ������
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn_multi_finger.test_r);%ѵ�������еĲ��Լ�loss
title('���Լ�loss');
figure(3)
plot(cnn_multi_finger.verif_r);%ѵ�������е���֤��loss������ֹͣѵ����ȷ����������
title('��֤��loss');
figure(4)
plot(cnn_multi_finger.tra_r);%ѵ�������е�ѵ����loss
title('ѵ����loss');

save('cnn_multi_finger.mat','cnn_multi_finger');
