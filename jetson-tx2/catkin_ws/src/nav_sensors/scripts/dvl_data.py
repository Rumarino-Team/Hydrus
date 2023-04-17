#!/usr/bin/env python3


from dataclasses import dataclass
from abc import ABC, abstractmethod
from io import FileIO
import numpy as np
import datetime as dt
import math
import traceback
from dvl.dvl import Dvl  # Wayfinder DVL
from dvl.system import OutputData
from time import sleep
import os

#ABS_PATH = "/home/osvaldo/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/logs/"
#ABS_PATH = "/workspaces/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/scripts/"
#print(ABS_PATH )
#PREV_LOGGER_DIR = "/home/osvaldo/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/logs/"

PREV_LOGGER_DIR = '/opt/catkin_ws/src/hydrus/jetson-tx2/catkin_ws/src/nav_sensors/logs'
PREV_LOGGER_PREF = "dvl_log_attempts.txt"
PREV_OS_PATH = os.path.join(PREV_LOGGER_DIR, PREV_LOGGER_PREF)
# LOGGER_DIR = "/home/osvaldo/Hydrus/jetson-tx2/catkin_ws/src/nav_sensors/scripts/logs/"
LOGGER_DIR = '/opt/catkin_ws/src/hydrus/jetson-tx2/catkin_ws/src/nav_sensors/logs'
LOGGER_NUM_FORMAT = "%06d.log"
WRITE_COMMAND = 'w'           
READ_COMMAND = 'r'
# LOGGER_PATH = put inside obj

print(PREV_OS_PATH)

# Macro Declarations
DVL_BAUDRATE = 115200
DVL_PORT = '/dev/ttyUSB0'
MAX_DEPTH = 20
MAX_RANGE = 20

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
ROLL_ANGLE = 0
PITCH_ANGLE = 0
YAW_ANGLE = 45
START_TIME = 0


@dataclass
class DVL_Component(ABC):
    """Help on package DVL_Component
    
    NAME 
        DVL_Component
    
    DESCRIPTION

    Args:
        ABC (_type_): _description_
    
    PACKAGE CONTENTS
    
    """

    def __init__(self):
        """

        """


        self._logger: FileIO
        self._log_file_counter: int
        self._binary_data_output_group: dict = {}
        # Assign random values to each parameter:
        self._ROLL: np.radians = np.radians(ROLL_ANGLE)
        self._PITCH: np.radians = np.radians(PITCH_ANGLE)  # y ->
        self._YAW: np.radians = np.radians(YAW_ANGLE)  # z ->
        self._prev_time = START_TIME
        self._prev_pose: np.array 
        self._curr_pose: np.array


    def __post_init__(self):
        """ Post init function used to increment the global class variables used in this object."""

        self.setup_transposition_matrix()  # instrument to ship rotation matrix

    @abstractmethod
    def connect(self, port, baudrate):
        """Connects to the DVL system
        Should be overriden in a child class.
        """
        raise NotImplementedError

    @abstractmethod
    def disconnect(self):
        """Disconnects to the DVL system
        Should be overriden in a child class.
        """
        raise NotImplementedError

    @abstractmethod
    def is_connected(self):
        """Checks if system is connected.
        Returns
        -------
        bool
            True if system is connected, False otherwise.
        """
        raise NotImplementedError

    @abstractmethod
    def get_time():
        """_summary_

        Raises:
            NotImplementedError: _description_
        """
        raise NotImplementedError

    @abstractmethod
    def set_time():
        raise NotImplementedError

    @abstractmethod
    def set_setup(self):
        """Sets up the DVL system
        Should be overriden in a child class.
        """
        raise NotImplementedError

    @abstractmethod
    def get_setup(self):
        """Sets up the DVL system
        Should be overriden in a child class.
        """
        raise NotImplementedError

    def setup_transposition_matrix(self):

        # Y_x is negative on dvl manual but positive on formula (check)

        # yaw_rotation = np.array(
        #     [
        #         [np.cos(self.YAW),   np.cos(self.YAW),       0,
        #          -np.sin(self.YAW),    np.cos(self.YAW),      0,
        #          0,                    0,              1]
        #     ])

        #self._transposition_matrix = yaw_rotation
        self._transposition_matrix = np.array(\
        [
            [np.cos(self.YAW) * np.cos(self._PITCH), 
            np.cos(self.YAW) * np.sin(self._PITCH) * np.sin(self._ROLL) - np.sin(self.YAW) * np.cos(self._ROLL),
            np.cos(self.YAW) * np.sin(self._PITCH) * np.cos(self._ROLL) + np.sin(self.YAW) * np.sin(self._ROLL)
            ],
            [np.sin(self.YAW) * np.cos(self._PITCH), 
            np.sin(self.YAW) * np.sin(self._PITCH) * np.sin(self._ROLL) + np.cos(self.YAW) * np.cos(self._ROLL),
            np.sin(self.YAW) * np.sin(self._PITCH) * np.cos(self._ROLL) - np.cos(self.YAW) * np.sin(self._ROLL)
            ],
            [-np.sin(self._PITCH),
            np.cos(self._PITCH) * np.sin(self._ROLL),
            np.cos(self._PITCH) * np.cos(self._ROLL)
            ]
        ])

    def get_data(self):
        """Gets the data from the ZED device. This method should not be modified."""
        return {'DVL_Data': self._binary_data_output_group}

    def cb_data(self):
        """Used to retrieve the data from the DVL device according to the device being used.
        This method should be overriden in a child class.
        """
        raise NotImplementedError

    def setup_logger(self):
        """Configures the data logging
            Make sure folder exists
        """

        try:
            with open(PREV_OS_PATH, READ_COMMAND) as prev_log:
                self.log_file_counter = int(prev_log.readline()) + 1
        except Exception:
            self.log_file_counter = 0

        with open(PREV_OS_PATH, WRITE_COMMAND) as lastLog:
            lastLog.write("%d\n" % self.log_file_counter)

        print(os.path.join(LOGGER_DIR, LOGGER_NUM_FORMAT % self.log_file_counter))
        
        self._logger = open(os.path.join(
            LOGGER_DIR, LOGGER_NUM_FORMAT % self.log_file_counter), WRITE_COMMAND)
        # os.path.join -> working_folder, prefix

    def reset_to_defauls(self):
        raise NotImplementedError

    def enter_command_mode(self):
        raise NotImplementedError

    def exit_command_mode(self):
        raise NotImplementedError


