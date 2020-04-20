FROM ubuntu
RUN apt update -y && apt install npm -y && \
npm install -g create-react-app
RUN create-react-app sample
WORKDIR ./sample
EXPOSE 5000
COPY ./app/App.js ./src
RUN npm run build
RUN npm install -g serve
