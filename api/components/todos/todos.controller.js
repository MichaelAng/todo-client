/**
 * This is the Todos controller.
 */

module.exports = function(todosService) {

    /**
     * Async method that returns a promise with the result or rejects with a message.
     */
    const getTodos = () => {
        return todosService.getTodos();
    };

    const createTodo = (title) => {
        return todosService.createTodo(title);
    }

    const updateTodo = (id, changes) => {
        return todosService.updateTodo(id, changes);
    }

    return {
        createTodo: createTodo,
        getTodos: getTodos,
        updateTodo: updateTodo
    };
};
