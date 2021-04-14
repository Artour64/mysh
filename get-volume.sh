#!/bin/dash
mute=$(pacmd list-sinks | awk '/muted/ { print $2 }')
if [ "$mute" = "yes" ]; then
	m="🔇"
else
	m="🔊"
fi
echo " $m:$(amixer get Master | grep % | awk '{print $5}'| sed 's/[^0-9\%]//g' | head -n1) "
