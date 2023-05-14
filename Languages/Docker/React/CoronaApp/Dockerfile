FROM node
RUN apt update -y && \
apt upgrade -y && \
apt install git -y && \
npm install -g create-react-app && \
git clone https://github.com/programandoconro/project_corona_tracker
WORKDIR ./project_corona_tracker
RUN npm install -g serve && \
npm install && npm run build
EXPOSE 5000
CMD serve -s build
