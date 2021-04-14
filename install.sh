#!/bin/bash

sudo cp wifi_mirror.sh /usr/local/bin/
sudo cp mirror_suspend.sh /lib/systemd/system-sleep/
sudo cp wifi_mirror.service /etc/systemd/system/

sudo systemctl start wifi_mirror.service
sudo systemctl enable wifi_mirror.service
