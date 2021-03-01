# save this as app.py
from flask import Flask

app = Flask(__name__)
#app = Flask("hello") # will also work

@app.route("/")
def hello():
    return "Simplest Flask App !"

app.run()

