/**
 * Import all of the todo components and return an intialized todo component, which is an instance of the expressjs router
 *
 * @param config is the config object
 * @param db the database from a mongo client connection
 */
module.exports = (config, db) => {

    const TodosService = require('./todos.service.js');
    const TodosController = require('./todos.controller.js');
    const TodosRouter = require('./todos.router.js');

    /* Instantiate the services */
    const todosService = new TodosService(config, db);

    /* Instantiate the controllers */
    const todosController = new TodosController(todosService);

    /* Instantiate the routers */
    const todosRouter = new TodosRouter(todosController);

    return todosRouter;
}
