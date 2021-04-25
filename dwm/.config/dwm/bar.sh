MUTE=$(pactl list sinks | awk '/^\sMute/ {print $2}')
VOLUME=" :: $(pactl list sinks | awk '/^\sVolume/ {print $5}')"
if [ $MUTE == "yes" ]; then
  VOLUME=""
fi

xsetroot -name " $(date "+%a %d %b %Y %R:%S")$VOLUME"
