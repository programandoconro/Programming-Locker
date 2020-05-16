# Debian 10

apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update -y
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64
chmod +x ./kind

~/kind create cluster
kubectl cluster-info --context kind-kind

docker run -d --restart=always -e DOMAIN=cluster --name nginx-app -p 808:80 nginx
kubectl run --image=nginx nginx-app --port=808 --env="DOMAIN=cluster"
kubectl expose pod nginx-apps --port=808 --name=nginx-http
