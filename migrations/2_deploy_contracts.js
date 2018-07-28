var ArizonaHistoryCourse = artifacts.require("./ArizonaHistoryCourse.sol");

module.exports = function(deployer) {
    deployer.deploy(ArizonaHistoryCourse, "Arizona History Course", "Carl Hayden, a dead dude, became Arizona’s first congressman upon statehood.", "Who became Arizona’s first congressman upon statehood? 1) Carl Hayden 2) Daffy Duck", "0xc89efdaa54c0f20c7adf612882df0950f5a951637e0307cdcb4c672f298b8bc6", 4);
};
