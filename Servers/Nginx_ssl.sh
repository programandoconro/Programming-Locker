#Ubuntu 20 in AWS EC2

sudo apt nginx -y

git clone https://github.com/programandoconro/Kanji-Trainer

sudo apt install npm -y

cd Kanji-Trainer

npm install
npm run build

sudo cp build/* /var/www/html/

sudo systemct restart nginx

# Check http

# SSL
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

sudo openssl dhparam -out /etc/nginx/dhparam.pem 4096

sudo nano /etc/nginx/snippets/self-signed.conf

"""
ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

"""

sudo nano /etc/nginx/snippets/ssl-params.conf

"""
ssl_protocols TLSv1.2;
ssl_prefer_server_ciphers on;
ssl_dhparam /etc/nginx/dhparam.pem;
ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384;
ssl_ecdh_curve secp384r1; # Requires nginx >= 1.1.0
ssl_session_timeout  10m;
ssl_session_cache shared:SSL:10m;
ssl_session_tickets off; # Requires nginx >= 1.5.9
ssl_stapling on; # Requires nginx >= 1.3.7
ssl_stapling_verify on; # Requires nginx => 1.3.7
resolver 8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout 5s;
# Disable strict transport security for now. You can uncomment the following
# line if you understand the implications.
# add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
add_header X-Frame-Options DENY;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";

"""

sudo vim /etc/nginx/sites-available/default

"""
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    include snippets/self-signed.conf;
    include snippets/ssl-params.conf;

    server_name roro.world www.roro.world;

    root /var/www/example.com/html;
    index index.html index.htm index.nginx-debian.html;

    
}

server {
    listen 80;
    listen [::]:80;

    server_name roro.world www.roro.world;

    return 302 https://$server_name$request_uri;
}
"""
# Open port 443 in the cloud server.
# Restart Nginx

sudo nginx -t
sudo systemctl restart nginx

# Change the redirection, sudo vim /etc/nginx/sites-available/default
"""
return 301 https://$server_name$request_uri;
"""

# Add certbot

sudo apt install python3-certbot-nginx
sudo certbot --nginx -d roro.world -d www.roro.world

# Restart again nginx

sudo nginx -t
sudo systemctl restart nginx









