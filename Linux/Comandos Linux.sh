#Hace más de 4 años me fleché por GNU/Linux, los nombres Fedora y Ubuntu simplemente me cautivaron. La idea de una cantidad innumerable de aplicaciones, gratuítas, era demasiado atractiva. Desde ese día soy usuario diario, de hecho, mi ruta profesional marcó un giro brutal. Ahora comparto la filosofía de software libre, pero dejemos los rodeos y vayamos al punto y coma:

su
#Privilegios absolutos, control total del sistema. Debido a que "un gran superpoder conlleva una gran responsabilidad", el comando 2 es muy práctico.

sudo useradd nombreusuario
#Podemos crear varios usuarios de esta manera. En caso de querer agregar usuarios al grupo de usuarios sudo (administradores), utilizamos el siguiente comando:

usermod -aG sudo nombreusuario

# para ver los grupos a los que pertenece el usuario

group nombreusuario 

#Para cambiar la contraseña utilizamos:

passwd

#Realizados estos pasos básicos,  es momento para actualizar el sistema. Dependiendo de la distribución, o más puntualmente, del gestor de paquetes (apt, yum, pacman), este comando puede variar. En sistemas Debian y derivados, apt es el gestor predeterminado.

  apt update
  apt upgrade
  apt autoremove
#Estos tres comandos pueden ser ejecutados en conjunto, utlizando && entre ellos. Tambien se puede agregar -y para no tener que hacerlo durante el proceso. 

#El comando 8 es mi favorito, nos permite instalar todo tipo de programas en Linux: 

sudo apt install nmap openssh-server htop -y
 
#El siguiente comando quizás tendría que haber sido el primero, ya que nos permite crear un USB bootable con cualquier imagen de Linux. Lo que nos permitirá instalar y transportar Linux facilmente. 

 sudo dd bs=4M if=***.iso of=/dev/sdb status=progress

#Ojo con el comando anterior, ya que hay que navegar a la carpeta donde se encuentra la imagen a quemar y conocer el sitio donde ha sido montado el USB. 

#Para navegar a las carpetas utilizamos un formato tipo:

 cd /carpeta/a/navegar

#Si no sabemos los nombres de las carpetas disponibles, podemos usar la tecla TAB para arrojar las posibilidades. Para regresar a la carpeta anterior utilizamos:

 cd ..

#Si queremos saber donde está un dispositivo USB, disco duro y sus particiones:

 sudo fdisk -l 
Con lo cual podemos montar la unidad que nos interese con:

sudo mount -rw /dev/sd* /carpeta
#Para crear una carpeta nueva en nuestra ubicación:

 sudo mkdir nombrecarpeta
#Crear un archivo vacio:

 touch nombrearchivo
#Crear un archivo con un texto corto:

 echo "Texto corto" > nombrearchivo
#El signo > nos permite asignar un nombre al archivo, si utilizamos >> agregamos el texto sin reemplazar el archivo. 

#Para echar un ojo a un archivo corto:

 cat nombrearchivo
#Con el editor nano podemos ver y editar archivos más grandes:

 nano nombrearchivo
#Utilizando Crlt-x guardamos los cambios. 

#Para copiar archivos de un sitio a otro:

 cp carpeta/archivo carpeta/
#Si nos encontramos en la carpeta destino, podemos simplemente agregar un punto (.), el archivo se creara en nuestra ubicación. Esta técnica puede usarse para renombrar archivos, por ejempo:

 cp archivo nuevoarchivo .
#Para mover archivos seguimos el mismo razonamiento que al copiar. Mientras que si es una carpeta debemos agregar -r.

 mv -r carpeta/ /carpeta/destino
#Si agregamos asterisco (*) luego de carpeta, moveremos todos archivos pero no la carpeta como tal. 

#Para eliminar archivos y carpetas:
 rm nombrearchivo
 rm -r /carpeta
#Un comando que tendría que haber nombrado antes:
 ls
#Permite ver el contenido de la carpeta donde nos ubicamos. 
#Uno que se le parece, y permite saber que tenemos conectado a los puertos USB:
 lsusb
