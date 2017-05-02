#!/bin/sh
# You will need NODE_ENV set

[ "${NODE_ENV:=NODE_ENV=development}" ]

# Wait for mongodb to be ready before starting the api
if [ $NODE_ENV = "integration" ] || [ $NODE_ENV = "staging" ] || [ $NODE_ENV = "production" ]; then
    echo "Starting in $NODE_ENV"
    node main.js
else
    echo "Starting in $NODE_ENV"
    while ! nc -z mongodb 27017; do
        echo "mongodb not available sleeping for 3 seconds."
        sleep 3;
    done;
    echo 'mongodb available'
    # Start the api
    pm2-docker --watch start main.js
fi