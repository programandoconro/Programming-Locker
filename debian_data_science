su
nano /etc/apt/sources.list

##################################################################
# deb cdrom:[Debian GNU/Linux 9.9.0 _Stretch_ - Official amd64 DVD Binary-1 20190427-$

#deb cdrom:[Debian GNU/Linux 9.9.0 _Stretch_ - Official amd64 DVD Binary-1 20190427-1$

deb http://ftp.es.debian.org/debian/ stretch main non-free
deb-src http://ftp.es.debian.org/debian/ stretch main non-free

deb http://security.debian.org/debian-security stretch/updates main contrib
deb-src http://security.debian.org/debian-security stretch/updates main contrib

# stretch-updates, previously known as 'volatile'
deb http://ftp.es.debian.org/debian/ stretch-updates main contrib
deb-src http://ftp.es.debian.org/debian/ stretch-updates main contrib

##################################################################

apt-get install sudo  
sudo apt-get update
usseradd ro
usermod -aG sudo ro
sudo reboot -f

#######################################################################
#download anaconda from webpage
cd Downloads

ls

bash Anaconda.shy
source ~/.bashrc
#reininciar terminal
conda update --prefix /home/ro/anaconda3 anaconda 

conda create -name r_env r-essentials r-base
conda create -n my_env python=3.7 anaconda

conda activate r_env 

conda remove -n r_env -all

conda list

conda config --add channels conda-forge
conda install numpy
conda install scipy
conda install dlib
sudo apt-get install python3-pip
pip3 install face_recognition

#####################################################################3
sudo apt isntall synaptic
#ir a synaptic e instalar dropbox

sudo apt install snap snapd
sudo snap install vlc

#wordpress https://apps.wordpress.com/d/linux-deb/

cd Downloads
sudo apt-get insall ./wordpress.com-linux-deb-4.2.0.deb

#Latex
sudo apt-get install texlive-full

#R (sin anaconda)

sudo apt install dirmngr apt-transport-https ca-certificates software-properties-common gnupg2

sudo apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/debian stretch-cran35/'

sudo apt updatesudo apt install r-base


