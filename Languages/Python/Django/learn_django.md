# Learning Django. Level 0.1 

## Install
```
python3 -m pip install django
```
## Create project 
```
django-admin startproject iothacks
```
## Edit settings.py
```
cd iothacks

vim iothacks/settings.py
```
add: ``ALLOWED_HOSTS = ["*"]`` 

## Run server in LAN

```
python3 manage.py runserver 0:8000
```
## Test it
```
nmap localhost -p 8000
curl localhost:8000
```

## In a new terminal window, create the app
```
python3 manage.py startapp polls
```

## Edit the urls file in polls folder
```
vim polls/urls.py
```
Add: 
```
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

```
## Edit urls file in page folder
```
vim iothacks/urls.py
```
Add: 
```
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('polls/', include('polls.urls')),
    path('admin/', admin.site.urls),
]
```
## Test it
```
curl localhost:8000/polls/
```

