# RSTUDIO
# una instancia
docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere rocker/rstudio
# Servidor
docker run -d -p 8787:8787  --restart always -v $HOME:/home/'whoami' -e PASSWORD=****** rocker/rstudio
# o con podman (Fedora 31)
podman run -d -p 8787:8787  --restart always -v $HOME:/home/'whoami' -e PASSWORD=****** rocker/rstudio
# Ve a 0.0.0.0:8787 o localhost:8787
#nombre: rstudio
#clave: ******

# JUPYTER LAB SPARK
docker run --rm -p 8888:8888 -p 4040:4040 -e JUPYTER_ENABLE_LAB=yes -v ~:/home/ro/jupyter jupyter/all-spark-notebook
# JUPYTER SPARK
docker run -it --rm -p 8888:8888 -p 4040:4040 -v ~:/home/ro/python jupyter/all-spark-notebook

# KNOWN OS
docker run -it ubuntu 
docker run -it centos
docker run -it debian
docker run -it alpine

# MAKE DOCKERFILE 
# FROM
# RUN
# COPY

docker build . -t mydocker
docker run -it mydocker
