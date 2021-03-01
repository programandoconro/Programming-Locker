import flask
import requests

api = "https://api.github.com/users/programandoconro/repos"

app = flask.Flask(__name__)

def home():
  r = requests.get(api)
  results = r.json()
  
  return str(results)

app.run()

