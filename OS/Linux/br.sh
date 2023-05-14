echo Entra el nivel de brillo
read brillo
echo $brillo > /sys/class/backlight/intel_backlight/brightness
