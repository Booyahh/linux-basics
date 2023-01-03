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

_remove unwanted images_

**careful to use**

```bash
sudo docker system prune
```

_Container performance check_

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
_container creation_

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

_docker login_ 

```bash
sudo docker exec -it deva1 bash
```

_Start & Stop_

```bash
sudo docker start deva1
sudo docker stop deva1
```


_Container remove_ 

```bash
sudo docker rm <container id>
```

_docker logs_

```bash
docker logs <containr id>
```