#Hemos sobrepasado el primer cuarto de la lista, ahora las cosas empezaran a ponerse más interesantes. 
ss 
#Simple pero hermoso, nos permite ver las conexiones de nuestro equipo, una herramienta defensiva importante a considerar. Puede ser acompañado de -l para listar los sockets que estan escuchando. 
ss -l
#Ya que nos hemos adentrado al networking, necesitamos nombrar a nmap. Estoy seguro que ya sabes como instalarlo. Este programa nos permite ver los puertos abiertos de una red, información importante para establecer comunicación entre computadoras. Para ver los puertos de la computadora que utilizamos:
nmap localhost
#Para evaluar la red local entera:
nmap 192.168.1.1/24 
#Si creemos que puede haber dispositivos que quieran escapar de nuestro mapeo podemos agregar -Pn para una búsqueda más exaustiva, -p para decir el puerto de interes, e incluso -open para listar solamente los puertos abiertos. 
nmap -Pn 192.168.1.1/24 -p22 -open  
#Si modificamos la IP por nuestra IP pública y nos conectamos desde una red externa, podremos auditar la seguridad de nuestra red. Es lo primero que haría alguien que intente ilegalmente a nuestra red. 

 nmap -Pn **IP**/24 
#Nota del autor: Debemos ser sumamente cautelosos de NO utilizar este comando con IPs públicas que NO se nos ha pedido auditar. 
#El siguiente comando es otro de mis más queridos. 

 ssh usuario@servidor.local
 ssh-keygen
 ssh-copy-id -i ~/.ssh/id_rsa.pub usuario@servidor.local
#En un  tutorial previo comparto mis experiencias al conocer este gran programa. Se puede instalar como un servidor y acceder remotamente, lo que permite programar a distancia. Con la opción -X, incluso podemos usar la interfaz gráfica de usuario. 
#Las Raspberry Pi  son una manera genial de entender la potencia de un servidor ssh, tendremos acceso entero a una computadora sin usar periféricos. En este otro post explico con más detalle. SSH puede tambien utlizarse con el usuario, dominio y puerto a conectar. Se puede compartir archivos entre computadoras facilmente con:
scp nombrearchivo pi@raspberrypi.local:~
#Hablemos de algunos comandos que nos permiten hacer minería de datos. Estos comandos son muy útiles cuando la data es muy grande y la memoría RAM impide que los utilicemos en Python, R o Matlab. 

wc -l nombrearchivo
#El comando anterior nos permite ver el número de líneas o filas que tiene un archivo. Para acceder a las primeras y últimas filas:

 head nombrearchivo
 tail nombrearchivo
#Podemos acompañar estos comandos con -100 para ver 100 filas, o el número que determinemos.

#Si el archivo es demasiado grande, podemos separarlo en varias partes, por ejemplo, cinco:

split -n l/5 nombrearchivo x
#Para seleccionar la quinta columna, utilizamos:

awk '{print $5}' nombrearchivo
#También podemos separar en columnas en función de un caracter, por ejemplo, dos puntos (:)

 cut -d ':' -f1 nombrearchivo 
#Ahora, me gustaría nombrar algunos programas que permiten extraer data de la web. Primero, wget, para descargar archivos desde la terminal, por ejemplo, instalador de RStudio para Debian 10 y Ubuntu 19. 

 wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5001-amd64.deb
#Pero no todo es programación, también necesitamos música para programar. Con youtube-dl bajamos nuestros videos favoritos para acceder a ellos sin conexión a internet. 

 youtube-dl ***youtubelink***
#Con el programa vlc, podemos escuchar y controlar la música desde la línea de comandos. 

 cvlc **musica**
#Con tanta música y vídeos, es importante ver el estado de almacenamiento de los discos, df es la solución. 

 df
#Otra manera de intentar programas y código en línea es con git, el gestor de control de versiones más famoso. Para descargar un repositorio:

 git clone https://github.com/progamandoconro/Docker
#Para actualizar el repositorio local a partir de GitHub:

 git pull origin master
#Los commits y los push también pueden realizarse de esta manera o directamente en GitHub. 
git add .

git diff --cached

git commit -m 'comment'

(Alternatively, instead of running git add beforehand, you can use git commit -a)

git push -u origin master

git checkout -b 'robranch' #o (git switch robranch)

git push origin robranch

git branch -a

#Más opciones y comandos: 
git status
git log
git log -p
git log --stat --summary


git help -a 
git help -g

# Tutorial de git
git help tutorial

git config --global user.name "Your Name Comes Here"
git config --global user.email you@yourdomain.example.com

tar xzf project.tar.gz
cd project
git init


#Scripts de Bash, Python o R, pueden ejecutarse facilmente desde la linea de comandos:

 sudo bash archivo.sh
 sudo python archivo.py
 sudo Rscript archivo.R
#Ya cerca de la mitad de este post, volvamos a algunos comando sencillos pero importantes que olvidé nombrar:
 clear
#Seguramente el comando más importante para quienes aman el orden y la pulcritud.
#Los procesos del sistema pueden mostrarse con:
 top
 htop
 ps -ef | less
#El signo | nos permite concatenar comandos (pipes).

