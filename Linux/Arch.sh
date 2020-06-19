# Connect to Wi-Fi manually

ip link
ip link set wlan0 up

echo '

update_config=1
ctrl_interface=/var/run/wpa_supplicant

network={
 scan_ssid=1
 ssid="MyNetworkSSID"
 psk="Pa55w0rd1234"
}

' > /etc/wpa_supplicant/wpa_supplicant.conf

wpa_supplicant -B -i interface -c /etc/wpa_supplicant/example.conf

ifconfig

ping archlinux.org

