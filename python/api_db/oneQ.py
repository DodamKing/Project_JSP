import requests
from bs4 import BeautifulSoup as bs
import pymysql
from requests.api import options
from selenium import webdriver
import time
import os
import re
from pytube import YouTube

url = 'https://music.bugs.co.kr/chart/track/day/total'
data = requests.get(url)
soup = bs(data.text, 'html.parser')

titles = soup.select('p.title')
artists = soup.select('p.artist')
imgs = soup.select('.list>tbody>tr')

title_list = []
artist_list = []
img_list = []

for i in range(100):
    title_list.append(titles[i].text.strip())
    artist_list.append(artists[i].select('a')[0].text)
    img_list.append(imgs[i].select('a>img')[0].get('src'))

conn = pymysql.connect(host='localhost', user='root',
                       password='1234', db='java02_kdd')
cursor = conn.cursor()

cnt_db = 0
yt_url_list = []
title = []
artist = []

options = webdriver.ChromeOptions()
options.add_argument('--headless')
options.add_argument('--window-size=1024,768')
options.add_argument('--disable-gpu')
driver = webdriver.Chrome('./95/chromedriver.exe', options=options)

for i in range(100):
    sql = 'select * from song where title = %s and artist = %s'
    val = (title_list[i], artist_list[i])

    cursor.execute(sql, val)
    result = cursor.fetchall()

    # 결과가 없으면 (결과의 길이가 0)
    if len(result) == 0:
        # db 저장
        sql = 'insert song (img, title, artist) select %s, %s, %s'
        val = (img_list[i], title_list[i], artist_list[i])
        cursor.execute(sql, val)
        cnt_db += 1

        # 영상 주소
        keyword = '{} {} official audio, short '.format(
            title_list[i], artist_list[i])
        url = 'https://www.youtube.com/results?search_query=' + keyword

        driver.get(url)
        soup = bs(driver.page_source, 'html.parser')
        if soup.select('a#video-title') == []:
            continue
        html = soup.select('a#video-title')[0]
        video_url = 'https://www.youtube.com' + html.get('href')
        yt_url_list.append(video_url)
        title.append(title_list[i])
        artist.append(artist_list[i])

driver.close()
conn.commit()
conn.close()

# 음원 다운
cnt_down = 0
for i in range(len(yt_url_list)):
    name = '{} - {}'.format(title[i], artist[i])
    name = re.sub('[\\\/:*?\"<>|]', '', name)

    if os.path.exists('D:\works\java02_kdd\Project_JSP\jsp2108_kdd\jsp2108_kdd\src\main\webapp\music\\' + name + '.mp3'):
        print(name + ' is already exist')
        pass
    else:
        yt = YouTube(yt_url_list[i])
        audio = yt.streams.get_by_itag(140)
        audio.download(
            'D:\works\java02_kdd\Project_JSP\jsp2108_kdd\jsp2108_kdd\src\main\webapp\music', name + '.mp3')
        print(name + ' is downloaded')
        cnt_down += 1
        time.sleep(2)

print('insert count: ', cnt_db)
print('download count:', cnt_down)
print('done')
