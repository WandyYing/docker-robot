# docker-robot


### How to use?
1. open SSH.
```
docker run --name robot -p32222:22 --rm -it yingjun/robotframework-runner:ubuntu-2
```

2. use SSH to connect and exec shell
```
ssh root@ip -p 22
```

3. Also, you can use SSH Plug-in in Jenkins.



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


### Paralar execute 
You can use SSH plus-in on jenkins shell to exec.

Example Script
```
ssh root@ip -p 22
export http_proxy=http://proxy:8080
export https_proxy=http://proxy:8080
cd /home/seluser/exec/
wget http://10.131.66.209/yingjun/demo/repository/master/archive.zip -O archive
unzip -o -d temp archive.zip
cd temp
#/home/seluser/exec/temp
mv -f * ../projectlab
cd ..
#/home/seluser/exec/
python paec.py --rp_endpoint http://ip:port --rp_project projectname --rp_uuid xxx-xxx-xxx-xx --rp_launch_name launch+name --rp_launch_tags demo --tests_folder_name "/home/seluser/exec/projectlab/tests"
```


Reference & Thanks:
[rastasheep/ubuntu-sshd](https://hub.docker.com/r/rastasheep/ubuntu-sshd/)
[ivonet/robotframework-ride](https://hub.docker.com/r/ivonet/robotframework-ride/~/dockerfile/)
[softsam/robotframework-ride](https://hub.docker.com/r/softsam/robotframework-ride)