# General info:
kubectl config view
kubectl cluster-info

kubectl get pods
kubectl get nodes
kubectl get deployments
kubectl get services

# Detailed info:
kubectl describe nodes
kubectl describe pods
kubectl describe services

# Delete:
kubectl delete node <name>
sudo kubectl delete pods --all

# Credentials: 
sudo cat /etc/rancher/k3s/k3s.yaml
sudo cat /var/lib/rancher/k3s/server/node-token

# Usage with Docker
docker run -d --restart=always -e DOMAIN=cluster --name nginx-app -p 808:80 nginx
kubectl run --image=nginx nginx-app --port=808 --env="DOMAIN=cluster"
kubectl expose pod nginx-app --port=808 --name=nginx-http

# Deployment:
kubectl apply -f https://k8s.io/examples/application/deployment.yaml
kubectl describe deployment nginx-deployment

# shell access:
kubectl run my-shell --rm -i --tty --image ubuntu -- bash
kubectl exec -it <name> -- /bin/bash
