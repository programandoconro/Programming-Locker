import os
from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/')
def schedule():
    os.system("sh hakataminami.sh")
    results = []
    with open('schedule.txt') as f:
        lines = f.readlines()
        for i in lines:
            results.append(i[:-1])
    return jsonify(results)
