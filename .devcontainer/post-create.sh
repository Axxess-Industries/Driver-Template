#!/bin/sh

if [ -d $BASE_PATH/drivers-driverpackager ]; then
    if [ "$(ls -A $BASE_PATH/drivers-driverpackager)" ]; then
        echo "Driver packager already cloned in repo."
        exit 0
    else
        echo "Driver packager folder is empty. Delete the drivers-driverpackager folder then rebuild devcontainer."
    fi
else
    echo "Driver packager not found in repo. Cloning driver-packager to repo."
    git clone $DRIVER_PACKAGER_REPO $BASE_PATH/drivers-driverpackager
fi