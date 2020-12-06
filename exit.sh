#!/bin/dash
#i="poweroff,reboot,exit --user,suspend,hibernate,hybrid-sleep"
i="suspend,logout,poweroff,reboot"
i=$(echo "$i" | rofi -i -sep ',' -dmenu -p systemctl)
if [ -z "$i" ]; then
	exit
elif [ "$i" = "logout" ]; then
	i="exit --user"
fi
systemctl -q $i

	
