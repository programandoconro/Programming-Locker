#!bash

# update
yum update -y
yum upgrade -y

# set root password
sudo passwd root

# programas base
dnf install git nano htop youtube-dl wget elinks wget curl \
python-pip R macchanger nmap terminator transmission \
gnome-tweaks gimp okular cmatrix vim -y

# Snap
yum install snapd -y
sudo ln -s /var/lib/snapd/snap /snap

# Visual Studio Code
snap install code --classic
snap install vlc --classic

# Tor 
mkdir tor
cd tor
wget https://www.torproject.org/dist/torbrowser/9.0.5/tor-browser-linux64-9.0.5_en-US.tar.xz
tar -xvJf tor-browser-linux64-9.0.5_en-US.tar.xz 
cd tor-browser_en-US/
./start-tor-browser.desktop 
# ir a la carpeta y clickear para usar tor

#rstudio
cd && mkdir Rstudio && cd Rstudio
wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.1335-x86_64.rpm 
dnf install compat-openssl10.x86_64 -y
dnf localinstall rstudio-1.2.1335-x86_64.rpm -y 

# librerias R fundamentales
echo " local({
  r <- getOption('repos')
  r['CRAN'] <- 'http://cran.cnr.berkeley.edu/'
  options(repos = r)
}) ;
install.packages(c('keras','ggplot2',
'caret','e1071','randomForest','MASS',
'tensorflow','zoo','stringr','dplyr',
'lubridate','shiny','shinydasboard','neuralnet'), repos='http://cran.us.r-project.org') ; 
library(keras) ; library (tensorflow) ;
install_keras() ; install_tensorflow() " > libs.R && sudo Rscript libs.R

# Wordpress

cd && mkdir Wordpress && cd Wordpress
wget https://public-api.wordpress.com/rest/v1.1/desktop/linux/download
#ir a la carpeta y clickear wpcom para usar

# Anaconda

cd && mkdir Ananconda && cd Anaconda

wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-2019.07-Linux-x86_64.sh -y
source ~/.bashrc -y
yum install conda -y
conda update --prefix /usr anaconda

sudo systemctl stop cups
sudo systemctl disable cups

# Actualizar y reiniciar

yum update -y
reboot
