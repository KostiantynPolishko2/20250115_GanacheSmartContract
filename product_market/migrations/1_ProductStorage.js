const FoodProduct = artifacts.require("FoodProduct");

module.exports = function (deployer) {
  deployer.deploy(FoodProduct, "milk", 42, true);
};