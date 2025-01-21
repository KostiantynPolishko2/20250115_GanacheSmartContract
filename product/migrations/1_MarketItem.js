const MarketItem = artifacts.require("MarketItem");

module.exports = function (deployer) {
  deployer.deploy(MarketItem, "milk", 42, true, 0);
};