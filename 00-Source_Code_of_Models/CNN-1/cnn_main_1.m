clear;
clc;

load data.mat; 

train_x = [[],[],[],[]];
train_y = [[],[]];
test_x = [[],[],[],[]];
test_y = [[],[]];
verification_x = [[],[],[],[]];
verification_y = [[],[]];

cnn0.conv_layer = {  
    struct('type', 'i') %输入层  struct(field,value)
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 3) %卷积层
    struct('type', 's', 'scale_1', 2,'scale_2', 2) %空间金字塔池化层
};
cnn0.full_layer = {  
%     struct('neurons', 24) %全连接层
    struct('neurons', 1) %全连接层，输出层——由train_y决定大小
}; 
cnn0.Parameter.rate = 0.001;%学习率  
cnn0.Parameter.num = 10;%训练num个样本后进行一次权值调整
cnn0.Parameter.train_num = 100000;%整个样本的训练最大次数
cnn0.Parameter.r=0.0001;%训练中的最小误差，当小于r是，停止训练
cnn0.e_num = 0; %出现loss连续不变或增加的计数

% 这里把cnn的设置给cnnsetup，它会据此构建一个完整的CNN网络，并返回   
cnn0 = cnn_setup_1(cnn0, train_data_x, train_data_y); 

num = size(train_data_x, 4); % m 读取数据集大小?
k = randperm(num);  %由于是训练样本是随机输入，所以每次结果都不一样
%训练集
for i = 1:num*8/10
    train_x(:,:,:,i) = train_data_x(:,:,:,k(i));
    train_y(1,i) = train_data_y(:,k(i));   
end
%测试集
for i = num*8/10 + 1:num*9/10
    test_x(:,:,:,i-num*8/10) = train_data_x(:,:,:,k(i));
    test_y(1,i-num*8/10) = train_data_y(:,k(i));   
end
%验证集
for i = num*9/10 + 1:num
    verification_x(:,:,:,i-num*9/10) = train_data_x(:,:,:,k(i));
    verification_y(1,i-num*9/10) = train_data_y(:,k(i));   
end

% 然后开始把训练样本给它，开始训练这个CNN网络
cnn0 = cnn_train_1(cnn0, train_x, train_y, test_x, test_y,verification_x,verification_y);

figure(1)
plot(cnn0.rL);  %训练过程中的均方误差
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn0.test_r);%训练过程中的测试集loss
title('测试集loss');
figure(3)
plot(cnn0.verif_r);%训练过程中的验证loss，用于停止训练，确定迭代次数
title('验证集loss');
figure(4)
plot(cnn0.tra_r);%训练过程中的训练集loss
title('训练集loss');

save('cnn0.mat','cnn0');
