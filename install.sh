#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [[ $(crontab -l) = *"reboot.py"* ]]; then
    echo "Already installed!"
    exit
fi

(crontab -l; echo "@reboot python $(pwd)/reboot.py > /tmp/reboot.log") | crontab -

echo "Installed successfully!"