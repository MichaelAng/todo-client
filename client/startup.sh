#!/bin/bash
# NODE_ENV is the environment. It can accept integration, staging, or production. Defaults to development
# To use
# NODE_ENV=integration ./startup.sh

# Exit on any error
set -e

[ "${NODE_ENV:=NODE_ENV=development}" ]
if [ $NODE_ENV = "integration" ]; then
    npm run build -- --dev
elif [ $NODE_ENV = "staging" ] || [ $NODE_ENV = "production" ]; then
    npm run build -- --prod
else
    npm start
fi
