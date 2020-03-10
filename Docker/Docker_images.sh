# RSTUDIO
# One instance
docker run --rm -p 8787:8787 -e PASSWORD=yourpasswordhere rocker/rstudio
# Server
docker run -d -p 8787:8787  --restart always -v $HOME:/home/'whoami' -e PASSWORD=****** rocker/rstudio
# or with podman (Fedora 31)
podman run -d -p 8787:8787  --restart always -v $HOME:/home/'whoami' -e PASSWORD=****** rocker/rstudio
# Go to 0.0.0.0:8787 or localhost:8787
#name: rstudio
#password: ******

# JUPYTER LAB SPARK
docker run --rm -p 8888:8888 -p 4040:4040 -e JUPYTER_ENABLE_LAB=yes -v ~:/home/ro/jupyter jupyter/all-spark-notebook
# JUPYTER SPARK
docker run -it --rm -p 8888:8888 -p 4040:4040 -v ~:/home/ro/python jupyter/all-spark-notebook

# Anaconda3 
#docker
docker run -i -t continuumio/anaconda3 /bin/bash 
#podman(FEDORA)
podman run -i -t continuumio/anaconda3 /bin/bash

# KNOWN OS
docker run -it ubuntu 
docker run -it centos
docker run -it debian
docker run -it alpine

#COMMANDS FOR DOCKERFILE 
# FROM
# RUN
# COPY
# ADD
# CMD
# ENTRYPOINT 
# EXPOSE
# ENV

#then run this command in the directory where Dockerfile exists. 
docker build . -t mydocker
docker run -it mydocker
