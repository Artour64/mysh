#!/bin/bash
cf=~/myinstall/dwm/config.h

si=$(grep "keys\[\]" -n $cf | cut -f1 -d:)
ei=$(grep "};" -n $cf | cut -f1 -d: | awk -v value=$si '$1 > value { print }' | head -n1)
si=$(($si+2))
dif=$(($ei-$si))

si2=$(grep "buttons\[\]" -n $cf | cut -f1 -d:)
ei2=$(grep "};" -n $cf | cut -f1 -d: | awk -v value=$si2 '$1 > value { print }' | head -n1)
si2=$(($si2+2))
dif2=$(($ei2-$si2))

{ tail -n+$si $cf | head -n$dif ; tail -n+$si2 $cf | head -n$dif2 ; } | sed 's/^[ \t]*//;s/[ \t]*$//' | rofi -i -dmenu -p "dwm-bind"

