# 2018年每周编程日历---Mac 版本

> 如图

![](./data/code\_calendar\_wallpaper\_06.jpg)

## 简介

> 拿任何一张你喜欢的`背景图片`和`编程日历`合二为一，生成你的独特桌面背景

> `编程日历`每周一更；`背景图片`随你所动。

![](./source/python\_calander.jpg)

## 使用

> `git clone https://github.com/xiaobocser/code-wallpaper-2018-Mac.git`

> 命令格式

`bash set_desktop.sh $your_backgroud $pass_week`

> 几种简单的使用方法

1. 生成本周壁纸并设定背景

      `bash set_desktop.sh source/risingabovethefog_2560x1440.jpg`

	  > (source/risingabovethefog_2560x1440.jpg可以替换为你的背景图片地址，背景图片用2560x1440分辨率效果最佳)
      
2. 生成几周前壁纸并设定背景

      `bash set_desktop.sh $your_backgroud 2`

	  > 生成2周前壁纸并设定背景

3. 每周定时生成壁纸并设定背景

      `crontab -e`

	  `0 12 * * 1 /bin/bash $FILE_PATH/set_desktop.sh $your_backgroud` 

	  > 每周一中午12点执行


## 安装

> 打开`终端`程序

1. 安装homebrew

	  `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

2. 安装python

      `brew install python`

3. 安装wand包

	  `pip install wand`

4. 安装ImageMagick

      `brew install imagemagick@6`

      `export MAGICK_HOME=/usr/local/opt/imagemagick@6`

5. 安装Ghostscript

      `brew install ghostscript`

## 参考

> V2EX：https://www.v2ex.com/t/427092
