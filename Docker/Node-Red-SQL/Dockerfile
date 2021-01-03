FROM node:latest

MAINTAINER Rodrigo Diaz "programandoconro@gmail.com"

RUN apt update -y
RUN npm install -g node-red
RUN npm install -g node-red-node-mysql
RUN npm install -g node-red-node-sqlite
RUN npm install -g node-red-node-email

EXPOSE 1880

VOLUME /home/pi/.node-red

WORKDIR /usr/local/bin/
CMD ["/usr/local/bin/node-red","-v"]
