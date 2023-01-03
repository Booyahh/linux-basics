## Docker basic commands

_Version check_
```bash
sudo docker -v
```

_help section_

```bash
docker volume --help
docker info --help
docker system --help
```

sudo docker system prune

performance check

```bash
docker stats
docker top <container id>
```
_image check_

```bash
docker search
docker pull (imagename)
sudo docker images
```
_copy_

```bash
docker cp deva.txt 28f5c5f29fd7:/tmp/
docker cp deva1:/tmp/deva.txt .
```
container creation

```bash
sudo docker create
sudo docker run
sudo docker run -d --name deva1 httpd
```

_check container status_

```bash
sudo docker ps
sudo docker ps -a
```

docker login 

```bash
sudo docker exec -it deva1 bash
```

_Start & Stop_

```bash
sudo docker start deva1
sudo docker stop deva1
```


_Constainer remove_ 

```bash
sudo docker rm <container id>
```

docker logs

```bash
docker logs <containr id>
```

