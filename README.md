## Quick Start

1. Clone https://github.com/MichaelAng/todo-client.git into your local directory.
1. Copy `env` to the root folder from the Zoho vault under Docker .env file and rename it to `.env`
1. Ensure system has installed version of node > 6 or greater && npm > 3 or greater.
1. Install `npm install -g angular-cli` on your host machine.
1. Install npm inside of the client folder `cd ./client && npm install`.
1. Install npm inside of the api folder `cd ./api && npm install`.
1. Run `docker-compose down -v && docker-compose up --build` for a dev server on a docker environment.
    1. If you are using docker-machine you will need to navigate to `[docker-machine ip]`.
1. Navigate to `http://localhost/`.
1. The app will automatically reload if you change any of the `client/` source or `/api` files.

## Unit Testing

To unit test on the frontend
1. From the root folder, `cd client`
1. Run `npm test`. This will watch your files. Run `npm run test -- --browser PhantomJS --single-run` to run test once then exit.

## Linting

To lint the front end.
1. From the root folder, `cd client`
1. Run `npm run lint`