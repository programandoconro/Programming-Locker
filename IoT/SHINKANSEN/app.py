import os
from datetime import datetime, date
from flask import Flask, jsonify

app = Flask(__name__)
FM = "%H:%M"

@app.route('/')
def shinkansen():
    now = datetime.now()
    current_time = now.strftime(FM)
    print(current_time)
    def nearest(items, pivot):
        return min([i for i in items if i <= pivot], key=lambda x: abs(x - pivot))

    os.system("sh hakataminami.sh")
   
    results = []
    var = -1
    with open('schedule.txt') as f:
        lines = f.readlines()
        for i in lines:
            times = datetime.strptime(i[:-1],FM).time()
            min_time = datetime.combine(date.min,times) -datetime.combine(date.min,now.time())
            if var == -1:
                var = min_time
            else:
                if min_time < var:
                    var = min_time
        results.append(str(var))
    return jsonify(results)
