

# Docker 



apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update -y
apt install docker-ce -y



#R
add-apt-repository "deb-src https://cloud.r-project.org/bin/linux/debian $(lsb_release -cs)-cran35/"
apt instal r-base

#etcher

echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61

sudo apt-get update
sudo apt-get install balena-etcher-electron




