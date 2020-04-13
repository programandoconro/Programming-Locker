FROM httpd:latest
COPY requirements.txt .
RUN apt update -y && apt install $(cat requirements.txt) -y
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
COPY token.txt . 
RUN unzip ngrok-stable-linux-amd64.zip && ./ngrok authtoken $(cat token.txt)
