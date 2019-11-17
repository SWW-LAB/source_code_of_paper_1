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

echo_and_run cd "/home/chao/tools/src/dynamixel_motor/dynamixel_driver"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/chao/tools/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/chao/tools/install/lib/python2.7/dist-packages:/home/chao/tools/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/chao/tools/build" \
    "/usr/bin/python" \
    "/home/chao/tools/src/dynamixel_motor/dynamixel_driver/setup.py" \
    build --build-base "/home/chao/tools/build/dynamixel_motor/dynamixel_driver" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/chao/tools/install" --install-scripts="/home/chao/tools/install/bin"
