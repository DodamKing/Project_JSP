from bs4 import BeautifulSoup as bs
from selenium import webdriver
from pytube import YouTube
import os
import re

# driver = webdriver.Chrome('./95/chromedriver.exe')
title = '잠들지 않는 별'
artist = '벤'
# keyword = '{} {} official audio, short'.format(title, artist)
# url = 'https://www.youtube.com/results?search_query=' + keyword

# driver.get(url)
# soup = bs(driver.page_source, 'html.parser')
# html = soup.select('a#video-title')[0]
# video_url = 'https://www.youtube.com' + html.get('href')
video_url = 'https://www.youtube.com/watch?v=wT9Qqunzx3I'

# driver.close()

fileName = '{} - {}'.format(title, artist)
fileName = re.sub('[\\\/:*?\"<>|]', '', fileName)

if os.path.exists('D:\works\java02_kdd\Project_JSP\jsp2108_kdd\jsp2108_kdd\src\main\webapp\music\\' + fileName + '.mp3'):
    print(fileName + ' is already exist')
    pass
else:
    yt = YouTube(video_url)
    audio = yt.streams.get_by_itag(140)
    audio.download(
        'D:\works\java02_kdd\Project_JSP\jsp2108_kdd\jsp2108_kdd\src\main\webapp\music', fileName + '.mp3')
    print(fileName + ' is downloaded')
