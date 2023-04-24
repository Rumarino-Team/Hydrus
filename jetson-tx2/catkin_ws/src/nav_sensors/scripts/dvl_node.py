# Copyright (c) 2023 Real-Time Development Center (RTDC) Project
# All rights reserved.
#!/usr/bin/env python3
#

# from rospy import Publisher, Rate, init_node, is_shutdown, Time, get_time, get_param, ROSInterruptException, loginfo
# Imports for ROS tools
import rospy  # ROS client library for python
# Autogenerated ros message used to integrate timestamp data on a given coordinate frame
from std_msgs.msg import Header
# Autogenerated ROS message used to integrate the Wayfinder Doppler Velocity Logger (DVL)
from nav_sensors.msg import DVL_MSG

# Imports for Teledyne Marine RDIntruments Wayfinder Doppler Velocity Logger (DVL)
from dvl.dvl import Dvl  # Import wayfinder dvl module from Teledyne Marine RDI
# Import BinaryDataOutputGroup Object from Teleyne Marine RDI
from dvl.system import OutputData
import datetime as dt  # To set real-time clock
import math  # To check for Not a Number (NaN) Velocities
import numpy as np  # Used for mathematical calculations
import traceback  # Extract and print information about stack traces

import sys
import os  # To generate path
# Will delay ping execution for a given number of seconds.
from time import sleep
from io import FileIO  # For log files


_SIM = 0
_WAYFINDER = 1
_MODE = _WAYFINDER
_NODE_NAME = 'dvl_driver'
_TOPIC_NAME = '/hydrus/dvl'
_TRANSMISSION_RATE = 10
_QUEUE_SIZE = 10
_FRAME_ID = 'dvl_frame'

# MACROS for Path to be used to determine the name of the logger file to be created based on the current
# log files inside the directory
_PREV_LOGGER_DIR = '/opt/catkin_ws/src/hydrus/jetson-tx2/catkin_ws/src/nav_sensors/logs'
_PREV_LOGGER_PREF = "dvl_log_attempts.txt"
_PREV_OS_PATH = os.path.join(_PREV_LOGGER_DIR, _PREV_LOGGER_PREF)

# MACROS for Path to be used as the log file for the dvl
_LOGGER_DIR = '/opt/catkin_ws/src/hydrus/jetson-tx2/catkin_ws/src/nav_sensors/logs'
_LOGGER_NUM_FORMAT = "%06d.log"
_WRITE_COMMAND = 'w'
_READ_COMMAND = 'r'

print(_PREV_OS_PATH)

# MACROS (M) for WAYFINDER (DVL) Macros Declarations

_WAYFINDER_SW_TRIGGER = 1
_WAYFINDER_BAUDRATE = 115200
_WAYFINDER_PORT = '/dev/ttyUSB0'
_WAYFINDER_MAX_DEPTH = 20
_WAYFINDER_MAX_RANGE = 20
_WAYFINDER_PING_TIME = 1  # second ping time

_ROLL_ANGLE = 0
_PITCH_ANGLE = 0
_YAW_ANGLE = 45

_START_TIME = 0

# MACROS for generated Wayfinder(DVL) Binary Data Output Group
MIN = 0
UINT8 = 2**8
UINT16 = 2**16
FLOAT32 = 2**32
DVL_VERSION = 76
CONECTION_LIMIT = 1
VEL_SIZE = 3
POS_SIZE = 3
BEAMS_SIZE = 4
ROUND_DELIMETER = 3