#Si te molestan los cookies y la publicidad, o te obligan a loggearte para acceder a la información que deseas, puedes usar el programa elinks, por ejemplo, para acceder a medium sin usar Facebook ni google:

 elinks https://medium.com/learn-love-code/how-to-set-up-your-professional-data-science-environment-6df74eb06aa4
#Muchas veces queremos controlar la accesibilidad de los archivos y carpetas de nuestro sistema, por ejemplo, dar todo tipo de acceso a un archivo:

 sudo chmod a+rwx nombrearchivo
#O para que solo root pueda acceder a ellos:

 sudo chmod 700 nombrearchivo
#Ahora, es momento de agregar comandos Docker a mi lista. Docker permite ejecutar facilmente y simultaneamente, gran cantidad de servicios y programas, sin preocuparnos de problemas de compatibilidad entre ellos. Además de ser una manera comoda de compartir aplicaciones y realizar experimentación con aplicaciones en desarrollo. Para instalarlo, revisa mi git. 

 docker run -it ubuntu
#De esta manera, tenemos un contenedor virtual corriendo Ubuntu en menos de un minuto. 
 docker ps -a
 docker images
#Podemos listar los servicios e imagenes que tenemos. 
#Creando un archivo llamado Dockerfile, podemos generar instrucciones personalizadas. Por ejemplo, este Dockerfile para instalar librerías Machine Learning en R y Python sobre un sistema Debian. Para crear la imagen:
 docker build .   
#Podemos agregar -t seguido de un nombre para guardar nuestra imagen. 
#Con docker-compose, podemos hacer instalaciones más complejas, como de wordpress, en cuestión de minutos también. Ver el archivo docker-compose-yml para tal fin. 
docker-compose -f docker-compose.yml up
#Tambien podemos instalar Apache con php en segundos, ver link. 
# Tor, para navegar de manera anónima.  Simplemente descárgalo (https://www.torproject.org/dist/torbrowser/8.5.4/tor-browser-linux64-8.5.4_en-US.tar.xz) y
 tar -xvJf tor-browser-linux64-8.5.4_en-US.tar.xz
#tar nos ha descomprido el archivo, ahora ejecuta en carpeta donde se encuentre Tor:

 ./tor-browser_en-US/Browser/start-tor-browser &
#Sea lo que sea que hayamos hecho en Tor, si el ocio ataca, es momento para juegos en la terminal:

 apt-get install bastet moon-buggy ninvaders nsnake pacman4console neofetch figlet -y
#Con neofetch podemos ver detalles de nuestro sistema de manera divertida. 

 neofetch

# Si queremos guardar el resultado de un comando a un archivo, por ejemplo, nmap, utilizamos ">" :

nmap localhost > mylocalnet

# O, por el contrario queremos aplicar un comando a un archivo, por ejemplo, un sript mysql, usamos "<" 

mariadb --user=root --password -s < mariadb.sql

 figlet HOLA AMIGO 

 unzip *.zip
#El comando de arriba habla por si mismo.

 dpkg -i archivo.deb && apt install -f
#Este comando facilita la instalación de aplicaciones .deb. Tambien es posible usar gdebi. 

#Los siguientes comandos utilizan systemctl para controlar servicios del sistema.

 systemctl enable nombreservicio
 systemctl start nombreservicio
 systemctl stop nombreservicio
 systemctl disable nombreservicio
#En este punto, me gustaría nombrar a mi tercer favorito: 

 ifconfig
 ip address
 iwconfig
#Sin estos comandos la vida sería más dificil, no se como he tartado tanto en nombrarlos.

 kill idproceso
 userdel nombreusuario
#Con top ubicamos el proceso. userdel permite eliminar usuario de un grupo, por ejemplo, del grupo sudo. 

#Para ver características del sistemaÑ

 lshw
 lscpu
#Si abrimos nuestro servidor al internet, es muy útil tener la capacidad de bloquear IPs que deseen entrar sin nuestro consentimiento. 

 iptables -A INPUT -s $IPbloquear -j DROP
#Si tienes microprocesadores como el ESP32 o Arduino conectado a tu USB por conexión serial. Ubicarlo es sencillo con:

 dmesg | grep ttyUSB
#Una vez hecho esto, podemos usar rshell y repl para acceder a el. 

 rshell -p /dev/ttyUSB* && repl
#Para interactuar con el dispositivo, podemos usar:

 ampy --port /dev/ttyUSB** ls
 ampy --port /dev/ttyUSB** put archivo
 ampy --port /dev/ttyUSB** run archivo
 ampy --port /dev/ttyUSB** rm archivo
#Para saber el nombre del host.
 hostname
#Para cambiar el nombre de la computadora:
hostnamectl set-hostname nuevonombre
#Para listar los archivos que tengan un patrón, por ejemplo, que terminen en .iso. 
 ls | grep *.iso
