import mpu6050
from machine import SoftI2C, Pin, PWM, ADC, reset
from time import sleep
import network
import wifi
import math

from umqtt import simple


def wifi_connect():
    
    ssid = 'Mi-Ro-Sa-Network'
    wp2_pass = '*************'
    sta_if = network.WLAN(network.STA_IF)
    sta_if.active(True)
    sta_if.connect(ssid, wp2_pass)
    while sta_if.isconnected() == False:
        pass
    print(sta_if.isconnected())

wifi_connect()

mqtt_server = b"192.168.1.166"

client_id = b"usero"

topic_sub = b'temp_orientation'
topic_pub = b'hello'

last_message = 0
message_interval = 5
counter = 0

def sub_cb(topic, msg):
  print((topic, msg))


def connect_and_subscribe():
  global client_id, mqtt_server, topic_sub
  client = simple.MQTTClient(client_id, mqtt_server,user=b'user00001', password=b'***********')
  client.set_callback(sub_cb)
  client.connect()
  client.subscribe(topic_sub)
  return client

def restart_and_reconnect():
  print(b'Failed to connect to MQTT broker. Reconnecting...')
  sleep(1)
  reset()

try:
  client = connect_and_subscribe()
except OSError as e:
  restart_and_reconnect()

# mpu sensor

i2c = SoftI2C(scl=Pin(22),sda=Pin(21))
a = mpu6050.accel(i2c)

tprev = 0
mprev = False

while True:
    
    values = a.get_values()
    z = values["AcZ"]
    t = values["Tmp"]
    
    if int(z) < 0:
        m = "DOWN"
        
    if int(z) > 0:
        m = "UP"
     
    if t != tprev or m != mprev:
        mprev = m
        tprev = t
        try:
            client.check_msg()
            client.publish(b"temp_orientation", b"{} {}".format(str(math.floor(int(t*100))/100.0),m))
        
        except OSError as e:
            restart_and_reconnect()
            
    sleep(0.2)
        
        

