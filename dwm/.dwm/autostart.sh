#!/bin/bash

discord &
firefox &

while :
do
    xsetroot -name "$(date "+%a %d %b %Y %R %S") :: $(pactl list sinks | awk '/^\sVolume/ {print $5}')"
    sleep 1
done