#!/bin/bash

picom -b &
copyq &
discord --use-gl=desktop --enable-speech-dispatcher &
firefox &
feh --bg-scale --no-fehbg ~/.dotfiles/wallpaper/.wp &
ckb-next -b &
easyeffects --gapplication-service &
playerctld &

while :
do
  sh -c $HOME/.config/dwm/bar.sh
  sleep 0.5
done
