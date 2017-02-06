/**
 * This is the todos service.
 *
 * This guy guy will do all things related to manipulating todos
 *
 * @param config is the config object
 * @param db the database from a mongo client connection
 */

module.exports = function(config, db) {

    const collection = db.collection('todos');

    /**
     * Get all the ToDo records from the database
     */
    function getTodos() {
        return new Promise((resolve, reject) => {
            collection.find().toArray((err, docs) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(docs)
                }
            });
        });
    };

    /**
     * Create a ToDo record in the database
     *
     * @param title the name of the ToDo item
     */
    function createTodo(title) {
        return new Promise((resolve, reject) => {
            collection.insertOne(
                { title: title, completed: false },
                (err, doc) => {
                    if (err) {
                        reject(err);
                    } else {
                        resolve(doc);
                    }
                }
            );
        });
    }

    /**
     * Update a ToDo record in the database
     *
     * @param id the specific ToDo record
     * @param changes a key-value map of changes to apply. These will be consumed using Mongo's $set operator
     */
    function updateTodo(id, changes) {
        console.log('id changes', id, changes);
        return new Promise((resolve, reject) => {
            collection.updateOne(
                { _id: id },
                { $set: { title: 1} },
                (err, doc) => {
                    if (err) {
                        reject(err);
                    } else {
                        resolve();
                    }
                }
            );
        });
    }

    return {
        createTodo: createTodo,
        getTodos: getTodos,
        updateTodo: updateTodo
    };
};
