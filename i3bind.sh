#!/bin/bash
grep '^bindsym' ~/.config/i3/config | sed 's/bindsym //' | rofi -i -dmenu -p i3-bind
