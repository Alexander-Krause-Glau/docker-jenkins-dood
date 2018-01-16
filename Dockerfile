FROM jenkins/jenkins:lts
LABEL maintainer="Alexander Krause akr@informatik.uni-kiel.de"

USER root

# Install Docker client
ARG DOCKER_VERSION=17.03.1-ce
ARG DOCKER_COMPOSE_VERSION=1.12.0

RUN curl -fsSL https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz | tar --strip-components=1 -xz -C /usr/local/bin docker/docker

RUN curl -fsSL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

# Install user and password utilities and update docker GID to host docker GID
# Find out via  "grep docker: /etc/group" or getent group docker
# Pass this to your docker build statement
ARG DOCKER_GID=XXX

RUN apt-get update && groupadd -g ${DOCKER_GID} docker && usermod -aG docker jenkins

USER jenkins
