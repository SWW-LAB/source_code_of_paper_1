#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/chao/catkin_ws_youbot/src/youbot_driver_ros_interface"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/chao/catkin_ws_youbot/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/chao/catkin_ws_youbot/install/lib/python2.7/dist-packages:/home/chao/catkin_ws_youbot/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/chao/catkin_ws_youbot/build" \
    "/usr/bin/python" \
    "/home/chao/catkin_ws_youbot/src/youbot_driver_ros_interface/setup.py" \
    build --build-base "/home/chao/catkin_ws_youbot/build/youbot_driver_ros_interface" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/chao/catkin_ws_youbot/install" --install-scripts="/home/chao/catkin_ws_youbot/install/bin"