class WayfinderDVL(DVL_Component):

    def __init__(self):
        DVL_Component.__init__(self)
        self.setup_logger()
        self.setup_transposition_matrix()
        self.setup_wayfinder()

    def connect(self, port: str, baudrate: int = DVL_BAUDRATE) -> bool:
        self.wayfinder.connect(DVL_PORT, baudrate)

    def is_connected(self) -> bool:
        """_summary_

        Args:
            date_time (_type_): _description_

        Returns:
            _type_: _description_
        """
        return self.wayfinder.is_connected()

    def get_time(self) -> None:
        """_summary_

        Returns:
            _type_: _description_
        """
        return self.wayfinder.get_time()

    def set_time(self, date_time) -> bool:
        """_summary_

        Args:
            date_time (_type_): _description_

        Returns:
            _type_: _description_
        """
        return self.wayfinder.set_time(date_time)

    def get_setup(self):
        """_summary_

        Returns:
            _type_: _description_
        """
        return self.wayfinder.get_setup()

    def set_setup(self):
        """_summary_

        Returns:
            _type_: _description_
        """
        return True

    def disconnect(self):
        """_summary_

        Returns:
            _type_: _description_
        """
        return self.wayfinder.disconnect()

    def reset_to_defaults(self):
        """_summary_
        """
        self.wayfinder.reset_to_defaults()

    def enter_command_mode(self):
        """_summary_
        """
        self.wayfinder.enter_command_mode()

    def exit_command_mode(self):
        """_summary_
        """
        self.wayfinder.exit_command_mode()

    def send_software_trigger(self):
        self.wayfinder.send_software_trigger()

    def setup_wayfinder(self):

        self.wayfinder = Dvl()

        if not self.connect(DVL_PORT, DVL_BAUDRATE):
            self._logger.write("Error connecting \n")
            
        self._logger.write("Connection Succesful \n")


        self.reset_to_defaults()

        # Get user system setup
        if not self.wayfinder.get_setup():
            self._logger.write("Failed to get DVL System setup \n")
        else:
            # Modify system setup structure to set software trigger
            SETUP = self.wayfinder.system_setup
            self._binary_data_output_group['sys_info'] = {}
            print(SETUP)
            self._logger.write('%s \n' % SETUP)
            
            SETUP.software_trigger = 1  # enable software
            SETUP.max_depth = MAX_DEPTH # Maximum tracking depth in meters
            SETUP.max_vb_range = MAX_RANGE # Maximum vertical beam range in meters
        if not self.wayfinder.set_setup(SETUP):
            self._logger.write("Failed to set system setup \n")
        else:
            # collect data

            # start logging

            # register callback function to be exectuted
            self.wayfinder.register_ondata_callback(self.data_cb, None)

            # self.enter_command_mode() #enter command mode to set Wayfinder Time
            if not self.wayfinder.exit_command_mode():
                self._logger.write("Failed to exit comamnd mode \n")

            # verify
            twoseconds = dt.datetime.now() + dt.timedelta(seconds=2)
            target_time = dt.datetime(twoseconds.year, twoseconds.month, twoseconds.day,
                                     twoseconds.hour, twoseconds.minute, twoseconds.second)
            current_time = dt.datetime.now()
            
            delta_time = target_time - current_time
            
            print(delta_time)
            self._logger.write('%s: \n' % delta_time)
            sleep((delta_time).total_seconds())

            self.wayfinder.set_time(dt.datetime.now())  # set time
            print("Software trigger every 2 seconds - press Ctrl+C to stop")
            RUN = True
            while RUN:
                try:
                    # Ping every 2 milliseconds
                    sleep(2/1000)
                    if not self.wayfinder.send_software_trigger():
                        self._logger.write("Failed to send software trigger \n")
                except KeyboardInterrupt:
                    RUN = False

    def data_cb(self, output_data: OutputData, *args):
        """Callback function to generate dummy data"""
        try:
            
            self._binary_data_output_group['data'] = {}

            time_stamp_us = output_data.get_date_time().timestamp() * 1e6
            self._logger.write("%9d: " % time_stamp_us)
            print("Time stamp us: ", time_stamp_us)
            

            #verify AP offset
            #dataTimestamp_boot_us = int(time_stamp_us + AP_offset_us)
            dataTimestamp_boot_us = int(time_stamp_us)
            #self._logger.write("%9d, " % dataTimestamp_boot_us)
            
            time = output_data.get_date_time()
            txt = time.strftime('%Y-%m-%d %H:%M:%S.%f')[:-3]
            self._logger.write("Got data {0}\n".format(txt))
            print('DVL Time (from examples): ', time)

            # if math.isnan(output_data.vel_x) or math.isnan(output_data.vel_y) or \
            #         math.isnan(output_data.vel_z) or math.isnan(output_data.vel_err):
            #     self._logger.write("NaN velocities\n")
            #     return

            # if output_data.is_velocity_valid():
            velocity = np.array(
                [output_data.vel_x, output_data.vel_y, output_data.vel_z])
            self._binary_data_output_group['data']['velocity'] = velocity
            self._logger.write("%9.3f %9.3f %9.3f, \n" % (velocity[0], velocity[1], velocity[2]))
            # else:
            #     self._logger.write("Invalid velocities\n")
            #     return


            print("Velocity Vector w/o rotation :", velocity)
            
            # matrix multiplication
            velocity = np.matmul(
                self._transposition_matrix, velocity)
            
            print("Velocity Vector after rotation :", velocity)
            # self._logger.write("%9.3f %9.3f %9.3f, \n" % (self._velocity[0], self._velocity[1], self._velocity[2]))

            # determine delta time
            delta_time = int(dataTimestamp_boot_us - self._prev_time)
            if self._prev_time == 0:
                delta_time = 0
            self._logger.write('%9d, ' % delta_time)
            if delta_time < 0:
                self._logger.write("\n")
                return
            
            # determine delta angle
            # angle_delta = self.curr_attitude - self._prev_pose[0:3]
            # self.logger.write("%9.3f %9.3f %9.3f, " % (angle_delta[0], angle_delta[1], \
            #     angle_delta[2]))
            #print('Angle Delta: ' ,angle_delta)

            # determine position delta
            #position_delta = self.velocity * delta_time * 1e-6
            #self._logger.write("%9.3f %9.3f %9.3f, " % (self.velocity[0], self.velocity[1], self.velocity[2]))
            #print('Position Delta: ', position_delta)
            #self._binary_data_output_group['data']['position'] = self._velocity
            
            # determining confidence level of velocity error measurement:
            vel_err_max = 1
            vel_err_min = 0.001
            percentage_err_vol = 0.005
            self.vel_mean = np.mean(self._velocity)
            print("Velocity mean: \n", self.vel_mean)

            # self._confidence = 1 - (self.vel_mean - vel_err_min) / \
            #     (vel_err_max - vel_err_min)
            self._confidence = 1 - (self.vel_mean - vel_err_min) / \
                (vel_err_max - vel_err_min) * percentage_err_vol

        
            self._binary_data_output_group['data']['velocity_error'] = output_data.vel_err
            
            self._binary_data_output_group['data']['beams'] = np.array([output_data.range_beam1, output_data.range_beam2,
                                    output_data.range_beam3, output_data.range_beam4])
            
            self._coordinates = output_data.COORDINATES
            self._coordinate_system = output_data.coordinate_system
            
            self._binary_data_output_group['data']['mean_bottom_range'] = output_data.mean_range
            
            self._binary_data_output_group['data']['speed_of_sound'] = output_data.speed_of_sound
            
            self._binary_data_output_group['power_info'] = {}
            self._binary_data_output_group['power_info']['input_voltage'] = output_data.voltage
            self._binary_data_output_group['power_info']['transmit_voltage'] = output_data.transmit_voltage
            self._binary_data_output_group['power_info']['transmit_current'] = output_data.current 
            
            self._binary_data_output_group['serial_number'] = output_data.serial_number

            print("%9.3f %9.3f %9.3f | %9.3f | %9.3f %9.3f %9.3f %9.3f | %s" %
                  (self._velocity[0], self._velocity[1], self._velocity[2], self._velocity_error, self._beams[0],
                   self._beams[1], self._beams[2], self._beams[3],
                   output_data.bit_code))
            
            self._prev_time = dataTimestamp_boot_us
            #self._prev_pose[0:3] = self.curr_attitude
            #self.data.append([dataObj, AP_offset_us, currAtt, prevPose])
            self._logger.write('\n')
            
            print("=============================================================================================================================================\n")
            print("PRINTING VALUES GENERATED FOR WAYFINDER DOPPLER VELOCITY LOGGER: \n")
            print("System Information = ",
                self._binary_data_output_group['sys_info'], '\n')
            print("Velocity (in m/s) =",
                self._binary_data_output_group['data']['velocity'], '\n')
            print("Velocity Error (in m/s) =",
                self._binary_data_output_group['data']['velocity_error'], '\n')
            print("Position (in m) =",
                self._binary_data_output_group['data']['position'], '\n')
            print("Beams (in meters) = ",
                self._binary_data_output_group['data']['beams'], '\n')
            print("Mean Range To Bottom (in meters) =",
                self._binary_data_output_group['data']['mean_bottom_range'], '\n')
            print("Speed of Sound (in m/s) =",
                self._binary_data_output_group['data']['speed_of_sound'], '\n')
            print("BT Status =",
                self._binary_data_output_group['data']['BT_status'], '\n')
            print("Power Information = ",
                self._binary_data_output_group['power_info'], '\n')
            print("System Serial Number = ",
                self._binary_data_output_group['serial_number'], '\n')
            print("================================================================================================================================================\n")

            # else:
            #     return

        except Exception as e:
            print(e)
            traceback.print_exc()
            self._logger.write('EXCEPTION OCURRED\n')

        self._logger.flush()


