vim /etc/wpa_supplicant/wpa_supplicant.conf

##########
ctrl_interface=/run/wpa_supplicant

network={

	ssid="SSID"
	psk="PSK"

}

#############

sudo rfkill unblock all
sudo ip link set wlan0 up
sudo wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
sudo dhcpcd
