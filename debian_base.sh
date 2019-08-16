#R (sin anaconda)

apt install dirmngr apt-transport-https ca-certificates software-properties-common gnupg2 -y

apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'
add-apt-repository 'deb https://cloud.r-project.org/bin/linux/debian stretch-cran35/'

apt update -y
apt install r-base-core r-deb -y

# Docker 

apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update -y
sudo apt install docker-ce -y


#######################################################################

apt install synaptic -y
#ir a synaptic 

apt install snap snapd -y
snap install vlc -y

#Latex
apt-get install texlive-full texmaker -y



