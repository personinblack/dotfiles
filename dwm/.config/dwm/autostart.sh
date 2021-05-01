#!/bin/bash

picom --experimental-backends -b &
copyq &
discord &
firefox &
feh --bg-scale --no-fehbg ~/.dotfiles/wallpaper/.wp &
{
  while :
  do
    ckb-next -b
    sleep 1
  done &
  sleep 2; setxkbmap tr;
} &

while :
do
  sh -c $HOME/.config/dwm/bar.sh
  sleep 1
done
