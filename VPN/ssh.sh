#!bash

#Instalar
apt-get install openssh-server
systemctl enable ssh 
systemctl start ssh

# Agregar llaves para no usar contraseñas.
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub UserName@RemoteServer
ssh-add

#copiar archivos local --> remote

scp /dir/al/archivo user@remote.local:~/Destino/
scp -r /dir/ user@remote:~/Destino/

# Comandos a distancia

ssh user@remote.local ls

# por flojera podemos escribrir un script bash para conectar rapidamente.

#!bash
ssh user@remote.local

# Para conectar fuera de la red local necesitamos la IP pública del router y haber abierto un túnel para un servidor local

ssh user@IP 

# Si el túnel esta abierto tendremos acceso a los equipos conectados en la red. 
