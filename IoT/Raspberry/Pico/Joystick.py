'''
Joystick emulation using Adafruit CircuitPython 6.2.0 (2021-04-05) on a Raspberry Pi Pico with rp2040 . 
Pico usb_hid capability and an Elegoo Joystick piece to move mouse and left click button on a computer or phone.
Tested on a Linux computer and an Android phone device.

'''

import board
from analogio import AnalogIn
import usb_hid
from adafruit_hid.mouse import Mouse
import time
from digitalio import DigitalInOut, Direction, Pull

# Mouse
mouse = Mouse(usb_hid.devices)
xAxis = AnalogIn(board.A1)
yAxis = AnalogIn(board.A0)

in_min,in_max,out_min,out_max = (0, 65000, -5, 5)
filter_joystick_deadzone = lambda x: int((x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min) if abs(x - 32768) > 500 else 0

# Click
button = DigitalInOut(board.GP16)
button.direction = Direction.INPUT
button.pull =Pull.UP

# Run loop
while True:
    
    if button.value == False:
        mouse.click(Mouse.LEFT_BUTTON)
              
    y_offset = filter_joystick_deadzone(xAxis.value) 
    x_offset = filter_joystick_deadzone(yAxis.value) * -1 #Invert axis
    
    mouse.move(x_offset, y_offset, 0)
    time.sleep(0.01)
    
    
    
    
