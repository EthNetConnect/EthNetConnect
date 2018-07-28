var ArizonaHistoryCourse = artifacts.require("./ArizonaHistoryCourse.sol");

module.exports = function(deployer) {
    deployer.deploy(ArizonaHistoryCourse);
};
