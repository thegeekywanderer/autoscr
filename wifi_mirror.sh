#!/bin/bash

sleep 10

adb_check=`adb devices | awk -F " " 'FNR>1 {print $2}'`

if [[ $adb_check == *"device"* ]]; 
then
    scrcpy --bit-rate 2M --max-size 800 --window-x 1500 --window-y 150 --window-title "wolf's Phone" 
else
    zenity --info --text="ADB IP not found... Connect your device via USB" --title="wolf's Mirror Script" --width=300 --height=100
    
    while true
    do
       
        if [[ `adb devices | awk -F " " 'FNR>1 {print $2}'` == *"device"* ]];
        then
            ip_addr=`adb shell ip addr show wlan0 | grep "inet\s" | awk '{print $2}' | awk -F'/' '{print $1}'`
            adb tcpip 5555
            zenity --info --text="Remove the device and press Ok" --title="wolf's Mirror Script" --width=300 --height=100
            if [[ `hostname -I | awk -F '.' '{print $1}'` == `cut -d '.' -f1 <<<"$ip_addr"` ]] && [[ `hostname -I | awk -F '.' '{print $2}'` == `cut -d '.' -f2 <<<"$ip_addr"` ]];
            then
                adb connect $ip_addr
                sleep 4
                if [[ `adb devices | awk -F " " 'FNR>1 {print $2}'` == *"device"* ]];
                then
                   
                    scrcpy --bit-rate 2M --max-size 800 --window-x 1500 --window-y 150 --window-title "wolf's Phone"

                    break
                else
                    adb kill-server
                    adb start-server
                fi
            else 
                zenity --error --text="Device not on same LAN... Connect to same WiFi and try again" --title="wolf's Mirror Script" --width=300 --height=100 
            fi
        fi
    done
fi
# cd ~/autoadb/target/release
# ./autoadb scrcpy --bit-rate 2M --max-size 800 --window-x 1500 --window-y 150 --window-title "Wolf's Phone"

# cd ~/sndcpy
# ./sndcpy

