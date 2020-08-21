#!/bin/bash

q=""
declare -a p=("Discord" "zoom" "geary" "kdeconnectd")

for c in "${p[@]}"
do
	x=$(pidof $c) 
	if [ -n "$x" ]; then
		q="$q $c"
	fi
done

#nothing to kill
if [ -z "$q" ]; then
	exit
fi

i=$(echo -e "All$q" | rofi -i -sep ' ' -dmenu -p kill)

if [ -z "$i" ]; then
	exit
#elif [ $i == "None" ];then
#	exit
elif [ $i == "All" ];then
	killall $q
else
	killall $i
fi
