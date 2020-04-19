FROM node:latest
COPY ./server.js .
RUN apt update -y && apt install nmap netcat net-tools nano -y
RUN npm install mysql ajax
