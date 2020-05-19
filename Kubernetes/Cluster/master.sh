# docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $(whoami)

# kubernetes
curl -sfL https://get.k3s.io | sh -
sudo kubectl get nodes
