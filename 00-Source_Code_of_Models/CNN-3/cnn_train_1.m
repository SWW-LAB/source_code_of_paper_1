function net = cnn_train_1(net, x, y,test_x, test_y,verif_x,verif_y)  
    m = size(x, 4);
    numbatches = m / net.Parameter.num;  
    if rem(numbatches, 1) ~= 0  
        error('numbatches not integer');  
    end  
      
    net.rL = [];
    net.tra_r = [];
    net.test_r = [];
    net.verif_r = [];
    
    for i = 1 : net.Parameter.train_num  
        disp(['cnt/total：' num2str(i) '/' num2str(net.Parameter.train_num)]);  
        e0 = cnn_test_1(net, x, y);
        if isempty(net.tra_r)  
            net.tra_r(1) = e0;
        else  
            net.tra_r(end + 1) = e0;
        end
        e1 = cnn_test_1(net, test_x, test_y);
        if isempty(net.test_r)  
            net.test_r(1) = e1;
        else  
            net.test_r(end + 1) = e1;
        end
        e2 = cnn_test_1(net, verif_x, verif_y);
        if isempty(net.verif_r)  
            net.verif_r(1) = e2;
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
        kk = randperm(m);
        for l = 1 : numbatches  
            batch_x = x(:, :, :, kk((l - 1) * net.Parameter.num + 1 : l * net.Parameter.num));  
            batch_y = y(:,    kk((l - 1) * net.Parameter.num + 1 : l * net.Parameter.num));  
  
            net = cnn_feedforward(net, batch_x);
            net = cnn_back_propagation(net, batch_y);
            net = cnn_weight_updated(net);  
            
            if isempty(net.rL)  
                net.rL(1) = net.L;
            else
                net.rL(end + 1) = 0.999 * net.rL(end) + 0.001 * net.L;
            end    
        end  
        toc; 
        if net.rL(end)<net.Parameter.r
            break;
        end
        disp(['Mean square error:' num2str(net.L) '  Smoothing mean square error:' num2str(net.rL(end))]);  
    end  
      
end 
