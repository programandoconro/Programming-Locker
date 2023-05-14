FROM node:latest

MAINTAINER Rodrigo Diaz "programandoconro@gmail.com"

RUN apt update -y
RUN npm install -g node-red
RUN npm install -g node-red-node-mysql
RUN npm install -g node-red-node-sqlite
RUN npm install -g node-red-node-email
RUN npm install -g node-red-contrib-firebase
RUN npm install -g node-red-admin

COPY settings.js /root/.node-red/

VOLUME /home/pi/.node-red

WORKDIR /usr/local/bin/
CMD ["/usr/local/bin/node-red","-v"]
