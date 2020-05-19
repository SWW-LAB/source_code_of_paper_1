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
    struct('type', 'i')
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 3)
    struct('type', 's', 'scale_1', 2,'scale_2', 3)
};  
cnn1.full_layer = {  
    struct('neurons', 1)
}; 
cnn1.Parameter.rate = 0.001;
cnn1.Parameter.num = 10;
cnn1.Parameter.train_num = 100000;
cnn1.Parameter.r=0.0001;
cnn1.e_num = 0;
cnn1 = cnn_setup_1(cnn1, train_data_x, train_data_y); 


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


cnn1 = cnn_train_1(cnn1, train_x, train_y, test_x, test_y,verification_x,verification_y);

figure(1)
plot(cnn1.rL);
title('pricing function - Smoothing mean square error');
figure(2)
plot(cnn1.test_r);
title('test loss');
figure(3)
plot(cnn1.verif_r);
title('valid loss');
figure(4)
plot(cnn1.tra_r);
title('train loss');

save('cnn1.mat','cnn1');
