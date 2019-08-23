yum update -y
yum upgrade -y

yum install nano youtube-dl elinks wget curl redshift\
r-base pip-python docker.io vlc nmap terminator\
transmission gnome-tweaks gimp -y
#Docker
dnf -y install dnf-plugins-core

     dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo

dnf install docker-ce docker-ce-cli containerd.io -y

systemctl start docker

# Etcher
#wget https://balena.io/etcher/static/etcher-rpm.repo -O /etc/yum.repos.d/etcher-rpm.repo

#yum install -y balena-etcher-electron
