#!bash

sudo passwd root

yum update -y
yum upgrade -y

# programas base

dnf install git nano htop youtube-dl wget elinks wget curl \
python-pip R macchanger nmap terminator transmission \
gnome-tweaks gimp okular vim -y

/usr/bin/python2.7 -m pip install --upgrade --user virtualenv

#vlc 

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
  dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E  %fedora).noarch.rpm -y
  dnf install vlc dnf-plugins-core -y 

# tor 

mkdir tor
cd tor
wget https://www.torproject.org/dist/torbrowser/8.5.4/tor-browser-linux64-8.5.4_en-US.tar.xz
tar -xvJf tor-browser-linux64-8.5.4_en-US.tar.xz
# ir a la carpeta y clickear para usar tor

#rstudio

cd && mkdir Rstudio && cd Rstudio
wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.1335-x86_64.rpm 
dnf install compat-openssl10.x86_6 -y
dnf localinstall rstudio-1.2.1335-x86_64.rpm -y 

# librerias fundamentales

/usr/bin/python2.7 -m pip install --upgrade --user virtualenv

echo " local({
  r <- getOption('repos')
  r['CRAN'] <- 'http://cran.cnr.berkeley.edu/'
  options(repos = r)
}) ;
install.packages(c('keras','ggplot2',
'caret','e1071','randomForest','MASS',
'tensorflow','zoo','stringr','dplyr',
'lubridate','shiny','shinydasboard','neuralnet')) ; 
library(keras) ; library (tensorflow) ;
install_keras() ; install_tensorflow() " > libs.R && sudo Rscript libs.R

# SSH

dnf install -y openssh-server
systemctl start sshd.service
sudo systemctl enable sshd.service

# Wordpress

cd && mkdir Wordpress && cd Wordpress
wget https://public-api.wordpress.com/rest/v1.1/desktop/linux/download
#ir a la carpeta y clickear wpcom para usar

# Anaconda

cd && mkdir Ananconda && cd Anaconda

wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-2019.07-Linux-x86_64.sh -y
source ~/.bashrc -y

#etcher
echo “deb https://deb.etcher.io stable etcher” | sudo tee /etc/apt/sources.list.d/balena-etcher.list
apt-key adv –keyserver keyserver.ubuntu.com –recv-keys 379CE192D401AB61
apt-get update
apt-get install balena-etcher-electron

# VisualStudio

vim /etc/yum.repos.d/vscode.repo
 
 ###################### add to file ###################
 [vscode]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
########################################################

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install code

# Actualizar

yum update -y
yum upgrade -y
