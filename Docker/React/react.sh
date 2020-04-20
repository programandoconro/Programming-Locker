docker build . -t reactapp
docker run -dit -p 3001:3000 reactapp npm start
docker run -dit -p 3002:5000 reactapp serve -s build
