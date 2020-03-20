#connect to your cloud-server from your shell with ssh

!pip install git+https://github.com/demotomohiro/remocolab.git
import remocolab
remocolab.setupSSHD()

# ssh -o UserKnownHostsFile=/dev/null -o VisualHostKey=yes -p 14533 root@0.tcp.eu.ngrok.io
# ssh-keygen
# ssh-copy-id -i ~/.ssh/id_rsa.pub root@0.tcp.eu.ngrok.io -p 14533
# ssh-add
