import pymysql
from bs4 import BeautifulSoup as bs
from selenium import webdriver
from time import sleep

conn = pymysql.connect(host='localhost', user='root',
                       password='1234', db='java02_kdd')
cursors = conn.cursor()

sql = 'select title, artist from song where idx > 481 and idx < 486'
cursors.execute(sql)
result = cursors.fetchall()

for item in result:
    title = item[0]
    artist = item[1]

    sql = 'select album from song where title = %s and artist = %s'
    val = (title, artist)
    cursors.execute(sql, val)
    row = cursors.fetchall()

    if row[0] == ('',):
        options = webdriver.ChromeOptions()
        options.add_experimental_option('excludeSwitches', ['enable-logging'])
        driver = webdriver.Chrome('./95/chromedriver.exe', options=options)
        driver.implicitly_wait(10)
        query = title + ' ' + artist
        url = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query='
        driver.get(url + query)
        soup = bs(driver.page_source, 'html.parser')

        if soup.select('ul.tab_list li.tab a') == []:
            driver.get(url + title)
            soup = bs(driver.page_source, 'html.parser')

            if soup.select('ul.tab_list li.tab a') == []:
                print(title, '검색 실패')
                driver.close()
                continue

        html = soup.select('ul.tab_list a')[1].get('href')
        key = 'https://search.naver.com/search.naver' + html

        # try:
        #     driver.get(url + query)
        #     driver.implicitly_wait(10)
        #     soup = bs(driver.page_source, 'html.parser')
        #     html = soup.select('ul.tab_list li.tab a')[1].get('href')
        #     key = 'https://search.naver.com/search.naver' + html

        # except:
        #     driver.get(url + title)
        #     driver.implicitly_wait(10)
        #     soup = bs(driver.page_source, 'html.parser')
        #     html = soup.select('ul.tab_list a')[1].get('href')
        #     key = 'https://search.naver.com/search.naver' + html

        driver.get(key)
        soup = bs(driver.page_source, 'html.parser')

        try:
            data = soup.select('div.info_group dd')
            cnt = len(data)

            album = ''
            releaseDate = ''
            genre = ''
            music = ''
            words = ''
            arranger = ''

            if cnt == 7:
                artist = data[0].text.strip()
                album = data[1].text.strip()
                releaseDate = data[2].text.strip()
                genre = data[3].text.strip()
                music = data[4].text.strip()
                words = data[5].text.strip()
                arranger = data[6].text.strip()
            elif cnt == 6:
                artist = data[0].text.strip()
                album = data[1].text.strip()
                releaseDate = data[2].text.strip()
                genre = data[3].text.strip()
                music = data[4].text.strip()
                words = data[5].text.strip()
            elif cnt == 5:
                artist = data[0].text.strip()
                album = data[1].text.strip()
                releaseDate = data[2].text.strip()
                genre = data[3].text.strip()
                music = data[4].text.strip()
            elif cnt == 4:
                artist = data[0].text.strip()
                album = data[1].text.strip()
                releaseDate = data[2].text.strip()
                genre = data[3].text.strip()

            lyrics_data = soup.select_one('p.no_ellipsis')

            # print('가수(artist) :', artist)
            # print('album :', album)
            # print('발매일(release) :', releaseDate)
            # print('장르(genre) :', genre)
            # print('작곡(music) :', music)
            # print('작사(words) :', words)
            # print('편곡(arranger) :', arranger)

            lyrics = ""
            no = 0
            for item in lyrics_data:
                if no % 2 == 0:
                    lyrics += item.strip()
                    no += 1
                else:
                    lyrics += '\n'
                    no += 1

            # print('가사')
            # print(lyrics)

            sql = 'update song set album = %s, releaseDate = %s, genre = %s, music = %s, words = %s, arranger = %s, lyrics = %s where title = %s and artist = %s'
            val = (album, releaseDate, genre, music,
                   words, arranger, lyrics, title, artist)
            cursors.execute(sql, val)

            conn.commit()
            sleep(1)

            # cursors.close()
            # conn.close()

            print(title, 'insert')

        except:
            print(title, '오류가 나긴 함')
            pass

        driver.close()

    else:
        print(title, "is exist")

cursors.close()
conn.close()

print('program end')
