#!/usr/bin/env python3
import rospy
from nav_sensors.msg import DVL_MSG

def dvl_cb(dvl_msg):
    rospy.loginfo(rospy.get_caller_id() + "Velocities %s", dvl_msg.data.velocity)
    rospy.loginfo(rospy.get_caller_id() + "Velocity Error %s", dvl_msg.data.vel_error)
    rospy.loginfo(rospy.get_caller_id() + "Beams %s", dvl_msg.data.beams)
    rospy.loginfo(rospy.get_caller_id() + "Mean Bottom Range %s", dvl_msg.data.mean_bottom_range)
    rospy.loginfo(rospy.get_caller_id() + "Speed of Sound %s", dvl_msg.data.speed_of_sound)
    rospy.loginfo(rospy.get_caller_id() + "Input Voltage %s", dvl_msg.power.input_voltage)
    rospy.loginfo(rospy.get_caller_id() + "Transmit Voltage %s", dvl_msg.power.transmit_voltage)
    rospy.loginfo(rospy.get_caller_id() + "Transmit Current %s", dvl_msg.power.transmit_current)

    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("/hydrus/dvl", DVL_MSG, dvl_cb)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()