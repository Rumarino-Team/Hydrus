# Copyright (c) 2023 Real-Time Development Center (RTDC) Project
# All rights reserved.
# Example usage for DVL driver (software trigger)

from time import sleep
from dvl.dvl import Dvl
from dvl.system import OutputData
# from math import nan, isnan 
import math
import numpy as np
import os

# log_path = '~/Desktop/dvl_test_out-of-water.txt'
# log_file = open(log_path, 'w')

def update_data(output_data: OutputData, obj):
    """Prints data time to screen
    """
    #del obj
    if output_data is not None:
        print('=======================================================================================================================')
        time = output_data.get_date_time()
        txt = time.strftime('%Y-%m-%d %H:%M:%S.%f')[:-3]
        print("Got data {0}".format(txt))
        # if math.isnan(output_data.vel_x) or math.isnan(output_data.vel_y) or \
        #     math.isnan(output_data.vel_z) or math.isnan(output_data.vel_err):
        #     return
            #log NaN velocities 
        # if output_data.is_velocity_valid():
        #velocities = np.array([output_data.vel_x, output_data.vel_y, output_data.vel_z])
        velocities = np.array([output_data.vel_x, output_data.vel_y, output_data.vel_z])
        print("velocities :" , velocities)
        beams = np.array([output_data.range_beam1, output_data.range_beam2, output_data.range_beam3, output_data.range_beam4])
        print("veloity error: ", output_data.vel_err) 
        print("beams" , beams)
        print("coordinates: ", output_data.COORDINATES) 
        print("coordinate system:", output_data.coordinate_system)
        print("fw major version", output_data.fw_major_version)
        print("fw minor version:", output_data.fw_minor_version)
        print("patch version:", output_data.fw_patch_version)
        print("build version:", output_data.fw_build_version)
        print("mean range:", output_data.mean_range)
        print("Speed of sound:", output_data.speed_of_sound)
        print("data status:", output_data.status)
        print("input voltage:", output_data.voltage)
        print("transmit voltage:", output_data.transmit_voltage)
        print("current:", output_data.current)
        print("serial number:", output_data.serial_number)
        print('=======================================================================================================================')
        log_file.write('=======================================================================================================================')
        log_file.write("Got data {0}".format(txt))
        # if math.isnan(output_data.vel_x) or math.isnan(output_data.vel_y) or \
        #     math.isnan(output_data.vel_z) or math.isnan(output_data.vel_err):
        #     return
            #log NaN velocities 
        # if output_data.is_velocity_valid():
        #velocities = np.array([output_data.vel_x, output_data.vel_y, output_data.vel_z])
        # log_file.write("velocities :" , velocities)
        # log_file.write("veloity error: ", output_data.vel_err) 
        # log_file.write("beams" , beams)
        # log_file.write("coordinates: ", output_data.COORDINATES) 
        # log_file.write("coordinate system:", output_data.coordinate_system)
        # log_file.write("fw major version", output_data.fw_major_version)
        # log_file.write("fw minor version:", output_data.fw_minor_version)
        # log_file.write("patch version:", output_data.fw_patch_version)
        # log_file.write("build version:", output_data.fw_build_version)
        # log_file.write("mean range:", output_data.mean_range)
        # log_file.write("Speed of sound:", output_data.speed_of_sound)
        # log_file.write("data status:", output_data.status)
        # log_file.write("input voltage:", output_data.voltage)
        # log_file.write("transmit voltage:", output_data.transmit_voltage)
        # log_file.write("current:", output_data.current)
        # log_file.write("serial number:", output_data.serial_number)
        # log_file.write('=======================================================================================================================')
    
    else:
        print("NaN velocities") 
        # log_file.write("NaN Velocities")

if __name__ == "__main__":

    PORT = "/dev/ttyUSB0"

    # Initialize Dvl class
    with Dvl() as DVL:
        
        # Connect to serial port
        if DVL.connect(PORT, 115200):
            # Get user system setup
            if not DVL.get_setup():
                print("Failed to get system setup")
            else:
                # Print setup 
                print (DVL.system_setup)

                # Modify system setup structure to set software trigger
                SETUP = DVL.system_setup
                SETUP.software_trigger = 1 # software trigger flag (Disabled - 0, Enabled - 1)
                #SETUP.baud_rate_type = 7 # baud rate tupe (3-9600, 7-11520
                SETUP.max_depth  = 10 # maximum tracking depth in meters
                SETUP.max_vb_range = 10 #maximum vertical beam range in meters 
                # modify max tracking depth 
                print (DVL.system_setup)


                # Set user system setup
                if not DVL.set_setup(SETUP):
                    print("Failed to set system setup")
                else:

                    # # Collect data - make sure working folder exists
                    # if not DVL.start_logging("c:/temp", "DVL"):
                    #     print("Failed to start logging")
                    # else:
                    #     print("Data logged to {0}".format(DVL.get_log_file_name()))



                    # Exit command mode
                    if not DVL.exit_command_mode():
                        print("Failed to exit command mode")

                    print("Software trigger every 2 seconds - press Ctrl+C to stop")
                    # Register callback function
                    DVL.get_tests()
                    print(DVL.system_tests.tests)
                    DVL.register_ondata_callback(update_data)
                    RUN = True
                    while RUN:
                        try:
                            # Ping every 2 milliseconds
                            sleep(2/1000)
                            if not DVL.send_software_trigger():
                                print("Failed to send software trigger")
                        except KeyboardInterrupt:
                            RUN = False
                            # log_file.close()
        else:
            print("Failed to open {0} - make sure it is not used by any other program".format(PORT))

