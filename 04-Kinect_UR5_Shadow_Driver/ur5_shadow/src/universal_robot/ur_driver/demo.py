#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import copy
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg


ur5_pose=[]
def read_pose(data):
    global ur5_pose
    ur5_pose=[data.position.x,data.position.y,data.position.z,
              data.orientation.x,data.orientation.y,data.orientation.z,data.orientation.w]

if __name__ == '__main__':
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('demo',anonymous=True)
    rospy.Subscriber('/ros_msg',geometry_msgs.msg.Pose,read_pose)
    rospy.sleep(1)
    robot=moveit_commander.RobotCommander()
    scene=moveit_commander.PlanningSceneInterface()
    group=moveit_commander.MoveGroupCommander('arm')
    group.set_pose_reference_frame('/ur5_arm_base_link')

    print '========reference frame:%s' %group.get_pose_reference_frame()
    print '========reference end:%s' %group.get_end_effector_link()
    print '========robot groups:'
    print robot.get_group_names()
    print '=======printing robot state'
    print robot.get_current_state()
    print '==============================='


    joints_names=['ur5_arm_shoulder_pan_joint','ur5_arm_shoulder_lift_joint',
                  'ur5_arm_elbow_joint','ur5_arm_wrist_1_joint',
                  'ur5_arm_wrist_2_joint','ur5_arm_wrist_3_joint']
    joints_values=[-0.6795108954059046, -0.97711688676943, 1.2615337371826172, -0.2705925146685999, 1.627468228340149, -1.6714065710650843]

    start_states=[-0.20480472246278936, -2.0412190596209925, 1.7673931121826172, -1.396710220967428, 1.5672399997711182, -1.6695974508868616]
#    final_states = [ 2.989414691925049, -1.0977328459369105, -1.5466106573687952, -0.4654811064349573, 1.593137264251709, 1.4916716814041138]
#    final_states = [-0.20541602769960576, -2.292988125477926, 1.7679438591003418, 0.3065863847732544, 1.5677070617675781, -1.6698010603534144]
    final_states =[ -0.3472960630999964, -0.9690325895892542, 1.1105599403381348, -0.09819347063173467, 0.5922203660011292, -1.5322297255145472]
#    start_states = [ 2.9893548488616943, -1.096809212361471, -1.546154801045553, 1.0707706212997437, 1.592921495437622, 0.1688794493675232]
#    start_states = [-0.794627,-0.377616,1.89491, -1.396710220967428, 1.5672399997711182, -1.6695974508868616]
    group.set_joint_value_target(start_states)

    plan0=group.plan()
    group.execute(plan0)
    print plan0.joint_trajectory.points[0].positions[0]  #points是list,points[0]是一个类
    print type(plan0.joint_trajectory.points[0])
    print 'plan0'
    print 'input s to start ur5'
    if raw_input() == 's':
	    pass
    
    group.set_joint_value_target(joints_values)
   
    plan2=group.plan()
  #  print plan2
    
    group.execute(plan2)
    
    print 'plan2,c to continue'
    #rospy.sleep(5)
    if raw_input() == 'c':
        pass
    #防止手超过物体，规划时碰撞物体，所以y轴位置减少10cm
    pose_target=geometry_msgs.msg.Pose()
    print 'ur5_pose',ur5_pose

    pose_target.orientation.w=ur5_pose[6]
    pose_target.orientation.x=ur5_pose[3]
    pose_target.orientation.y=ur5_pose[4]
    pose_target.orientation.z=ur5_pose[5]

    pose_target.position.x=ur5_pose[0]
    pose_target.position.y=-0.4091
    pose_target.position.z=ur5_pose[2]
    group.set_pose_target(pose_target)
    plan3=group.plan()
    length = len(plan3.joint_trajectory.points)
    first_joint = plan3.joint_trajectory.points[length-1].positions[0]
    fourth_joint = plan3.joint_trajectory.points[length-1].positions[3]
    print plan3
#    if raw_input == 'p':
#	pass
    while (first_joint > 0.07 or first_joint <-1.3 or fourth_joint < -4 or fourth_joint >1.7):
        plan3=group.plan()
        length = len(plan3.joint_trajectory.points)
        first_joint = plan3.joint_trajectory.points[length-1].positions[0]
        fourth_joint = plan3.joint_trajectory.points[length-1].positions[3]
        print first_joint,fourth_joint
    # display_trajectory=moveit_msgs.msg.DisplayTrajectory()
    # display_trajectory.trajectory_start=robot.get_current_state()
    # display_trajectory.trajectory.append(plan1)
    # display_trajectory_publisher.publish(display_trajectory)
    # rospy.sleep(10)
    group.execute(plan3)
    if raw_input() == '3':
        pass

    pose_target=geometry_msgs.msg.Pose()
    pose_target.orientation.w=ur5_pose[6]
    pose_target.orientation.x=ur5_pose[3]
    pose_target.orientation.y=ur5_pose[4]
    pose_target.orientation.z=ur5_pose[5]

    pose_target.position.x=ur5_pose[0]
    pose_target.position.y=-0.2791
#    pose_target.position.y=-0.2991
    pose_target.position.z=ur5_pose[2]
    group.set_pose_target(pose_target)
    plan1=group.plan()
    length = len(plan1.joint_trajectory.points)
    first_joint = plan1.joint_trajectory.points[length-1].positions[0]
#    if raw_input == 'p':
#       pass
    while (first_joint > 0.0):
        plan1=group.plan()
        length = len(plan1.joint_trajectory.points)
        first_joint = plan1.joint_trajectory.points[length-1].positions[0]
        print first_joint

    print plan1
    print 'c to continue'
    if raw_input() == 'c':
        pass
    # display_trajectory=moveit_msgs.msg.DisplayTrajectory()
    # display_trajectory.trajectory_start=robot.get_current_state()
    # display_trajectory.trajectory.append(plan1)
    # display_trajectory_publisher.publish(display_trajectory)
    # rospy.sleep(10)
    group.execute(plan1)
    
    group.set_joint_value_target(final_states)
    plan3=group.plan()
    if raw_input() == 'ok':
        group.execute(plan3)
    print 'plan3'
