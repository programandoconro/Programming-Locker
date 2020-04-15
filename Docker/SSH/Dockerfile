FROM debian:latest
#COPY access.sh .
RUN apt update -y && apt install unzip wget openssh-server -y
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
unzip ngrok-stable-linux-amd64.zip
RUN ./ngrok authtoken xxxxxxx
#./ngrok tcp 22
RUN mkdir /var/run/sshd
RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d>

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
RUN apt install nmap -y
RUN ip address
#./ngrok tcp 22
CMD ["/usr/sbin/sshd", "-D"]

