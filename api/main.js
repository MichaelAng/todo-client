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
const os = require('os');

const config = require('./config/config.js');
console.log(`api-server: loaded configuration:\n${JSON.stringify(config, null, 4)}`);

/**
 * Instanitate an ExpressJS webserver.
 * Later on, this should probably be turned into a "core" module that we import into here and inject into the "components".
 */
const app = express();

/**
 * Instanitate a MongoDB connection.
 * Later on, this should probably be turned into a "core" module that we import into here and inject into the "components".
 */
const MongoClient = require('mongodb').MongoClient;

// Wrap this in a promise
const listen = (expressApp, port) => {
    return new Promise((resolve, reject) => {
        expressApp.listen(port, () => {
            console.log(`api-server: listening on ${os.hostname()}:${port}`)
            resolve();
        });
    });
}

/**
 * Initialize the express application and the mongo database connection
 */
Promise.all([
    listen(app, config.port),
    MongoClient.connect(`${config.database_hostname}/${config.database_name}`)
])
/**
 * The database connection passed along ad db
 */
.then(([_, db]) => {
    console.log(`api-server: connected to ${config.database_hostname}/${config.database_name}`)

    /**
     * Import the components. Each component is an instance of an ExpressJS router.
     * Here the application (general utility) component is loaded.
     */
    const applicationComponent = require('./components/application')(config);
    const todosComponent = require('./components/todos')(config, db);

    /**
     * Bind the components to the express application
     */
    app.use(applicationComponent);
    app.use('/todos', todosComponent);

})
.catch((reason) => {
    console.error(reason)
});






