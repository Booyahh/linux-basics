## Docker basic commands

_Version check_
```bash
sudo docker -v
```

_help section_

```bash
docker volume --help
docker info
docker system
```


sudo docker system prune

docker stats (Top command)


docker search
docker pull (imagename)
sudo docker images
docker cp deva.txt 28f5c5f29fd7:/tmp/
docker cp deva1:/tmp/deva.txt .


sudo docker create
sudo docker run

_check container status_

```bash
sudo docker ps
sudo docker ps -a
```

sudo docker run -d --name deva1 httpd

docker login 

```bash
sudo docker exec -it deva1 bash
```
_Start & Stop_

``bash
sudo docker start deva1
sudo docker stop deva1
```

Constainer remove 

```bash
sudo docker rm <container id>
```

docker logs

```bash
docker logs <containr id>
```

