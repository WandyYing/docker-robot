# docker-robot

docker run --name robot --rm -it yingjun/robotframework-runner:1.8.0 /bin/sh


### Proxy
Dockerfile
```
ENV http_proxy http://proxy:8080
ENV https_proxy http://proxy:8080
```

container
```
export http_proxy=http://proxy:8080
export https_proxy=http://proxy:8080
```