#!/usr/bin/env python3

from rospy import Publisher, Rate, init_node, is_shutdown, Time, get_param
from std_msgs.msg import Header
from src.lib.Wayfinder.dvl import Dvl
from dvl.msg import Raw_DVL # this import is giving problems 
from time import sleep

_NODE_NAME = get_param('DVL_NODE_NAME')
_TOPIC_NAME = get_param('DVL_TOPIC_NAME') 

class DVL_node:
    """ TODO: DOCUMENT"""
    TRANSMISSION_DELAY = get_param('DVL_TRANSMISSION_DELAY')

    def __init__(self, TOPIC_NAME, NODE_NAME):
        """ TODO: DOCUMENT"""

        self.dvl_msg = Raw_DVL() # Create message instance, instance will be reused by node to provide information
        self.pub = Publisher(TOPIC_NAME, Raw_ZED, queue_size=get_param('DVL_QUEUE_SIZE')) # Create ros publisher to given arguments
        init_node(NODE_NAME, anonymous=True) # Init ros node
        self.rate = Rate(get_param('DVL_RATE')) # Set rate for ros node


    def publish(self):
        """ TODO: DOCUMENT"""
        if self._inteface():            
            self.dvl_msg.header = self._get_msg_header() # Sets messageheader to message
            self.pub.publish(self.dvl_msg) # Message is published to ros with publisher
        self.rate.sleep()
        return


    def _interface(self):
        """ TODO: DOCUMENT"""


    def _get_msg_header(self):
        """ TODO: DOCUMENT"""


        msg_header = Header()
        msg_header.stamp = Time.now()
        return msg_header