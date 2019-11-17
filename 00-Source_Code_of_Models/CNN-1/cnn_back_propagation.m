function net = cnn_back_propagation(net, y)  
    n_c = numel(net.conv_layer); % 卷积网络层数  
    n_f = numel(net.full_layer);%全连接网络层数
  
    %  error  
    net.e = net.full_layer{n_f}.o - y; 

    % 代价函数是 均方误差    
    net.L = 1/2* sum(net.e(:) .^ 2) / size(net.e, 2);  %所有的误差之和，除以样本个数
  
    %%  backprop deltas  
    % 这里可以参考 UFLDL 的 反向传导算法 的说明  
    % 输出层的 灵敏度 或者 残差
    net.full_layer{n_f}.d = net.e .* derivative(net.full_layer{n_f}.o);
    
    % 残差 反向传播回 前一层
    for i = 1:1:n_f-1
         net.full_layer{n_f-i}.d = net.full_layer{n_f-i+1}.w' * net.full_layer{n_f-i+1}.d .* derivative(net.full_layer{n_f-i}.o);
    end
    %反向传播到卷积层
    net.fvd = (net.full_layer{1}.w' * net.full_layer{1}.d);   
    if strcmp(net.conv_layer{n_c}.type, 'c')         %  only conv layers has sigm function  
        net.fvd = net.fvd .* derivative(net.fv);  
    end  
  
    %  reshape feature vector deltas into output map style  
    sa = size(net.conv_layer{n_c}.a{1}); % 最后一层特征map的大小。这里的最后一层都是指输出层的前一层  
    fvnum = sa(1) * sa(2); % 因为是将最后一层特征map拉成一条向量，所以对于一个样本来说，特征维数是这样  
    for j = 1 : numel(net.conv_layer{n_c}.a) % 最后一层的特征map的个数  
        % 在fvd里面保存的是所有样本的特征向量（在cnnff.m函数中用特征map拉成的），所以这里需要重新  
        % 变换回来特征map的形式。d 保存的是 delta，也就是 灵敏度 或者 残差  
        net.conv_layer{n_c}.d{j} = reshape(net.fvd(((j - 1) * fvnum + 1) : j * fvnum, :), sa(1), sa(2), sa(3));  
    end  
  
    % 对于 输出层前面的层（与输出层计算残差的方式不同）  
    for l = (n_c - 1) : -1 : 1  
        if strcmp(net.conv_layer{l}.type, 'c')  
            for j = 1 : numel(net.conv_layer{l}.a) % 该层特征map的个数  
                % net.layers{l}.d{j} 保存的是 第l层 的 第j个 map 的 灵敏度map。 也就是每个神经元节点的delta的值  
                % expand的操作相当于对l+1层的灵敏度map进行上采样。然后前面的操作相当于对该层的输入a进行sigmoid求导  
                % 这条公式请参考 Notes on Convolutional Neural Networks  
                % for k = 1:size(net.layers{l + 1}.d{j}, 3)  
                    % net.layers{l}.d{j}(:,:,k) = net.layers{l}.a{j}(:,:,k) .* (1 - net.layers{l}.a{j}(:,:,k)) .*  kron(net.layers{l + 1}.d{j}(:,:,k), ones(net.layers{l + 1}.scale)) / net.layers{l + 1}.scale ^ 2;  
                % end  
                if l == (n_c - 1)
                    img_sz1 = size(net.conv_layer{l}.a{j});
                    p_z1 = fix([img_sz1(1)/net.conv_layer{l+1}.scale_1 img_sz1(2)/net.conv_layer{l+1}.scale_2]); %取整数,得池化核大小
                    m_rem = [rem(img_sz1(1),p_z1(1)) rem(img_sz1(2),p_z1(2))];
                    m_expand = expand(net.conv_layer{l + 1}.d{j}, [p_z1(1) p_z1(2) 1]) / (p_z1(1)*p_z1(2));
                    if m_rem(1) ~= 0
                        for i =1:1:m_rem(1)
                            m_expand = cat(1,m_expand,m_expand(end,:,:));
                        end
                    end
                    if m_rem(2) ~= 0
                        for i =1:1:m_rem(2)
                            m_expand = cat(2,m_expand,m_expand(:,end,:));
                        end
                    end
                    net.conv_layer{l}.d{j} = derivative(net.conv_layer{l}.a{j}) .* m_expand;
                else
                    img_sz1 = size(net.conv_layer{l}.a{j});
                    m_rem = [rem(img_sz1(1),net.conv_layer{l+1}.scale) rem(img_sz1(2),net.conv_layer{l+1}.scale)];
                    m_expand = expand(net.conv_layer{l + 1}.d{j}, [net.conv_layer{l + 1}.scale net.conv_layer{l + 1}.scale 1]) / net.conv_layer{l + 1}.scale ^ 2;
                    if m_rem(1) ~= 0
                        for i =1:1:m_rem(1)
                            m_expand = cat(1,m_expand,m_expand(end,:,:));
                        end
                    end
                    if m_rem(2) ~= 0
                        for i =1:1:m_rem(2)
                            m_expand = cat(2,m_expand,m_expand(:,end,:));
                        end
                    end
                    net.conv_layer{l}.d{j} = derivative(net.conv_layer{l}.a{j}) .*m_expand;
                end 
            end  
        elseif strcmp(net.conv_layer{l}.type, 's')  
            for i = 1 : numel(net.conv_layer{l}.a) % 第l层特征map的个数  
                z = zeros(size(net.conv_layer{l}.a{1}));  
                for j = 1 : numel(net.conv_layer{l + 1}.a) % 第l+1层特征map的个数  
                     z = z + convn(net.conv_layer{l + 1}.d{j}, flip_diagonal(net.conv_layer{l + 1}.k{i}{j}), 'full');  
                end  
                net.conv_layer{l}.d{i} = z;  
            end  
        end  
    end  
  
    %%  calc gradients  
    % 这里与 Notes on Convolutional Neural Networks 中不同，这里的 子采样 层没有参数，也没有  
    % 激活函数，所以在子采样层是没有需要求解的参数的  
    for l = 2 : n_c  
        if strcmp(net.conv_layer{l}.type, 'c')  
            for j = 1 : numel(net.conv_layer{l}.a)  
                for i = 1 : numel(net.conv_layer{l - 1}.a)  
                    % dk 保存的是 误差对卷积核 的导数  
                    net.conv_layer{l}.dk{i}{j} = convn(flip_all(net.conv_layer{l - 1}.a{i}), net.conv_layer{l}.d{j}, 'valid') / size(net.conv_layer{l}.d{j}, 3);  
                end  
                % db 保存的是 误差对于bias基 的导数  
                net.conv_layer{l}.db{j} = sum(net.conv_layer{l}.d{j}(:)) / size(net.conv_layer{l}.d{j}, 3);  
            end  
        end  
    end  
    %卷积层与全连接层的之间的计算
    net.full_layer{1}.dw = net.full_layer{1}.d * (net.fv)' / size(net.full_layer{1}.d, 2); 
    net.full_layer{1}.db = mean(net.full_layer{1}.d, 2);
    %全连接的计算
    for i = 2:1:n_f
        net.full_layer{i}.dw = net.full_layer{i}.d * (net.full_layer{i-1}.o)' / size(net.full_layer{i}.d, 2); 
        net.full_layer{i}.db = mean(net.full_layer{i}.d, 2);
    end

end 
