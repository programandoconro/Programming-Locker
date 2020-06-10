
# Conectar Raspberry Pi Zero (sin WIFI) a otra Raspberry mediante USB serial

# Instalamos Raspbian Buster y agregamos archivo ssh a carpeta boot
touch ssh

# Editamos un par de archivos en carpeta boot

echo dtoverlay=dwc2 >> config.txt 

nano cmdline.txt 
# luego de rootwait agreagar: modules-load=dwc2,g_ether

# Accedemos por ssh 

ssh pi@raspberrypi.local

# Cambiamos password y hostname en raspi-config

sudo raspiconfig
# Siendo root, modificamos en archivo ip_forward y permitimos el routing por 
sudo -i 
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE

# Accedemos a la Raspberry mediante USB serial.
ssh pi@raspberrypi.local
ifconfig


