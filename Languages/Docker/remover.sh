DOCKER=$(docker ps)
NAME=$(echo $DOCKER | grep -oP '(?<=tcp )[^ ]*')
docker stop $NAME
docker rm $NAME
