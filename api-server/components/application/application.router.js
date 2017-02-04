/**
 * This is the Application (general utility) router.
 */

const express = require('express');
const bodyParser = require('body-parser');

module.exports = function ApplicationRouter(applicationController) {

    const router = express.Router();

    /* Parse HTTP request bodies as JSON */
    router.use(bodyParser.json());

    /* Log the request and send it to the next middleware function */
    router.use((req, res, next) => {
        console.info(`${req.method} ${req.url}`);
        next();
    });

    router.use((req, res) => {
        applicationController.asyncGetApiVersion()
            .then(
                (number) => {
                    res.header('x-api-version', number)
                        .status(200)
                        .send();
                },
                (issue) => {
                    res.setStatus(422).send(issue.message);
                }
            );
    });

    return router;
};
