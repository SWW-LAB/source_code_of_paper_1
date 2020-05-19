function net = cnn_setup_1(net, x, y)  
    inputmaps = 3;
    full_n = numel(net.full_layer);
    mapsize = size(squeeze(x(:, :, 1, 1)));
  
    for layer_n = 1 : numel(net.conv_layer)   
        if strcmp(net.conv_layer{layer_n}.type, 'c')
            
            mapsize = mapsize - net.conv_layer{layer_n}.kernelsize + 1;
            
            fan_out = net.conv_layer{layer_n}.outputmaps * net.conv_layer{layer_n}.kernelsize ^ 2;
            for j = 1 : net.conv_layer{layer_n}.outputmaps  %  output map  
                fan_in = inputmaps * net.conv_layer{layer_n}.kernelsize ^ 2;  
                for i = 1 : inputmaps  %  input map  
                    net.conv_layer{layer_n}.k{i}{j} = (rand(net.conv_layer{layer_n}.kernelsize) - 0.5) * 2 * sqrt(6 / (fan_in + fan_out));  
                end  
                net.conv_layer{layer_n}.b{j} = 0;
            end  
            inputmaps = net.conv_layer{layer_n}.outputmaps;   
        end
        if strcmp(net.conv_layer{layer_n}.type, 's')
            if layer_n == numel(net.conv_layer)
                mapsize = floor([net.conv_layer{layer_n}.scale_1 net.conv_layer{layer_n}.scale_2]);
            else
                mapsize = floor(mapsize / net.conv_layer{layer_n}.scale);
            end
            for j = 1 : inputmaps
                net.conv_layer{layer_n}.b{j} = 0;
            end  
        end  
    end  
      
    fvnum = prod(mapsize) * inputmaps;
    output_num = size(y, 1);
    net.full_layer{full_n}.neurons = output_num;
    for layer_n = 1 :full_n
        
        net.full_layer{layer_n}.w = (rand(net.full_layer{layer_n}.neurons, fvnum) - 0.5) * 2 * sqrt(6 / (net.full_layer{layer_n}.neurons + fvnum)); %全连接中的权值初始化
        
        net.full_layer{layer_n}.b = zeros(net.full_layer{layer_n}.neurons, 1);
        
        fvnum = net.full_layer{layer_n}.neurons;
    end
end  
