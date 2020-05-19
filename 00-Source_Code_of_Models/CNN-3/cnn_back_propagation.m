function net = cnn_back_propagation(net, y)  
    n_c = numel(net.conv_layer);
    n_f = numel(net.full_layer);
  
    %  error  
    net.e = net.full_layer{n_f}.o - y; 

    % mse
    net.L = 1/2* sum(net.e(:) .^ 2) / size(net.e, 2);
  
    %%  backprop deltas  
    net.full_layer{n_f}.d = net.e .* derivative(net.full_layer{n_f}.o);
    
    for i = 1:1:n_f-1
         net.full_layer{n_f-i}.d = net.full_layer{n_f-i+1}.w' * net.full_layer{n_f-i+1}.d .* derivative(net.full_layer{n_f-i}.o);
    end
    net.fvd = (net.full_layer{1}.w' * net.full_layer{1}.d);   
    if strcmp(net.conv_layer{n_c}.type, 'c')         %  only conv layers has sigm function  
        net.fvd = net.fvd .* derivative(net.fv);  
    end  
  
    %  reshape feature vector deltas into output map style  
    sa = size(net.conv_layer{n_c}.a{1});
    fvnum = sa(1) * sa(2);
    for j = 1 : numel(net.conv_layer{n_c}.a)
        net.conv_layer{n_c}.d{j} = reshape(net.fvd(((j - 1) * fvnum + 1) : j * fvnum, :), sa(1), sa(2), sa(3));  
    end  

    for l = (n_c - 1) : -1 : 1  
        if strcmp(net.conv_layer{l}.type, 'c')  
            for j = 1 : numel(net.conv_layer{l}.a)
                % for k = 1:size(net.layers{l + 1}.d{j}, 3)  
                    % net.layers{l}.d{j}(:,:,k) = net.layers{l}.a{j}(:,:,k) .* (1 - net.layers{l}.a{j}(:,:,k)) .*  kron(net.layers{l + 1}.d{j}(:,:,k), ones(net.layers{l + 1}.scale)) / net.layers{l + 1}.scale ^ 2;  
                % end  
                if l == (n_c - 1)
                    img_sz1 = size(net.conv_layer{l}.a{j});
                    p_z1 = fix([img_sz1(1)/net.conv_layer{l+1}.scale_1 img_sz1(2)/net.conv_layer{l+1}.scale_2]);
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
            for i = 1 : numel(net.conv_layer{l}.a)
                z = zeros(size(net.conv_layer{l}.a{1}));  
                for j = 1 : numel(net.conv_layer{l + 1}.a)
                     z = z + convn(net.conv_layer{l + 1}.d{j}, flip_diagonal(net.conv_layer{l + 1}.k{i}{j}), 'full');  
                end  
                net.conv_layer{l}.d{i} = z;  
            end  
        end  
    end  
  
    %%  calc gradients  
    for l = 2 : n_c  
        if strcmp(net.conv_layer{l}.type, 'c')  
            for j = 1 : numel(net.conv_layer{l}.a)  
                for i = 1 : numel(net.conv_layer{l - 1}.a)  
                    net.conv_layer{l}.dk{i}{j} = convn(flip_all(net.conv_layer{l - 1}.a{i}), net.conv_layer{l}.d{j}, 'valid') / size(net.conv_layer{l}.d{j}, 3);  
                end  
                net.conv_layer{l}.db{j} = sum(net.conv_layer{l}.d{j}(:)) / size(net.conv_layer{l}.d{j}, 3);  
            end  
        end  
    end  
    net.full_layer{1}.dw = net.full_layer{1}.d * (net.fv)' / size(net.full_layer{1}.d, 2); 
    net.full_layer{1}.db = mean(net.full_layer{1}.d, 2);
    for i = 2:1:n_f
        net.full_layer{i}.dw = net.full_layer{i}.d * (net.full_layer{i-1}.o)' / size(net.full_layer{i}.d, 2); 
        net.full_layer{i}.db = mean(net.full_layer{i}.d, 2);
    end

end 
