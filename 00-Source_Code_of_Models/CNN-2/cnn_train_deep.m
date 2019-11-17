function net = cnn_train_deep(net, x, y,test_x, test_y,verif_x,verif_y)   
    m = size(x, 3); % m 保存的是 训练样本个数 
    numbatches = m / net.Parameter.num;  
    % rem: Remainder after division. rem(x,y) is x - n.*y 相当于求余  
    % rem(numbatches, 1) 就相当于取其小数部分，如果为0，就是整数   
    if rem(numbatches, 1) ~= 0  
        error('numbatches not integer');  
    end  
      
    net.rL = [];  %存储平滑后的代价函数
    net.tra_r = [];  %存储训练集loss
    net.test_r = []; %存储测试集loss
    net.verif_r = []; %存储验证集loss
    
    for i = 1 : net.Parameter.train_num  
         % disp(X) 打印数组元素。如果X是个字符串，那就打印这个字符串  
        disp(['已经训练次数/最大训练次数：' num2str(i) '/' num2str(net.Parameter.train_num)]);  
       % tic 和 toc 是用来计时的，计算这两条语句之间所耗的时间  
        e0 = cnn_test_deep(net, x, y);%测试
        if isempty(net.tra_r)  
            net.tra_r(1) = e0; % 测试集loss  
        else  
            net.tra_r(end + 1) = e0;
        end
        e1 = cnn_test_deep(net, test_x, test_y);%测试
        if isempty(net.test_r)  
            net.test_r(1) = e1; % 测试集loss  
        else  
            net.test_r(end + 1) = e1;
        end
        e2 = cnn_test_deep(net, verif_x, verif_y);%测试
        if isempty(net.verif_r)  
            net.verif_r(1) = e2; % 验证集loss  
        else  
            if net.verif_r(end)<= e2
                net.e_num = net.e_num+1;
            else
                net.e_num=0;
            end 
            net.verif_r(end + 1) = e2;        
        end
        if net.e_num>8
            break;
        end
        tic;  
        % P = randperm(N) 返回[1, N]之间所有整数的一个随机的序列，例如  
        % randperm(6) 可能会返回 [2 4 5 6 1 3]  
        % 这样就相当于把原来的样本排列打乱，再挑出一些样本来训练  
        kk = randperm(m);   %由于是训练样本是随机输入，所以每次结果都不一样。
        for j = 1 : numbatches  
            % 取出打乱顺序后的batchsize个样本和对应的标签   
            batch_x = x(:, :, kk((j - 1) * net.Parameter.num + 1 : j * net.Parameter.num));  
            batch_y = y(:,    kk((j - 1) * net.Parameter.num + 1 : j * net.Parameter.num)); 
  
            % 在当前的网络权值和网络输入下计算网络的输出   
            net = cnn_feedforward_deep(net, batch_x); % Feedforward 函数（向前传播）
           % 得到上面的网络输出后，通过对应的样本标签用bp算法来得到误差对网络权值  
            %（也就是那些卷积核的元素）的导数  
            net = cnn_back_propagation(net, batch_y); % Backpropagation（反向传播）  
            % 得到误差对权值的导数后，就通过权值更新方法去更新权值 
            net = cnn_weight_updated(net);  
      
            if isempty(net.rL)  
                net.rL(1) = net.L; % 代价函数值，也就是误差值  
            else
                net.rL(end + 1) = 0.999 * net.rL(end) + 0.001 * net.L; % 保存历史的误差值，以便画图分析(代价函数大小)
            end
            
        end  
        toc;
        if net.rL(end)<net.Parameter.r
            break;
        end
        disp(['Mean square error:' num2str(net.L) '  Smoothing mean square error:' num2str(net.rL(end))]); 
    end  
      
end 