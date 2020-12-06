#!/bin/dash
i="add-commit-push,status,pull,fetch"
i=$(echo "$i" | rofi -i -sep ',' -dmenu -p git-menu)
if [ -z "$i" ]; then
	exit
elif [ "$i" = "add-commit-push" ]; then
	git add .
	git commit
	git push
else
	git $i
fi
