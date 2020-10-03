# Agrega la carpeta build de react a la root en:
sudo nano /etc/nginx/sites-enabled/default 

# Para que quede asi 

server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html/build;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
               
                try_files $uri $uri/ =404;
        }

