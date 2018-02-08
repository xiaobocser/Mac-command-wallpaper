#!/usr/bin/env python
import sys
import datetime
import os
from wand.image import Image


def composite_image(week_num, pdf_path, pic_path, pic_save_path):
    start_page = 6  # PDF start page
    dis_left = 10
    dis_top = 8
    
    page = start_page + week_num
    with Image(filename=pdf_path.format(page), resolution=200) as calendar:
        with Image(filename=pic_path) as background:
            background.composite_channel(
                'default_channels', calendar, 'blend', dis_left, dis_top)
            background.save(filename=pic_save_path)


def main():
    path = os.getcwd()  # now path
    pdf_path = path + '/source/2018_code_calendar.pdf[{}]'  # pdf path
    pic_path = path + '/background/yosemiteonfire_2560x1440.jpg'  # wallpaper
    if len(sys.argv) > 1:
        pic_path = sys.argv[1]
    week_num = datetime.datetime.now().isocalendar()[1]
    if len(sys.argv) > 2:
        week_num = int(sys.argv[2])
    week_num_str = '0' + str(week_num) if week_num < 10 else str(week_num)

    pic_save_path = path + '/composite/code_calendar_wallpaper_' + week_num_str + '.jpg'  # new wallpaper

    composite_image(week_num, pdf_path, pic_path, pic_save_path)


if __name__ == "__main__":
    main()

