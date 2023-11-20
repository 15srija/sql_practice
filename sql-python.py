import mysql.connector
import pandas as pd

########################################## CONNECTION ESTABLISHMENT #####################################################

con=mysql.connector.connect(host="localhost",user="root",passwd="123456789",database="database_1")
c=con.cursor()

##########################################  CHECK TABLE ALREADY EXISTS OR NOT ############################################

def table_exists(connection,table_name):
    
    q=f"select count(*) from information_schema.tables where table_name='{table_name}'"
    c.execute(q)
    result = c.fetchone()[0]
    return result>0

############################################    DISPLAY TABLE CONTENT   ##################################################

def display_table(con,table_name):
    q=f"select * from {table_name}"
    c.execute(q)
    rows=c.fetchall()                               # fetches all the rows in the form of tuples
    col_names=[desc[0] for desc in c.description]   #from cursor description gets only 0th index values 
                                                    #i.e column names in the form of list
    db_pd=pd.DataFrame(rows,columns=col_names)      # converts list and tuples in the form of dataframe.
    print(db_pd)

############################################ GET THE INPUTS FROM USER FOR INSERTION ##########################################

def get_values(columns):
    values=[input(f"Enter value for '{col}':")for col in columns]
    return tuple(values)

########################################### INSERT THE VALUES TO THE TABLE ####################################################

def insert_values(con,table_name,columns):
    add_one_more='y'
    print(table_name)
    while add_one_more!='n':
        insert_values=f"insert into {table_name} values(%s,%s)"
        value=get_values(columns)
        #print(value)
        c.execute(insert_values,value)
        con.commit()
        add_one_more=input("Do you want to add one more element(y/n):")
    display_table(con,table_name)


############################################## GET THE COLUMNS OF EXISTING TABLES ########################################

def get_columns(con,table_name):
    query=f"select column_name, data_type from information_schema.columns where table_schema='database_1' and table_name='{table_name}"
    column_info=c.execute(query)
    return column_info

################################################# ADD COLUMN ############################################################

def add_column():
    table_name=input("Enter the table name to alter:")
    display_table(con,table_name)
    column_name=input("Enter the column name you want to add to the table:")
    data_type=input("Enter data type (e.g., VARCHAR(255), INT, FLOAT, etc.):")
    query=f"alter table {table_name} add {column_name} {data_type}"
    c.execute(query)
    con.commit()
    display_table(con,table_name)

############################################# UPDATE COLUMN NAME IN TABLE #####################################################

def update_table():
    table_name=input("Enter the table name to alter:")
    display_table(con,table_name)
    old_col_name=input("Enter the column name to change:")
    new_col_name=input("Enter the new column name to replace:")
    query=f"ALTER TABLE {table_name} RENAME COLUMN {old_col_name} TO {new_col_name}"
    c.execute(query)
    print("Updated column name..!")
    con.commit()
    display_table(con,table_name)

############################################# MODIFY DATATYPE OF COLUMN ###############################################

def modify_datatype():
    table_name=input("Enter the table name to alter:")
    display_table(con,table_name)
    column_name=input("Enter the column name to modify:")
    data_type=input("Enter the data type:")
    query=f"alter table {table_name} modify {column_name} {data_type}"


################################################# TABLE CREATION #########################################################

def creation_of_table():
    check_table_name=input("Enter the name of the table:")
    if table_exists(con,check_table_name):
        print(f"{check_table_name} already there in the database")
        display_table(con,check_table_name)
        insertion=input("Do you want to add values into the table(y/n):")
        if insertion=='y':
            query=f"select column_name,data_type from information_schema.columns where table_schema='database_1' and table_name='{check_table_name}'"
            column_info=c.execute(query)
            df_c = pd.DataFrame(c.fetchall(),columns=['column_name','data_type'])
            print("column_info :",df_c)
            columns=df_c['column_name'].tolist()
            print(columns)
            insert_values(con,check_table_name,columns)
        else:
            print("Okay!")
    else:
        print("Creating table...")
        # create if not exists table <table_name>
        total_columns=int(input("Enter no. of columns:"))
        columns=[]
        for i in range(total_columns):
            col_name=input("Enter column name:")
            data_type=input("Enter data type (e.g., VARCHAR(255), INT, FLOAT, etc.):")
            columns.append(f"{col_name} {data_type}")
        create_table=f"create table {check_table_name}({', '.join(columns)})"
        c.execute(create_table)
        print("Table created.")
        display_table(con,check_table_name)
        con.commit()
        insertion=input("Do you want to insert values into the table(y/n):")
        if insertion=='y':
            insert_values(con,check_table_name,columns)
        else:
            print("You have created an empty table.")

################################################## OPERATIONS #########################################################

print("Hello! You are at the right place if you are trying to create and manupulate tables in mysql!!!")
operation=input("Choose one of the following operation:\n1.create_table\n2.insert_values\n3.add_column\n4.update_column_name\n")
operate='y'
while operate != 'n':
    switch={
        '1': creation_of_table,
        '2': creation_of_table,
        '3': add_column,
        '4': update_table,
        '5': modify_datatype
        # col_update, rename, delete_row_values, modify_row_values
    }
    if operation in switch:
        switch[operation]()
    else:
        print("Please enter correct operation")
    operate=input("Do you want do more operations:(y/n)\n")
    if operate=='y':
        operation=input("Choose one of the following operation:\n1.create_table\n2.insert_values\n3.add_column\n4.update_column_name")
    else:
        print("Thank You!!!....")
