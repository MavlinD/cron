#FROM clockworksoul/docker-gc-cron:latest

FROM alpine:3.15
#FROM alpine:3.13

LABEL maintainer="Mavlin Dm. <mavlind@list.ru>"
LABEL date="2022-03-10"

ARG DOCKER_VERSION=1.11.1

# We get curl so that we can avoid a separate ADD to fetch the Docker binary, and then we'll remove it.
# Blatantly "borrowed" from Spotify's spotify/docker-gc image. Thanks, folks!
RUN apk --update add bash curl tzdata \
  && cd /tmp/ \
  && curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar zxf docker-${DOCKER_VERSION}.tgz \
  && mkdir -p /usr/local/bin/ \
  && mv /tmp/docker/docker /usr/local/bin/ \
  && chmod +x /usr/local/bin/docker \
  && apk del curl \
  && rm -rf /tmp/* \
  && rm -rf /var/cache/apk/*

COPY .bashrc /root
COPY scripts scripts
COPY crontab .
RUN crontab crontab
CMD crond -f
#ENTRYPOINT crond -f
#CMD ["/usr/sbin/crond", "-f"]
#CMD ["/usr/sbin/crond", "-f", "-l", "2"]
