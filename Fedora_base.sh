#!bash


yum update -y
yum upgrade -y

dnf install git nano youtube-dl wget elinks wget curl python-pip redshift R macchanger nmap terminator transmission gnome-tweaks gimp okular vim -y

/usr/bin/python2.7 -m pip install --upgrade --user virtualenv

#vlc 
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
  dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E  %fedora).noarch.rpm -y
  dnf install vlc -y

dnf -y install dnf-plugins-core 

#Docker 

dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf makecache

dnf install docker-ce -y

systemctl enable docker.service
systemctl start docker.service


#tor 
mkdir tor
cd tor
wget https://www.torproject.org/dist/torbrowser/8.5.4/tor-browser-linux64-8.5.4_en-US.tar.xz
tar -xvJf tor-browser-linux64-8.5.4_en-US.tar.xz

#rstudio
wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.1335-x86_64.rpm
rpm -i rstudio-1.2.1335-x86_64.rpm -y

/usr/bin/python2.7 -m pip install --upgrade --user virtualenv

echo 'install.packages(c('keras','ggplot2',
'caret','e1071','randomForest','MASS',
'tensorflow','zoo','stringr','dplyr',
'lubridate','shiny','shinydasboard','neuralnet')) ; 
install_keras() ; install_tensorflow()' > libs.R && Rscript libs.R

yum update -y
yum upgrade -y


















