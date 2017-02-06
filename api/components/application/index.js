/**
 * Import all of the applcation components and return an intialized application component, which is an instance of the expressjs router
 */
module.exports = (config) => {

    const ApplicationService = require('./application.service.js');
    const ApplicationController = require('./application.controller.js');
    const ApplicationRouter = require('./application.router.js');

    /* Instantiate the services */
    const applicationService = new ApplicationService(config);

    /* Instantiate the controllers */
    const applicationController = new ApplicationController(applicationService);

    /* Instantiate the routers */
    const applicationRouter = new ApplicationRouter(applicationController);

    return applicationRouter;
}
