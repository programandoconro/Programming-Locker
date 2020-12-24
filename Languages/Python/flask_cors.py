# read a file and served in an API with flask.

import flask
from flask import request, jsonify
app = flask.Flask(__name__)
app.config["DEBUG"] = True
@app.route('/',methods=['GET'])
def home():
        return '''<h1> Test </h1> '''
@app.route('/api/v1/data', methods= ['GET'])
def api_all():
        f = open('data.txt', 'r')
        data = {'id': f.read()}
        response = jsonify(data)
        response.headers.add("Access-Control-Allow-Origin","*")
        return response
app.run(host='0.0.0.0', port=8888)
