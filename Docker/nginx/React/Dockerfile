FROM nginx
RUN apt update -y && apt upgrade -y
RUN apt install git npm -y 
RUN npm -g install create-react-app
RUN create-react-app example
WORKDIR example
RUN npm install
RUN npm run build
RUN cp -r build/* /usr/share/nginx/html/
