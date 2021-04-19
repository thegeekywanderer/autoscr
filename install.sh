#!/bin/bash

sed -i "s/USER/$USER/g" autoscr.service

mkdir -p $HOME/.local/share/systemd/user

sudo cp autoscr /usr/local/bin/
cp autoscr.service $HOME/.local/share/systemd/user/
cp autoscr_ip $HOME/.local/share/autoscr_ip

systemctl --user daemon-reload
systemctl --user enable autoscr.service
systemctl --user start autoscr.service
