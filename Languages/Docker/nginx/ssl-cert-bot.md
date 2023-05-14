## SSL en Nginx Raspbian Server

```
sudo -i
apt-get install python-certbot-nginx
certbot certonly --webroot -w /var/www/roro.world -d roro.world -d www.roro.world

vim /etc/nginx/sites-available/roro.world
```
Redirige el puerto 80 al https:
```

server {
    listen 80 default_server;

    server_name _;

    return 301 https://roro.world;
}
server {

	listen 443 ssl default_server;
        ssl_certificate /etc/letsencrypt/live/roro.world/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/roro.world/privkey.pem;

	root /var/www/roro.world/;
	index index.html index.htm index.nginx-debian.html;

	server_name roro.world www.roro.world;

	location / {
		try_files $uri $uri/ =404;
	}

}



```     
        
firefox https://roro.world

