# API Local deployment

```
docker build . -t shinkansen
docker run -dit --restart always -p 9999:5000 shinkansen 
```
* Available in: https://next-shinkansen.herokuapp.com/hakataminami-hakata
