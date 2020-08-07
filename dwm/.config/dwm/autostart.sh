#!/bin/bash

#picom --experimental-backends -b &
discord &
firefox &
feh --bg-max --no-fehbg ~/.dotfiles/wallpaper/.wp &

while :
do
  sh -c $HOME/.config/dwm/bar.sh
  sleep 1
done
