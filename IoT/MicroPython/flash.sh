pip3 install esptool
sudo esptool.py --port /dev/ttyUSB0 erase_flash 
sudo esptool.py write_flash -z 0x1000 esp32-idf3-20200902-v1.13.bin 

