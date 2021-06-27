import os
from flask import Flask, jsonify, request

app = Flask(__name__)
m = {}
@app.route('/')
def home():
    return m

@app.route('/posts',methods = ['GET','POST'])
def post():
    message = request.data
    m[len(m)] = message.decode("utf-8")
    print(message)
    return message
