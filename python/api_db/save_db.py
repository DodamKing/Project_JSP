import requests
from bs4 import BeautifulSoup as bs
import pymysql

url = 'https://music.bugs.co.kr/chart'
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

for i in range(100):
    sql = "insert song (img, title, artist) select %s, %s, %s from dual where not exists (select * from song where title = %s and artist = %s);"
    val = (img_list[i], title_list[i], artist_list[i],
           title_list[i], artist_list[i])
    cursor.execute(sql, val)

print(cursor.rowcount)
conn.commit()

conn.close()
