#!/bin/dash
t=$(sensors|grep CPUTIN|cut -d ' ' -f18)
echo " $t "
