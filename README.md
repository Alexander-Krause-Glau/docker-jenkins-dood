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

## Regarding Base Device Size
Docker's default max size for containers is 10 GB. When building images, docker might use a container that is bigger than this limit. Follow the [this guide](https://www.projectatomic.io/blog/2016/03/daemon_option_basedevicesize/) to increase this limit.
