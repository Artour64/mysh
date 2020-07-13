#/bin/bash
#i="poweroff,reboot,exit --user,suspend,hibernate,hybrid-sleep"
i="suspend,logout,poweroff,reboot"
i=$(echo -e $i | rofi -i -sep ',' -dmenu -p systemctl)
if [ "$i" == "logout" ]; then
	i="exit --user"
fi
systemctl -q $i

	
