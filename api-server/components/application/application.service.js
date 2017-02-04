/**
 * This is the Application (general utility) service. 
 */

module.exports = function(config) {

    const getApiVersion = () => {
        return config.version;
    };

    return {
        getApiVersion: getApiVersion
    };
};
