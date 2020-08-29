#!/bin/bash

#picom --experimental-backends -b &
discord &
firefox &
feh --bg-scale --no-fehbg ~/.dotfiles/wallpaper/.wp &
{
  sudo ckb-next-daemon &
  while :
  do
    ckb-next -b
    sleep 1
  done &
  sleep 1; setxkbmap tr;
} &

while :
do
  sh -c $HOME/.config/dwm/bar.sh
  sleep 1
done
