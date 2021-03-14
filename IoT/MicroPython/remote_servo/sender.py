"""
Send Temperature and orientation data from mpu6050 sensor to local and AWS MQTT Brokers.
Using ESP32 chip and MicroPython.
"""

import mpu6050
from machine import SoftI2C, Pin, PWM, ADC, reset
from time import sleep
import network
import math
from umqtt import simple

import wifi

try:
    wifi.wifi_connect()
except:
    wifi.hotspot_connect()

mqtt_server = "192.168.1.166"
mqtt_aws = "roro.world"

client_id = "usero"

topic_sub = 'temp_orientation'

last_message = 0
message_interval = 5
counter = 0

def sub_cb(topic, msg):
  print(topic, msg)

def connect_and_subscribe():
  global client_id, mqtt_server, topic_sub
  client = simple.MQTTClient(client_id, mqtt_server,user='user00001', password='*********')
  client.set_callback(sub_cb)
  client.connect()
  client.subscribe(topic_sub)

  return client

def connect_and_subscribe_aws():
  global client_id, topic_sub,mqtt_aws
  client_aws = simple.MQTTClient(client_id, mqtt_aws,user="user00001", password="*********")
  client_aws.set_callback(sub_cb)
  client_aws.connect()
  client_aws.subscribe(topic_sub)
  
  return client_aws

def restart_and_reconnect():
  print('Failed to connect to MQTT broker. Reconnecting...')
  sleep(1)
  reset()

try:
  client_aws = connect_and_subscribe_aws()
except OSError as e:
  restart_and_reconnect()

try:
  client = connect_and_subscribe()
except OSError as e:
  restart_and_reconnect(e)

# mpu sensor

i2c = SoftI2C(scl=Pin(22),sda=Pin(21))
a = mpu6050.accel(i2c)

tprev = 0
mprev = False
m = 0

while True:
    
    values = a.get_values()
    z = values["AcZ"]
    t = math.floor(int(values["Tmp"]) * 10) / 10
    
    if int(z) < 0:
        m = "DOWN"
        
    if int(z) > 0:
        m = "UP"
     
    if t != tprev or m != mprev:
        mprev = m
        tprev = t
        try:
            client.check_msg()
            client.publish("temp_orientation", "{} {}".format(str(t),m))
        
        except OSError as e:
            restart_and_reconnect()
            
        try:
            client_aws.check_msg()
            client_aws.publish("temp_orientation", "{} {}".format(str(t),m))
        
        except OSError as e:
            restart_and_reconnect()        
            
    sleep(0.2)
    
    
    
        
        
