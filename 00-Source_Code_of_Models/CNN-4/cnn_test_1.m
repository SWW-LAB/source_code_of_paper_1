function error = cnn_test_1(net, x, y)  

    net = cnn_feedforward(net, x); % ǰ�򴫲��õ����  
    n = numel(net.full_layer);%ȫ���Ӳ�Ĳ���
    %  error  
    t_e = net.full_layer{n}.o - y; 
    % ���ԵĴ��ۺ����� �������    
    t_L = 1/2* sum(t_e(:) .^ 2) / size(t_e, 2);  %���е����֮�ͣ�������������
    
    error = t_L;
    disp(['loss:' num2str(error)]);
%     b = net.full_layer{n}.o;%�������
%     n = size(y, 2); %����������Ŀ
%     m = 0;%��ʼ���ڲ��������г��ִ��������󣩵�������Ŀ��
%     for i = 1:n
%         e = y(i) - b(i);
%         if abs(e)>0.5
%             m = m + 1;
%         end
%     end
%     error = m/n;
%     disp(['test error number:' num2str(m) '  test error rate:' num2str(error)]);
    
%     a =  round(b);
%     bad = find(y ~= a);  % �ҵ����ǲ���ͬ�ĸ�����Ҳ���Ǵ���Ĵ���  
%     error = numel(bad) / size(y, 2); % ���������  
end  
