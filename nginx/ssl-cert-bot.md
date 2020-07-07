## SSL en Nginx Raspbian Server

```
sudo -i
apt-get install python-certbot-nginx
certbot certonly --webroot -w /var/www/roro.world -d roro.world -d www.roro.world

vim /etc/nginx/sites-available/roro.world
```
Agrega:
```
 listen 443 ssl;
        ssl_certificate /etc/letsencrypt/live/roro.world/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/roro.world/privkey.pem;
```     
        
firefox https://roro.world

