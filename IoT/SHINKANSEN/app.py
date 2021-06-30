# API to get time until the 3 next available Shinkansen trains.
# programandoconro 2021
# TODO: add more routes

import os
from datetime import datetime, date
from flask import Flask, jsonify

app = Flask(__name__)
FM = "%H:%M"

# Calculate time until the next 3 Shinkansen trains.  
def calc_time(command):
    results = []
    counter = 0
    now = datetime.now()
    current_time = now.strftime(FM)
    curl = os.popen(command).read()
    schedule = curl.split('\n')[:-1]

    for i in schedule:
        times = datetime.strptime(i,FM).time()
        min_time = datetime.combine(date.min,times) - datetime.combine(date.min,now.time())

        if str(min_time).startswith('-1') == False:
            results.append(str(min_time)[:-7])
            counter += 1
    if len(results) < 1:
        results.append(schedule[0])
        results.append('***')

    return jsonify(results)

# Routes: 
@app.route('/')
def home():
    return "Next Shinkansen train"

@app.route('/hakataminami-hakata')
def hakataminami():
    return calc_time("sh get_schedule.sh from_hakataminami_to_hakata")

@app.route('/hakata-hakataminami')
def hakata():
    return calc_time("sh get_schedule.sh from_hakata_to_hakataminami")

if __name__ == '__main__':
    app.run(threaded=True, port=5000)



