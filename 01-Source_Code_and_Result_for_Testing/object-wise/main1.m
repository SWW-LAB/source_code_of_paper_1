clear
clc
% Waiting_start = rossubscriber('chatter_msg','std_msgs/Bool');
% disp('waiting');
% start_msg = receive(Waiting_start);
load cnn0;
load cnn1;
load cnn2;
load cnn_deep;
result_dir = 'E:\研究生资料\我的论文及相关程序\小论文\小论文3\论文对应的三级网络程序及实验结果\1-从新训练的网络\数据集测试结果\方式2\result';
addpath('E:\研究生资料\我的论文及相关程序\小论文\小论文3\论文对应的三级网络程序及实验结果\test_ImageData\类别');
addpath('E:\研究生资料\我的论文及相关程序\小论文\小论文3\论文对应的三级网络程序及实验结果\test_DeepData');
for iii=1:1100
    img_a = sprintf('pcd%04dr.png',iii);
    deep_a = sprintf('pcd%04d.mat',iii);
    if ~exist(img_a,'file');
        continue
    end
    img = imread(img_a);%锟斤拷取原图锟斤拷
    load(deep_a);
    
    r_long = 32;
    r_wide = 16;
    save_Frame = [[],[]];
    save_data = [[],[],[],[]];
    result = 0;
    n_1 = 1;
    n_2 = 0;

    % msg_image = receive(sub_image);
    % img = readImage(msg_image);
    % disp('get img');
    deep_size = size(deepdata);
    img_size = size(img);
    tic
    for multiple_i = 2:4
        multiple = multiple_i;
        img1 = change_size(img, img_size(2)/multiple, img_size(1)/multiple);
        deepdata1 = change_size_deep(deepdata,deep_size(2)/multiple, deep_size(1)/multiple);
        img_size1 = size(img1);
        img_judge = [[],[]];
        n=14;
        img_judge_i =1;
        for i_1 = 120/multiple:n:(img_size1(1)-60/multiple-n)
            for i_2 = 60/multiple:n:(img_size1(2)-120/multiple-n)
                img_f = img1(i_1:i_1+n-1,i_2:i_2+n-1,:);
                data = double(img_f)/255;
                cnn0 = cnn_feedforward(cnn0, data);
                cnn1_result = cnn0.full_layer{1}.o; 
                if cnn1_result >0.5
                    img_judge(img_judge_i,:)=[i_1+3 i_2+3];
                    img_judge_i = img_judge_i + 1;
                    img_judge(img_judge_i,:)=[i_1+10 i_2+3];
                    img_judge_i = img_judge_i + 1;
                    img_judge(img_judge_i,:)=[i_1+3 i_2+10];
                    img_judge_i = img_judge_i + 1;
                    img_judge(img_judge_i,:)=[i_1+10 i_2+10];
                    img_judge_i = img_judge_i + 1;
                end
            end  
        end
        for i = 1:img_judge_i-1
            img_f = Dig_Img (img1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  0);
            deep_f = Dig_deep (deepdata1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  0);
            cnn1 = cnn_feedforward(cnn1, img_f);
            cnn_deep = cnn_feedforward_deep(cnn_deep,deep_f);
            cnn1_result = cnn1.full_layer{1}.o; 
            cnn_deep_result = cnn_deep.full_layer{1}.o; 
            if cnn1_result<0.2;
                continue;
            end
            if (cnn1_result>0.5&&cnn_deep_result>0.5)
                save_Frame(n_1,:) = [img_judge(i,1)*multiple img_judge(i,2)*multiple r_long*multiple r_wide*multiple 0 cnn1_result];
                save_data(:,:,:,n_1)  =img_f;
                n_1 = n_1 + 1;
            end

            for r = pi/8:pi/8:pi*7/8
                img_f = Dig_Img (img1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  r);
                deep_f = Dig_deep (deepdata1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  r);
                cnn1 = cnn_feedforward(cnn1, img_f);
                cnn_deep = cnn_feedforward_deep(cnn_deep,deep_f);
                cnn1_result = cnn1.full_layer{1}.o; 
                cnn_deep_result = cnn_deep.full_layer{1}.o; 
                if (cnn1_result>0.5&&cnn_deep_result>0.5)
                    save_Frame(n_1,:) = [img_judge(i,1)*multiple img_judge(i,2)*multiple r_long*multiple r_wide*multiple r cnn1_result];
                    save_data(:,:,:,n_1)  = img_f;
                    n_1 = n_1 + 1;
                end
                n_2 = n_2+1;
            end
        end
    end

    if  isempty(save_data)
        mingzhi = sprintf('%s/%04d.png',result_dir,iii);
        imwrite(img,mingzhi);
        continue
    end

    result1 = 0;
    result2 = 0;
    result3 = 0;
    result_Frame1 = [0 0 0 0 0 0];
    result_Frame2 = [0 0 0 0 0 0];
    result_Frame3 = [0 0 0 0 0 0];
    cnn2_n = size(save_data,4);

    if cnn2_n == 1
        result_Frame =  save_Frame(1,:);
        img2= draw_frame(img, result_Frame(1), result_Frame(2), result_Frame(3),result_Frame(4), result_Frame(5));
        mingzhi = sprintf('%s/%04d.png',result_dir,iii);
        imwrite(img2,mingzhi);
        continue
    end

    for i = 1:1:cnn2_n
        cnn2 = cnn_feedforward(cnn2, save_data(:,:,:,i));
        cnn2_result = cnn2.full_layer{2}.o;
        if result1 < cnn2_result
            if (result_Frame1(1)~=save_Frame(i,1))||(result_Frame1(2)~=save_Frame(i,2))
                result3 = result2;
                result_Frame3 = result_Frame2;
                result2 = result1;
                result_Frame2 = result_Frame1;
            end
            result1 = cnn2_result;
            result_Frame1 = save_Frame(i,:);
        elseif (result2 < cnn2_result)
            if(result_Frame1(1)~=save_Frame(i,1))||(result_Frame1(2)~=save_Frame(i,2))
                if result_Frame2(1)~=save_Frame(i,1)||(result_Frame2(2)~=save_Frame(i,2))
                    result3 = result2;
                    result_Frame3 = result_Frame2;
                end
                result2 = cnn2_result;
                result_Frame2 = save_Frame(i,:);
            end
        elseif (result3 < cnn2_result)
            if (result_Frame1(1)~=save_Frame(i,1))||(result_Frame1(2)~=save_Frame(i,2))
                if (result_Frame2(1)~=save_Frame(i,1))||(result_Frame2(2)~=save_Frame(i,2))
                    result3 = cnn2_result;
                    result_Frame3 = save_Frame(i,:);
                end
            end
        end
    end
    mean_coordinates=mean(save_Frame(:,1:2));
    a1 = sum(abs(mean_coordinates-result_Frame1(1:2)));
    a2 = sum(abs(mean_coordinates-result_Frame2(1:2)));
    a3 = sum(abs(mean_coordinates-result_Frame3(1:2)));
    if (a1<a2)&&(a1<a3)
        result_Frame =  result_Frame1;
    elseif a2<a3
        result_Frame =  result_Frame2; 
    else
        result_Frame =  result_Frame3;
    end
    toc;
    img2= draw_frame(img, result_Frame(1), result_Frame(2), result_Frame(3),result_Frame(4), result_Frame(5));
    mingzhi = sprintf('%s/%04d.png',result_dir,iii);
    imwrite(img2,mingzhi);
end
% p_p = (result_Frame(1)-1)*img_size(2)+result_Frame(2);
% point = piont_xyz(points,p_p,img_size(2));
% msg.Position.X = point(1);
% msg.Position.Y = point(2);
% msg.Position.Z = point(3)-0.1;
% %{
% quaternion = posture_quaternion(points,point,result_Frame,img_size(2));
% msg.Orientation.X = quaternion(1);
% msg.Orientation.Y = quaternion(2);
% msg.Orientation.Z = quaternion(3);
% msg.Orientation.W = quaternion(4);
% %}
% msg.Orientation.X = 0;
% msg.Orientation.Y = 0;
% msg.Orientation.Z = sin((pi/2+result_Frame(5))/2);
% msg.Orientation.W = cos((pi/2+result_Frame(5))/2);
% 
% send(pub_msg,msg);
% pause(2);

