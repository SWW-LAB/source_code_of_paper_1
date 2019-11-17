#!/usr/bin/env python
import rospy
import roslib
import actionlib
roslib.load_manifest('arm_trajectory')
import arm_trajectory.msg

def jointsgoal_client():
    client=actionlib.SimpleActionClient('jointsgoal',arm_trajectory.msg.jointsgoalAction)

    goal=arm_trajectory.msg.jointsgoalGoal()
    goal.jointsgoal=[0,0,0,0,0]

    client.wait_for_result()
    client.send_goal(goal)

    client.wait_for_result()

    return client.get_result()

if __name__=='__name__':

    rospy.init_node('jointsgoal_client')
    result=jointsgoal_client()