class WayfinderNode():
    """Help on ROS Python Executable Node Class for Teledyne's Marine RDI Wayfinder Doppler Velocity Logger (DVL) 

    NAME 
        WayfinderNode

    DESCRIPTION

    Args:
        ABC (_type_): Abstract Base Class for DVL Component

    PACKAGE CONTENTS

    """

    def __init__(self, NODE_NAME, TOPIC_NAME, RATE, MODE=_WAYFINDER):
        """ TODO: DOCUMENT"""
        self.setup_private_variables()
        self.setup_logger()
        self.setup_transposition_matrix()
        self.setup_ros_dependancies(NODE_NAME, TOPIC_NAME, RATE)
        self.setup_wayfinder()
        # if MODE == _SIM:
        #     self.dvl = Dummy_DVL()
        #     # SETUP SIMULATION
        #     while not self.dvl.connect(DVL_PORT, DVL_BAUDRATE):
        #         pass
        #     self.dvl.reset_to_defauls()
        #     self.dvl.enter_command_mode()
        #     self.dvl.set_time()
        #     self.dvl.exit_command_mode()
        #     self.dvl.data_cb()
        #     self.data = self.dvl.get_data()
        #     print(self.data)
        #     print(self.data.values())
        #     print(self.data['DVL_Data']['sys_info']['version'])
        #     self.dvl.disconnect()
        # else: # otherwise _WAYFINDER mode will be exectued
        # self.dvl = WayfinderDVL() # Create instance of Teledyne RD Instruments Wayfinder Doppler Velocity Logger (DVL)
        self.publish()

    def setup_private_variables(self):

        self._logger: FileIO
        self._log_file_counter: int
        self._ROLL: np.radians = np.radians(_ROLL_ANGLE)
        self._PITCH: np.radians = np.radians(_PITCH_ANGLE)  # y ->
        self._YAW: np.radians = np.radians(_YAW_ANGLE)  # z ->
        self._prev_time: int = _START_TIME

    def setup_logger(self):
        """Configures the data logging
            Make sure folder exists
        """

        try:
            # open prev log file to view the current log_num
            with open(_PREV_OS_PATH, _READ_COMMAND) as prev_log:
                # extract log_num
                self._log_file_counter = int(prev_log.readline()) + 1
        except Exception:
            # 0 will be assigned if there is not a number
            self._log_file_counter = 0

        # Update log_num
        with open(_PREV_OS_PATH, _WRITE_COMMAND) as lastLog:
            lastLog.write("%d\n" % self._log_file_counter)

        # Create logger
        self._logger = open(os.path.join(
            _LOGGER_DIR, _LOGGER_NUM_FORMAT % self._log_file_counter), _WRITE_COMMAND)

    def setup_transposition_matrix(self):
        """
        Sets the Instrument to Ship rotation according to Wayfinder Manual
        """

        self._transposition_matrix = np.array(
            [
                [np.cos(self._YAW) * np.cos(self._PITCH),
                 np.cos(self._YAW) * np.sin(self._PITCH) *
                    np.sin(self._ROLL) - np.sin(self._YAW) *
                 np.cos(self._ROLL),
                 np.cos(self._YAW) * np.sin(self._PITCH) *
                    np.cos(self._ROLL) + np.sin(self._YAW) * np.sin(self._ROLL)
                 ],
                [np.sin(self._YAW) * np.cos(self._PITCH),
                 np.sin(self._YAW) * np.sin(self._PITCH) *
                    np.sin(self._ROLL) + np.cos(self._YAW) *
                 np.cos(self._ROLL),
                 np.sin(self._YAW) * np.sin(self._PITCH) *
                    np.cos(self._ROLL) - np.cos(self._YAW) * np.sin(self._ROLL)
                 ],
                [-np.sin(self._PITCH),
                 np.cos(self._PITCH) * np.sin(self._ROLL),
                 np.cos(self._PITCH) * np.cos(self._ROLL)
                 ]
            ])

    def setup_ros_dependancies(self, NODE_NAME, TOPIC_NAME, RATE):
        # Create a ROS message instance to store DVL messages of Wayfinder of Simulated DVL data.
        self.dvl_msg = DVL_MSG()
        # Instance of ROS Publisher to publish DVL information
        self.pub = rospy.Publisher(TOPIC_NAME, DVL_MSG, queue_size=_QUEUE_SIZE)
        rospy.init_node(NODE_NAME, anonymous=True)  # Initialize ROS node
        self.rate = rospy.Rate(RATE)

    def setup_wayfinder(self):

        # Create instance of Teledyne Marine RDInstruments Doppler Velocity Logger
        self.wayfinder = Dvl()
        msg = self.dvl_msg

        # Use the connect method of the wayfinder to create a connection with the sensor at given port and baudrate:
        # If the wayfinder is not not connected,
        while not self.wayfinder.connect(_WAYFINDER_PORT, _WAYFINDER_BAUDRATE):
            rospy.logerr("Error connecting to Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL)")
            self._logger.write("Error connecting to Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) \n")  # Log a connection error

        rospy.loginfo("Succesfully Connected to Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL)")
        # Otherwise, log that the connection was succesful
        self._logger.write("Succesfully Connected to Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) \n")

        if self.wayfinder.reset_to_defaults():  # reset sensor to default factory settings
            self._logger.write("DVL is reset to default factory settings \n")
        else:
            rospy.logerr("Failed to reset Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) to default factory settings ")
            self._logger.write(
                "Failed to reset Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) to default factory settings \n")

        # Use the get_setup() method of the Wayfinder wrapper to get user system setup and calibrate
        # the sensor to any oceanic environment.
        if not self.wayfinder.get_setup():  # If the wayfinder cannot get the setup of the system,
            rospy.logerr("Failed to get system setup of Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) ")
            # log a System Setup Error
            self._logger.write("Failed to get system setup of Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) \n")
        else:  # otherwise

            # Modify system setup structure:

            SETUP = self.wayfinder.system_setup  # declare the object for the sensor

            rospy.loginfo("System setup of Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) before calibration: %s " % (SETUP))

            # log the system setup before calibration
            self._logger.write('Setup Before Calibration %s \n' % SETUP)

            # Set software trigger flag
            SETUP.software_trigger = _WAYFINDER_SW_TRIGGER
            # Set maximum tracking depth in meters
            SETUP.max_depth = _WAYFINDER_MAX_DEPTH
            # Set maximum vertical beam range in meters
            SETUP.max_vb_range = _WAYFINDER_MAX_RANGE

            # extract software trigger information (0-disabled, 1-enabled)
            msg.setup.sw_trigger = SETUP.software_trigger
            # extract maximum tracking depth information (in meters)
            msg.setup.max_depth = SETUP.max_depth
            # extract maximum vertical beam range information (in meters)
            msg.setup.max_track_range = SETUP.max_vb_range

            rospy.loginfo("System setup of Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) after calibration: %s " % (SETUP))

            # log system setup after calibration
            self._logger.write('System setup of Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) after calibration: %s \n' % SETUP)

            # Setup new calibration settings
            # if the setup cannot be set,
            if not self.wayfinder.set_setup(SETUP):
                # log a system setup error to rosconsole
                rospy.loginfo("Failed system setup of Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL)")
                # log a system setup error to log file
                self._logger.write("Failed system setup of Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) \n")
            else:  # otherwise

                rospy.loginfo("Registering ondata callback function for Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL)")
                # register callback function to be exectuted
                self.wayfinder.register_ondata_callback(self.binary_data_output_group_cb, None)

                if not self.wayfinder.exit_command_mode():
                    rospy.logerr("Failed to exit the command mode of Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) ")
                    self._logger.write("Failed to exit the command mode of Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) \n")

                rospy.loginfo('Entering the command mode of the Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL)')
                self._logger.write("Entering the command mode of the Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) \n")

                self.wayfinder.get_tests()  # achieve initial tests for the Wayfinder DVL
                # log Wayfinder interfal system tests
                self._logger.write('Sensor Tests: %s \n' %
                                   self.wayfinder.system_tests.tests)

                onesecond = dt.datetime.now() + dt.timedelta(seconds=_WAYFINDER_PING_TIME)
                target_time = dt.datetime(onesecond.year, onesecond.month, onesecond.day,
                                          onesecond.hour, onesecond.minute, onesecond.second)

                current_time = dt.datetime.now()

                delta_time = target_time - current_time
                rospy.loginfo('Delta Time: %s' %(delta_time))
                sleep((delta_time).total_seconds())

                # Set time of Teledyne Wayfinder DVL to Real-Time Clock (RTC)
                self.wayfinder.set_time(dt.datetime.now())  # set time

    def binary_data_output_group_cb(self, output_data: OutputData, *args):
        """Callback function to be called each ping to extract the Binary Data Output Group of the DVL"""
        try:
            msg = self.dvl_msg

            time_stamp_us = output_data.get_date_time().timestamp() * 1e6
            self._logger.write("%9d: " % time_stamp_us)
            print("Time stamp us: ", time_stamp_us)

            # verify AP offset
            # dataTimestamp_boot_us = int(time_stamp_us + AP_offset_us)
            dataTimestamp_boot_us = int(time_stamp_us)
            # self._logger.write("%9d, " % dataTimestamp_boot_us)

            time = output_data.get_date_time()
            txt = time.strftime('%Y-%m-%d %H:%M:%S.%f')[:-3]
            self._logger.write("DVL TimeStamp {0}\n".format(txt))
            print('DVL Time (from examples): ', time)

            # Conditional statement that checks for Not A Number (NaN) velocities inside the Teledyne Wayfinder DVL
            if math.isnan(output_data.vel_x) or math.isnan(output_data.vel_y) or \
                    math.isnan(output_data.vel_z) or math.isnan(output_data.vel_err):
                rospy.logwarn('The Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) -XYZ velocity measurements are Not a Number (NaN) ')
                self._logger.write("The Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) -XYZ velocity measurements are Not a Number (NaN) '\n")
                return

            # Conditional statement that checks for valid velocities inside the Teledyne Wayfinder DVL
            if output_data.is_velocity_valid():  # If the velocities are valid

                # Extract Wayfinder DVL XYZ velocity measurements and store it using an np.array
                velocity = np.array(
                    [output_data.vel_x, output_data.vel_y, output_data.vel_z])

                # Assign Teledyne Wayfinder DVL velocity measurements to custom ROS DVL message
                # assign velocity-x measurement
                msg.data.velocity.x = velocity[0]
                # assign velocity-y measurement
                msg.data.velocity.y = velocity[1]
                # assign velocity-z measurement
                msg.data.velocity.z = velocity[2]

                # Log velocity values locally
                self._logger.write("%9.3f %9.3f %9.3f, \n" %
                                   (velocity[0], velocity[1], velocity[2]))
            else:  # Otherwise
                # Log 'Invalid Velocity' message to rosconsle
                rospy.logwarn('The Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) -XYZ velocity measurements are invalid ')
                # Log 'Invalid Velocities' message locally
                self._logger.write('The Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) -XYZ velocity measurements are invalid \n')
                return

            # Matrix multiplication
            velocity = np.matmul(
                self._transposition_matrix, velocity)

            print("Velocity Vector after rotation :", velocity)
            # rospy.loginfo('Wayfinder Velocities: %9.3f %9.3f %9.3f' % ((velocity[0], velocity[1], velocity[2])))

            # Log velocity values locally
            self._logger.write("%9.3f %9.3f %9.3f, \n" %
                               (velocity[0], velocity[1], velocity[2]))

            # Assign Teledyne Wayfinder DVL velocity error to custom ROS DVL message
            msg.data.vel_error = output_data.vel_err  # extract velocity error

            # Conditional statement that checks if the range to bottom is valid inside the Teledyne Wayfinder DVL
            if output_data.is_range_valid():  # If the range to bottom is valid:

                # Extract Wayfinder DVL 3-Beam solution measurements and store it using an np.array
                beams = np.array([output_data.range_beam1, output_data.range_beam2,
                                 output_data.range_beam3, output_data.range_beam4])

                # Assign Teledyne Wayfinder DVL 3-Beam solution measurements to custom ROS DVL message
                msg.data.beams.beam1 = beams[0]  # extract beam1 information
                msg.data.beams.beam2 = beams[1]  # extract beam2 information
                msg.data.beams.beam3 = beams[2]  # extract beam3 information
                msg.data.beams.beam4 = beams[3]  # extract beam4 information

                # Log Teledyne Wayfinder DVL 3-Beam solution measurements locally
                self._logger.write("%9.3f %9.3f %9.3f %9.3f, \n" % (
                    beams[0], beams[1], beams[2], beams[3]))

                # Extract Teledyne Wayfinder DVL mean bottom range measurements to custom ROS DVL message
                msg.data.mean_bottom_range = output_data.mean_range

                # Log Teledyne Wayfinder DVL mean bottom range measurements locally
                self._logger.write("%9.3f, \n" % (output_data.mean_range))

            else:  # Otherwise
                # Log 'Invalid Range to Bottom Measurements' message to rosconsle
                rospy.logwarn(
                    "Invalid Range to Bottom Measurements for Wayfinder")
                # Log 'Invalid Range to Bottom Measurements' message locally
                self._logger.write("Invalid Range to Bottom Measurements \n")
                return

            # extract speed of sound information from Wayfinder DVL to ROS DVL MSG
            msg.data.speed_of_sound = output_data.speed_of_sound
            
            rospy.logdebug('Extracting Power Information from Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL)')
            # extract input voltage information from Wayfinder DVL to ROS DVL MSG
            msg.power.input_voltage = output_data.voltage
            # extract transmit voltage information from Wayfinder DVL to ROS DVL MSG
            msg.power.transmit_voltage = output_data.transmit_voltage
            # extract transmit current information from Wayfinder DVL to ROS DVL MSG
            msg.power.transmit_current = output_data.current
            rospy.logdebug('Succesfully extracted Power Information from Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL)')

            # extract serial number from Wayfinder DVL to ROS DVL MSG
            msg.serial_numer = output_data.serial_number

            print("%9.3f %9.3f %9.3f | %9.3f | %9.3f %9.3f %9.3f %9.3f | %s" %
                  (velocity[0], velocity[1], velocity[2], output_data.vel_err, beams[0],
                   beams[1], beams[2], beams[3],
                   output_data.bit_code))

            self._prev_time = dataTimestamp_boot_us  # assign previous time

            self._logger.write('\n')  # end of data measurement

        except Exception as e:
            print(e)
            traceback.print_exc()
            self._logger.write('EXCEPTION OCURRED\n')

        self._logger.flush()

    def publish(self):
        """ TODO: DOCUMENT"""
        while not rospy.is_shutdown():
            # delay execution of the dvl ping by a second
            sleep(_WAYFINDER_PING_TIME)
            # execute a software trigger that will make the Wayfinder ping
            if not self.wayfinder.send_software_trigger():
                rospy.logwarn("Failed to send software trigger to Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL)")
                # log software trigger error
                self._logger.write("Failed to send software trigger to Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) \n")
            self.dvl_msg.header = self._set_msg_header()  # Sets message header to message
            rospy.loginfo('Publishing Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) Message')
            self.pub.publish(self.dvl_msg)
            rospy.loginfo('Logging Teledyne Marine RDI Wayfinder Doppler Velocity Logger (DVL) Message: %s' % (self.dvl_msg))
            self.rate.sleep()  # Set publishing rate for DVL node

    def _set_msg_header(self):
        """ TODO: DOCUMENT"""

        # Create ROS Header Message
        msg_header = Header()
        # Assign current ROS time to ROS Header timestamp
        msg_header.stamp = rospy.Time.now()
        # Assgin Frame ID to Header message
        msg_header.frame_id = _FRAME_ID
        return msg_header


if __name__ == '__main__':
    try:
        WayfinderNode(_NODE_NAME, _TOPIC_NAME, _TRANSMISSION_RATE, _MODE)
    except rospy.ROSInterruptException:
        pass
