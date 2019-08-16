 dnf -y install dnf-plugins-core

   

     dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo

dnf install docker-ce docker-ce-cli containerd.io -y

systemctl start docker

docker run -it hello-world
