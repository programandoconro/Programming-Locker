from mysql.connector import connect,Error

show = "show tables"
select = "select * from Weather"
data = {}

try:
    with connect(
        host="192.168.1.166",
        user="user_name",
        password="password",
        database="Sensors"

    ) as connection:
        print(connection)
        print("Success")
        with connection.cursor() as cursor:
            
            cursor.execute(show)
            for tables in cursor:
                print(tables)
           
            cursor.execute(select)
            for i,vals in enumerate(cursor):
                print(vals)
                data[i] = vals
    print(data)

except Error as e:
    print(e)
