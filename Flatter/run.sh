#!/bin/bash

./stop.sh

xhost +local:root

docker run -t -d --privileged --net=host \
--name flatter \
-v $PWD/code:/home/noroot/code \
--env="DISPLAY" \
--env="QT_X11_NO_MITSHM=1" \
 flatter:docker