class Dummy_DVL(DVL_Component):

    def __init__(self):
        DVL_Component.__init__(self)

    def connect(self, port, baudrate):
        """Dummy connect will always return True when called."""
        return True

    def is_connected(self):
        return True  # make flag

    def get_time(self):
        """Dummy connect will always return True when called."""
        return True

    def set_time(self):
        """Dummy connect will always return True when called."""
        return True

    def get_setup(self):
        """Dummy connect will always return True when called."""
        return True

    def set_setup(self):
        """Dummy connect will always return True when called."""
        return True

    def disconnect(self):
        """Dummy connect will always return True when called."""
        return True

    def reset_to_defauls(self):
        return True

    def enter_command_mode(self):
        return True

    def exit_command_mode(self):
        return True

    def data_cb(self):
        """Callback function to generate dummy data"""
        self.generate_data()


    def generate_data(self):
        '''

        Call to generate a data model for the Teledyne Marine RDI Wayfinder Doppler Velocity Logger 
        ---------------------

        Function that generates data for Wayfinder Doppler Velocity Logger.

        Output: 
        - System Information
        - Velocity
        - Velocity Error
        - Position  
        - Beams

        '''

        self._binary_data_output_group['sys_info'] = {}
        self._binary_data_output_group['sys_info']['packet_count'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['packet_id'] = np.random.randint(
            MIN, CONECTION_LIMIT)
        self._binary_data_output_group['sys_info']['version'] = DVL_VERSION
        self._binary_data_output_group['sys_info']['system_type'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['system_subtype'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['fw_major_version'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['fw_minor_version'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['fw_patch_version'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['fw_build_version'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['year'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['month'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['day'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['hour'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['minute'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['second'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['sys_info']['coordinate_system'] = np.random.randint(
            MIN, UINT8)
        self._binary_data_output_group['data'] = {}
        self._binary_data_output_group['data']['velocity'] = np.round(
            np.random.uniform(low=-2.9, high=2.9, size=(VEL_SIZE)), ROUND_DELIMETER)
        self._binary_data_output_group['data']['velocity_error'] = np.round(
            np.random.rand(), ROUND_DELIMETER)
        self._binary_data_output_group['data']['position'] = np.round(
            np.random.uniform(low=-2.9, high=2.9, size=(POS_SIZE)), ROUND_DELIMETER)
        self._binary_data_output_group['data']['beams'] = np.round(
            np.random.uniform(low=0, high=50, size=(BEAMS_SIZE)), ROUND_DELIMETER)
        self._binary_data_output_group['data']['mean_bottom_range'] = np.round(
            np.random.rand(), ROUND_DELIMETER)
        self._binary_data_output_group['data']['speed_of_sound'] = np.round(
            np.random.rand(), ROUND_DELIMETER)
        self._binary_data_output_group['data']['BT_status'] = np.random.randint(
            -1, 1)
        self._binary_data_output_group['power_info'] = {}
        self._binary_data_output_group['power_info']['input_voltage'] = np.round(
            np.random.uniform(low=7, high=36.7), ROUND_DELIMETER)
        self._binary_data_output_group['power_info']['transmit_voltage'] = np.round(
            np.random.uniform(low=7, high=36.7), ROUND_DELIMETER)
        self._binary_data_output_group['power_info']['transmit_current'] = np.round(
            np.random.uniform(low=0, high=5), ROUND_DELIMETER)
        self._binary_data_output_group['serial_number'] = np.random.randint(
            MIN, UINT8)

        print("=============================================================================================================================================\n")
        print("PRINTING VALUES GENERATED FOR WAYFINDER DOPPLER VELOCITY LOGGER: \n")
        print("System Information = ",
              self._binary_data_output_group['sys_info'], '\n')
        print("Velocity (in m/s) =",
              self._binary_data_output_group['data']['velocity'], '\n')
        print("Velocity Error (in m/s) =",
              self._binary_data_output_group['data']['velocity_error'], '\n')
        print("Position (in m) =",
              self._binary_data_output_group['data']['position'], '\n')
        print("Beams (in meters) = ",
              self._binary_data_output_group['data']['beams'], '\n')
        print("Mean Range To Bottom (in meters) =",
              self._binary_data_output_group['data']['mean_bottom_range'], '\n')
        print("Speed of Sound (in m/s) =",
              self._binary_data_output_group['data']['speed_of_sound'], '\n')
        print("BT Status =",
              self._binary_data_output_group['data']['BT_status'], '\n')
        print("Power Information = ",
              self._binary_data_output_group['power_info'], '\n')
        print("System Serial Number = ",
              self._binary_data_output_group['serial_number'], '\n')
        print("================================================================================================================================================\n")
        # return data


if __name__ == '__main__':
    """Testing method from data class."""
    dvl = WayfinderDVL()
