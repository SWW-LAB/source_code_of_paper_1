function error = cnn_test_deep(net, x, y)  

    net = cnn_feedforward_deep(net, x);
    n = numel(net.full_layer);
    %  error  
    t_e = net.full_layer{n}.o - y; 
    % mse
    t_L = 1/2* sum(t_e(:) .^ 2) / size(t_e, 2);
    
    error = t_L;
    disp(['loss:' num2str(error)]);
%     for i = 1:n
%         e = y(i) - b(i);
%         if abs(e)>0.4
%             m = m + 1;
%         end
%     end
%     error = m/n;
%     disp(['error number:' num2str(m) '  error rate:' num2str(error)]);
%     
%     a =  round(b);
%     bad = find(y ~= a);
%     error = numel(bad) / size(y, 2);
end  
