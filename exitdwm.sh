#/bin/bash
#i="poweroff,reboot,exit --user,suspend,hibernate,hybrid-sleep"
i="suspend,logout,restart,poweroff,reboot"
i=$(echo -e $i | rofi -i -sep ',' -dmenu -p systemctl)
if [ "$i" == "logout" ]; then
	i="exit --user"
elif [ "$i" == "restart" ]; then
	kill $(pidof dwm)
	exit
fi
systemctl -q $i
