#!/bin/bash

systemctl --user disable wifi_mirror.service
systemctl --user stop wifi_mirror.service

sudo rm /usr/local/bin/wifi_mirror.sh
rm -f $HOME/.local/share/systemd/user/wifi_mirror.service

systemctl --user daemon-reload
