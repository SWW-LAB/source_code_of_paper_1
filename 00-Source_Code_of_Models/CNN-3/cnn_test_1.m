function error = cnn_test_1(net, x, y)  

    net = cnn_feedforward(net, x);
    n = numel(net.full_layer);
    %  error  
    t_e = net.full_layer{n}.o - y;  
    t_L = 1/2* sum(t_e(:) .^ 2) / size(t_e, 2);
    
    error = t_L;
    disp(['loss:' num2str(error)]);
%     b = net.full_layer{n}.o;
%     n = size(y, 2);
%     m = 0;
%     for i = 1:n
%         e = y(i) - b(i);
%         if abs(e)>0.5
%             m = m + 1;
%         end
%     end
%     error = m/n;
%     disp(['test error number:' num2str(m) '  test error rate:' num2str(error)]);
    
%     a =  round(b);
%     bad = find(y ~= a);
%     error = numel(bad) / size(y, 2);
end  
