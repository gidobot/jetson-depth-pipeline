#! /bin/bash

docker run --rm -it \
    --privileged \
	--net=host \
	--user $(id -u) \
	--runtime nvidia \
	-e QT_QPA_PLATFORM=$QT_QPA_PLATFORM \
	-e QT_X11_NO_MITSHM=1 \
	-e DISPLAY=$DISPLAY \
	-e XDG_RUNTIME_DIR=/run/user/1000 \
	-v  ${XAUTHORITY:-$HOME/.Xauthority}:/home/admin/.Xauthority:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-v /run/jtop.sock:/run/jtop.sock:rw \
	-v ~/.docker_bash_history:/home/admin/.bash_history:rw \
	-v ~/.tmux.conf:/home/admin/.tmux.conf \
	-v $HOME/workspace/data:/data:ro \
	-v $PWD/../:/jetson-depth:rw \
	-v $HOME/workspace/binutils-gdb:/binutils-gdb:rw \
	-w /jetson-depth \
	--name jetson-depth \
	gidobot:isaac_ros_jetson_xavier_nx_latest \
	bash
