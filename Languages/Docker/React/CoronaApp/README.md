## React App in Docker container for Coronavirus data visualization

Just create a Dockerfile:

```
FROM node
RUN apt update -y && \
apt upgrade -y && \
apt install git -y && \
npm install -g create-react-app && \
git clone https://github.com/progamandoconro/project_corona_tracker
WORKDIR ./project_corona_tracker
RUN npm install -g serve && \
npm install && npm run build
CMD serve -s build
EXPOSE 5000
```
Build and run:

```
docker build . -t corona
docker run -dit -p 3004:5000 --restart always corona
```
Go to localhost:3004 in the browser.
