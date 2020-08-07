xsetroot -name " $(date "+%a %d %b %Y %R:%S") :: $(pactl list sinks | awk '/^\sVolume/ {print $5}')"
