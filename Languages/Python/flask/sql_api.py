from mysql.connector import connect,Error
import flask
from flask import request, jsonify,render_template
from collections import OrderedDict

show = "show tables"
select = "select * from Weather"

def get_data():
    data = OrderedDict()
    try:
        with connect(
            host="192.168.1.166",
            user="user",
            password="***********",
            database="Sensors"
            
        ) as connection:
              print(connection)
              print("Success")
              with connection.cursor() as cursor:
                  cursor.execute(show)
                  for db in cursor:
                      print(db)
                  cursor.execute(select)
                  for i,db in enumerate(cursor):
                      data[i] = db
                  for k,j in enumerate(reversed(data)):
                      data[k] = data[j]
    except Error as e:
        print(e)
    
    return data

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route("/",methods = ["GET"])
def home():
    return """<h1> Weather station API </h1>"""

@app.route("/api/temp&hum")
def temp_hum():
    response = jsonify(get_data())
    response.headers.add("Access-Control-Allow-Origin","*")
    return response

@app.route("/home")
def index():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=5000)

    
    
