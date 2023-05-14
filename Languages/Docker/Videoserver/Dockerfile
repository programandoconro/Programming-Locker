FROM node:latest
RUN apt update -y && npm install -g serve
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl && mkdir server
WORKDIR ./server
COPY ./urls .
RUN youtube-dl $(cat urls)
CMD  serve -s -p 7777 .
EXPOSE 7777
