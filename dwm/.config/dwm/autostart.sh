#!/bin/bash

xsetroot -bg "#848f81" -fg "black" -bitmap $HOME/.wp.xbm &
discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform \
--enable-features=VaapiVideoDecoder --use-gl=desktop \
--enable-gpu-rasterization --enable-zero-copy &
ckb-next -b &
easyeffects --gapplication-service &
playerctld &

while :
do
  sh -c $HOME/.config/dwm/bar.sh
  sleep 0.5
done
