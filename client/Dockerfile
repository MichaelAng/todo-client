# This Dockerfile is for the source environment.  It will create a container that sets up a local
# development server that will automatically refresh for you.
# To use this source environment:
# $ docker-compose down && docker-compose up -d

# Set up base node image
FROM node:wheezy

# Set up the Docker Working Directory
ENV HOME=/usr/src/app
RUN mkdir $HOME
WORKDIR $HOME

# Pulls in the package.json file and installs all the node dependencies
# The .dockerignore file should ignore the node module since the container will operate on a
# linux server.
COPY ./package.json $HOME
RUN npm install

# Copies the host machine folder(s) into the docker container so you can develop on your host
# machine
COPY . $HOME

# Exposes the necessary ports for development
# 4200 is the default dev server port
# 49153 is the automatic refresh (live reload) port
EXPOSE 80

# Kicks off the default `ng serve` command
CMD ["npm", "start"]
