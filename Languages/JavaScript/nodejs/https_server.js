// sudo apt install letsencrypt -y 

// ** Important: there should be no service running on port 80 and your domain name should point to your IP.
// sudo certbot certonly --standalone --agree-tos --preferred-challenges http -d your_domain_name.com

// cp /etc/letsencrypt/live/your_domain_name.com/privkey.pem .
// cp /etc/letsencrypt/live/your_domain_name.com/cert.pem .

// mkdir ssl-test && cd ssl-test
// npm i https fs

const https = require('https');
const fs = require('fs');

const options = {
  key: fs.readFileSync('privkey.pem'),
  cert: fs.readFileSync('cert.pem')
};

https.createServer(options, (req, res) => {
  res.writeHead(200);
  res.end('hello world\n');
}).listen(443);

// open 443 and 80 port to the world
// sudo node https_server.js
