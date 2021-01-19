#!/bin/dash
status(){
	dpms=$(xset q | grep DPMS |tail -n1| cut -d ' ' -f5)
	ss=$(xset q|grep timeout|cut -d ' ' -f5)
	if [ "$dpms" = "Disabled" ];then
		if [ "$ss" = "0" ];then
			status="on"
		else
			status="mixed"
		fi
	elif [ "$ss" = "0" ];then
		status="mixed"
	else
		status="off"
	fi
	echo "$status"
}

charstatus(){
	if [ "$1" = "on" ];then
		echo "☀" 
	elif [ "$1" = "off" ];then
		echo "☾"
	elif [ "$1" = "mixed" ];then
		echo "?"
	else
		echo "!"
	fi
}

if [ "$1" = "status" ];then
	status=$(status)
	if [ "$2" = "char" ];then
		charstatus "$status"
	else
		echo "$status"
	fi
	exit
fi

seton(){
	xset s off
	xset -dpms
}

setoff(){
	xset s on
	xset +dpms
}

if [ "$1" = "toggle" ];then
	status=$(status)
	if [ "$status" = "on" ];then
		setoff
	elif [ "$status" = "off" ];then
		seton
	elif [ "$status" = "mixed" ];then
		seton
	fi
	exit
elif [ "$1" = "on" ];then
	seton
	exit
elif [ "$1" = "off" ];then
	setoff
	exit
fi

if [ -z "$1" ];then
	status=$(status)
	menu="toggle,set-on,set-off"
	sel=$( echo "$menu" | tr ',' '\n' | rofi -i -dmenu -p "caffeine($status)" )
	if [ -z "$sel" ];then
		exit
	elif [ "$sel" = "toggle" ];then
		if [ "$status" = "on" ];then
			setoff
		elif [ "$status" = "off" ];then
			seton
		elif [ "$status" = "mixed" ];then
			seton
		fi
	elif [ "$sel" = "set-on" ];then
		seton
	elif [ "$sel" = "set-off" ];then
		setoff
	fi
	exit
elif [ "$1" = "char" ];then
	status=$(status)
	stat=$(charstatus "$status")
	menu="toggle,set-on,set-off"
	sel=$( echo "$menu" | tr ',' '\n' | rofi -i -dmenu -p "caffeine($stat)" )
	if [ -z "$sel" ];then
		exit
	elif [ "$sel" = "toggle" ];then
		if [ "$status" = "on" ];then
			setoff
		elif [ "$status" = "off" ];then
			seton
		elif [ "$status" = "mixed" ];then
			seton
		fi
	elif [ "$sel" = "set-on" ];then
		seton
	elif [ "$sel" = "set-off" ];then
		setoff
	fi
	exit
fi

helpmsg="this script lets you enable/disable your power settings (standby, dim screen, etc) similar to the caffeine gnome extension

running without arguments will open a rofi/dmenu prompt to choose toggle, set-on, or set-off actions
the prompt will show the current status (on/off/mixed).

commands:
char - same as running without arguments but the status will be shown as a single character (☀/☾/?)
status - prints the status (on/off/mixed)
stats char - prints the status as a single character (☀/☾/?)
on - enable caffeine (will disable screensaver and dpms)
off - disable caffeine (will enable screensaver and dpms)
toggle - toggle enabled/disabled. if status is 'mixed', will enable
help -  displays this help message
-h - displays this help message
--help - displays this help message
"
if [ "$1" = "-h" ];then
	echo "$helpmsg"
elif [ "$1" = "help" ];then
	echo "$helpmsg"
elif [ "$1" = "--help" ];then
	echo "$helpmsg"
else
	echo "caffine command not recognized: $1"
fi
