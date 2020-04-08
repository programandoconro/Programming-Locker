# Use MariaDB(MYSQL) in Docker virtual container

docker pull mariadb/server:10.3
docker run --name mariadbtest -e MYSQL_ROOT_PASSWORD=mypass -d mariadb/server:10.3
docker ps
docker exec -it mariadbtest bash

#inside the container
mysql -u root -p
