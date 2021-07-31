SEPERATOR=" ▓"
BAR="$USER@$(cat /etc/hostname)$SEPERATOR"

mod_volume() {
  mute=$(pactl list sinks | awk '/^\sMute/ {print $2}')
  if [[ $mute == "yes" ]]; then
    echo ""
  else
    echo $(pactl list sinks | awk '/^\sVolume/ {print $5}')
  fi
}

mod_temp() {
  temp=$(sensors acpitz-acpi-0 | awk '{ if(NR==5) { print($2++) } }')
  if (( "$temp" >= 70 )); then
    echo "$temp°C"
  else
    echo ""
  fi
}

mod_date() {
  echo $(date "+%a %d %b %Y %R:%S")
}

MODS=($(mod_temp) "$(mod_date)" $(mod_volume))

for mod in "${MODS[@]}"; do
  if [[ $mod == "" ]]; then
    continue
  fi

  BAR+="$mod"
  BAR+=$SEPERATOR
done

xsetroot -name "${BAR%$SEPERATOR*}"
