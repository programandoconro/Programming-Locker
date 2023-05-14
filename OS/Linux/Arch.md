1. Conecta a Wi-Fi manualmente
```
ip link
ip link set wlan0 up
vim /etc/wpa_supplicant/wpa_supplicant.conf
```
Agrega y guarda
 ```

update_config=1
ctrl_interface=/var/run/wpa_supplicant

network={
 scan_ssid=1
 ssid="MyNetworkSSID"
 psk="Pa55w0rd1234"
}

```
```
wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/example.conf
ifconfig
ping archlinux.org
```

2. Borra todo el disco y 2 crea particiones:

```
fdisk -l
fdisk /dev/sda
```
Con d borras todo el disco, con n creas particiones, creemos una pequeña para el ``swap`` y otra para el resto.

3. Formateamos el ``swap`` y la otra partición:
```
mkswap /dev/sda1
swapon /dev/sda1
```

Ahora la partición general:
```
mkfs.ext4 /dev/sda2
```

4. Montamos la partición general e instalamos los paquetes:

```
mount /dev/sda2 /mnt 
pacstrap /mnt base linux linux-firmware
```
Esta es la parte que más tiempo tarda.

5. Configuramos el sistema:

```
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
locale-gen
```




