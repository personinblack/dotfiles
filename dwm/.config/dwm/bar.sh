#!/bin/bash

SEPERATOR=" }~{ "
BAR=""

mod_volume() {
  mute=$(pactl list sinks | awk '/^\sMute/ {print $2}')
  if [[ $mute == "yes" ]]; then
    VOL="NA%"
  else
    VOL="$(pactl list sinks | awk '
      /^\sState/ {
        State = $2
      }
      /^\sName/ {
        if ($2 == "easyeffects_sink")
          State = "NOT"
      }
      /^\sMute/ {
        Muted = $2
      }

      /^\sVolume/ {
        if (State == "RUNNING")
          if (Muted == "no")
            print $5 " "
          else
            print "NA% "
      }
    ')"
  fi

  if [[ $VOL == "" ]]; then
    VOL="NA%"
  fi

  echo $VOL
}

mod_temp() {
  temp=$(sensors acpitz-acpi-0 | awk '{ if(NR==5) { print($2++) } }')
  echo "$temp°C"
}

mod_date() {
  echo $(date "+%a %d %b %Y %R:%S")
}

mod_playing() {
  if ! playerctl status >> /dev/null; then
    echo "NA by NA"
  else
    echo $(playerctl metadata title) by $(playerctl metadata artist)
  fi
}

xsetroot -name "$(mod_playing) :: $(mod_volume) :: $(mod_date) :: $(mod_temp)"
