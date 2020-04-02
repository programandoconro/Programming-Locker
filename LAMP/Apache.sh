#Installation
sudo -i
##Debian / Ubuntu / Raspbian
apt install apache2 -y

##Fedora
yum -y install httpd
sudo systemctl start httpd

#Hello world
echo 'hello world' > /var/www/html/index.html
curl localhost
#or go to localhost in the browser

#Security
sudo htpasswd -c /etc/apache2/.htpasswd ro
sudo htpasswd /etc/apache2/.htpasswd another_user
cat /etc/apache2/.htpasswd

nano /etc/apache2/sites-enabled/000-default.conf
#add
#########################################
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory "/var/www/html">
        AuthType Basic
        AuthName "Restricted Content"
        AuthUserFile /etc/apache2/.htpasswd
        Require valid-user
    </Directory>
</VirtualHost>
########################################

