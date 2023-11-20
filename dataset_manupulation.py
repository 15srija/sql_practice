import mysql.connector
import pandas as pd
import csv

conn=mysql.connector.connect(host="localhost",user="root",passwd="123456789",database="database_1")
cur=conn.cursor()

df=pd.read_csv('Salary_Data.csv')

table_name='Salary_data'
df.columns=df.columns.str.replace(" ","_")
d_clm_nms = {}
for col in df.columns:

    if df[col].dtype == 'float':
        d_clm_nms[df[col]] = "float"
        df[col] = df[col].astype(float)
    elif df[col].dtype == 'object':
        df[col] = df[col].astype(str)

create_table_query=f"create table if not exists {table_name} ({', '.join([f'{col} {df[col].dtype}' for col in d_clm_nms])})" col[]
cur.execute(create_table_query)

conn.commit()








# df = pd.read_csv("Salary_Data.csv",sep=',',quotechar='\'',encoding='utf8') # Replace Excel_file_name with your excel sheet name
# df.to_sql('Table_name',con=conn,index=False,if_exists='append') 
# table_name='Salary_Data'
# create_table_query = f"CREATE TABLE IF NOT EXISTS {table_name} ({', '.join([f'{col} VARCHAR(255)' for col in ds.columns])})"
# cur.execute(create_table_query)
# print(f"Table '{table_name}' created.")
# print("Importing the file..")
# query="insert into Salary_Data values (%s,%s,%s,%s,%s,%s)"
# data_to_insert=[tuple(row) for row in ds.itertuples(index=False,name=None)]
# cur.executemany(query,data_to_insert)
# conn.commit()