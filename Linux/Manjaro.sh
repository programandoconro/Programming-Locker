#!/bin/bash

echo "Manjaro Post-Installation Script"

if [[ $EUID -ne 0 ]]; then
	echo "Necesitas ser root (sudo -i o su)" 
	exit 1
fi
sleep 1

echo "Activa Wi-Fi"
dev=$(iw dev | grep Interface | awk '{print $2}')
sleep 1

echo $dev
ip link set $dev up
sleep 1

echo "Activando y Habilitando"
systemctl start NetworkManager
systemctl enable NetworkManager
sleep 1

echo "IP= Conectado a: "  $(ip address | grep 192.)
sleep 1

echo "Actualizamos" && sleep 1
pacman -Syy

echo "Instalando programas favoritos para trabajar" && sleep 1
pacman -Sy nmap npm r python-pip podman vim

echo "Instando programas para entretenimiento"
pacman -Sy cmatrix youtube-dl

#echo "Clonando mis repositorios favoritos" && sleep 1
#cd /home/

#git clone https://github.com/programandoconro/wallpapers 
#git clone https://github.com/programandoconro/My-Linux-Locker-
#git clone https://github.com/programandoconro/Mis-Comandos-Linux
#git clone https://github.com/programandoconro/Image-Classification-ML-App
#git clone https://github.com/programandoconro/KanjiTrainer
#git clone https://github.com/programandoconro/vimrc



