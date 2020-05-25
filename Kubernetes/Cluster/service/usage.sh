kubectl apply -f  pod-definition.yml 
kubectl create -f service-definition2.yml
curl localhost:30011 # or <nodeIP>:30011
