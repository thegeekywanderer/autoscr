#!/bin/bash

case $1 in
    pre)    pkill scrcpy ;;
    post)   /usr/local/bin/wifi_mirror.sh ;;
esac
