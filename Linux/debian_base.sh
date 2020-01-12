## Debian 10 (Buster)

# Docker 

apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update -y
apt install docker-ce -y

# R

sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/debian buster-cran35/'
sudo apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'
apt install r-base -y

# RStudio

wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.1578-amd64.deb
sudo dpkg -i rstudio-1.2.1578-amd64.deb

# Etcher

echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
apt-get update
apt-get install balena-etcher-electron

# Skype 

wget https://repo.skype.com/latest/skypeforlinux-64.deb
dpkg -i skypeforlinux-64.deb
apt-get install -f




