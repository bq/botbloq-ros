#!/usr/bin/env python

import sys
import rospy
import time
from wshubsapi import asynchronous

from comm_bridge.srv import *
from std_msgs.msg import String

pub = rospy.Publisher('mobile_show_toast', String, queue_size=10)


def get_acc_client(action):
    rospy.loginfo(action)
    try:
        get_sensor = rospy.ServiceProxy('get_sensor', GetSensor)
        resp = get_sensor("acc")
        print resp.respond
        pub.publish("clicked: {}".format(action))
    except rospy.ServiceException as e:
        print "Service call failed: %s" % e


def listener():
    rospy.loginfo("waiting for service")
    rospy.wait_for_service('get_sensor', 10)
    rospy.loginfo("service started")
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("mobile_action", String, get_acc_client)
    rospy.spin()


@asynchronous.asynchronous()
def talker():
    time.sleep(3)
    rate = rospy.Rate(0.2)  # 10hz
    while not rospy.is_shutdown():
        hello_str = "Message to mobile %s" % rospy.get_time()
        pub.publish(hello_str)
        rate.sleep()

if __name__ == '__main__':
    talker()
    listener()
