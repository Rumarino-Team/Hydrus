#!/bin/sh

# This script is used to run commands on the docker 

source /opt/ros/noetic/setup.sh
roscore&
roslaunch nav_sensors hydrus_dvl.launch&
rqt_graph
