#!/bin/bash

user=`whoami`
sed -i "s/USER/$user/g" airscr.service
sed -i "s/USER/$user/g" airscr

mkdir -p $HOME/.local/share/systemd/user

sudo cp airscr /usr/local/bin/
cp airscr.service $HOME/.local/share/systemd/user/
cp airscr_ip $HOME/.local/share/airscr_ip

systemctl --user daemon-reload
systemctl --user enable airscr.service
systemctl --user start airscr.service
