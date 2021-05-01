#!/bin/bash

picom --experimental-backends -b &
copyq &
discord &
firefox &
feh --bg-scale --no-fehbg ~/.dotfiles/wallpaper/.wp &
{
  sleep 4; ckb-next -b; sleep 4; setxkbmap tr;
  setxkbmap tr;
} &

while :
do
  sh -c $HOME/.config/dwm/bar.sh
  sleep 1
done
