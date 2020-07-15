#!/bin/sh
(sleep 0.5 && /home/artour/mysh/startup.sh && dwmblocks ) &
~/mysh/monitor-auto
while true; do
	dwm
done
