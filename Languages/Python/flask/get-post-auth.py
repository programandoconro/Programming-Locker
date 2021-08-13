#!/bin/python3

from flask import Flask, jsonify, request
from flask_cors import CORS
from flask_httpauth import HTTPBasicAuth
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
CORS(app)
auth = HTTPBasicAuth()

users = {
    "john": generate_password_hash("hello"),
    "susan": generate_password_hash("bye")
}

@auth.verify_password
def verify_password(username, password):
    if username in users and \
            check_password_hash(users.get(username), password):
        return username

data = { 'gps': '0'}

@app.route('/')
@auth.login_required
def get_incomes():
  return jsonify(data)

@app.route('/', methods=['POST'])
@auth.login_required
def add_income():
  data['gps'] = request.get_json()
  return '', 204

if __name__ == '__main__':
    app.run(host='0.0.0.0', threaded=True, port=5000)
    
# curl -X POST -H "Content-Type: application/json" -d '5' 'localhost:5000/' -u john:hello

    
    
