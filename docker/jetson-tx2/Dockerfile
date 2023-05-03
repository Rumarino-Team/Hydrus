# Copyright (c) 2023 Real-Time Development Center (RTDC) Project
# All rights reserved.

FROM ros:noetic-ros-base
LABEL author="Osvaldo Aquino <rtdc@upr.edu>"
#WORKDIR /hydrus

#ENV SHELL /bin/bash


# Install dependencies
RUN apt-get update  
RUN apt-get upgrade -y


RUN echo "Installing Required Dependencies"
RUN apt-get update && apt-get install --no-install-recommends -y\
    git\
    curl\
    python3\
    python3-pip\
    ros-$ROS_DISTRO-rqt \
    ros-$ROS_DISTRO-rqt-common-plugins \
    ros-$ROS_DISTRO-rqt-graph \
    ros-$ROS_DISTRO-rosserial \
    ros-$ROS_DISTRO-rosserial-arduino \
    vim \ 
    apt-utils\
    && rm -rf /var/lib/apt/lists/* 


RUN echo "Creating ROS catkin_ws"
RUN mkdir -p /opt/catkin_ws/src
ENV CATKIN_WS /opt/catkin_ws
WORKDIR ${CATKIN_WS}
RUN . /opt/ros/noetic/setup.sh && catkin_make 


RUN echo "Installing ROS Dependencies"
# The command below will make sure not rosdep sources are installed, to ensure defaults sources are selected:
RUN rm -rf /etc/ros/rosdep/sources.list.d/* 
RUN apt update 
RUN pip install -U rosdep 


RUN echo "Initializing ROS Dependencies"
RUN rosdep init 


RUN echo "Updating ROS Dependencies"
RUN rosdep update


RUN echo "Cloning optional add-on software packages for the Computer System of Hydrus"
WORKDIR ${CATKIN_WS}/src
RUN git clone --recursive https://github.com/Rumarino-Team/hydrus


RUN echo "Sourcing Cagit clone --recursive https://github.com/Rumarino-Team/hydrustkin Workspace"
WORKDIR ${CATKIN_WS}
RUN . /opt/ros/noetic/setup.sh && catkin_make 


RUN echo "Installing Teledyne RD Instruments Proprietary Python3 Driver for Wayfinder Doppler Velocity Logger (DVL)"
WORKDIR ${CATKIN_WS}/src/hydrus/jetson-tx2/catkin_ws
RUN . /opt/ros/noetic/setup.sh && catkin_make 


WORKDIR ${CATKIN_WS}/src/hydrus/jetson-tx2/catkin_ws/src/nav_sensors/src/Wayfinder
RUN pip3 install .


RUN echo "Installing VN Programming Library for VectorNav VN100 Inertial Measurement Unit (IMU)"
WORKDIR ${CATKIN_WS}/src/hydrus/jetson-tx2/catkin_ws
RUN . /opt/ros/noetic/setup.sh && catkin_make 


WORKDIR ${CATKIN_WS}/src/hydrus/jetson-tx2/catkin_ws/src/nav_sensors/src/VN100/vnproglib/python
RUN pip3 install .

RUN echo "Sourcing Catkin Workspace"
WORKDIR ${CATKIN_WS}
RUN . /opt/ros/noetic/setup.sh && catkin_make 


RUN echo "Setup of ROS Entrypoint for Jetson Container"
RUN rm -rf /ros_entrypoint.sh
COPY ./ros_entrypoint.sh /
CMD ["bash"]
ENTRYPOINT ["/ros_entrypoint.sh"]