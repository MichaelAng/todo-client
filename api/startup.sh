#!/bin/sh
# You will need NODE_ENV set

[ "${NODE_ENV:=NODE_ENV=development}" ]

# Wait for mongo to be ready before starting the api
if [ $NODE_ENV = "integration" ] || [ $NODE_ENV = "staging" ] || [ $NODE_ENV = "production" ]; then
    echo "Starting in $NODE_ENV"
    node main.js
else
    echo "Starting in $NODE_ENV"
    while ! nc -z mongo 27017; do
        echo "mongo not available sleeping for 3 seconds."
        sleep 3;
    done;
    echo "mongo available"
    # Start the api
    pm2-docker --watch start main.js
fi