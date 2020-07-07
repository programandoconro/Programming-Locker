#Japanese input and fonts in Manjaro and i3 window-manager.

pacman -S fcitx-mozc 
pacman -S adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fontsotf-ipafont

sudo echo 'ja_JP.UTF-8 UTF-8' >> /etc/locale.gen

# Add to .bashrc
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

ibus-daemon -d

echo 'exec --no-startup-id ibus-daemon -d' >> .i3/config
