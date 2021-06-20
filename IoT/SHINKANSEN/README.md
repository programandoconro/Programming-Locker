# Next-Shinkansen:

Get time until next Shinkansen trains in your ESP32 OLED screen.

Features:
* Flask API.
* Arduino ESP32 OLED.
* Deployed in Heroku.
* Route: Hakata minami station -> Hakata station.

TODO: Add more routes to API, another oled and keypad to select.

# API Local deployment

```
docker build . -t shinkansen
docker run -dit --restart always -p 9999:5000 shinkansen 
```
* Remote API available in: https://next-shinkansen.herokuapp.com/hakataminami-hakata

# IoT device on action:

ESP32 Helmec WiFi-Kit

<div> 
<img src='https://github.com/programandoconro/Programming-Locker/blob/master/IoT/SHINKANSEN/next-shinkansen.jpg?raw=true'/>

</div>

## 博多南駅から博多駅まで次の新幹線。
