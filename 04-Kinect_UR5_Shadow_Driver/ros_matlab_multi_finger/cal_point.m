load cnn_multi_finger
point_finger = [[],[]];
[Frame1, Frame2 , Frame3, Frame4] = Fixed_Point_Finger( img, result_Frame,cnn_multi_finger );

point_finger(1,:) = point_xyz(points_data_image,result_Frame); 

point_0 = point_finger(1,:);
point_1 = point_xyz(points_data_image,result_Frame+[10 0 0 0 0 0]);
point_2 = point_xyz(points_data_image,result_Frame+[0 10 0 0 0 0]);
dif_1 = (point_1-point_0)/10;
dif_2 = (point_2-point_0)/10;
point_finger(2,:) = point_0 + dif_1*(Frame1(1)-result_Frame(1)) + dif_2*(Frame1(2)-result_Frame(2));
point_finger(3,:) = point_0 + dif_1*(Frame2(1)-result_Frame(1)) + dif_2*(Frame2(2)-result_Frame(2));
point_finger(4,:) = point_0 + dif_1*(Frame3(1)-result_Frame(1)) + dif_2*(Frame3(2)-result_Frame(2));
point_finger(5,:) = point_0 + dif_1*(Frame4(1)-result_Frame(1)) + dif_2*(Frame4(2)-result_Frame(2));
point_finger(2,:) = point_finger(2,:)+[0 0 0.080];
point_finger(3,:) = point_finger(3,:)+[0 0 0.080];
point_finger(4,:) = point_finger(4,:)+[0 0 0.080];
point_finger(5,:) = point_finger(5,:)+[0 0 0.080];

 E1 =  c_to_s( wTh, point_finger(2,:),result_Frame(5),cos_xi,sin_xi);
 E2 =  c_to_s( wTh, point_finger(3,:),result_Frame(5),cos_xi,sin_xi);
 E3 =  c_to_s( wTh, point_finger(4,:),result_Frame(5),cos_xi,sin_xi);
 E4 =  c_to_s( wTh, point_finger(5,:),result_Frame(5),cos_xi,sin_xi);

img2= draw_frame(img, result_Frame(1), result_Frame(2), result_Frame(3),result_Frame(4), result_Frame(5));
if  ~isempty(Frame1)
    img2= draw_frame(img2, Frame1(1), Frame1(2), Frame1(3),Frame1(4), Frame1(5));
end
if  ~isempty(Frame2)
    img2= draw_frame(img2, Frame2(1), Frame2(2), Frame2(3),Frame2(4), Frame2(5));
end
if  ~isempty(Frame3)
    img2= draw_frame(img2, Frame3(1), Frame3(2), Frame3(3),Frame3(4), Frame3(5));
end
if  ~isempty(Frame4)
    img2= draw_frame(img2, Frame4(1), Frame4(2), Frame4(3),Frame4(4), Frame4(5));
end

figure;
imshow(img2);