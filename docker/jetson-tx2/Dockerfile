FROM ros:noetic-ros-base
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /hydrus

#ENV SHELL /bin/bash

RUN echo "Installing Required Dependencies"
RUN apt-get update && apt-get install -y\
    git\
    curl\
    python3\
    python3-pip\
    ros-$ROS_DISTRO-rqt \
    ros-$ROS_DISTRO-rqt-common-plugins \
    ros-$ROS_DISTRO-rqt-graph \
    && rm -rf /var/lib/apt/lists/*

RUN echo "Initializing rosdep"
RUN rosdep update

RUN echo "Adding ROS source to .bashrc"
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

RUN echo "Cloning Software Packages"
RUN git clone --recursive https://github.com/Rumarino-Team/hydrus