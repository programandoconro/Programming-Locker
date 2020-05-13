# Debian 10

apt-get update && sudo apt-get install -y$
curl -s https://packages.cloud.google.com$
cat <<EOF | sudo tee /etc/apt/sources.lis$
deb https://apt.kubernetes.io/ kubernetes$
EOF
apt-get update -y
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

virsh net-autostart default
virsh net-start default
