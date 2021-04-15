#!/bin/bash

user=`whoami`
sed -i "s/USER/$user/g" wifi_mirror.service
sed -i "s/USER/$user/g" wifi_mirror.sh

mkdir -p $HOME/.local/share/systemd/user

sudo cp wifi_mirror.sh /usr/local/bin/
cp wifi_mirror.service $HOME/.local/share/systemd/user/

sudo systemctl --user daemon-reload
sudo systemctl --user enable wifi_mirror.service
sudo systemctl --user start wifi_mirror.service
