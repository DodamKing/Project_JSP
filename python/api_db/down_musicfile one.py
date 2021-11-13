from bs4 import BeautifulSoup as bs
from selenium import webdriver
from pytube import YouTube
import os
import re

driver = webdriver.Chrome('./95/chromedriver.exe')
title = '가진다는 말은 좀 그렇지?'
artist = '10CM'
keyword = '{} {} official audio -long'.format(title, artist)
url = 'https://www.youtube.com/results?search_query=' + keyword

driver.get(url)
soup = bs(driver.page_source, 'html.parser')
html = soup.select('a#video-title')[0]
video_url = 'https://www.youtube.com' + html.get('href')
# video_url = 'https://www.youtube.com/watch?v=H99SezEMflU'

driver.close()

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
