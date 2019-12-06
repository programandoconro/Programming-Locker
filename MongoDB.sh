# MongoDB installation in Fedora and first steps using it. 

sudo nano /etc/yum.repos.d/mongodb.repo

[Mongodb]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc

sudo dnf install mongodb-org

sudo systemctl enable mongod.service
sudo systemctl start mongod.service

mongo

use myDB
db
db.myDB.save({user:0001})
db.myDB.find()
db.myDB.deleteMany({user:0001})

