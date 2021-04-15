#!/bin/bash

systemctl --user disable airscr.service
systemctl --user stop airscr.service

sudo rm /usr/local/bin/airscr
rm -f $HOME/.local/share/systemd/user/airscr.service

systemctl --user daemon-reload
