#!/bin/bash

systemctl --user disable autoscr.service
systemctl --user stop autoscr.service

sudo rm /usr/local/bin/autoscr
rm -f $HOME/.local/share/systemd/user/autoscr.service
rm -f $HOME/.local/share/autoscr_ip

systemctl --user daemon-reload
