#!/bin/bash

picom --experimental-backends -b &
copyq &
discord-canary &
firefox &
feh --bg-scale --no-fehbg ~/.dotfiles/wallpaper/.wp &
ckb-next -b &

while :
do
  sh -c $HOME/.config/dwm/bar.sh
  sleep 1
done
