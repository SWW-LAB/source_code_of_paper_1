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
    struct('type', 'i')
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 3)
    struct('type', 's', 'scale_1', 2,'scale_2', 2)
};
cnn0.full_layer = {  
%     struct('neurons', 24)
    struct('neurons', 1)
}; 
cnn0.Parameter.rate = 0.001;
cnn0.Parameter.num = 10;
cnn0.Parameter.train_num = 100000;
cnn0.Parameter.r=0.0001;
cnn0.e_num = 0;

cnn0 = cnn_setup_1(cnn0, train_data_x, train_data_y); 

num = size(train_data_x, 4);
k = randperm(num);
for i = 1:num*8/10
    train_x(:,:,:,i) = train_data_x(:,:,:,k(i));
    train_y(1,i) = train_data_y(:,k(i));   
end

for i = num*8/10 + 1:num*9/10
    test_x(:,:,:,i-num*8/10) = train_data_x(:,:,:,k(i));
    test_y(1,i-num*8/10) = train_data_y(:,k(i));   
end

for i = num*9/10 + 1:num
    verification_x(:,:,:,i-num*9/10) = train_data_x(:,:,:,k(i));
    verification_y(1,i-num*9/10) = train_data_y(:,k(i));   
end

cnn0 = cnn_train_1(cnn0, train_x, train_y, test_x, test_y,verification_x,verification_y);

figure(1)
plot(cnn0.rL);
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn0.test_r);
title('test loss');
figure(3)
plot(cnn0.verif_r);
title('valid loss');
figure(4)
plot(cnn0.tra_r);
title('train loss');

save('cnn0.mat','cnn0');
