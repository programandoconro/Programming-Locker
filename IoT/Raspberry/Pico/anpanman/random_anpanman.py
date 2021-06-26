import usb_hid
from adafruit_hid.keyboard import Keyboard
import random
from adafruit_hid.keyboard_layout_us import KeyboardLayoutUS

anpanman = []
with open('anpanman.txt','r') as file:
    for url in file:
        anpanman.append(url)
               
r = random.randint(0, len(anpanman))
print(anpanman[r])

kbd = Keyboard(usb_hid.devices)
layout = KeyboardLayoutUS(kbd)
layout.write('brave ' + anpanman[r])
