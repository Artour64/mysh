#/bin/sh
if [ $1 == "m" ]; then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
else
	pactl set-sink-volume @DEFAULT_SINK@ $1%
fi
~/mysh/bar-vol.sh
