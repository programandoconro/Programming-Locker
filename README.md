<div style="text-align:center"><img src="https://programandoconro.files.wordpress.com/2019/07/cropped-net-2.png?w=300" /></div>

# Dockerfiles para data science y proyectos en la Raspberry


Diferentes archivos Dockerfile, bash para proyectos en la Raspberry Pi 3B+ y Data Science en Linux en general.
Comandos escenciales Linux y procedimientos luego de instalar OS. Archivo .conf para conectarnos por ssh a la Raspberry via WIFI local. 

<div style="text-align:center"><img src="https://programandoconro.files.wordpress.com/2019/08/dsc8846.jpg" /></div>


#Una vez dentro de la Raspberry cambiamos la clave predeterminada por medidas de seguridad.

passwd

# Actualizamos Raspbian.

sudo apt-get update $$ apt-get upgrade -y 

sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common

· Descargamos la versión de docker para nuestro OS y agregamos key

sudo curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

# Se agregan los repositorios la lista de fuentes 

sudo echo "deb [arch=armhf] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list
# Actualizamose instalamos Docker 

sudo apt update
sudo apt install docker-ce

# Habilitamos e iniciamos Docker

sudo systemctl enable docker
sudo systemctl start docker

docker run -it ubuntu 

# En otra pestaña de la terminal
 
docker run -it centos
