# 2018年每周编程日历---Mac 版本

> 如图

![](./data/code\_calendar\_wallpaper\_06.jpg)

## 安装

> 打开`终端`程序

1. 安装homebrew

	  `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

2. 安装python

      `brew install python`

3. 安装ImageMagick

      `brew install imagemagick@6`

      `export MAGICK_HOME=/usr/local/opt/imagemagick@6`

4. 安装Ghostscript

      `brew install ghostscript`

## 使用

> 打开`终端`程序，并`cd $YOURPATH`

1. 生成壁纸并设定背景

      `bash set_desktop.sh`

      
2. 生成几周前壁纸并设定背景

      `bash set_desktop.sh 2`


3. 每周定时生成壁纸并设定背景

      `crontab -e`

	  `0 12 * * 1 /bin/bash $YOURPATH/set_desktop.sh` 

	  > 每周一中午12点执行

## 参考

	  V2EX：https://www.v2ex.com/t/427092
