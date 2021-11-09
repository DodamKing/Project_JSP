from flask import Flask
import requests
from bs4 import BeautifulSoup as bs
import json

app = Flask(__name__)


@app.route('/')
def index():
    header = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko'}
    data = requests.get(
        'https://www.melon.com/chart/index.htm', headers=header)
    soup = bs(data.text, 'html.parser')

    imgs = soup.select('table tr td .wrap img')
    titles = soup.select('table tr td .rank01 a')
    artists = soup.select('span.checkEllipsis')

    img_list = []
    title_list = []
    artist_list = []

    for i in range(100):
        img_list.append(imgs[i].get('src'))
        title_list.append(titles[i].text)
        artist_list.append(artists[i].text)

    song_dict = {'songs': []}

    for i in range(100):
        song_dict['songs'].append(
            {'img': img_list[i], 'title': title_list[i], 'artist': artist_list[i]})

    # for i in range(100):
    #     song_dict['song{}'.format(i)] = {
    #         'img': img_list[i], 'title': title_list[i], 'artist': artist_list[i]}

    # 파일로 만들 때
    with open("song.json", "w") as f:
        json.dump(song_dict, f)

    with open('song.json') as f:
        song_json = json.load(f)

    # 데이터로 바로 넘길 때
    # song_json = json.dumps(song_dict)

    # print(song_json)

    return song_json


if __name__ == '__main__':
    app.run(debug=True)
