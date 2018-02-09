#!/bin/bash

path=$(cd "$(dirname "$0")"; pwd)
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
path=$real_path
export PATH=$PATH:$path
if [ -f ~/.bash_profile ] ; then
	exist=$(grep "export PATH=\$PATH":$path ~/.bash_profile | wc -l)
	if [ $exist -eq 0 ]; then
		echo "export PATH=\$PATH":$path >> ~/.bash_profile
	fi
	if [ -d /usr/local/opt/imagemagick@6 -a $(grep "imagemagick@6" ~/.bash_profile | wc -l) -eq 0 ] ; then
		echo "export MAGICK_HOME=/usr/local/opt/imagemagick@6" >> ~/.bash_profile
	fi
fi

if [ -f ~/.zshrc ] ; then
	exist=$(grep "export PATH=\$PATH":$path ~/.zshrc | wc -l)
	if [ $exist -eq 0 ]; then
		echo "export PATH=\$PATH":$path >> ~/.zshrc
	fi
	if [ -d /usr/local/opt/imagemagick@6 -a $(grep "imagemagick@6" ~/.zshrc | wc -l) -eq 0 ] ; then
		echo "export MAGICK_HOME=/usr/local/opt/imagemagick@6" >> ~/.zshrc
	fi
fi

chmod +x wallpaper
