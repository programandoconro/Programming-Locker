#!/bin/bash
max=$(sudo cat /sys/class/backlight/intel_backlight/max_brightness)

echo 'Tu nivel máximo de brillo es: '$max
echo '========================================================================'

echo 'Entra el nivel de brillo'
read brillo
sudo echo $brillo > /sys/class/backlight/intel_backlight/brightness


