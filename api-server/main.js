/* This is the entrypoint to the application programmer interface */

'use strict';

/* Catch and log uncaught exceptions as soon as they happen, log them, then exit with error code 1 */
process.on('uncaughtException', (exception) => {
    console.error(`An uncaughtException happened:\n${exception}`);
    process.exit(1);
});

const config = require('./config/config.js');
console.log(`api-server: loaded configuration:\n${JSON.stringify(config, null, 4)}`);

/* Instantiate an expressjs webserver */
const express = require('express');
const app = express();
const os = require('os');

app.use('/', (req, res) => {
    res.send('hello');
});

/* Error handling middleware */
app.use((error, req, res, next) => {
    console.error(`Something went wrong\n${error}`);
    res.status(500).send('Something went wrong');
});

/* Have the broker server listen on config.webserverPort */
app.listen(config.port, () => {
    console.log(`api-server: listening on ${os.hostname()}:${config.port}`)
});
