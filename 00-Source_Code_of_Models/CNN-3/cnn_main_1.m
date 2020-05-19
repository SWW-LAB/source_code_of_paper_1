clear;
clc;

load data.mat; 
train_x = [[],[],[],[]];
train_y = [[],[]];
test_x = [[],[],[],[]];
test_y = [[],[]];
verification_x = [[],[],[],[]];
verification_y = [[],[]];

cnn1.conv_layer = {  
    struct('type', 'i') %�����?  struct(field,value)
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 3) %������ 
    struct('type', 's', 'scale_1', 2,'scale_2', 3) %�ռ�������ػ���
};  
cnn1.full_layer = {  
    struct('neurons', 1)%ȫ���Ӳ㣬����㡪����train_y������С
}; 
cnn1.Parameter.rate = 0.001;%ѧϰ��  
cnn1.Parameter.num = 10;%ѵ��num�����������һ��Ȩֵ����
cnn1.Parameter.train_num = 100000;%����������ѵ��������
cnn1.Parameter.r=0.0001;%ѵ���е���С����С��r�ǣ�ֹͣѵ��
cnn1.e_num = 0; %����loss������������ӵļ���
%�����cnn�����ø�cnnsetup������ݴ˹���һ��������CNN���磬������  
cnn1 = cnn_setup_1(cnn1, train_data_x, train_data_y); 


num = size(train_data_x, 4); % m ��ȡ���ݼ���С?
k = randperm(num);  %������ѵ��������������룬����ÿ�ν������һ��
%ѵ����
for i = 1:num*8/10
    train_x(:,:,:,i) = train_data_x(:,:,:,k(i));
    train_y(1,i) = train_data_y(:,k(i));   
end
%���Լ�
for i = num*8/10 + 1:num*9/10
    test_x(:,:,:,i-num*8/10) = train_data_x(:,:,:,k(i));
    test_y(1,i-num*8/10) = train_data_y(:,k(i));   
end
%��֤��
for i = num*9/10 + 1:num
    verification_x(:,:,:,i-num*9/10) = train_data_x(:,:,:,k(i));
    verification_y(1,i-num*9/10) = train_data_y(:,k(i));   
end

% Ȼ��ʼ��ѵ��������������ʼѵ�����CNN����
cnn1 = cnn_train_1(cnn1, train_x, train_y, test_x, test_y,verification_x,verification_y);

figure(1)
plot(cnn1.rL);  %ѵ�������еľ������
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn1.test_r);%ѵ�������еĲ��Լ�loss
title('���Լ�loss');
figure(3)
plot(cnn1.verif_r);%ѵ�������е���֤loss������ֹͣѵ����ȷ����������
title('��֤��loss');
figure(4)
plot(cnn1.tra_r);%ѵ�������е�ѵ����loss
title('ѵ����loss');

save('cnn1.mat','cnn1');