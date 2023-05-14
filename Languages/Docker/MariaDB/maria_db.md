# Podman containers (default in Fedora)
```
podman pull mariadb/server
podman run --name mysql -e MYSQL_ROOT_PASSWORD=pass -d mariadb/server
podman ps
podman exec -it mysql bash
```
Inside the container ``mysql -u root -p``

Or, if you want to use Docker ....

```
docker pull mariadb/server:10.3
docker run --name mariadbtest -e MYSQL_ROOT_PASSWORD=mypass -d mariadb/server:10.3
docker ps
docker exec -it mariadbtest bash

#inside the container
mysql -u root -p
```
