#!/bin/bash

path=`readlink -f $0`
real_path=""
i=0
for pt in $path ; do
	if [ $i == 0 ] ; then
		real_path=$pt
		i=1
	else
		real_path=$real_path"\ "$pt
	fi
done
path=${real_path%/*}
export PATH=$PATH:$path
echo "export PATH=\$PATH":$path >> ~/.bash_profile
chmod +x wallpaper
