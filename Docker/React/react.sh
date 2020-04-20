docker build . -t reactapp
docker run -dit -p 3001:3000 reactapp npm start
