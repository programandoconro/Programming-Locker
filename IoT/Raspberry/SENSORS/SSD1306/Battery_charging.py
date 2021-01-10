from board import SCL, SDA
import busio
from oled_text import OledText, Layout64
from time import sleep

i2c = busio.I2C(SCL, SDA)

# Create the display, pass its pixel dimensions
oled = OledText(i2c, 128, 64)

# Write to the oled
while True:
    oled.layout = Layout64.layout_icon_only()
    oled.text('\uf244', 1)
    sleep(1)
    oled.text('\uf243', 1)
    sleep(1)
    oled.text('\uf242', 1)
    sleep(1)
    oled.text('\uf241', 1)
    sleep(1)
    oled.text('\uf240', 1)
    sleep(1)

