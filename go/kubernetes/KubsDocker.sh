
# Kubernetes for docker users

docker stack deploy --compose-file /path/to/docker-compose.yml mystack
docker stack services mystack
#You can see the service deployed with the kubectl get services command.

#Specify a namespace
#By default, the default namespace is used. You can specify a namespace with the --namespace flag.

    docker stack deploy --namespace my-app --compose-file /path/to/docker-compose.yml mystack

#Run kubectl get services -n my-app to see only the services deployed in the my-app namespace.

#Override the default orchestrator
#While testing Kubernetes, you may want to deploy some workloads in swarm mode. Use the DOCKER_STACK_ORCHESTRATOR variable to override the default orchestrator for a given terminal session or a single Docker command. This variable can be unset (the default, in which case Kubernetes is the orchestrator) or set to swarm or kubernetes. The following command overrides the orchestrator for a single deployment, by setting the variable before running the command.

set DOCKER_STACK_ORCHESTRATOR=swarm
docker stack deploy --compose-file /path/to/docker-compose.yml mystack

#Alternatively, the --orchestrator flag may be set to swarm or kubernetes when deploying to override the default orchestrator for that deployment.

kubectl get nodes


version: '3.3'

services:
  web:
    image: dockersamples/k8s-wordsmith-web
    ports:
     - "80:80"

  words:
    image: dockersamples/k8s-wordsmith-api
    deploy:
      replicas: 5
      endpoint_mode: dnsrr
      resources:
        limits:
          memory: 50M
        reservations:
          memory: 50M

  db:
    image: dockersamples/k8s-wordsmith-db
