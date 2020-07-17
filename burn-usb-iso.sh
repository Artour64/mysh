#!/bin/bash
x=$(select-iso.sh)
if [ -z $x ]; then
	echo "nothing selected"
else
	echo "selected: $x"
	sudo dd bs=4M if=$x of=/dev/sdb
fi

