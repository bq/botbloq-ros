#!/usr/bin/env python
from hgext.inotify.linux.watcher import threshold

import rospy
from std_msgs.msg import String
from sensor_msgs.msg import  JointState
import threading

import sys
sys.path.append('/root/mraa/build/src/python')
import mraa

import ctypes

i2c = mraa.I2c(0)

conversion_vel = 90.0/6.25


class Listener():
    def __init__(self):
        self.lock = threading.Lock()
        rospy.init_node('listener', anonymous=True)
        rospy.Subscriber("/joint_states", JointState, self.callback)
        i2c.address(0x05)
        i2c.writeByte(ctypes.c_uint8(183).value)
        rospy.sleep(rospy.Duration(0, 5000000))
        i2c.writeByte(ctypes.c_uint8(1).value)
        rospy.sleep(rospy.Duration(0, 5000000))
        i2c.address(0x04)
        i2c.writeByte(ctypes.c_uint8(183).value)
        rospy.sleep(rospy.Duration(0, 5000000))
        i2c.writeByte(ctypes.c_uint8(1).value)
        rospy.sleep(rospy.Duration(0, 5000000))
        i2c.address(0x05)
        i2c.writeByte(ctypes.c_uint8(183).value)
        rospy.sleep(rospy.Duration(0, 5000000))
        i2c.writeByte(ctypes.c_uint8(1).value)
        rospy.sleep(rospy.Duration(0, 5000000))
        i2c.address(0x06)
        i2c.writeByte(ctypes.c_uint8(183).value)
        rospy.sleep(rospy.Duration(0, 5000000))
        i2c.writeByte(ctypes.c_uint8(1).value)
        rospy.sleep(rospy.Duration(0, 5000000))

        rospy.spin()


    def callback(self,data):
        self.lock.acquire()
        try:
            mi_lista = [a * b for a, b in zip(data.velocity, [b + conversion_vel for b in [0] * len(data.velocity)])]
            print [round(c + 90) for c in mi_lista]
            i2c.address(0x05)
            i2c.writeByte(ctypes.c_uint8(182).value)
            rospy.sleep(rospy.Duration(0, 5000000))
            i2c.writeByte(ctypes.c_uint8(mi_lista[2]).value)
            rospy.sleep(rospy.Duration(0, 5000000))

            # RR
            i2c.address(0x04)
            i2c.writeByte(ctypes.c_uint8(182).value)
            rospy.sleep(rospy.Duration(0, 5000000))
            i2c.writeByte(ctypes.c_uint8(mi_lista[4]).value)
            rospy.sleep(rospy.Duration(0, 5000000))

            # LF
            i2c.address(0x03)
            i2c.writeByte(ctypes.c_uint8(182).value)
            rospy.sleep(rospy.Duration(0, 5000000))
            i2c.writeByte(ctypes.c_uint8(mi_lista[1]).value)
            rospy.sleep(rospy.Duration(0, 5000000))

            # LR
            i2c.address(0x06)
            i2c.writeByte(ctypes.c_uint8(182).value)
            rospy.sleep(rospy.Duration(0, 5000000))
            i2c.writeByte(ctypes.c_uint8(mi_lista[3]).value)
            rospy.sleep(rospy.Duration(0, 5000000))
        except ValueError as e:
            print e
        finally:
            self.lock.release()



if __name__ == '__main__':
    try:
        Listener()
    except rospy.ROSInterruptException:
        pass