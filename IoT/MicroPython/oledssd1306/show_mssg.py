import network
import machine
import time
import upip
from machine import Pin, I2C

import simple
import ssd1306


# ESP32 Pin assignment 
i2c = I2C(-1, scl=Pin(22), sda=Pin(21))

# ESP8266 Pin assignment
#i2c = I2C(-1, scl=Pin(5), sda=Pin(4))

oled_width = 128
oled_height = 32
oled = ssd1306.SSD1306_I2C(oled_width, oled_height, i2c)

oled.init_display()

oled.text('Initialized', 0, 0)
oled.text('Waiting a mssg.', 0, 10)
oled.text('Send me a mqtt', 0, 20)        
oled.show()

ssid = "Mi-Ro-Sa-Network"
password = "***************"

mqtt_server = "192.168.1.166"

client_id = "user"

station = network.WLAN(network.STA_IF)
station.active(True)

station.connect(ssid,password)

while station.isconnected() == False:
  pass

print(station.ifconfig())

topic_sub = b'test'
topic_pub = b'test2'

last_message = 0
message_interval = 5
counter = 0

def sub_cb(topic, msg):
  print((topic, msg))
  #clear 
  oled.fill(0)
  oled.show()
  oled.text(msg,0,0)
  oled.show()
  if topic == b'test':
    print('ESP received hello message')

def connect_and_subscribe():
  global client_id, mqtt_server, topic_sub
  client = simple.MQTTClient(client_id, mqtt_server,user='user00001', password='*********')
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


while True:
  try:
      
    client.check_msg()
    msg = 'Hello esp mqtt'
    client.publish(topic_pub, msg)
    
    time.sleep(1)
    print('sending')
      
  except OSError as e:
    restart_and_reconnect()

