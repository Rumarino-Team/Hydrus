#!/bin/bash

# This script will create a standard ROS Doppler Velocity Logger Package
# Script requirements: 
# - ROS Noetic
# - ROS standard workspace

echo "Creating the ROS DVL PKGe"
cd ~/catkin_ws/src # Change directory to your source directory of your standard catkin workspace
catkin_create_pkg dvl rospy std_msgs message_generation message_runtime # create the dvl package
cd ~/catkin_ws # change directory to your standard catkin workspace
catkin_make # compile workspace 
. ~/catkin_ws/devel/setup.bash # Add the workspace to your ROS environment you need to source the generated setup file

# Standard package process setup:
cd ~/catkin_ws/src/dvl # change directory to the DVL pkg dir
touch README.md& # creates readme.md for the whole package directory
touch .gitignore

echo "Process of creating necessary directories for the package"
mkdir config& # used for .yaml files 
mkdir msg& # used for .msg files 
mkdir launch& # used for .launch files 
mkdir scripts # used for ros executable files 

echo "Process of creating files that are needed for this package:"

echo "Setting message directory"
cd config 
touch README.md # Creates readme.md for config directory

cd .. # change back 

echo "Setting message directory"
cd msg
touch Raw_DVL.msg& # Creates .msg file for Raw DVL data
touch README.md # Creates readme.md for message directory

cd .. #change back 

echo "Setting lauch directory"
cd launch 
touch hydrus_dvl.launch& # Creates .launch file for DVL component
touch README.md # Creates readme.md for launch directory

cd .. # change back

## Setup of scripts Directory: 
cd scripts 
touch dvl_node.py& # Creates the executable that the package will use
touch README.md # Creates readme.md for message directory

cd ~/catkin_ws # change directory to your standard catkin workspace
catkin_make # compile workspace 

# Validation process:
cd ~/catkin_ws/src/dvl # change directory to the DVL pkg dir
rospack depends1 dvl # finally, check package dependacies 