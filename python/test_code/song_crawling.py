from bs4 import BeautifulSoup as bs
from selenium import webdriver

driver = webdriver.Chrome('./95/chromedriver.exe')
title = 'Snowman'
artist = 'sia'
query = title + ' ' + artist
url = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query='

try:
    driver.get(url + query)
    soup = bs(driver.page_source, 'html.parser')
    html = soup.select('ul.tab_list li.tab a')[1].get('href')
    key = 'https://search.naver.com/search.naver' + html

except:
    driver.get(url + title)
    soup = bs(driver.page_source, 'html.parser')
    html = soup.select('ul.tab_list a')[1].get('href')
    key = 'https://search.naver.com/search.naver' + html

driver.get(key)
soup = bs(driver.page_source, 'html.parser')

try:
    data = soup.select('div.info_group dd')
    artist = data[0].text.strip()
    album = data[1].text.strip()
    release = data[2].text.strip()
    genre = data[3].text.strip()
    music = data[4].text.strip()
    words = data[5].text.strip()
    arranger = data[6].text.strip()
    lyrics_data = soup.select_one('p.no_ellipsis')

    print('가수(artist) :', artist)
    print('album :', album)
    print('발매일(release) :', release)
    print('장르(genre) :', genre)
    print('작곡(music) :', music)
    print('작사(words) :', words)
    print('편곡(arranger) :', arranger)

    lyrics = ""
    no = 0
    for item in lyrics_data:
        if no % 2 == 0:
            lyrics += item.strip()
            no += 1
        else:
            lyrics += '\n'
            no += 1

    print('가사')
    print(lyrics)

except:
    print(title + ' 검색 못 함')
    pass

driver.close()
