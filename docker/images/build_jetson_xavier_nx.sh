#! /bin/bash

docker build --build-arg USERNAME=admin --build-arg USER_ID=1000 --build-arg GROUP_ID=1000 --network=host -f Dockerfile.jetson_xavier_nx -t gidobot:isaac_ros_jetson_xavier_nx_latest ../
