#
# Ubuntu Node.js Dockerfile
#
# https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
# https://docs.docker.com/examples/nodejs_web_app/
#
# getting base image ubuntu

# FROM ubuntu:latest
# Pull base image

FROM ubuntu:12.4.0

MAINTAINER Sanjay Bhan <bhancapri78@yahoo.com>

USER root
WORKDIR /home/app

# Copy folder and files to VM
COPY . /home/app/

# COPY ./forkify-js-v1/src /home/app/src
# COPY ./forkify-js-v1/package.json /home/app/package.json
# COPY ./forkify-js-v1/webpack.config.js /home/app/webpack.config.js
# COPY ./forkify-js-v1/.babelrc /home/app/.babelrc

# Update Ubuntu
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
RUN npm install

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install --yes nodejs
RUN node -v
RUN npm -v
RUN npm i -g nodemon
RUN nodemon -v

CMD npm run build

# Binds to port 8080
EXPOSE  8080

CMD [ "npm", "start" ]

CMD ["echo", "Docker image [img-forky:1.0] got created and ready to publish on port:8080"]

# Cleanup
# RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
