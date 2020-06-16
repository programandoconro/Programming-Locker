PUBLIC=$(curl -s https://ipinfo.io/ip)
echo " Your public ip is: $PUBLIC " 

LOCAL=$(ifconfig | grep -w 'inet')
echo " Your devices local ips are: $LOCAL " 

TEMPERATURE=$(/opt/vc/bin/vcgencmd measure_temp)
echo " raspberry's temperature is: $TEMPERATURE "
