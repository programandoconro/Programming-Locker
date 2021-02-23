# Move the servo depending on the orientation of the mpu sensor.

import mpu6050
from machine import SoftI2C, Pin, PWM, ADC
from time import sleep

# mpu sensor

i2c = SoftI2C(scl=Pin(22),sda=Pin(21))
a = mpu6050.accel(i2c)
p = Pin(19)
servo = PWM(p,freq = 50)

while True:
    values = a.get_values()
    z = values["AcZ"]
    if int(z) < 0:
        print("up")
        servo.duty(20)
      
        
    if int(z) > 0:
        print("down")
        servo.duty(130)
