#!/bin/dash
x=$(select-iso.sh)
if [ -z "$x" ]; then
	echo "nothing selected"
	exit
fi
#echo "selected: $x"
y=$(lsblk | grep ^sd* | tac | rofi -i -dmenu -p "select usb")
if [ -z "$y" ];then
	echo "nothing selected"
	exit
fi
echo "$y"
y=$(echo "$y" | cut -d ' ' -f1)
echo sudo dd bs=4M if=$x of=/dev/$y
confirm=$(echo "yes\nno" | rofi -i -dmenu -p "Are you sure?")
if [ -z "$confirm" ];then
	echo "nothing selected"
	exit
elif [ "$confirm" = "yes" ];then
	sudo dd bs=4M if=$x of=/dev/$y
fi
