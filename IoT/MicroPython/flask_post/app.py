import os
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def home():
    return "ESP32 post"

@app.route('/posts',methods = ['POST'])
def post():
    message = request.data
    return message
