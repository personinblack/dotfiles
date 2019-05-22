#!/bin/bash

/usr/bin/xcalib -d :0 /home/menfie/.config/color.icm

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

exec i3
