%rostopic list
pub_msg_points = rospublisher('/ros_msg_points','msg_custom/msg_float64');
pause(2);
msg_points = rosmessage(pub_msg_points);

msg_points.X1 = E1(1,4);
msg_points.Y1 =  E1(2,4);
msg_points.Z1 =  E1(3,4);
msg_points.X2 =  E2(1,4);
msg_points.Y2 =  E2(2,4);
msg_points.Z2 =  E2(3,4);
msg_points.X3 =  E3(1,4);
msg_points.Y3 =  E3(2,4);
msg_points.Z3 =  E3(3,4);
msg_points.X4 =  E4(1,4);
msg_points.Y4 =  E4(2,4);
msg_points.Z4 =  E4(3,4);
% msg_points.X1 = point_finger(2,1);
% msg_points.Y1 = point_finger(2,2);
% msg_points.Z1 = point_finger(2,3);
% msg_points.X2 = point_finger(3,1);
% msg_points.Y2 = point_finger(3,2);
% msg_points.Z2 = point_finger(3,3);
% msg_points.X3 = point_finger(4,1);
% msg_points.Y3 = point_finger(4,2);
% msg_points.Z3 = point_finger(4,3);
% msg_points.X4 = point_finger(5,1);
% msg_points.Y4 = point_finger(5,2);
% msg_points.Z4 = point_finger(5,3);
send(pub_msg_points,msg_points);
pause(2);