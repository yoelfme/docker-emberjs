FROM nginx

MAINTAINER "Yoel Monzon" <yoelfme@hotmail.com>

# Install Nodejs
RUN apt-get update -y
RUN apt-get install curl git -y
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

# Install Ember CLI and Bower
RUN npm install -g ember-cli@1.13.15
RUN npm install -g bower@1.7.2

# Set registry for npm
RUN npm config set registry http://registry.npmjs.org/

# Add configuration for nginx
ADD config/nginx.conf /etc/nginx/conf.d/default.conf

# Create folder for storage the app
RUN mkdir /code

VOLUME ["code"]

WORKDIR /code

