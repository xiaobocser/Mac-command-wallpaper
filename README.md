# 2018年每周编程日历---Mac 版本

如图

![](./data/code\_calendar\_wallpaper\_06.jpg)

## 安装

打开`终端`工具

1. 安装homebrew

2. 安装python

      `brew install python`

3. 安装ImageMagick

      `brew install imagemagick@6`

      `export MAGICK_HOME=/usr/local/opt/imagemagick@6`

4. 安装Ghostscript

      `brew install ghostscript`

## 使用

1. 生成壁纸并设定背景

      `bash set_desktop.sh`

      

2. 生成几周前壁纸并设定背景

      `bash set_desktop.sh 2`

      

3. 每周定时生成壁纸并设定背景

      `crontab -e`
      

## 相关资源

V2EX：https://www.v2ex.com/t/427092
