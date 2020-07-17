#!/bin/sh
ls -a | grep \.iso$ | rofi -dmenu -p select-iso
