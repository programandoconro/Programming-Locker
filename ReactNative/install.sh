# Ve a la configuración del teléfono Android y activa las opciones de desarrollador (ABOUT DEVICE ---- toca 7 veces la opción de BUILD NUMBER)

# Ahora, en linux, conectamos por USB a Anrdorid.

lsusb

# Encuerta el dispositivo y copia los primeros 4 valores del ID, por ejemplo, 04e8. 

echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="plugdev"' | sudo tee /etc/udev/rules.d/51-android-usb.rules

adb devices

#Habilita la conexión en tu teléfono.

#Instala npm 
apt install nmp nodejs -y

# Instala node.js

sudo npm install -g create-react-app
