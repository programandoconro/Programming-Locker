FROM httpd:latest
COPY requirements.txt .
RUN apt update -y && apt install $(cat requirements.txt) -y
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
COPY token.txt .
RUN unzip ngrok-stable-linux-amd64.zip && ./ngrok authtoken $(cat token.txt)
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl
RUN touch /usr/local/apache2/htdocs/example
RUN rm /usr/local/apache2/htdocs/index.html
