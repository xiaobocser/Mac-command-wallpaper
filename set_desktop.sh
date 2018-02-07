#!/bin/bash

pass_week=0
week_num=`date +%V`
if [ $# -gt 0 ]; then
	pass_week=$1
	if [ $pass_week -ge $week_num ] ; then
		week_num="01"
	else
		week_num=`date +%V -d -${pass_week}weeks`
	fi
fi

path=$(dirname `readlink -f $0`)
cd $path

if [ ! -d data ] ; then
	mkdir data
fi

python bin/generate_code_calender.py $week_num

localpath=$path"/data/code_calendar_wallpaper_$week_num.jpg"
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$localpath\""
