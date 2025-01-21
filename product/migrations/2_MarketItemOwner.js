const MarketItemOwner = artifacts.require("MarketItemOwner");

module.exports = function (deployer) {
  deployer.deploy(MarketItemOwner);
};