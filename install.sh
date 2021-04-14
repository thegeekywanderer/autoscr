#!/bin/bash

user=`whoami`
sed -i "s/USER/$user/g" wifi_mirror.service

sudo cp wifi_mirror.sh /usr/local/bin/
sudo cp mirror_suspend.sh /lib/systemd/system-sleep/
sudo cp wifi_mirror.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl start wifi_mirror.service
sudo systemctl enable wifi_mirror.service
