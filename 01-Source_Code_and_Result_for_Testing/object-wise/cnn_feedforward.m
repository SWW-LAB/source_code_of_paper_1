function net = cnn_feedforward(net, x)  
    n = numel(net.conv_layer);

    net.conv_layer{1}.a{1} = reshape(x(:,:,1,:), size(x,1),size(x,2),size(x,4));
    net.conv_layer{1}.a{2} = reshape(x(:,:,2,:), size(x,1),size(x,2),size(x,4));
    net.conv_layer{1}.a{3} = reshape(x(:,:,3,:), size(x,1),size(x,2),size(x,4));
    inputmaps = 3;
  
    for l_n = 2 : n
        if strcmp(net.conv_layer{l_n}.type, 'c')
            for j = 1 : net.conv_layer{l_n}.outputmaps   %  for each output map  
                %  create temp output map  
                z = zeros([size(net.conv_layer{l_n - 1}.a{1},1) - net.conv_layer{l_n}.kernelsize + 1 size(net.conv_layer{l_n - 1}.a{1},2) - net.conv_layer{l_n}.kernelsize + 1 size(net.conv_layer{l_n - 1}.a{1},3)]);  
                for i = 1 : inputmaps   %  for each input map  
                    %  convolve with corresponding kernel and add to temp output map  
                    z = z + convn(net.conv_layer{l_n - 1}.a{i}, net.conv_layer{l_n}.k{i}{j}, 'valid');
                end  
                %  add bias, pass through nonlinearity  
                net.conv_layer{l_n}.a{j} = activation_function(z + net.conv_layer{l_n}.b{j});  
            end  
            %  set number of input maps to this layers number of outputmaps  
            inputmaps = net.conv_layer{l_n}.outputmaps;  
        elseif strcmp(net.conv_layer{l_n}.type, 's')
            %  downsample  
            for j = 1 : inputmaps  
                %  !! replace with variable  
                if l_n == n
                    img_sz = size(net.conv_layer{l_n - 1}.a{j});
                    p_z = fix([img_sz(1)/net.conv_layer{l_n}.scale_1 img_sz(2)/net.conv_layer{l_n}.scale_2]);
                    z = convn(net.conv_layer{l_n - 1}.a{j}, ones(p_z) / (p_z(1)*p_z(2)), 'valid');   
                    net.conv_layer{l_n}.a{j} = z(1 : p_z(1) : p_z(1)*net.conv_layer{l_n}.scale_1, 1 : p_z(2) : p_z(2)*net.conv_layer{l_n}.scale_2, :); 
                else
                    z = convn(net.conv_layer{l_n - 1}.a{j}, ones(net.conv_layer{l_n}.scale) / (net.conv_layer{l_n}.scale^2), 'valid');   
                    net.conv_layer{l_n}.a{j} = z(1 : net.conv_layer{l_n}.scale : end, 1 : net.conv_layer{l_n}.scale : end, :);  
                end
            end  
        end  
    end  
  
    net.fv = [];  
    for j = 1 : numel(net.conv_layer{n}.a)
        sa = [size(net.conv_layer{n}.a{j},1),size(net.conv_layer{n}.a{j},2),size(net.conv_layer{n}.a{j},3)];
        net.fv = [net.fv; reshape(net.conv_layer{n}.a{j}, sa(1) * sa(2), sa(3))];  
    end  
    net.full_layer_in = net.fv;
    %  feedforward into output perceptrons  
    for l_n = 1 : numel(net.full_layer)
        net.full_layer{l_n}.o = activation_function(net.full_layer{l_n}.w * net.full_layer_in + repmat(net.full_layer{l_n}.b, 1, size(net.full_layer_in, 2)));
        net.full_layer_in = net.full_layer{l_n}.o;
    end
  
end  
