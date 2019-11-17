#!/usr/bin/env python
# -*- coding: utf-8 -*-
#采集UR5中末端执行器关于基座的转换关系
import roslib
import rospy
import math
import tf
import geometry_msgs.msg
import turtlesim.srv
def write_data(filename,data):
    with open(filename, 'a+') as file:
        file.write(str(data)+'\n')

if __name__ == '__main__':
    rospy.init_node('ur5_tf_listener')
    listener = tf.TransformListener()
    transfile_name='tf_trans.txt'
    rotsfile_name='tf_rots.txt'
    while not rospy.is_shutdown():
        if raw_input() == 's':
            (trans, rot) = listener.lookupTransform('/ur5_arm_base_link', '/ur5_arm_ee_link', rospy.Time(0))
            print trans
	    print rot
            write_data(transfile_name, trans)
            write_data(rotsfile_name, rot)


