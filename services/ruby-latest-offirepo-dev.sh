#!/bin/bash

if [ -f "include/startup.sh" ]; then
    . include/startup.sh
elif [ -f "../include/startup.sh" ]; then
    . ../include/startup.sh
fi

echo "Installing Ruby from apt" | log

installPackage ruby | log
waitOrStop 0 "Failed to install ruby"

installPackage ruby-dev | log
waitOrStop 0 "Failed to install ruby-dev"

installPackage build-essential | log
waitOrStop 0 "Failed to install build-essential"


tag ruby.success
tagScript success
exit 0