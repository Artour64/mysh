#!/bin/bash
f=$( ls -al | grep ^-..-..-..-.*\.sh$ | cut -d ' ' -f11 | rofi -dmenu -p chmod+x )
if [ -z "$f" ]; then
	exit
fi
chmod +x $f
