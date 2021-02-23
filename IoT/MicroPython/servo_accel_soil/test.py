import mpu6050
from machine import SoftI2C, Pin, PWM
from time import sleep

# mpu sensor

i2c = SoftI2C(scl=Pin(22),sda=Pin(21))
a = mpu6050.accel(i2c)
print(a.get_values())

# servo

p = Pin(19)
servo = PWM(p,freq = 50)
servo.duty(20)
sleep(2)
servo.duty(130)