#Para saber el número de archivos en una carpeta:
 ls | wc -l
#Desde que conocí Docker, ya no utilizo Anaconda. Sin embargo, es una manera práctica de gestionar ambientes de trabajo en R y Python. Para instalar Anaconda te dejo un post previo. Varios comandos son muy útiles:

 conda create -n my_env python=3.7 anaconda
 conda create -n r_env r-essentials r-base
#Creados estos tres ambientes, podemos activar alguno con:

conda activate r_env
#Y ver las sesiones creadas con:

 conda info --envs
#Para instalar modulos de Python, por ejemplo, face_recognition, utilizamos conda o pip:

 conda install face_recognition
 pip install face_recognition
#Puedes revisar un post previo sobre reconocimiento facial en Linux. 

#Algunos módulos requieren de python 3 para funcionar y su instalación se realiza mediante pip3, por ejemplo, el famoso módulo Pyspark.

 pip3 install --user pyspark

#El próximo comando te hará sentir en la matrix. 
 cmatrix

#Ha sido un viaje interesante tratar de representar los 99 comandos que más me gusta utilizar en Linux. Para terminar, unos sencillos pero fundamentales.
 reboot
 shutdown -h +30
 poweroff -f
#Corresponden a: reiniciar, apagar en 30 minutos y apagar inmediatamente.

#El comando 100 te lo dejo a tu recomendación, ¿Cúal me faltó? 

###########################################################
############## COMANDOS NIVEL INTERMEDIO ###################
###########################################################

# Para ejecutar scripts al iniciar el sistema
cd ~
sudo nano .bashrc
# add the script 
./script

#listar las aplicaciones desktop

ls /usr/share/applications | awk -F '.desktop' ' { print $1}' -

#instalacion segura de mariadb
apt install mariadb-server
/usr/bin/mysql_secure_installation

# Ver la historia del terminal
history

gunzip example.txt.gz #  descomprimir

#para buscar archivos
sudo apt-get install mlocate
locate -i 

# tiempo de procesos
echo "sudo apt update -y" > myUpdate.sh 
time bash myUpdate.sh

# Programar tareas
sudo rm -f /var/run/crond.pid #delete pid
sudo cron 00 00 *** myUpdate.sh #todos los dias a las 12

# Cambiar el tamaño de las fuente en terminal. 
sudo dpkg-reconfigure console-setup

# Provocar sonidos en el computador (apt install beep / yum install beep)
su
beep -f 4000 -D 500 -l 100 -r 100

###################################################Data mining###############################################

#número de filas

wc -l *.txt

#primeros y últimos 10 filas

head -10 *.txt  
tail -10 *.txt 

#eliminar la primera fila de datos

sed 1d *.txt

#seleccionar quinta columna

awk '{print $5}' *.txt 

# cambiar el orden de columnas

awk '{ print $3, $1 }' *.txt

ps -ef | awk -F " " '{print $2}' 

#separar en columnas dependiendo de caracter, en este caso dos puntos #(:)

cut -d ':' -f1 *.txt > **.txt

#cortar una sección intermedia de filas

sed -n '250, 260p' *.txt > **.txt

#dividir el archivo en 5 partes iguales

split -n l/5 *.txt x

###################################### SISTEMA ##################################################################

uname -r
uptime -p
#imprimir todos los procesos en un momento determinado
ps -ef
# ver lista de fuentes 
sudo nano /etc/apt/sources.list

## Temperatura CPU Raspberry Pi

/opt/vc/bin/vcgencmd measure_temp
 
### Enviar archivo via ncat por tunel ssh

cat myDocument.pdf | ssh me.myserver.com nc -l -p 20000
### cliente
nc me.myserver.com 20000 > myDocument.pdf

# Descargar video de youtube en formato mp3
youtube -dl --extract audio --format mp3 

### Audio ssh rasp ######

amixer scontrols 
# Busca el dispositivo y ajustar el volumen 
amixer sset 'PCM' 100%

######################## Operaciones ###########################################

# For loop

          for i in {1..10} ; do 
              echo "hola $i"; 
          done

           #!/bin/bash
            for i in $( ls ); do
                echo item: $i
            done
      
#for.

            #!/bin/bash
            for i in `seq 1 10`;
            do
                    echo $i
            done    
            
# While 
             #!/bin/bash 
             COUNTER=0
             while [  $COUNTER -lt 10 ]; do
                 echo The counter is $COUNTER
                 let COUNTER=COUNTER+1 
             done
    
#Until
             #!/bin/bash 
             COUNTER=20
             until [  $COUNTER -lt 10 ]; do
                 echo COUNTER $COUNTER
                 let COUNTER-=1
             done
             
###########################################################################

