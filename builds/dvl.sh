
# This script will create a standard ROS Doppler Velocity Logger Package
# Script requirements: 
# - ROS Noetic
# - ROS standard workspace

echo "Creating the ROS DVL PKG"
cd /workspaces/Hydrus/jetson-tx2/catkin_ws/src/ # Change directory to your source directory of your standard catkin workspace
catkin_create_pkg dvl rospy std_msgs geometry_msgs message_generation message_runtime # create the dvl package
cd /workspaces/Hydrus/jetson-tx2/catkin_ws/ # change directory to your standard catkin workspace
catkin_make # compile workspace 
. ~/catkin_ws/devel/setup.bash # Add the workspace to your ROS environment you need to source the generated setup file
. /workspaces/Hydrus/jetson-tx2/catkin_ws/devel/setup.bash # Add the workspace to your ROS environment you need to source the generated setup file

# Standard package process setup:
cd /workspaces/Hydrus/jetson-tx2/catkin_ws/src/dvl # change directory to the DVL pkg dir
touch README.md& # creates readme.md for the whole package directory
touch .gitignore

echo "Process of creating necessary directories for the package"
mkdir config& # used for .yaml files 
mkdir msg& # used for .msg files 
mkdir launch& # used for .launch files 
mkdir scripts& # used for ros executable files 
mkdir src # used src files files 

echo "Process of creating files that are needed for this package:"

echo "Setting config directory"
cd config
touch README.md # Creates readme.md for config directory

cd ..

echo "Setting message directory"
cd msg
touch Raw_DVL.msg& # Creates .msg file for Raw DVL data
touch README.md # Creates readme.md for message directory

cd ..

echo "Setting lauch directory"
cd launch 
touch hydrus_dvl.launch& # Creates .launch file for DVL component
touch README.md # Creates readme.md for launch directory

cd ..

echo "Setting scripts directory"
cd scripts 
touch dvl_node.py& # Creates the executable that the package will use
touch README.md # Creates readme.md for message directory

cd ..

echo "Setting source directory"
cd src 
touch README.md # Creates readme.md for source directory
mkdir lib # Directory that will hold libraries built by user or any programing library required.
cd lib 
touch README.md # Creates readme.md for lib directory

# echo "Setup of Directory for the DVL Programming Library:"
# unzip /workspaces/Hydrus/Wayfinder.zip -d /workspaces/Hydrus/jetson-tx2/catkin_ws/src/dvl/src/lib
# cd Wayfinder 
# pip3 install . # locally install python package

cd /workspaces/Hydrus/jetson-tx2/catkin_ws/ # change directory to your standard catkin workspace
catkin_make # compile workspace 

# Validation process:
rospack depends1 dvl # finally, check package dependacies 