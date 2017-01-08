# Set up base node image
FROM node:wheezy

# Set up the Working Directory
ENV HOME=/usr/src/app
RUN mkdir $HOME
WORKDIR $HOME

# Installs angular-cli.  We need this to run the cool ng commands
RUN npm install -g angular-cli

# Sets up and installs all the node modules
COPY . $HOME
RUN npm install

# Necessary ports for development
# 4200 is the default dev server port
# 49153 Live reload port
EXPOSE 4200
EXPOSE 49153
