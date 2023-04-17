#!/usr/bin/env python3

import sys
from dvl_data import WayfinderDVL, Dummy_DVL
from time import sleep
from rospy import Publisher, Rate, init_node, is_shutdown, Time, get_time, get_param, ROSInterruptException, loginfo
from std_msgs.msg import Header
from nav_sensors.msg import DVL_MSG 

DVL_PORT = '/dev/ttyUSB0' # Default port for jetson, usually USB0
DVL_BAUDRATE = 115200 # Default value (Recommended is 9200 or 115200) (Currently not being used)

_SIM = 0 
_WAYFINDER = 1
_MODE = _WAYFINDER
_NODE_NAME = 'dvl_driver'
_TOPIC_NAME = '/hydrus/dvl'
_TRANSMISSION_RATE = 10

# _NODE_NAME = get_param('DVL_NODE_NAME')
# _TOPIC_NAME = get_param('DVL_TOPIC_NAME') 
# _TRANSMISSION_RATE = get_param('DVL_TRANSMISSION_RATE')

class DVL_Wrapper:
    """ TODO: DOCUMENT"""

    def __init__(self, NODE_NAME, TOPIC_NAME, RATE, MODE = _WAYFINDER):
        """ TODO: DOCUMENT"""

        if MODE == _SIM:
            self.dvl = Dummy_DVL()
            # SETUP SIMULATION
            while not self.dvl.connect(DVL_PORT, DVL_BAUDRATE): 
                pass
            self.dvl.reset_to_defauls()
            self.dvl.enter_command_mode()
            self.dvl.set_time()
            self.dvl.exit_command_mode()
            self.dvl.data_cb()
            self.data = self.dvl.get_data()
            print(self.data)
            print(self.data.values())
            print(self.data['DVL_Data']['sys_info']['version'])
            self.dvl.disconnect()
        else: # otherwise _WAYFINDER mode will be exectued 
            self.dvl = WayfinderDVL() # Create instance of Teledyne RD Instruments Wayfinder Doppler Velocity Logger (DVL)
            
        self.dvl_msg = DVL_MSG() # Create a ROS message instance to store DVL messages of Wayfinder of Simulated DVL data.
        #self.pub = Publisher(TOPIC_NAME, DVL_MSG, queue_size=get_param('DVL_QUEUE_SIZE')) # Create ros publisher to given arguments
        self.pub = Publisher(TOPIC_NAME, DVL_MSG, queue_size= 10) # Instance of ROS Publisher to publish DVL information 
        init_node(NODE_NAME, anonymous=True) # Initialize ROS node
        self.rate = Rate(RATE) 
        self.publish()


    def publish(self):
        """ TODO: DOCUMENT"""
        while not is_shutdown():
            self._prepare_msg()
            loginfo(self.dvl_msg)
            self.pub.publish(self.dvl_msg)
            self.rate.sleep() # Set publishing rate for DVL node


    def _get_msg_header(self):
        """ TODO: DOCUMENT"""


        msg_header = Header()
        msg_header.stamp = Time.now()
        msg_header.frame_id = 'dvl_frame'
        return msg_header
    
    def _prepare_msg(self):
        
        msg = self.dvl_msg
        data = self.dvl.get_data()
        print(data.values())
        sys_info = data['DVL_Data']['sys_info']
        data = data['DVL_Data']['data']
        power_info = data['DVL_Data']['power_info']


        msg.header = self._get_msg_header() # Sets messageheader to message


        # msg.system_info.year = sys_info['year']
        # msg.system_info.month = sys_info['month']
        # msg.system_info.day = sys_info['day']
        # msg.system_info.hour = sys_info['hour']
        # msg.system_info.minute = sys_info['minute']
        # msg.system_info.second = sys_info['second']
        # msg.system_info.coordinate_system = sys_info['coordinate_system']
        
        msg.data.velocity.x, msg.data.velocity.y, msg.data.velocity.z = data['velocity'][0], data['velocity'][1], data['velocity'][2]
        msg.data.vel_error = data['velocity_error']

        msg.data.beams.beam1 = data['beams'][0]
        msg.data.beams.beam2 = data['beams'][1]
        msg.data.beams.beam3 = data['beams'][2]
        msg.data.beams.beam4 = data['beams'][3]
        # msg.data.position.x = data['position'][0]
        # msg.data.position.y = data['position'][1]
        # msg.data.position.z = data['position'][2]
        msg.data.mean_bottom_range = data['mean_bottom_range']
        msg.data.speed_of_sound = data['speed_of_sound']
        msg.data.BT_status = data['BT_status']
        
        msg.power.input_voltage = power_info['input_voltage']
        msg.power.transmit_voltage = power_info['transmit_voltage']
        msg.power.transmit_current = power_info['transmit_current']
        
        #serial number
        msg.serial_number = power_info['serial_number']

    
    def _prepare_gen_msg(self):
        
        msg = self.dvl_msg
        sys_info = self.data['DVL_Data']['sys_info']
        data = self.data['DVL_Data']['data']
        power_info = self.data['DVL_Data']['power_info']


        msg.header = self._get_msg_header() # Sets messageheader to message
        msg.system_info.packet_count = sys_info['packet_count']
        msg.system_info.packet_id = sys_info['packet_id']
        msg.system_info.version = sys_info['version']
        msg.system_info.system_type = sys_info['system_type']
        msg.system_info.system_subtype = sys_info['system_subtype']
        msg.system_info.fw_major_version = sys_info['fw_major_version']
        msg.system_info.fw_minor_version = sys_info['fw_minor_version']
        msg.system_info.fw_patch_version = sys_info['fw_patch_version']
        msg.system_info.fw_build_version = sys_info['fw_build_version']
        msg.system_info.year = sys_info['year']
        msg.system_info.month = sys_info['month']
        msg.system_info.day = sys_info['day']
        msg.system_info.hour = sys_info['hour']
        msg.system_info.minute = sys_info['minute']
        msg.system_info.second = sys_info['second']
        msg.system_info.coordinate_system = sys_info['coordinate_system']
        
        msg.data.velocity.x, msg.data.velocity.y, msg.data.velocity.z = data['velocity'][0], data['velocity'][1], data['velocity'][2]
        msg.data.vel_error = data['velocity_error']

        msg.data.position.x = data['position'][0]
        msg.data.position.y = data['position'][1]
        msg.data.position.z = data['position'][2]
        
        msg.data.beams.beam1 = data['beams'][0]
        msg.data.beams.beam2 = data['beams'][1]
        msg.data.beams.beam3 = data['beams'][2]
        msg.data.beams.beam4 = data['beams'][3]
        msg.data.mean_bottom_range = data['mean_bottom_range']
        msg.data.speed_of_sound = data['speed_of_sound']
        msg.data.BT_status = data['BT_status']
        
        msg.power.input_voltage = power_info['input_voltage']
        msg.power.transmit_voltage = power_info['transmit_voltage']
        msg.power.transmit_current = power_info['transmit_current']


if __name__ == '__main__':
    try:
        node = DVL_Wrapper(_NODE_NAME, _TOPIC_NAME, _TRANSMISSION_RATE, _MODE)
    except ROSInterruptException:
        pass