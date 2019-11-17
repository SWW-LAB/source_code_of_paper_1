function error = cnn_test_1(net, x, y)  

    net = cnn_feedforward(net, x); % 前向传播得到输出  
    n = numel(net.full_layer);%全连接层的层数
    %  error  
    t_e = net.full_layer{n}.o - y; 
    % 测试的代价函数是 均方误差    
    t_L = 1/2* sum(t_e(:) .^ 2) / size(t_e, 2);  %所有的误差之和，除以样本个数
    
    error = t_L;
    disp(['loss:' num2str(error)]);
%     b = net.full_layer{n}.o;%网络输出
%     n = size(y, 2); %测试样本数目
%     m = 0;%初始化在测试样本中出现错误（误差过大）的样本数目。
%     for i = 1:n
%         e = y(i) - b(i);
%         if abs(e)>0.5
%             m = m + 1;
%         end
%     end
%     error = m/n;
%     disp(['test error number:' num2str(m) '  test error rate:' num2str(error)]);
    
%     a =  round(b);
%     bad = find(y ~= a);  % 找到他们不相同的个数，也就是错误的次数  
%     error = numel(bad) / size(y, 2); % 计算错误率  
end  
