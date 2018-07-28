var ArizonaHistoryCourse = artifacts.require("./ArizonaHistoryCourse.sol");

contract('ArizonaHistoryCourse', function(accounts) {

  it("...should store the value 89.", function() {
    return ArizonaHistoryCourse.deployed().then(function(instance) {
      arizonaHistoryCourseInstance = instance;

      return arizonaHistoryCourseInstance.set(89, {from: accounts[0]});
    }).then(function() {
      return arizonaHistoryCourseInstance.get.call();
    }).then(function(storedData) {
      assert.equal(storedData, 89, "The value 89 was not stored.");
    });
  });

});
