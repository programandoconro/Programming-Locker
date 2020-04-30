FROM node:latest
COPY ./connect_sql.js .
RUN apt update -y && apt install nano -y
RUN npm install -g npm mysql ajax
RUN node connect_sql.js > data
