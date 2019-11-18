load cnn0;
load cnn1;
load cnn2;
%load data_005
load cnn_deep;
%msg_points= receive(sub_points);
points=readXYZ(msg_points);
points_data = Get_Deep_Img_xyz(points);
points_img = Match_points_Image(points_data);
points_data_image = Deal_points_Img(points_img);

deepdata = Get_Deep_Img(msg_points);
deep_img = Match_Deep_Image(deepdata);
deep_data_image = Deal_Deep_Img(deep_img);
deep_0_1 = Normalize(deep_data_image);%归一�?
disp('get points');
%msg_image = receive(sub_image);
%img = readImage(msg_image);
disp('get img');

r_long = 32;
r_wide = 16;
save_Frame = [[],[]];
save_data = [[],[],[],[]];
result = 0;
n_1 = 1;
n_2 = 0;
 
deep_size = size(deep_0_1);
img_size = size(img);

 tic
for multiple_i = 1:2:8
    multiple = multiple_i;
    img1 = change_size(img, img_size(2)/multiple, img_size(1)/multiple);
    img2 = img1;
    deepdata1 = change_size_deep(deep_0_1,deep_size(2)/multiple, deep_size(1)/multiple);
    img_size1 = size(img1);
    img_judge = [[],[]];
    n=40;
    img_judge_i =1;
    for i_1 = round(60/multiple):n:(img_size1(1)-round(60/multiple)-n)
        for i_2 = round(60/multiple):n:(img_size1(2)-round(60/multiple)-n)
            img_f = img1(i_1:i_1+n-1,i_2:i_2+n-1,:);
            data = double(img_f)/255;
            cnn0 = cnn_feedforward(cnn0, data);
            cnn1_result = cnn0.full_layer{1}.o; 
            if cnn1_result >0.999
                img_judge(img_judge_i,:)=[i_1+3 i_2+3];
                img_judge_i = img_judge_i + 1;
                img_judge(img_judge_i,:)=[i_1+10 i_2+3];
                img_judge_i = img_judge_i + 1;
                img_judge(img_judge_i,:)=[i_1+3 i_2+10];
                img_judge_i = img_judge_i + 1;
                img_judge(img_judge_i,:)=[i_1+10 i_2+10];
                img_judge_i = img_judge_i + 1;
                img2(i_1:i_1+n-1,i_2:i_2+n-1,2)=100;
            end
        end  
    end
    for i = 1:img_judge_i-1
        
        img_f = Dig_Img (img1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  0);
        if  ~isempty(img_f)
            img_f = img_f/255;
            cnn1 = cnn_feedforward(cnn1, img_f);
            cnn1_result = cnn1.full_layer{1}.o; 

            deep_f = Dig_deep (deepdata1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  0);
            cnn_deep = cnn_feedforward_deep(cnn_deep,deep_f);
            cnn_deep_result = cnn_deep.full_layer{1}.o; 

            if cnn1_result<0.2;
                continue;
            end
            if (cnn1_result>0.5)&&(cnn_deep_result>0.5)
                save_Frame(n_1,:) = [img_judge(i,1)*multiple img_judge(i,2)*multiple r_long*multiple r_wide*multiple 0 cnn1_result];
                save_data(:,:,:,n_1)  =img_f;
                n_1 = n_1 + 1;
            end
            for r = pi/8:pi/8:pi*7/8
                img_f = Dig_Img (img1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  r);
                if  isempty(img_f)
                    continue;
                end
                img_f = img_f/255;
                cnn1 = cnn_feedforward(cnn1, img_f);
                cnn1_result = cnn1.full_layer{1}.o; 

                deep_f = Dig_deep (deepdata1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  r);
                cnn_deep = cnn_feedforward_deep(cnn_deep,deep_f);
                cnn_deep_result = cnn_deep.full_layer{1}.o; 

                if (cnn1_result>0.5)&&(cnn_deep_result>0.5)
                    save_Frame(n_1,:) = [img_judge(i,1)*multiple img_judge(i,2)*multiple r_long*multiple r_wide*multiple r cnn1_result];
                    save_data(:,:,:,n_1)  = img_f;
                    n_1 = n_1 + 1;
                end
                n_2 = n_2+1;
            end
        else
            for r = pi/8:pi/8:pi*7/8
                img_f = Dig_Img (img1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  r);
                if  isempty(img_f)
                    continue;
                end
                img_f = img_f/255;
                cnn1 = cnn_feedforward(cnn1, img_f);
                cnn1_result = cnn1.full_layer{1}.o; 

                deep_f = Dig_deep (deepdata1,img_judge(i,1), img_judge(i,2), r_long, r_wide,  r);
                cnn_deep = cnn_feedforward_deep(cnn_deep,deep_f);
                cnn_deep_result = cnn_deep.full_layer{1}.o; 

                if (cnn1_result>0.5)&&(cnn_deep_result>0.5)
                    save_Frame(n_1,:) = [img_judge(i,1)*multiple img_judge(i,2)*multiple r_long*multiple r_wide*multiple r cnn1_result];
                    save_data(:,:,:,n_1)  = img_f;
                    n_1 = n_1 + 1;
                end
                n_2 = n_2+1;
            end
        end
    end
end
if  isempty(save_data)
    disp('NaN');
    exit;
end

result1 = 0;
result2 = 0;
result3 = 0;
result_Frame1 = [0 0 0 0 0 0];
result_Frame2 = [0 0 0 0 0 0];
result_Frame3 = [0 0 0 0 0 0];
cnn2_n = size(save_data,4);

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
x1 = points_data_image(result_Frame(1),result_Frame(2),1)
y1 = points_data_image(result_Frame(1),result_Frame(2),2)
z1 = points_data_image(result_Frame(1),result_Frame(2),3)
if z1>0.136
    z1=0.136;
end
% msg.Position.X = x1+0.015;
% msg.Position.Y = y1-0.02;
% msg.Position.Z = z1-0.02;
% 
% msg.Orientation.X = result_Frame(5);
% msg.Orientation.Y = 0;
% msg.Orientation.Z = 0;
% msg.Orientation.W = 0;
% send(pub_msg,msg);
% pause(2);
% 
% save data_005.mat msg_points points points_data_image deep_data_image deep_0_1 img save_Frame result_Frame result_Frame1 result_Frame2 result_Frame3
