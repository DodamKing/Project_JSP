import pymysql

conn = pymysql.connect(host='localhost', user='root',
                       password='1234', db='java02_kdd')
cursors = conn.cursor()

sql = "insert into song (img, title, artist) values ('https://image.bugsm.co.kr/album/images/50/204305/20430595.jpg?version=20211109004233.0', '쉬어 (Feat. MINO) (Prod. GRAY)', 'MINO (송민호)');"
cursors.execute(sql)
conn.commit()
print(cursors.rowcount)

sql = 'select * from song'
cursors.execute(sql)

data = cursors.fetchall()

conn.close()

print(data)
