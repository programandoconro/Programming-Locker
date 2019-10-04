FROM debian
RUN apt update -y
RUN apt install golang -y
RUN export GOROOT=/usr/local/go
RUN export GOPATH=$HOME/Projects/Proj1
RUN export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
RUN echo "Europe/Spain" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
COPY 日本語で挨拶して.go /home/
RUN go run /home/日本語で挨拶して.go
