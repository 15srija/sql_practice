import mysql.connector
import pandas as pd

conn=mysql.connector.connect(host='localhost', user='root', password='123456789', database='database_1')
cur=conn.cursor()

cur.execute("create table if not exists student(name varchar(10),roll_number integer,percentage integer)")
# insert_values="insert into student values(%s,%s,%s)"
# v=[('sunny',501,60),('bunny',502,70),('munny',503,80)]
# cur.executemany(insert_values,v)
# conn.commit()

# alter query
# query="alter table student add branch varchar(10) default 'cse'"
# cur.execute(query)
# conn.commit()

# update query

q="update student set branch='ece' where roll_number=503"
cur.execute(q)
conn.commit()
