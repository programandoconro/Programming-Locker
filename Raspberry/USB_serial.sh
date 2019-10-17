sudo -i 
#montamos y navegamos al boot

nano config.txt 

#dtoverlay=dwc2 

nano cmdline.txt 

# modules-load=dwc2,g_ether

touch ssh

#en host 
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

## 

ssh pi@raspberrypi.local


