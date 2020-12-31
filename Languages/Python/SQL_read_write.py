import mysql.connector                                                                                        
mydb = mysql.connector.connect(host="localhost", user="pi", password="********", database='sensors')  
cursor = mydb.cursor()

insert = ("insert into weather(Temperature,Humidity,CO2) values(3,3,2); ")
query = ("SELECT * from weather;")

cursor.execute(insert)
cursor.execute(query)                                   
print(cursor.fetchall())       
                       
mydb.commit()
cursor.close()                                       
mydb.close()
