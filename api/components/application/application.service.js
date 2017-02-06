/**
 * This is the Application (general utility) service. 
 * 
 * This guy usually will figure out some stuff like asking the database or reading a file for some infomration.
 */

module.exports = function(config) {

    const getApiVersion = () => {
        return config.version;
    };

    return {
        getApiVersion: getApiVersion
    };
};
