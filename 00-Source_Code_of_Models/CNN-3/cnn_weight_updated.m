function net = cnn_weight_updated(net)  
    for l = 2 : numel(net.conv_layer)  
        if strcmp(net.conv_layer{l}.type, 'c')  
            for j = 1 : numel(net.conv_layer{l}.a)  
                for i = 1 : numel(net.conv_layer{l - 1}.a)   
                    net.conv_layer{l}.k{i}{j} = net.conv_layer{l}.k{i}{j} - net.Parameter.rate * net.conv_layer{l}.dk{i}{j};  
                end  
            end  
            net.conv_layer{l}.b{j} = net.conv_layer{l}.b{j} - net.Parameter.rate * net.conv_layer{l}.db{j};  
        end  
    end
    
    for i = 1 : numel(net.full_layer) 
        net.full_layer{i}.w = net.full_layer{i}.w - net.Parameter.rate * net.full_layer{i}.dw; 
        net.full_layer{i}.b = net.full_layer{i}.b - net.Parameter.rate * net.full_layer{i}.db;
    end
end  

