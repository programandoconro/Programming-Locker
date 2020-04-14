## Use Ngrok tunnel to share files served with Apache in a virtual container.

Build and run the Container with ```Docker``` or ```Podman```

```podman build . -t apachengrok```

Then, run ngrok using the ID or Name  obtained with ```podman ps```

```podman exec -it $ID ./ngrok http 80```

<div>img src= 'https://github.com/progamandoconro/My-Linux-Locker-/blob/master/Docker/ngrok/Screenshot%20from%202020-04-14%2002-27-35.png?raw=true'</div>
