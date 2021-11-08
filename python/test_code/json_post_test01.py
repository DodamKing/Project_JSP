from flask import Flask, render_template
import requests
from bs4 import BeautifulSoup as bs
import json

app = Flask(__name__)


@app.route('/')
def index():
    data = requests.get('https://music.bugs.co.kr/chart')
    print(data)
    soup = bs(data.text, 'html.parser')

    titles = soup.select('p.title')
    artists = soup.select('p.artist')
    imgs = soup.select('.list>tbody>tr')

    title = []
    artist = []
    img = []

    for i in range(100):
        img_url = imgs[i].select('a>img')

        title.append(" ".join(titles[i].text.split()))
        artist.append(artists[i].text.strip().split()[0])
        img.append(img_url[0].get('src'))

    song_dict = {'title': title, 'artist': artist, 'img': img}
    with open("song.json", "w") as f:
        song_json = json.dump(song_dict, f)

    url = "http://127.0.0.1:9090/jsonPost_test/getJson.jsp"
    headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
    response = requests.get(url, data=song_json, headers=headers)

    return response.status_code


if __name__ == '__main__':
    app.run(debug=True)
