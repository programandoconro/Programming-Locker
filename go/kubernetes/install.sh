sudo -i
mkdir -p $GOPATH/src/k8s.io
cd $GOPATH/src/k8s.io
git clone https://github.com/kubernetes/kubernetes
cd kubernetes
make

# Kubernetes for Docker users.
#https://kubernetes.io/docs/reference/kubectl/docker-cli-to-kubectl/
