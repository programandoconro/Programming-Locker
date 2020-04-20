# Containerization of micro-services with ``docker-compose``

Install docker and pip3
``apt install docker.io python3-pip``

Add your user to docker group ``sudo usermod -aG docker $USER`` 

Install docker-compose: ``pip3 install docker-compose``

You can start testing with this commands: 

```
docker-compoose up
docker-compose down
docker-compose start
docker ps
docker network ls
docker inspect compose_db_1
docker exec -it compose_worker_1 bash

```

go to ``localhost 8088`` and ``localhost 9000`` in your browser.

