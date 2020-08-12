#!/bin/bash
f=$( ls -al | grep ^-..-..-..-.*\.sh$ | rev | cut -d ' ' -f1 | rev | rofi -dmenu -p chmod+x )
if [ -z "$f" ]; then
	exit
fi
chmod +x $f
