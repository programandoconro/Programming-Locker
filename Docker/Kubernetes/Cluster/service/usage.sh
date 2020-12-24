kubectl apply -f  pod.yml 
kubectl create -f service.yml
curl localhost:30011 # or <nodeIP>:30011
