# docker-jenkins-dood
Dockerized Jenkins CI server with capability to build docker images via  DooD (Docker outside of Docker)

## How to build
1. Find out your Docker GID by using `grep docker: /etc/group` or `getent group docker`
2. Build via `docker build -t jenkins-dood:alpine -f Dockerfile-Alpine --build-arg DOCKER_GID=999 .`

## How to run
~~~bash
docker run -d \
--name jenkins \
-v /usr/jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-u 1000 \
jenkins-dood:alpine
~~~
