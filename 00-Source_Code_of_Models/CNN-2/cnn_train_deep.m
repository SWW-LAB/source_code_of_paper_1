function net = cnn_train_deep(net, x, y,test_x, test_y,verif_x,verif_y)   
    m = size(x, 3); % m ������� ѵ���������� 
    numbatches = m / net.Parameter.num;  
    % rem: Remainder after division. rem(x,y) is x - n.*y �൱������  
    % rem(numbatches, 1) ���൱��ȡ��С�����֣����Ϊ0����������   
    if rem(numbatches, 1) ~= 0  
        error('numbatches not integer');  
    end  
      
    net.rL = [];  %�洢ƽ����Ĵ��ۺ���
    net.tra_r = [];  %�洢ѵ����loss
    net.test_r = []; %�洢���Լ�loss
    net.verif_r = []; %�洢��֤��loss
    
    for i = 1 : net.Parameter.train_num  
         % disp(X) ��ӡ����Ԫ�ء����X�Ǹ��ַ������Ǿʹ�ӡ����ַ���  
        disp(['�Ѿ�ѵ������/���ѵ��������' num2str(i) '/' num2str(net.Parameter.train_num)]);  
       % tic �� toc ��������ʱ�ģ��������������֮�����ĵ�ʱ��  
        e0 = cnn_test_deep(net, x, y);%����
        if isempty(net.tra_r)  
            net.tra_r(1) = e0; % ���Լ�loss  
        else  
            net.tra_r(end + 1) = e0;
        end
        e1 = cnn_test_deep(net, test_x, test_y);%����
        if isempty(net.test_r)  
            net.test_r(1) = e1; % ���Լ�loss  
        else  
            net.test_r(end + 1) = e1;
        end
        e2 = cnn_test_deep(net, verif_x, verif_y);%����
        if isempty(net.verif_r)  
            net.verif_r(1) = e2; % ��֤��loss  
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
        % P = randperm(N) ����[1, N]֮������������һ����������У�����  
        % randperm(6) ���ܻ᷵�� [2 4 5 6 1 3]  
        % �������൱�ڰ�ԭ�����������д��ң�������һЩ������ѵ��  
        kk = randperm(m);   %������ѵ��������������룬����ÿ�ν������һ����
        for j = 1 : numbatches  
            % ȡ������˳����batchsize�������Ͷ�Ӧ�ı�ǩ   
            batch_x = x(:, :, kk((j - 1) * net.Parameter.num + 1 : j * net.Parameter.num));  
            batch_y = y(:,    kk((j - 1) * net.Parameter.num + 1 : j * net.Parameter.num)); 
  
            % �ڵ�ǰ������Ȩֵ�����������¼�����������   
            net = cnn_feedforward_deep(net, batch_x); % Feedforward ��������ǰ������
           % �õ���������������ͨ����Ӧ��������ǩ��bp�㷨���õ���������Ȩֵ  
            %��Ҳ������Щ����˵�Ԫ�أ��ĵ���  
            net = cnn_back_propagation(net, batch_y); % Backpropagation�����򴫲���  
            % �õ�����Ȩֵ�ĵ����󣬾�ͨ��Ȩֵ���·���ȥ����Ȩֵ 
            net = cnn_weight_updated(net);  
      
            if isempty(net.rL)  
                net.rL(1) = net.L; % ���ۺ���ֵ��Ҳ�������ֵ  
            else
                net.rL(end + 1) = 0.999 * net.rL(end) + 0.001 * net.L; % ������ʷ�����ֵ���Ա㻭ͼ����(���ۺ�����С)
            end
            
        end  
        toc;
        if net.rL(end)<net.Parameter.r
            break;
        end
        disp(['Mean square error:' num2str(net.L) '  Smoothing mean square error:' num2str(net.rL(end))]); 
    end  
      
end 