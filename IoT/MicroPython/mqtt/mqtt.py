import network
import machine
import time
import upip

import simple

ssid = "Mi-Ro-Sa-Network"
password = "*******"

mqtt_server = "192.168.1.166"

client_id = "user00001"


station = network.WLAN(network.STA_IF)
station.active(True)

station.connect(ssid,password)

while station.isconnected() == False:
  pass

print(station.ifconfig())

topic_sub = b'test'
topic_pub = b'hello'

last_message = 0
message_interval = 5
counter = 0

def sub_cb(topic, msg):
  print((topic, msg))
  if topic == b'test':
    print('ESP received hello message')

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


while True:
  try:
  
    msg = b'Hello #%d'
    client.publish(topic_pub, msg)
    time.sleep(1)
    print('sending')
      
  except OSError as e:
    restart_and_reconnect()

