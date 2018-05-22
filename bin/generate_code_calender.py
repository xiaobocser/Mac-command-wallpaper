#!/usr/bin/env python
import sys
import datetime
import os
import io
from wand.image import Image
from wand.color import Color
import io
from PyPDF2 import PdfFileReader, PdfFileWriter

memo = {}
 
def getPdfReader(filename):
    reader = memo.get(filename, None)
    if reader is None:
        reader = PdfFileReader(filename, strict=False)
        memo[filename] = reader
    return reader


def composite_image(week_num, pdf_path, pic_path, pic_save_path):
    start_page = 6  # PDF start page
    dis_left = 10
    dis_top = 10

    page = start_page + week_num

    pdfile = getPdfReader(pdf_path)
    pageObj = pdfile.getPage(page)
    dst_pdf = PdfFileWriter()
    dst_pdf.addPage(pageObj)

    pdf_bytes = io.BytesIO()
    dst_pdf.write(pdf_bytes)
    pdf_bytes.seek(0)
    
    #with Image(filename=pdf_path.format(page), resolution=200) as calendar:
    with Image(file=pdf_bytes, resolution=200) as calendar:
        calendar.format = 'jpg'
        # calendar.background_color = Color("transparent")
        with Color('#FFFFFF') as white:
            twenty_percent = int(65535 * 0.2)  # Note: percent must be calculated from Quantum
            calendar.transparent_color(white, alpha=0.0, fuzz=twenty_percent)
        with Image(filename=pic_path) as background:
            background.composite_channel(
                'default_channels', calendar, 'blend', dis_left, dis_top)
            background.save(filename=pic_save_path)


def main():
    path = os.getcwd()  # now path
    #pdf_path = path + '/source/2018_code_calendar.pdf[{}]'  # pdf path
    pdf_path = path + '/source/2018_code_calendar.pdf'  # pdf path
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

