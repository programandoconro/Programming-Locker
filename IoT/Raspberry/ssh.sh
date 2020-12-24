#!bash

#Instalar
apt-get install openssh-server
systemctl enable ssh 
systemctl start ssh
systemclt status ssh

# Agregar llaves para no usar contraseñas.
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub UserName@RemoteServer
ssh-add

#copiar archivos local --> remote

scp /dir/al/archivo user@remote.local:~/Destino/
scp -r /dir/ user@remote:~/Destino/

# Comandos a distancia

ssh user@remote.local ls

# Para conectar fuera de la red local necesitamos la IP pública del router y haber abierto un túnel para un servidor local

ssh user@IP 

# Firewall
ufw allow 22/tcp # o ufw allow 2222/tcp
ufw allow from 202.54.1.1 to any port 22
ufw limit ssh
ufw status

systemctl stop ssh
systemclt disable ssh
