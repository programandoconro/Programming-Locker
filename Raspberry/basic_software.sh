sudo apt install mariadb-server apache2 php \
r-base nmap cmatrix bastet moon-buggy ninvaders nsnake \ 
pacman4console neofetch figlet htop git -y

# Install Golang on Raspberry Pi Zero
url=`curl https://golang.org/dl/ | grep armv6l | sort --version-sort | tail -1 | grep -o -E https://dl.google.com/go/go[0-9]+\.[0-9]+((\.[0-9]+)?).linux-armv6l.tar.gz` 
wget ${url}
sudo tar -C /usr/local -xvf `echo ${url} | cut -d '/' -f5`
cat >> ~/.bashrc << 'EOF'
export GOPATH=$HOME/go
export PATH=/usr/local/go/bin:$PATH:$GOPATH/bin
EOF
source ~/.bashrc

echo "install.packages('ggplot2')" > requirements.R && Rscript requirements.R
