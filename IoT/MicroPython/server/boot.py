try:
  import usocket as socket
except:
  import socket

from machine import Pin
import network

import esp
esp.osdebug(None)

import gc
gc.collect()

ssid = ''
password = ''

station = network.WLAN(network.STA_IF)

station.active(True)
station.connect(ssid, password)
