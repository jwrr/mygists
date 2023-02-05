docker notes
============

Install Docker on Ubuntu
------------------------

[Docker install instructions](https://docs.docker.com/engine/install/ubuntu/)

```
sudo apt install curl ca-certificates gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt update
sudo apt upgrade
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Try Docker
----------

```
sudo docker run --rm hello-world
```

Try More Docker

```
sudo docker run -it ubuntu bash
```

In a different host terminal 

```
sudo docker ps
```

Run luvit webserver in Docker
-------------------

```
## Build Docker Image luvit
cp luvit.Dockerfile Dockerfile
sudo docker build -t luvit .

## Run luvit image in container with all ports enabled
sudo docker run --network host -it luvit bash
#in docker> luvit /opt/luvit/server.lua

## Run luvit image interactively with one port enabled (docker_port:host_port)
sudo docker run -it -p 1337:1337 luvit bash

## Run luvit image in the background as a daemon
sudo docker run -d -p 1337:1337 luvit
```

