#!bash

yum update -y
yum upgrade -y

dnf install git nano youtube-dl elinks wget curl redshift R pip-python nmap terminator transmission gnome-tweaks gimp -y

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
  dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E  %fedora).noarch.rpm -y
  dnf install vlc -y

dnf -y install dnf-plugins-core 

     dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo

dnf install docker-ce docker-ce-cli containerd.io -y

systemctl start docker
