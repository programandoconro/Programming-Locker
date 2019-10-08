sudo apt-get install python-pip

curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker pi

pip install docker-compose

sudo apt-get purge docker-ce
sudo apt-get install docker-ce=18.06.3~ce~3-0~raspbian
sudo systemctl enable docker && sudo systemctl start docker
    
mkdir php-docker-app  
cd php-docker-app

// index.php

    <?php  
        echo ?Hello, Php?;  
    ?>  

sudo nano Dockerfile

// Dockefile

    FROM php:7.0-apache  
    COPY . /var/www/php  

 
 
 docker build -t php-app .  
