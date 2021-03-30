#!/usr/bin/bash

# install

python3 -m pip install django

# create project 

django-admin startproject iothacks

# edit settings.py

cd iothacks

vim iothacks/settings.py

# ALLOWED_HOSTS = ["*"] 

# run server in LAN

python3 manage.py runserver 0.0.0.0:8000

nmap localhost -p 8000
curl localhost:8000



