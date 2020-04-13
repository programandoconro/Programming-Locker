FROM httpd:latest
COPY requirements.txt .
RUN apt update -y && apt install $(cat requirements.txt) -y
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
COPY token.txt . 
RUN unzip ngrok-stable-linux-amd64.zip && ./ngrok authtoken $(cat token.txt)
RUN wget https://yt-dl.org/downloads/latest/youtube-dl | tee /usr/local/bin/youtube-dl >/dev/null
RUN chmod a+x /usr/local/bin/youtube-dl
WORKDIR /usr/local/apache2/htdocs/
RUN youtube-dl https://www.youtube.com/watch?v=U1OW1cpNTuw 
RUN rm /usr/local/apache2/htdocs/index.html
RUN touch example