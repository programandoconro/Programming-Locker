import network
import machine
import time
from time import sleep
from machine import Pin, I2C, PWM, ADC

from umqtt import simple
import ssd1306

import wifi

wifi.wifi_connect()

pe = Pin(23)
servo = PWM(pe,freq = 50)

z = 1


# ESP32 Pin assignment 
i2c = I2C(-1, scl=Pin(22), sda=Pin(21))
p = Pin(2, Pin.OUT)
p.value(1)

# ESP8266 Pin assignment
#i2c = I2C(-1, scl=Pin(5), sda=Pin(4))

oled_width = 128
oled_height = 32


try:
    oled = ssd1306.SSD1306_I2C(oled_width, oled_height, i2c)
    oled.init_display()

    oled.text('Initialized', 0, 0)
    oled.text('Waiting a mssg.', 0, 10)
    oled.text('Send me a mqtt', 0, 20)        
    oled.show()
except Exception as e:
    print(e)
    
mqtt_server = "192.168.1.166"

client_id = "user"


topic_sub = b'temp_orientation'
topic_pub = b'test'

last_message = 0
message_interval = 5
counter = 0
mess = ""
def sub_cb(topic, msg):
  global mess
  print((topic, msg))
  #clear
  try:
      oled.fill(0)
      oled.show()
      oled.text(msg,0,0)
      oled.show()
      mess = str(msg)[-3:-1]
  except Exception as e:
      print(e)
 

def connect_and_subscribe():
  global client_id, mqtt_server, topic_sub
  client = simple.MQTTClient(client_id, mqtt_server,user='user00001', password='**********')
  client.set_callback(sub_cb)
  client.connect()
  client.subscribe(topic_sub)
  print('Connected to %s MQTT broker, subscribed to %s topic' % (mqtt_server, topic_sub))
  return client

def restart_and_reconnect():
  print('Failed to connect to MQTT broker. Reconnecting...')
  time.sleep(10)
  machine.reset()

try:
  client = connect_and_subscribe()
except OSError as e:
  restart_and_reconnect()

z = 1
servo.duty(20)
time.sleep(1)
servo.duty(130)

while True:
  try:
      
    client.check_msg()
    if mess == "UP":
        
        servo.duty(20)
        p.value(1)
        z = 1
      
    if mess == "WN":
       
        servo.duty(130)
        p.value(0)
    
      
  except OSError as e:
    restart_and_reconnect()
