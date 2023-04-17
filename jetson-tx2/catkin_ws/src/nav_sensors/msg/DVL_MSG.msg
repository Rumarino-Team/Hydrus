# Copyright (c) 2023 Real-Time Development Center (RTDC) Project
# All rights reserved.

std_msgs/Header header
bool is_valid
nav_sensors/DVL_Info system_info
nav_sensors/DVL_Data data
#two unknowns
int64 bit_count
int64 bit_code
nav_sensors/DVL_Power power
std_msgs/String serial_number