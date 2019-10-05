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
    
    exit
    
 # Dockerfile. Golang example for saying Good morning or good night in Japanese depending on time
     
     nano Dockerfile
     
 Add:
 
    FROM debian
    RUN apt update -y
    RUN apt install golang -y
    RUN export GOROOT=/usr/local/go
    RUN export GOPATH=$HOME/Projects/Proj1
    RUN export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
    RUN echo "Europe/Spain" > /etc/timezone
    RUN dpkg-reconfigure -f noninteractive tzdata
    COPY 日本語で挨拶して.go /home/
    RUN go run /home/日本語で挨拶して.go

 #Create Go program 
 
    nano 日本語で挨拶して.go
    
 add:
    
    package main
 
    import (
        "fmt"
	    "time"  
    )
 
    func main() {

       	y := time.Now()
        z := y.Hour()

        if  z < 19 && z > 6 {
                fmt.Println("こにちわ")
        } else {
	
                fmt.Println("こんばんわ")
        }
    }

# Build Docker image

      docker build . -t konichiwa_konbanwa
      
# Go inside the container

    docker run -it konichiwa_konbanwa
    
# Run the program

    go run /home/日本語で挨拶して.go
    
    
    
    

