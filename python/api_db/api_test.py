import pymysql

conn = pymysql.connect(host='localhost', user='root',
                       password='1234', db='java02_kdd')
cursor = conn.cursor()

sql = 'select * from song where title = %s and artist = %s'
val = ('어제 너는 나를 버렸어', '10cm')

cursor.execute(sql, val)

result = cursor.fetchall()

if len(result) == 0:
    print('없으니까 내용 실행')
else:
    print('있으니까 하지마')
