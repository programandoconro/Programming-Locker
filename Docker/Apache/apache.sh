podman build -t apache .
podman run -dit -p 8080:80 apache

# go to localhost:8080
