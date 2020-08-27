#Japanese input and fonts in Linux

yay -Sy fcitx-mozc ibus-daemon ibus-mozc
pacman -Sy adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fontsotf-ipafont noto-fonts-emoji

sudo echo 'ja_JP.UTF-8 UTF-8' >> /etc/locale.gen

# Add to .bashrc
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

ibus-daemon -d

# echo 'exec --no-startup-id ibus-daemon -d' >> .i3/config #i3 window-manager.
