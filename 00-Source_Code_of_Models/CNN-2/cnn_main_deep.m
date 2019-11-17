clear;
clc;

load data.mat; 

train_x = [[],[],[]];
train_y = [[],[]];
test_x = [[],[],[]];
test_y = [[],[]];
verification_x = [[],[],[],[]];
verification_y = [[],[]];

cnn_deep.conv_layer = {  
    struct('type', 'i')  %����� ?  struct(field,value)
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 5) %%�����
    struct('type', 's', 'scale', 2)%�ػ���
    struct('type', 'c', 'outputmaps', 12, 'kernelsize', 3) %�����
    struct('type', 's', 'scale_1', 4,'scale_2', 6) %�ռ�������ػ���
};  
cnn_deep.full_layer = {  
    struct('neurons', 1) %ȫ���Ӳ㣬����㡪����train_y������С
}; 
cnn_deep.Parameter.rate = 0.0005;% ѧϰ�� 
cnn_deep.Parameter.num = 10;%ѵ��num�����������һ��Ȩֵ����
cnn_deep.Parameter.train_num = 8000;%����������ѵ��������
cnn_deep.Parameter.r=0.0001;%ѵ���е���С����С��r�ǣ�ֹͣѵ��
cnn_deep.e_num = 0; %����loss������������ӵļ���
%  �����cnn�����ø�cnnsetup������ݴ˹���һ��������CNN���磬������    
cnn_deep = cnn_setup_deep(cnn_deep, train_data_x, train_data_y); 

num = size(train_data_x, 3); % m ��ȡ���ݼ���С?
k = randperm(num);  %������ѵ��������������룬����ÿ�ν������һ��
%ѵ����
for i = 1:num*8/10
    train_x(:,:,i) = train_data_x(:,:,k(i));
    train_y(1,i) = train_data_y(:,k(i));   
end
%���Լ�
for i = num*8/10 + 1:num*9/10
    test_x(:,:,i-num*8/10) = train_data_x(:,:,k(i));
    test_y(1,i-num*8/10) = train_data_y(:,k(i));   
end
%��֤��
for i = num*9/10 + 1:num
    verification_x(:,:,i-num*9/10) = train_data_x(:,:,k(i));
    verification_y(1,i-num*9/10) = train_data_y(:,k(i));   
end

% Ȼ��ʼ��ѵ��������������ʼѵ�����CNN����
cnn_deep = cnn_train_deep(cnn_deep, train_x, train_y, test_x, test_y,verification_x,verification_y);

figure(1)
plot(cnn_deep.rL);  %ѵ�������еľ������
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn_deep.test_r);%ѵ�������еĲ��Լ�loss
title('���Լ�loss');
figure(3)
plot(cnn_deep.verif_r);%ѵ�������е���֤��loss������ֹͣѵ����ȷ����������
title('��֤��loss');
figure(4)
plot(cnn_deep.tra_r);%ѵ�������е�ѵ����loss
title('ѵ����loss');


save('cnn_deep.mat','cnn_deep');
