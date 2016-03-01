FROM alpine

MAINTAINER "Yoel Monzon" <yoelfme@hotmail.com>

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories

# Install nginx
RUN apk update && apk upgrade
RUN apk add nginx
RUN mkdir -p /tmp/nginx/client-body

# Install Nodejs
RUN apk add nodejs@community \
  && rm -rf /var/cache/apk/*

# Note: npm is v2.14.10
RUN npm install -g ember-cli@1.13.15
RUN npm install -g bower@1.7.2

# Configure registry of npm
RUN npm config set registry http://registry.npmjs.org/

# Set default configuration of nginx
ADD config/nginx.conf /etc/nginx/conf.d/default.conf
