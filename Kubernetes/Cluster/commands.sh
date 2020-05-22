kubectl config view
kubectl cluster-info

kubectl describe nodes
kubectl describe pods

kubectl get pods
kubectl get nodes
kubectl get deployments
kubectl get services

kubectl delete node <name>

kubectl exec -it <name> -- /bin/bash

sudo cat /etc/rancher/k3s/k3s.yaml
sudo cat /var/lib/rancher/k3s/server/node-token

# usage with Docker

docker run -d --restart=always -e DOMAIN=cluster --name nginx-app -p 808:80 nginx
kubectl run --image=nginx nginx-app --port=808 --env="DOMAIN=cluster"
kubectl expose pod nginx-app --port=808 --name=nginx-http

