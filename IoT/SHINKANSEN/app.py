# API to get time until the next available Shinkansen trains of the day.
# Routes: From Hakata-Minami to Hakata and vice versa. TODO: Add more routes.
# www.nextshinkansen.com
# programandoconro 2021

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

    return results

# Routes: 
@app.route('/')
def home():

    hakata = calc_time("sh get_schedule.sh from_hakata_to_hakataminami")
    hakataminami = calc_time("sh get_schedule.sh from_hakataminami_to_hakata")
    
    return '<div><h1>博多 / 博多南: {}</h1><h1>博多南 / 博多: {}</h1></div>'.format(hakata,hakataminami)

@app.route('/hakataminami-hakata')
def hakataminami_hakata():
    return jsonify(calc_time("sh get_schedule.sh from_hakataminami_to_hakata"))

@app.route('/hakata-hakataminami')
def hakata_hakataminami():
    return jsonify(calc_time("sh get_schedule.sh from_hakata_to_hakataminami"))

if __name__ == '__main__':
    app.run(threaded=True, port=5000)




