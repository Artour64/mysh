#!/bin/dash

browser="firefox"
helpMsg="Open url in browser from file

Argument: file to querry (last specified)
If no arguments given, will ask which file from current directory to query

Options:
 -h, --help : show the help text and exit
 -a, --show-hidden : show hidden files (for no arguments)
 -A, --all : open all urls in file"
a=""
all=""
while [ -n "$1" ]; do
	case "$1" in
		-h|--help) echo "$helpMsg";exit;;
		-a|--show-hidden) a="-a";;	
		-A|--all) all=true;;
#		--start-script) eval $2;shift;;
		
		*) file=$1;;
	esac
	shift
done

if [ -z "$file" ];then
	file=$(ls -p $a | grep -v / | rofi -i -dmenu -p "select file")
	if [ -z "$file" ];then
		exit
	fi
fi


if [ "$all" = "true" ]; then
	cat $file | grep -v "^$" | grep -v "^#" | cut -d ' ' -f1 | while read line ; do $browser $line && sleep 0.1 ; done
else
	url=$(cat "$file" | grep -v "^$" | grep -v "^#" | cut -d ' ' -f1 | rofi -i -dmenu -p "select url")
	if [ -z "$url" ];then
		exit
	fi
	$browser $url
fi
