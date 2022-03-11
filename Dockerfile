FROM alpine:3.15

LABEL maintainer="Mavlin Dm. <mavlind@list.ru>"
LABEL date="2022-03-10"

ARG DOCKER_VERSION=20.10.9
#Linux:   https://download.docker.com/linux/static

RUN apk --update add bash curl tzdata \
  && cd /tmp/ \
  && curl -sSL -O https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar zxf docker-${DOCKER_VERSION}.tgz \
  && mkdir -p /usr/local/bin/ \
  && mv /tmp/docker/docker /usr/local/bin/ \
  && chmod +x /usr/local/bin/docker \
  && apk del curl \
  && rm -rf /tmp/* \
  && rm -rf /var/cache/apk/*

COPY .bashrc /root
COPY scripts /root/scripts
COPY crontab .
RUN crontab crontab
CMD crond -f
