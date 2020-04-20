FROM ubuntu
RUN apt update -y && apt install npm -y && \
npm install -g create-react-app
RUN create-react-app sample
WORKDIR ./sample
COPY ./app ./sample/src/
EXPOSE 3000


