#!/bin/bash

mod_volume() {
  SINK="$(pactl get-default-sink)"
  VOL="$(printf "%03d%%" $(pactl get-sink-volume $SINK | cut -s -d"/" -f2))"

  if [[ $VOL == "" || $(pactl get-sink-mute $SINK) == "Mute: yes" ]]; then
    VOL="N/A%"
  fi

  echo $VOL
}

mod_temp() {
  temp=$(sensors acpitz-acpi-0 | awk '{ if(NR==5) { print($2++) } }')
  echo "$temp°C"
}

mod_date() {
  echo $(date "+%^a %d %^b %Y %T")
}

mod_playing() {
  if ! playerctl status >> /dev/null; then
    echo "NA by NA"
  else
    printf "%.35s%.20s" "$(playerctl metadata title)" " by $(playerctl metadata artist)"
  fi
}

xsetroot -name "$(mod_playing) :: $(mod_volume) :: $(mod_date) :: $(mod_temp)"
