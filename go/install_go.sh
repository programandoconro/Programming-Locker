# Fedora 32
sudo dnf install golang
mkdir -p $HOME/go
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
source $HOME/.bashrc

# Raspberry Pi Zero
wget https://storage.googleapis.com/golang/go1.9.linux-armv6l.tar.gz
sudo tar -C /usr/local -xzf go1.9.linux-armv6l.tar.gz
export PATH=$PATH:/usr/local/go/bin # put into ~/.profile
