/**
 * This is the entrypoint to the application programmer interface.
 */

/**
 * Catch and log uncaught exceptions as soon as they happen, log them, then exit with error code 1.
 * Do this before loading anything else.
 */
process.on('uncaughtException', (exception) => {
    console.error(`An uncaughtException happened:\n${exception}`);
    process.exit(1);
});

const express = require('express');
const app = express();
const os = require('os');

const config = require('./config/config.js');
console.log(`api-server: loaded configuration:\n${JSON.stringify(config, null, 4)}`);

/**
 * Import the components. Each component is an instance of an ExpressJS router.
 * Here the application (general utility) component is loaded.
 */
const applicationComponent = require('./components/application')(config);

/**
 * Bind the application component to the express application
 */
app.use(applicationComponent);

/**
 * Error handling middleware 
 */
app.use((error, req, res, next) => {
    console.error(`api-server: something went wrong\n${error}`);
    res.status(500).send('Something went wrong');
});

/** 
 * Have the broker server listen on config.webserverPort 
 */
app.listen(config.port, () => {
    console.log(`api-server: listening on ${os.hostname()}:${config.port}`)
});
