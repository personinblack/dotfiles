#!/bin/bash

mod_volume() {
  SINK="$(pactl get-default-sink)"
  VOL="$(printf "%03d%%" $(pactl get-sink-volume $SINK | cut -s -d"/" -f2))"

  if [[ $VOL == "" || $(pactl get-sink-mute $SINK) == "Mute: yes" ]]; then
    VOL="N/A%"
  fi

  echo "$VOL :: "
}

mod_temp() {
  temp=$(sensors acpitz-acpi-0 | awk '{ if(NR==5) { print($2++) } }')
  echo "$temp°C"
}

mod_date() {
  echo "$(date "+%^a %d %^b %H:%M") :: "
}

mod_playing() {
  if playerctl status >> /dev/null; then
    printf "%.35s%.20s :: " "$(playerctl metadata title)" " by $(playerctl metadata artist)"
  fi
}

mod_ip() {
  if ip link | grep "state UP" >> /dev/null; then
    echo "CON :: "
  else
    echo "DIS :: "
  fi
}

status="$(mod_playing)$(mod_volume)$(mod_ip)$(mod_date)$(mod_temp)"

# convert all to lowercase
status="$(echo ${status,,})"

xsetroot -name "$status"
