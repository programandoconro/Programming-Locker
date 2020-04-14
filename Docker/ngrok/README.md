## Use Ngrok tunnel to share files served with Apache in a virtual container.

Build and run the Container with ```Docker``` or ```Podman```

```podman build . -t apachengrok

Find the Container ID or Name with 

Then, run ngrok using the ID or Name  obtained with ```podman ps```

```podman exec -it $ID ./ngrok http 80```
