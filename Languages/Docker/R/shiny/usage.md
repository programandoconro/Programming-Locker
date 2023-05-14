
```
  docker build -t shiny-server .
  docker run -dit --restart always -p 3838:3838 shiny-server
  docker ps
  curl localhost:3838
```
