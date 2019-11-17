#!/usr/bin/env python

import rosbag
bag = rosbag.Bag('2017-06-02-00-32-37.bag')
for topic, msg, t in bag.read_messages('joint_states'):
    print msg.data
bag.close();