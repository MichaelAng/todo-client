/**
 * This is the Todos router.
 */

const express = require('express');
const bodyParser = require('body-parser');

module.exports = function TodoRouter(todosController) {

    const router = express.Router();

    /* Parse HTTP request bodies as JSON */
    router.use(bodyParser.json());

    router.get('/', (req, res, next) => {
        todosController.getTodos()
            .then((todos) => {
                res.status(200).send(todos);
            })
            .catch(next)
    });

    router.post('/', (req, res, next) => {
        todosController.createTodo(req.body.title)
            .then((todos) => {
                res.status(201).send();
            })
            .catch(next)
    });

    router.put('/:id', (req, res, next) => {
        todosController.updateTodo(req.params.id, req.body)
            .then((success) => {
                res.status(200).send('updated')
            })
            .catch(next);
    });

    return router;
};
