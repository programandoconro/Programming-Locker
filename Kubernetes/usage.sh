kubectl cluster-info --context kind-kind

docker run -d --restart=always -e DOMAIN=cluster --name nginx-app -p 808:80 nginx
kubectl run --image=nginx nginx-app --port=808 --env="DOMAIN=cluster"
kubectl expose pod nginx-app --port=808 --name=nginx-http

kubeadm init --v=11
worker# 
kubeadm join <arguments-returned-from-init>
