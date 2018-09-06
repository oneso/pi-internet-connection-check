#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

DIR=`pwd`
CRONTAB_CONTENT=`crontab -l`

if [[ $CRONTAB_CONTENT = *"reboot.py"* ]]; then
    echo "Already installed!"
    exit
fi

(echo $CRONTAB_CONTENT; echo "@reboot python $DIR/reboot.py > /tmp/reboot.log") | crontab -

echo "Installed successfully!"