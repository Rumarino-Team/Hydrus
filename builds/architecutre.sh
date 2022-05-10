#!/bin/bash

TEST="/workspaces/Hydrus/builds"
CAMERA="/workspaces/Hydrus/builds/camera.sh"
CONTROL="/workspaces/Hydrus/builds/control.sh"
MCU="/workspaces/Hydrus/builds/mcu.sh"
DVL="/workspaces/Hydrus/builds/dvl.sh"
IMU="/workspaces/Hydrus/builds/imu.sh"
TASKS="/workspaces/Hydrus/builds/tasks.sh"


# This bash script will build the skeloton of the ROS architecture the team designed:

# echo "Creating jetson-tx2 workspace"
# source /opt/ros/noetic/setup.bash
# mkdir -p /workspaces/Hydrus/jetson-tx2/catkin_ws/src
# cd /workspaces/Hydrus/jetson-tx2/catkin_ws
# catkin_make
# source devel/setup.bash
# echo $ROS_PACKAGE_PATH

# echo "Creating utils workspace"
# source /opt/ros/noetic/setup.bash
# mkdir -p /workspaces/Hydrus/utils/catkin_ws/src
# cd /workspaces/Hydrus/utils/catkin_ws
# catkin_make
# source devel/setup.bash
# echo $ROS_PACKAGE_PATH

# source "${DVL}"
cd $TEST
source dvl.sh