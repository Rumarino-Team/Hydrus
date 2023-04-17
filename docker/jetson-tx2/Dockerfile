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
RUN echo "Creating ROS Entrypoint"
ENTRYPOINT ["/ros_entrypoint.sh"]

RUN echo "Creating ROS catkin_ws"
RUN mkdir -p /opt/catkin_ws/src
ENV CATKIN_WS /opt/catkin_ws
WORKDIR ${CATKIN_WS}
RUN . /opt/ros/noetic/setup.sh && catkin_make 
# RUN apt update 
# RUN pip install -U rosdep 
# RUN rosdep init 
# RUN rosdep update

RUN echo "Cloning optional add-on software packages for Hydrus"
WORKDIR ${CATKIN_WS}
RUN cd ./src 
RUN git clone --recursive https://github.com/Rumarino-Team/hydrus

RUN echo "Sourcing catkin_ws"
WORKDIR ${CATKIN_WS}
RUN . /opt/ros/noetic/setup.sh && catkin_make 

RUN echo "Installing Teledyne RD Instruments Proprietary Python3 Driver for Wayfinder Doppler Velocity Logger (DVL)"
WORKDIR ${CATKIN_WS}
RUN cd ./src/hydrus/jetson-tx2/catkin_ws/src/nav_sensors/src/Wayfinder
RUN pip3 install .

RUN echo "Sourcing catkin_ws"
WORKDIR ${CATKIN_WS}
RUN . /opt/ros/noetic/setup.sh && catkin_make 

RUN echo "Installing ROS Dependencies"
RUN apt update 
RUN pip install -U rosdep 

RUN echo "Initializing ROS Dependencies"
RUN rosdep init 

RUN echo "Updating ROS Dependencies"
RUN rosdep update

RUN echo "Installing Arduino-CLI"
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/local/bin sh -s 0.17.0

RUN echo "Build ROS Serial"
RUN . /opt/ros/noetic/setup.sh && catkin_make \
  cd $CATKIN_WS/src &&\
  git clone https://github.com/ros-drivers/rosserial.git &&\
  cd $CATKIN_WS &&\
  catkin_make &&\
  catkin_make install

RUN echo "Creating ROS Serial Arduino builder"
RUN . /opt/ros/noetic/setup.sh && catkin_make \
  cd /tmp &&\
  rosrun rosserial_arduino make_libraries.py .
