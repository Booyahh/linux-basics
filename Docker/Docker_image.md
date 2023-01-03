## Dokcer images creation


Pull images

```bash
docker pull <image name>
```

_run command_

```bash 
sudo docker run -d -it --name web1 -p 8090:80 httpd
```

_Inspect command_

```bash
docker inspect <condainer id>
```

_docker history_

```bash 
doxker history <Image id>
```

_docker image backup_
```bash
docker save <image id:latest> > backup.tar
```

