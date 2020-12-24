myIP=$(curl 'https://ipinfo.io/ip')

sudo grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" /var/log/auth.log |\
 grep -v $myIP | grep -v 176.84.43.12 | grep -v 95.127.145.244 |\
 grep -v 188.84.197.30 | grep -v 81.33.185.230 | grep -v 0.0.0.0 > blacklist.txt

for ip in $(sort -u /home/pi/blacklist.txt); do
  echo $ip
  sudo iptables -A INPUT -s $ip -j DROP
  sudo iptables -A OUTPUT -s $ip -j DROP
done



