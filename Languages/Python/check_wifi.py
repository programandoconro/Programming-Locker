# importing the subprocess module 
import subprocess 
  
# using the check_output() for having the network term retrival 
devices = subprocess.check_output(['netsh','wlan','show','network']) 
  
# decode it to strings 
devices = devices.decode('ascii') 
device = devices.replace("\r","") 
  
# displaying the information 
print(devices)
