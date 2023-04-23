# Copyright (c) 2023 Real-Time Development Center (RTDC) Project
# All rights reserved.

# ROS Message that represents the most notable values of the binary data output group 
# available for the Teledyne Marine RD Instruments Doppler Velocity Logger (DVL)

std_msgs/Header header # To provide functionality to parse a connection header and retrieve values from it
nav_sensors/DVL_Info system_info # Stores notable system information of the DVL
nav_sensors/DVL_Data data # Stores data informatin of the DVL
nav_sensors/DVL_Power power # Stores power informatin of the DVL
string serial_number