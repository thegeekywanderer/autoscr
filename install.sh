#!/bin/bash

user=`whoami`
sed -i "s/USER/$user/g" airscr.service
sed -i "s/USER/$user/g" airscr

mkdir -p $HOME/.local/share/systemd/user

sudo cp airscr /usr/local/bin/
cp airscr.service $HOME/.local/share/systemd/user/

systemctl --user daemon-reload
systemctl --user enable airscr.service
systemctl --user start airscr.service
