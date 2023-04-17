FROM ros:noetic-ros-base
ENV DEBIAN_FRONTEND=noninteractive

#WORKDIR /hydrus

#ENV SHELL /bin/bash
# Install dependencies
RUN apt-get update  
RUN apt-get upgrade -y

RUN echo "Installing Required Dependencies"
RUN apt-get update && apt-get install -y\
    git\
    curl\
    python3\
    python3-pip\
    ros-$ROS_DISTRO-rqt \
    ros-$ROS_DISTRO-rqt-common-plugins \
    ros-$ROS_DISTRO-rqt-graph \
    vim \
    && rm -rf /var/lib/apt/lists/*

# RUN echo "Initializing rosdep"
# RUN rosdep update

# RUN echo "Adding ROS source to .bashrc"
# RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
# setup entrypoint
RUN rm -rf /ros_entrypoint.sh
COPY ./ros_entrypoint.sh /
CMD ["bash"]
ENTRYPOINT ["/ros_entrypoint.sh"]
RUN mkdir -p /opt/catkin_ws/src
WORKDIR /opt/catkin_ws
RUN . /opt/ros/noetic/setup.sh && catkin_make 
# RUN apt update 
# RUN pip install -U rosdep 
# RUN rosdep init 
# RUN rosdep update

RUN echo "Cloning Software Packages"
WORKDIR /opt/catkin_ws
RUN cd ./src 
RUN git clone --recursive https://github.com/Rumarino-Team/hydrus
RUN cd ./src/hydrus/jetson-tx2/catkin_ws/src/nav_sensors/src/Wayfinder && pip3 install .

WORKDIR /opt/catkin_ws
RUN . /opt/ros/noetic/setup.sh && catkin_make 
RUN apt update 
RUN pip install -U rosdep 
RUN rosdep init 
RUN rosdep update
