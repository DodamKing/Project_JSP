import requests
from bs4 import BeautifulSoup as bs
from selenium import webdriver
import time
from pytube import YouTube
import os
from selenium.webdriver.chrome.options import Options
import chromedriver_autoinstaller
import subprocess
import shutil


# 차트 수집
url = 'https://music.bugs.co.kr/chart'
data = requests.get(url)
soup = bs(data.text, 'html.parser')

titles = soup.select('p.title')
artists = soup.select('p.artist')
imgs = soup.select('.list>tbody>tr')

title_list = []
artist_list = []
img_list = []

for i in range(10):
    title_list.append(titles[i].text.strip())
    artist_list.append(artists[i].select('a')[0].text)
    img_list.append(imgs[i].select('a>img')[0].get('src'))


# 음원 다운로드
try:
    shutil.rmtree(r"c:\chrometemp")  # 쿠키 / 캐쉬파일 삭제
except FileNotFoundError:
    pass

subprocess.Popen(
    r'"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --remote-debugging-port=9222 --user-data-dir="C:\chrometemp"')  # 디버거 크롬 구동


option = Options()
option.add_experimental_option("debuggerAddress", "127.0.0.1:9222")

chrome_ver = chromedriver_autoinstaller.get_chrome_version().split('.')[0]

try:
    driver = webdriver.Chrome(
        f'./{chrome_ver}/chromedriver.exe', options=option)
except:
    chromedriver_autoinstaller.install(True)
    driver = webdriver.Chrome(
        f'./{chrome_ver}/chromedriver.exe', options=option)
driver.implicitly_wait(10)




# for i in range(10):
#     keyword = '{} - {}'.format(title_list[i], artist_list[i])
#     if os.path.exists('..\\music_db\\' + keyword + '.mp3'):
#         print(keyword + ' is already exist')

#     else:
#         url = 'https://www.youtube.com/results?search_query=' + keyword + ' official audio'
#         driver.get(url)
#         soup = bs(driver.page_source, 'html.parser')
#         html = soup.select('a#video-title')[0]
#         video_url = 'https://www.youtube.com' + html.get('href')

#         yt = YouTube(video_url)
#         audio = yt.streams.get_by_itag(140)
#         # 파일명에 올 수 없는 문자 제거 나중에 파일 가져올 때도 확인 해야 함
#         keyword = re.sub('[\\\/:*?\"<>|]', '', keyword)
#         audio.download('..\\music_db', keyword + '.mp3')
#         time.sleep(2)
# driver.close()
