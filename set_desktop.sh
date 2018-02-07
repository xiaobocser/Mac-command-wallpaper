#!/bin/bash

path=$(dirname `readlink -f $0`)
cd $path

pic_path="source/yosemiteonfire_2560x1440.jpg"
if [ $# -gt 0 ]; then
	pic_path=$1
fi

pass_week=0
week_num=`date +%V`
if [ $# -gt 1 ]; then
	pass_week=$2
	if [ $pass_week -ge $week_num ] ; then
		week_num="01"
	else
		week_num=`date +%V -d -${pass_week}weeks`
	fi
fi

if [ ! -d data ] ; then
	mkdir data
fi

python bin/generate_code_calender.py $pic_path $week_num

localpath=$path"/data/code_calendar_wallpaper_$week_num.jpg"
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$localpath\""
